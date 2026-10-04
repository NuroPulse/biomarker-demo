import 'package:flutter/material.dart';

import '../../dsp/_dsp.dart';
import '../strings/app_strings.dart';

class FeatureTable extends StatelessWidget {
  const FeatureTable({super.key, required this.features});

  final TremorFeatures features;

  @override
  Widget build(BuildContext context) {
    final labels = AppStrings.featureLabels;
    final rows = [
      (labels.peak, '${features.peakFrequencyHz.toStringAsFixed(2)} Hz'),
      (labels.ratio, features.bandPowerRatio.toStringAsFixed(3)),
      (labels.snr, features.snr.toStringAsFixed(2)),
      (labels.rms, features.bandRms.toStringAsFixed(4)),
      (labels.consistency, features.consistency.toStringAsFixed(2)),
    ];

    return Table(
      columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(1)},
      children: [
        for (final (label, value) in rows)
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(label),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(value, textAlign: TextAlign.end),
              ),
            ],
          ),
      ],
    );
  }
}
