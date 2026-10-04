import 'package:flutter/material.dart';

import '../../../../core/strings/app_strings.dart';
import '../../../../core/utils/_utils.dart';
import '../../domain/entity/session_entity.dart';
import 'session_texts.dart';

class SessionMetadataCard extends StatelessWidget {
  const SessionMetadataCard({super.key, required this.session});

  final SessionEntity session;

  @override
  Widget build(BuildContext context) {
    final s = session;
    final simulated = s.simulatedFrequencyHz == null
        ? ''
        : '\n${AppStrings.simulatedFrequency}: ${s.simulatedFrequencyHz}';
    final notes = s.notes.isEmpty ? '' : '\n${AppStrings.notes}: ${s.notes}';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          '${AppStrings.createdAt}: ${formatLocalDateTime(s.createdAt)}\n'
          '${AppStrings.subjectCode}: ${s.subjectCode}\n'
          '${AppStrings.hand}: ${SessionTexts.hand(s.hand)}\n'
          '${AppStrings.condition}: ${SessionTexts.condition(s.condition)}\n'
          '${AppStrings.repetition}: ${s.repetition}'
          '$simulated$notes\n'
          '${AppStrings.device}: ${s.device.model}, ${s.device.os}\n'
          '${AppStrings.effectiveFs}: ${s.sampling.effectiveFsHz.toStringAsFixed(1)} Hz\n'
          '${AppStrings.jitter}: ${s.sampling.jitter.toStringAsFixed(3)}\n'
          '${AppStrings.maxGap}: ${s.sampling.maxGapMs.toStringAsFixed(0)} ms\n'
          '${AppStrings.algoVersion}: ${s.algoVersion}',
        ),
      ),
    );
  }
}
