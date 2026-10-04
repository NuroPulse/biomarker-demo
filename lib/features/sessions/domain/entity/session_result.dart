import '../../../../dsp/_dsp.dart';

/// Saved outcome of one analysis. Holds DSP types directly, which CLAUDE.md
/// section 3 allows.
class SessionResult {
  const SessionResult({
    required this.status,
    required this.gates,
    this.features,
  });

  final TremorStatus status;
  final List<GateResult> gates;

  /// Null when a gate failed before features were computed.
  final TremorFeatures? features;
}
