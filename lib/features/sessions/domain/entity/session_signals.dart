import 'signal_trace.dart';

/// The three streams recorded in one session (CLAUDE.md section 6).
class SessionSignals {
  const SessionSignals({
    required this.userAcc,
    required this.accRaw,
    required this.gyro,
  });

  /// Gravity removed by the OS. Written to user_acc.csv.
  final SignalTrace userAcc;

  /// Raw acceleration including gravity. Written to acc_raw.csv.
  final SignalTrace accRaw;

  /// Angular velocity. Written to gyro.csv.
  final SignalTrace gyro;
}
