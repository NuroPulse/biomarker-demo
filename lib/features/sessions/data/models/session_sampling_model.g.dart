// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_sampling_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionSamplingModel _$SessionSamplingModelFromJson(
  Map<String, dynamic> json,
) => _SessionSamplingModel(
  requestedPeriodUs: (json['requestedPeriodUs'] as num).toInt(),
  effectiveFsHz: (json['effectiveFsHz'] as num).toDouble(),
  jitter: (json['jitter'] as num).toDouble(),
  maxGapMs: (json['maxGapMs'] as num).toDouble(),
);

Map<String, dynamic> _$SessionSamplingModelToJson(
  _SessionSamplingModel instance,
) => <String, dynamic>{
  'requestedPeriodUs': instance.requestedPeriodUs,
  'effectiveFsHz': instance.effectiveFsHz,
  'jitter': instance.jitter,
  'maxGapMs': instance.maxGapMs,
};
