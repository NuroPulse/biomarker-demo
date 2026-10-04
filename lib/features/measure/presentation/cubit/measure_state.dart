import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/_errors.dart';
import '../../../../dsp/_dsp.dart';
import '../../domain/entity/live_window.dart';
import 'invalid_reason.dart';

part 'measure_state.freezed.dart';

/// idle | countdown | recording | processing | success | invalid | failure.
/// The state only moves forward; retry returns to idle.
@freezed
sealed class MeasureState with _$MeasureState {
  const factory MeasureState.idle() = MeasureIdle;

  const factory MeasureState.countdown(int secondsLeft) = MeasureCountdown;

  const factory MeasureState.recording({
    required Duration elapsed,
    required LiveWindow window,
  }) = MeasureRecording;

  const factory MeasureState.processing() = MeasureProcessing;

  const factory MeasureState.success({
    required TremorResult result,
    required String sessionId,
  }) = MeasureSuccess;

  const factory MeasureState.invalid(List<InvalidReason> reasons) =
      MeasureInvalid;

  const factory MeasureState.failure(Failure failure) = MeasureFailure;
}
