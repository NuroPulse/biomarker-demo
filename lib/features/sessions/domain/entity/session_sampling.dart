/// Measured sampling quality. The effective rate comes from timestamps, never
/// from the requested period (CLAUDE.md section 6).
class SessionSampling {
  const SessionSampling({
    required this.requestedPeriodUs,
    required this.effectiveFsHz,
    required this.jitter,
    required this.maxGapMs,
  });

  final int requestedPeriodUs;
  final double effectiveFsHz;
  final double jitter;
  final double maxGapMs;
}
