import '../../../../core/strings/app_strings.dart';
import '../../../../dsp/_dsp.dart';
import '../../domain/entity/session_condition.dart';
import '../../domain/entity/session_hand.dart';

/// Indonesian labels for session values. Kept here, next to the sessions
/// presentation, so AppStrings does not depend on the sessions domain.
class SessionTexts {
  const SessionTexts._();

  static String condition(SessionCondition condition) {
    return switch (condition) {
      SessionCondition.rest => AppStrings.conditionRest,
      SessionCondition.postural => AppStrings.conditionPostural,
      SessionCondition.noiseFloor => AppStrings.conditionNoiseFloor,
      SessionCondition.simulated => AppStrings.conditionSimulated,
    };
  }

  static String hand(SessionHand hand) {
    return switch (hand) {
      SessionHand.left => AppStrings.handLeft,
      SessionHand.right => AppStrings.handRight,
    };
  }

  static String decision(TremorStatus status) {
    return switch (status) {
      TremorStatus.none => AppStrings.decisionNone,
      TremorStatus.tremor => AppStrings.decisionTremor,
      TremorStatus.invalid => AppStrings.decisionInvalid,
    };
  }
}
