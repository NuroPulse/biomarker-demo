import '../../../../dsp/_dsp.dart';
import '../../../sessions/domain/entity/session_entity.dart';

/// A finished recording: the saved session and its analysis.
class MeasureOutcome {
  const MeasureOutcome({required this.session, required this.result});

  final SessionEntity session;
  final TremorResult result;
}
