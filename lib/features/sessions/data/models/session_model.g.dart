// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionModel _$SessionModelFromJson(
  Map<String, dynamic> json,
) => _SessionModel(
  sessionId: json['sessionId'] as String,
  createdAt: json['createdAt'] as String,
  subjectCode: json['subjectCode'] as String,
  hand: json['hand'] as String,
  condition: json['condition'] as String,
  repetition: (json['repetition'] as num).toInt(),
  simulatedFrequencyHz: (json['simulatedFrequencyHz'] as num?)?.toDouble(),
  notes: json['notes'] as String,
  device: SessionDeviceModel.fromJson(json['device'] as Map<String, dynamic>),
  sampling: SessionSamplingModel.fromJson(
    json['sampling'] as Map<String, dynamic>,
  ),
  algoVersion: json['algoVersion'] as String,
  result: SessionResultModel.fromJson(json['result'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SessionModelToJson(_SessionModel instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'createdAt': instance.createdAt,
      'subjectCode': instance.subjectCode,
      'hand': instance.hand,
      'condition': instance.condition,
      'repetition': instance.repetition,
      'simulatedFrequencyHz': instance.simulatedFrequencyHz,
      'notes': instance.notes,
      'device': _deviceToJson(instance.device),
      'sampling': _samplingToJson(instance.sampling),
      'algoVersion': instance.algoVersion,
      'result': _resultToJson(instance.result),
    };
