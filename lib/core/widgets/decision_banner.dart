import 'package:flutter/material.dart';

import '../../dsp/_dsp.dart';
import '../strings/app_strings.dart';

/// Shows the decision and, while thresholds are uncalibrated, a warning.
/// The wording never implies a diagnosis (CLAUDE.md section 5).
class DecisionBanner extends StatelessWidget {
  const DecisionBanner({
    super.key,
    required this.status,
    required this.calibrated,
  });

  final TremorStatus status;
  final bool calibrated;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final (text, background, foreground) = switch (status) {
      TremorStatus.none => (
        AppStrings.decisionNone,
        scheme.secondaryContainer,
        scheme.onSecondaryContainer,
      ),
      TremorStatus.tremor => (
        AppStrings.decisionTremor,
        scheme.tertiaryContainer,
        scheme.onTertiaryContainer,
      ),
      TremorStatus.invalid => (
        AppStrings.decisionInvalid,
        scheme.errorContainer,
        scheme.onErrorContainer,
      ),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          color: background,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: foreground),
            ),
          ),
        ),
        if (!calibrated)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              AppStrings.uncalibrated,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
      ],
    );
  }
}
