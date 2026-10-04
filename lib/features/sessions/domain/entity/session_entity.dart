import 'session_condition.dart';
import 'session_device.dart';
import 'session_hand.dart';
import 'session_result.dart';
import 'session_sampling.dart';

class SessionEntity {
  const SessionEntity({
    required this.id,
    required this.createdAt,
    required this.subjectCode,
    required this.hand,
    required this.condition,
    required this.repetition,
    required this.notes,
    required this.device,
    required this.sampling,
    required this.algoVersion,
    required this.result,
    this.simulatedFrequencyHz,
  });

  final String id;
  final DateTime createdAt;
  final String subjectCode;
  final SessionHand hand;
  final SessionCondition condition;
  final int repetition;
  final double? simulatedFrequencyHz;
  final String notes;
  final SessionDevice device;
  final SessionSampling sampling;
  final String algoVersion;
  final SessionResult result;
}
