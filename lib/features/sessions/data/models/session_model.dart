import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../dsp/_dsp.dart';
import '../../domain/entity/session_condition.dart';
import '../../domain/entity/session_device.dart';
import '../../domain/entity/session_entity.dart';
import '../../domain/entity/session_hand.dart';
import '../../domain/entity/session_result.dart';
import '../../domain/entity/session_sampling.dart';
import 'session_device_model.dart';
import 'session_features_model.dart';
import 'session_gate_model.dart';
import 'session_result_model.dart';
import 'session_sampling_model.dart';

part 'session_model.freezed.dart';
part 'session_model.g.dart';

/// Hive value and meta.json content. Field names follow the meta.json
/// example in CLAUDE.md section 6.
@Freezed(toJson: true, fromJson: true)
abstract class SessionModel with _$SessionModel {
  const factory SessionModel({
    required String sessionId,

    /// UTC ISO-8601, for example "2026-10-03T03:15:00.000Z".
    required String createdAt,
    required String subjectCode,
    required String hand,
    required String condition,
    required int repetition,
    double? simulatedFrequencyHz,
    required String notes,
    @JsonKey(toJson: _deviceToJson) required SessionDeviceModel device,
    @JsonKey(toJson: _samplingToJson) required SessionSamplingModel sampling,
    required String algoVersion,
    @JsonKey(toJson: _resultToJson) required SessionResultModel result,
  }) = _SessionModel;

  const SessionModel._();

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  factory SessionModel.fromEntity(SessionEntity entity) {
    final result = entity.result;
    return SessionModel(
      sessionId: entity.id,
      createdAt: entity.createdAt.toUtc().toIso8601String(),
      subjectCode: entity.subjectCode,
      hand: entity.hand.name,
      condition: _conditionToWire(entity.condition),
      repetition: entity.repetition,
      simulatedFrequencyHz: entity.simulatedFrequencyHz,
      notes: entity.notes,
      device: SessionDeviceModel(
        model: entity.device.model,
        os: entity.device.os,
        appVersion: entity.device.appVersion,
      ),
      sampling: SessionSamplingModel(
        requestedPeriodUs: entity.sampling.requestedPeriodUs,
        effectiveFsHz: entity.sampling.effectiveFsHz,
        jitter: entity.sampling.jitter,
        maxGapMs: entity.sampling.maxGapMs,
      ),
      algoVersion: entity.algoVersion,
      result: SessionResultModel(
        status: result.status.name,
        features: result.features == null
            ? null
            : SessionFeaturesModel(
                peakFrequencyHz: result.features!.peakFrequencyHz,
                bandPowerRatio: result.features!.bandPowerRatio,
                snr: result.features!.snr,
                bandRms: result.features!.bandRms,
                consistency: result.features!.consistency,
              ),
        gates: [
          for (final gate in result.gates)
            SessionGateModel(check: gate.check.name, passed: gate.passed),
        ],
      ),
    );
  }

  SessionEntity toEntity() {
    return SessionEntity(
      id: sessionId,
      createdAt: DateTime.parse(createdAt),
      subjectCode: subjectCode,
      hand: SessionHand.values.byName(hand),
      condition: _conditionFromWire(condition),
      repetition: repetition,
      simulatedFrequencyHz: simulatedFrequencyHz,
      notes: notes,
      device: SessionDevice(
        model: device.model,
        os: device.os,
        appVersion: device.appVersion,
      ),
      sampling: SessionSampling(
        requestedPeriodUs: sampling.requestedPeriodUs,
        effectiveFsHz: sampling.effectiveFsHz,
        jitter: sampling.jitter,
        maxGapMs: sampling.maxGapMs,
      ),
      algoVersion: algoVersion,
      result: SessionResult(
        status: TremorStatus.values.byName(result.status),
        features: result.features == null
            ? null
            : TremorFeatures(
                peakFrequencyHz: result.features!.peakFrequencyHz,
                bandPowerRatio: result.features!.bandPowerRatio,
                snr: result.features!.snr,
                bandRms: result.features!.bandRms,
                consistency: result.features!.consistency,
              ),
        gates: [
          for (final gate in result.gates)
            GateResult(
              check: GateCheck.values.byName(gate.check),
              passed: gate.passed,
            ),
        ],
      ),
    );
  }

  static String _conditionToWire(SessionCondition condition) {
    return switch (condition) {
      SessionCondition.rest => 'rest',
      SessionCondition.postural => 'postural',
      SessionCondition.noiseFloor => 'noise_floor',
      SessionCondition.simulated => 'simulated',
    };
  }

  static SessionCondition _conditionFromWire(String wire) {
    return switch (wire) {
      'rest' => SessionCondition.rest,
      'postural' => SessionCondition.postural,
      'noise_floor' => SessionCondition.noiseFloor,
      'simulated' => SessionCondition.simulated,
      _ => throw FormatException('Unknown condition: $wire'),
    };
  }
}

// Nested models must become Maps for Hive and jsonEncode. See the note in
// SessionResultModel.
Map<String, dynamic> _deviceToJson(SessionDeviceModel value) => value.toJson();

Map<String, dynamic> _samplingToJson(SessionSamplingModel value) =>
    value.toJson();

Map<String, dynamic> _resultToJson(SessionResultModel value) => value.toJson();
