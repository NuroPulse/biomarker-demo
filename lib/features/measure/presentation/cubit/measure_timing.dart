/// Durations for one recording. Defaults follow CLAUDE.md section 7: a 3 s
/// countdown, then 20 s of recording. Tests pass shorter values.
class MeasureTiming {
  static const defaultRecordingDuration = Duration(seconds: 20);

  const MeasureTiming({
    this.countdownSeconds = 3,
    this.recordingDuration = defaultRecordingDuration,
    this.countdownTick = const Duration(seconds: 1),
    this.liveTick = const Duration(milliseconds: 100),
  });

  final int countdownSeconds;
  final Duration recordingDuration;
  final Duration countdownTick;

  /// About 10 updates per second, so the main thread does not slow sensor
  /// delivery (CLAUDE.md section 8).
  final Duration liveTick;
}
