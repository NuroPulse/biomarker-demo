import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../domain/entity/live_window.dart';

/// Live preview of the last few seconds of user acceleration. Drawn with
/// CustomPainter so repaints stay cheap (CLAUDE.md section 2).
class LiveWaveform extends StatelessWidget {
  const LiveWaveform({super.key, required this.window});

  final LiveWindow window;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: CustomPaint(
        painter: _WaveformPainter(
          window: window,
          colors: [scheme.primary, scheme.tertiary, scheme.secondary],
          gridColor: scheme.outlineVariant,
        ),
      ),
    );
  }
}

class _WaveformPainter extends CustomPainter {
  _WaveformPainter({
    required this.window,
    required this.colors,
    required this.gridColor,
  });

  final LiveWindow window;
  final List<Color> colors;
  final Color gridColor;

  @override
  void paint(Canvas canvas, Size size) {
    final midline = Paint()
      ..color = gridColor
      ..strokeWidth = 1;
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      midline,
    );

    final channels = [window.x, window.y, window.z];
    final amplitude = _peakAmplitude(channels);
    if (amplitude == 0) return;

    final scale = (size.height / 2) / amplitude;
    for (var c = 0; c < channels.length; c++) {
      _drawChannel(canvas, size, channels[c], scale, colors[c]);
    }
  }

  void _drawChannel(
    Canvas canvas,
    Size size,
    Float64List values,
    double scale,
    Color color,
  ) {
    if (values.length < 2) return;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path();
    final mid = size.height / 2;
    final dx = size.width / (values.length - 1);
    for (var i = 0; i < values.length; i++) {
      final point = Offset(i * dx, mid - values[i] * scale);
      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }
    canvas.drawPath(path, paint);
  }

  double _peakAmplitude(List<Float64List> channels) {
    var peak = 0.0;
    for (final values in channels) {
      for (final value in values) {
        peak = math.max(peak, value.abs());
      }
    }
    return peak;
  }

  @override
  bool shouldRepaint(_WaveformPainter oldDelegate) {
    return oldDelegate.window != window;
  }
}
