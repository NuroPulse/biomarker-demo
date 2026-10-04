import 'dart:math' as math;
import 'dart:typed_data';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// Time-domain chart. Downsampled to at most [maxPoints] so fl_chart stays
/// responsive on long recordings (CLAUDE.md section 2).
class SignalChart extends StatelessWidget {
  const SignalChart({
    super.key,
    required this.values,
    required this.sampleRateHz,
    this.maxPoints = 500,
  });

  final Float64List values;
  final double sampleRateHz;
  final int maxPoints;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    final stride = math.max(1, (values.length / maxPoints).ceil());
    final spots = [
      for (var i = 0; i < values.length; i += stride)
        FlSpot(i / sampleRateHz, values[i]),
    ];

    return SizedBox(
      height: 160,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              color: color,
              barWidth: 1.5,
              dotData: const FlDotData(show: false),
            ),
          ],
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }
}
