import 'dart:typed_data';

import 'dsp_config.dart';
import 'models/dsp_input.dart';
import 'models/gate_result.dart';
import 'models/tremor_result.dart';
import 'models/tremor_status.dart';
import 'stages/decision_rule.dart';
import 'stages/feature_extractor.dart';
import 'stages/quality_gate.dart';
import 'stages/qc_sampling.dart';
import 'stages/resampler.dart';
import 'stages/sos_filter.dart';
import 'stages/welch.dart';

class TremorPipeline {
  const TremorPipeline(this.config);

  final DspConfig config;

  TremorResult analyze(DspInput input) {
    final qc = QcSampling.measure(input.tUs);
    final gates = <GateResult>[...QualityGate.checkSampling(qc, config)];
    if (gates.any((gate) => !gate.passed)) {
      return TremorResult(status: TremorStatus.invalid, qc: qc, gates: gates);
    }

    final resampled = [
      for (final axis in input.axes)
        Resampler.toTargetRate(input.tUs, axis, config),
    ];
    gates.add(QualityGate.checkFlatSignal(resampled));
    if (gates.any((gate) => !gate.passed)) {
      return TremorResult(status: TremorStatus.invalid, qc: qc, gates: gates);
    }

    final processed = [for (final axis in resampled) _preprocess(axis)];
    final spectra = [
      for (final axis in processed)
        Welch.compute(
          axis,
          fs: config.targetFsHz,
          segmentLength: config.segmentSamples,
          overlap: config.overlapSamples,
          nfft: config.nfft,
        ),
    ];
    final summed = spectra.reduce((a, b) => a.plus(b));
    final features = FeatureExtractor.compute(summed, processed, config);
    final status = DecisionRule.decide(
      gates: gates,
      features: features,
      config: config,
    );

    return TremorResult(
      status: status,
      qc: qc,
      gates: gates,
      features: features,
    );
  }

  // Demean, band-pass, then drop the filter transient and the post-countdown
  Float64List _preprocess(Float64List resampled) {
    var mean = 0.0;
    for (final value in resampled) {
      mean += value;
    }
    mean /= resampled.length;

    final demeaned = Float64List(resampled.length);
    for (var i = 0; i < resampled.length; i++) {
      demeaned[i] = resampled[i] - mean;
    }

    final filtered = SosFilter.filtfilt(demeaned, config.bandpassSos);
    final drop = (config.dropEdgeS * config.targetFsHz).round();
    return filtered.sublist(drop);
  }
}
