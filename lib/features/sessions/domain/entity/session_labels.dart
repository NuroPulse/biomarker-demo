import 'session_condition.dart';
import 'session_hand.dart';

/// Labels the user fills in before Start. Subject code, hand, and condition
/// are required, because unlabeled sessions are useless for calibration.
class SessionLabels {
  const SessionLabels({
    required this.subjectCode,
    required this.hand,
    required this.condition,
    required this.repetition,
    this.simulatedFrequencyHz,
    this.notes = '',
  });

  /// Anonymous code only. Never a name or any identifying information.
  final String subjectCode;
  final SessionHand hand;
  final SessionCondition condition;
  final int repetition;
  final double? simulatedFrequencyHz;
  final String notes;
}
