import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/_errors.dart';
import '../../../../dsp/_dsp.dart';
import '../../../sessions/domain/entity/session_labels.dart';
import '../../domain/repositories/measure_repository.dart';
import 'invalid_reason.dart';
import 'measure_state.dart';
import 'measure_timing.dart';

/// Drives one recording from countdown to decision. Samples never go into
/// state. Only a short live window is emitted (CLAUDE.md section 8).
class MeasureCubit extends Cubit<MeasureState> {
  MeasureCubit(this._repository, [this._timing = const MeasureTiming()])
    : super(const MeasureState.idle());

  /// 3 s of user acceleration at 100 Hz.
  static const liveSamples = 300;

  final MeasureRepository _repository;
  final MeasureTiming _timing;
  final Stopwatch _stopwatch = Stopwatch();

  Timer? _timer;
  SessionLabels? _labels;
  bool _recording = false;

  Future<void> start(SessionLabels labels) async {
    if (state is! MeasureIdle) return;

    _labels = labels;
    var left = _timing.countdownSeconds;
    emit(MeasureState.countdown(left));
    _timer = Timer.periodic(_timing.countdownTick, (timer) {
      left--;
      if (left > 0) {
        emit(MeasureState.countdown(left));
        return;
      }
      timer.cancel();
      unawaited(_beginRecording());
    });
  }

  Future<void> _beginRecording() async {
    try {
      await _repository.startRecording();
    } on Failure catch (failure) {
      emit(MeasureState.failure(failure));
      return;
    }

    _recording = true;
    _stopwatch
      ..reset()
      ..start();
    emit(
      MeasureState.recording(
        elapsed: Duration.zero,
        window: _repository.liveWindow(liveSamples),
      ),
    );
    _timer = Timer.periodic(_timing.liveTick, (_) => _onLiveTick());
  }

  void _onLiveTick() {
    final elapsed = _stopwatch.elapsed;
    if (elapsed >= _timing.recordingDuration) {
      unawaited(_finish());
      return;
    }
    emit(
      MeasureState.recording(
        elapsed: elapsed,
        window: _repository.liveWindow(liveSamples),
      ),
    );
  }

  Future<void> _finish() async {
    _timer?.cancel();
    _stopwatch.stop();
    _recording = false;
    emit(const MeasureState.processing());

    try {
      final outcome = await _repository.finishRecording(_labels!);
      final result = outcome.result;
      if (result.status == TremorStatus.invalid) {
        emit(MeasureState.invalid(_reasonsFrom(result)));
      } else {
        emit(
          MeasureState.success(result: result, sessionId: outcome.session.id),
        );
      }
    } on Failure catch (failure) {
      emit(MeasureState.failure(failure));
    }
  }

  /// Called when the app leaves the foreground. Stops the recording and marks
  /// it invalid, because a phone that moves or is handled corrupts the signal.
  void interrupt() {
    if (!_recording) return;
    _timer?.cancel();
    _stopwatch.stop();
    _recording = false;
    unawaited(_repository.cancelRecording());
    emit(const MeasureState.invalid([InvalidReason.interrupted]));
  }

  /// Cancels the countdown or the recording without analyzing it.
  Future<void> cancel() async {
    _timer?.cancel();
    _stopwatch.stop();
    if (_recording) {
      _recording = false;
      await _repository.cancelRecording();
    }
    emit(const MeasureState.idle());
  }

  /// Returns to idle so the user can measure again.
  void retry() {
    if (state is MeasureIdle || state is MeasureCountdown) return;
    if (state is MeasureRecording || state is MeasureProcessing) return;
    emit(const MeasureState.idle());
  }

  List<InvalidReason> _reasonsFrom(TremorResult result) {
    return [
      for (final gate in result.gates)
        if (!gate.passed)
          switch (gate.check) {
            GateCheck.sampling => InvalidReason.sampling,
            GateCheck.dataGap => InvalidReason.dataGap,
            GateCheck.flatSignal => InvalidReason.flatSignal,
          },
    ];
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    if (_recording) {
      unawaited(_repository.cancelRecording());
    }
    return super.close();
  }
}
