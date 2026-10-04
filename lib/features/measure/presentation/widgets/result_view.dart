import 'package:flutter/material.dart';

import '../../../../core/strings/app_strings.dart';
import '../../../../core/widgets/_widgets.dart';
import '../../../../dsp/_dsp.dart';
import 'signal_chart.dart';

/// Debug views after a successful analysis (CLAUDE.md section 9).
class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.result, required this.config});

  final TremorResult result;
  final DspConfig config;

  @override
  Widget build(BuildContext context) {
    final debug = result.debug;
    final features = result.features;
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        DecisionBanner(status: result.status, calibrated: config.calibrated),
        const SizedBox(height: 16),
        if (debug != null) ...[
          Text(AppStrings.signalBeforeFilter, style: textTheme.titleSmall),
          SignalChart(values: debug.rawX, sampleRateHz: config.targetFsHz),
          const SizedBox(height: 12),
          Text(AppStrings.signalAfterFilter, style: textTheme.titleSmall),
          SignalChart(values: debug.filteredX, sampleRateHz: config.targetFsHz),
          const SizedBox(height: 12),
          Text(AppStrings.spectrumTitle, style: textTheme.titleSmall),
          // SpectrumChart(
          //   spectrum: debug.spectrum,
          //   tremorBandHz: config.tremorBandHz,
          // ),
          const SizedBox(height: 16),
        ],
        if (features != null) ...[
          Text(AppStrings.result, style: textTheme.titleSmall),
          FeatureTable(features: features),
          const SizedBox(height: 16),
        ],
        Text(AppStrings.qualityGates, style: textTheme.titleSmall),
        GateList(gates: result.gates),
        const SizedBox(height: 16),
        Text(AppStrings.metadata, style: textTheme.titleSmall),
        Text(
          '${AppStrings.effectiveFs}: '
          '${result.qc.effectiveFsHz.toStringAsFixed(1)} Hz\n'
          '${AppStrings.jitter}: ${result.qc.jitter.toStringAsFixed(3)}\n'
          '${AppStrings.maxGap}: ${result.qc.maxGapMs.toStringAsFixed(0)} ms',
        ),
      ],
    );
  }
}
