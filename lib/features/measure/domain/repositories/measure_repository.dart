import '../../../sessions/domain/entity/session_labels.dart';
import '../entity/live_window.dart';
import '../entity/measure_outcome.dart';

/// Records the three sensor streams, analyzes them, and saves the session.
abstract class MeasureRepository {
  /// Starts all three sensor listeners and keeps the screen awake.
  /// Throws SensorFailure if the sensors cannot start.
  Future<void> startRecording();

  /// Latest [samples] of user acceleration, for the live waveform.
  LiveWindow liveWindow(int samples);

  /// Stops the listeners and discards the buffers. Does not analyze.
  Future<void> cancelRecording();

  /// Stops, runs the DSP off the UI isolate, saves the session, and returns the
  /// outcome. Throws Failure subclasses.
  Future<MeasureOutcome> finishRecording(SessionLabels labels);
}
