import 'dart:typed_data';

import 'package:biomarker_demo/dsp/_dsp.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/test_support.dart';

GateResult _gate(TremorResult result, GateCheck check) {
  return result.gates.firstWhere((gate) => gate.check == check);
}

void main() {
  final config = loadShippedConfig();
  final pipeline = TremorPipeline(config);

  test('reports tremor for a clean 5 Hz tone', () {
    final t = jitteredTimestamps(seconds: 25, seed: 1);
    final input = syntheticInput(t, freqHz: 5.0, amp: 0.05, noiseSd: 0.005);

    final result = pipeline.analyze(input);

    expect(result.status, TremorStatus.tremor);
    expect(result.features!.peakFrequencyHz, closeTo(5.0, 0.25));
  });

  test('reports none for broadband noise at rest', () {
    final t = jitteredTimestamps(seconds: 25, seed: 3);
    final input = syntheticInput(t, noiseSd: 0.02, seed: 3);

    final result = pipeline.analyze(input);

    expect(result.status, TremorStatus.none);
    expect(result.gates.every((gate) => gate.passed), isTrue);
  });

  test('reports invalid, not none, for an all-zero signal', () {
    final t = jitteredTimestamps(seconds: 25, seed: 6);
    final zeros = Float64List(t.length);
    final input = DspInput(tUs: t, x: zeros, y: zeros, z: zeros);

    final result = pipeline.analyze(input);

    expect(result.status, TremorStatus.invalid);
    expect(_gate(result, GateCheck.flatSignal).passed, isFalse);
    expect(result.features, isNull);
  });

  test('reports invalid for repeated timestamps', () {
    final t = jitteredTimestamps(seconds: 25, seed: 7);
    t[500] = t[499];
    final input = syntheticInput(t, freqHz: 5.0);

    final result = pipeline.analyze(input);

    expect(result.status, TremorStatus.invalid);
    expect(_gate(result, GateCheck.sampling).passed, isFalse);
  });

  test('reports invalid for a 300 ms data gap', () {
    final t = jitteredTimestamps(seconds: 25, seed: 8);
    for (var i = 600; i < t.length; i++) {
      t[i] += 300000;
    }
    final input = syntheticInput(t, freqHz: 5.0);

    final result = pipeline.analyze(input);

    expect(result.status, TremorStatus.invalid);
    expect(_gate(result, GateCheck.dataGap).passed, isFalse);
  });

  test('reports invalid when the effective rate is below 50 Hz', () {
    final t = jitteredTimestamps(
      seconds: 25,
      periodUs: 25000,
      jitterUs: 500,
      seed: 9,
    );
    final input = syntheticInput(t, freqHz: 5.0);

    final result = pipeline.analyze(input);

    expect(result.status, TremorStatus.invalid);
    expect(_gate(result, GateCheck.sampling).passed, isFalse);
  });
}
