import 'package:biomarker_demo/core/errors/_errors.dart';
import 'package:biomarker_demo/dsp/_dsp.dart';
import 'package:biomarker_demo/features/measure/domain/entity/live_window.dart';
import 'package:biomarker_demo/features/measure/domain/entity/measure_outcome.dart';
import 'package:biomarker_demo/features/measure/domain/repositories/measure_repository.dart';
import 'package:biomarker_demo/features/measure/presentation/cubit/_cubits.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/session_fixtures.dart';

class MockMeasureRepository extends Mock implements MeasureRepository {}

const _fastTiming = MeasureTiming(
  countdownSeconds: 2,
  countdownTick: Duration(milliseconds: 5),
  recordingDuration: Duration(milliseconds: 40),
  liveTick: Duration(milliseconds: 5),
);

TremorResult _result({
  TremorStatus status = TremorStatus.tremor,
  List<GateResult>? gates,
}) {
  return TremorResult(
    status: status,
    qc: const QcResult(
      effectiveFsHz: 99,
      jitter: 0.1,
      maxGapMs: 12,
      monotonic: true,
    ),
    gates: gates ?? const [GateResult(check: GateCheck.sampling, passed: true)],
    features: status == TremorStatus.invalid
        ? null
        : const TremorFeatures(
            peakFrequencyHz: 5,
            bandPowerRatio: 0.5,
            snr: 6,
            bandRms: 0.02,
            consistency: 0.7,
          ),
  );
}

void main() {
  late MockMeasureRepository repository;

  // mocktail needs a fallback for any() matchers on non-primitive arguments.
  setUpAll(() {
    registerFallbackValue(labelsFixture());
  });

  setUp(() {
    repository = MockMeasureRepository();
    when(() => repository.liveWindow(any())).thenReturn(LiveWindow.empty);
    when(() => repository.startRecording()).thenAnswer((_) async {});
    when(() => repository.cancelRecording()).thenAnswer((_) async {});
  });

  Future<MeasureState> waitForTerminal(MeasureCubit cubit) {
    return cubit.stream.firstWhere(
      (s) => s is MeasureSuccess || s is MeasureInvalid || s is MeasureFailure,
    );
  }

  test('runs countdown, recording, processing, then success', () async {
    when(() => repository.finishRecording(any())).thenAnswer(
      (_) async => MeasureOutcome(
        session: sessionFixture(id: 'abc'),
        result: _result(),
      ),
    );
    final cubit = MeasureCubit(repository, _fastTiming);
    final seen = <MeasureState>[];
    final sub = cubit.stream.listen(seen.add);

    cubit.start(labelsFixture());
    final terminal = await waitForTerminal(
      cubit,
    ).timeout(const Duration(seconds: 5));
    await sub.cancel();

    expect(seen.whereType<MeasureCountdown>(), isNotEmpty);
    expect(seen.whereType<MeasureRecording>(), isNotEmpty);
    expect(seen.whereType<MeasureProcessing>(), hasLength(1));
    expect(terminal, isA<MeasureSuccess>());
    expect((terminal as MeasureSuccess).sessionId, 'abc');
    verify(() => repository.startRecording()).called(1);
    await cubit.close();
  });

  test('reports invalid with the failed gate reasons', () async {
    when(() => repository.finishRecording(any())).thenAnswer(
      (_) async => MeasureOutcome(
        session: sessionFixture(),
        result: _result(
          status: TremorStatus.invalid,
          gates: const [
            GateResult(check: GateCheck.sampling, passed: true),
            GateResult(check: GateCheck.flatSignal, passed: false),
          ],
        ),
      ),
    );
    final cubit = MeasureCubit(repository, _fastTiming);

    cubit.start(labelsFixture());
    final terminal = await waitForTerminal(
      cubit,
    ).timeout(const Duration(seconds: 5));

    expect(terminal, isA<MeasureInvalid>());
    expect((terminal as MeasureInvalid).reasons, [InvalidReason.flatSignal]);
    await cubit.close();
  });

  test('reports failure when the sensors cannot start', () async {
    when(
      () => repository.startRecording(),
    ).thenThrow(const SensorFailure('no accelerometer'));
    final cubit = MeasureCubit(repository, _fastTiming);

    cubit.start(labelsFixture());
    final terminal = await waitForTerminal(
      cubit,
    ).timeout(const Duration(seconds: 5));

    expect(terminal, isA<MeasureFailure>());
    expect((terminal as MeasureFailure).failure, isA<SensorFailure>());
    await cubit.close();
  });

  test('interrupt during recording stops it and marks it invalid', () async {
    const slowTiming = MeasureTiming(
      countdownSeconds: 1,
      countdownTick: Duration(milliseconds: 5),
      recordingDuration: Duration(seconds: 10),
      liveTick: Duration(milliseconds: 5),
    );
    final cubit = MeasureCubit(repository, slowTiming);

    cubit.start(labelsFixture());
    await cubit.stream.firstWhere((s) => s is MeasureRecording);
    cubit.interrupt();

    expect(
      cubit.state,
      const MeasureState.invalid([InvalidReason.interrupted]),
    );
    verify(() => repository.cancelRecording()).called(1);
    verifyNever(() => repository.finishRecording(any()));
    await cubit.close();
  });

  test('interrupt is ignored when no recording is running', () {
    final cubit = MeasureCubit(repository, _fastTiming);

    cubit.interrupt();

    expect(cubit.state, const MeasureState.idle());
    verifyNever(() => repository.cancelRecording());
  });

  test('retry returns an invalid result to idle', () async {
    when(() => repository.finishRecording(any())).thenAnswer(
      (_) async => MeasureOutcome(
        session: sessionFixture(),
        result: _result(
          status: TremorStatus.invalid,
          gates: const [GateResult(check: GateCheck.dataGap, passed: false)],
        ),
      ),
    );
    final cubit = MeasureCubit(repository, _fastTiming);
    cubit.start(labelsFixture());
    await waitForTerminal(cubit).timeout(const Duration(seconds: 5));

    cubit.retry();

    expect(cubit.state, const MeasureState.idle());
    await cubit.close();
  });
}
