import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/strings/app_strings.dart';
import '../../../../dsp/_dsp.dart';

/// Power spectrum up to [maxHz]. Bins inside the tremor band are drawn in a
/// second color, so the band is highlighted (CLAUDE.md section 9).
class SpectrumChart extends StatelessWidget {
  const SpectrumChart({
    super.key,
    required this.spectrum,
    required this.tremorBandHz,
    this.maxHz = 15,
  });

  final Spectrum spectrum;
  final (double, double) tremorBandHz;
  final double maxHz;

  static const _allSeries = 0;
  static const _bandSeries = 1;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final all = <FlSpot>[];
    final band = <FlSpot>[];
    for (var k = 0; k < spectrum.frequencies.length; k++) {
      final f = spectrum.frequencies[k];
      if (f > maxHz) break;
      final spot = FlSpot(f, spectrum.power[k]);
      all.add(spot);
      if (f >= tremorBandHz.$1 && f <= tremorBandHz.$2) band.add(spot);
    }

    return SizedBox(
      height: 180,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: all,
              color: scheme.outline,
              barWidth: 1.5,
              dotData: const FlDotData(show: false),
            ),
            LineChartBarData(
              spots: band,
              color: scheme.tertiary,
              barWidth: 2.5,
              dotData: const FlDotData(show: false),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: _tooltipItems,
            ),
          ),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }

  /// The two series overlap inside the tremor band, so one tooltip is shown
  /// per touch. The band series wins, because it carries the band tag.
  List<LineTooltipItem?> _tooltipItems(List<LineBarSpot> touched) {
    final primary = _pickPrimary(touched);
    return [
      for (final spot in touched)
        identical(spot, primary) ? _itemFor(spot) : null,
    ];
  }

  LineBarSpot? _pickPrimary(List<LineBarSpot> touched) {
    for (final spot in touched) {
      if (spot.barIndex == _bandSeries) return spot;
    }
    for (final spot in touched) {
      if (spot.barIndex == _allSeries) return spot;
    }
    return null;
  }

  LineTooltipItem _itemFor(LineBarSpot spot) {
    final inBand = spot.barIndex == _bandSeries;
    final lines = [
      '${AppStrings.spectrumFrequency}: ${spot.x.toStringAsFixed(2)} Hz',
      '${AppStrings.spectrumPower}: ${spot.y.toStringAsExponential(2)}',
      if (inBand) AppStrings.tremorBandTag,
    ];
    return LineTooltipItem(
      lines.join('\n'),
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
    );
  }
}
