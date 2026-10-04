import 'dart:typed_data';

import 'package:biomarker_demo/dsp/_dsp.dart';
import 'package:biomarker_demo/features/sessions/domain/entity/session_condition.dart';
import 'package:biomarker_demo/features/sessions/domain/entity/session_device.dart';
import 'package:biomarker_demo/features/sessions/domain/entity/session_entity.dart';
import 'package:biomarker_demo/features/sessions/domain/entity/session_hand.dart';
import 'package:biomarker_demo/features/sessions/domain/entity/session_labels.dart';
import 'package:biomarker_demo/features/sessions/domain/entity/session_result.dart';
import 'package:biomarker_demo/features/sessions/domain/entity/session_sampling.dart';
import 'package:biomarker_demo/features/sessions/domain/entity/session_signals.dart';
import 'package:biomarker_demo/features/sessions/domain/entity/signal_trace.dart';

SessionEntity sessionFixture({
  String id = 'session-1',
  DateTime? createdAt,
  TremorStatus status = TremorStatus.tremor,
  SessionCondition condition = SessionCondition.noiseFloor,
}) {
  return SessionEntity(
    id: id,
    createdAt: createdAt ?? DateTime.utc(2026, 10, 3, 3, 15),
    subjectCode: 'S01',
    hand: SessionHand.right,
    condition: condition,
    repetition: 2,
    simulatedFrequencyHz: null,
    notes: 'pagi',
    device: const SessionDevice(
      model: 'Pixel 7',
      os: 'Android 14',
      appVersion: '0.1.0',
    ),
    sampling: const SessionSampling(
      requestedPeriodUs: 10000,
      effectiveFsHz: 98.7,
      jitter: 0.21,
      maxGapMs: 31,
    ),
    algoVersion: '0.2.0-dev',
    result: SessionResult(
      status: status,
      features: const TremorFeatures(
        peakFrequencyHz: 5.2,
        bandPowerRatio: 0.6,
        snr: 7.5,
        bandRms: 0.03,
        consistency: 0.8,
      ),
      gates: const [
        GateResult(check: GateCheck.sampling, passed: true),
        GateResult(check: GateCheck.dataGap, passed: true),
        GateResult(check: GateCheck.flatSignal, passed: true),
      ],
    ),
  );
}

SessionLabels labelsFixture({
  SessionCondition condition = SessionCondition.rest,
  String subjectCode = 'S01',
}) {
  return SessionLabels(
    subjectCode: subjectCode,
    hand: SessionHand.left,
    condition: condition,
    repetition: 1,
  );
}

SessionSignals signalsFixture({int samples = 3}) {
  SignalTrace trace(double offset) => SignalTrace(
    tUs: Int64List.fromList([
      for (var i = 0; i < samples; i++) 1000000 + i * 10000,
    ]),
    x: Float64List.fromList([
      for (var i = 0; i < samples; i++) offset + i * 0.1,
    ]),
    y: Float64List.fromList([
      for (var i = 0; i < samples; i++) offset + i * 0.2,
    ]),
    z: Float64List.fromList([
      for (var i = 0; i < samples; i++) offset + i * 0.3,
    ]),
  );

  return SessionSignals(userAcc: trace(0), accRaw: trace(1), gyro: trace(2));
}
