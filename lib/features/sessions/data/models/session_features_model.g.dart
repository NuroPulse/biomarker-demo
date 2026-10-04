// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_features_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionFeaturesModel _$SessionFeaturesModelFromJson(
  Map<String, dynamic> json,
) => _SessionFeaturesModel(
  peakFrequencyHz: (json['peakFrequencyHz'] as num).toDouble(),
  bandPowerRatio: (json['bandPowerRatio'] as num).toDouble(),
  snr: (json['snr'] as num).toDouble(),
  bandRms: (json['bandRms'] as num).toDouble(),
  consistency: (json['consistency'] as num).toDouble(),
);

Map<String, dynamic> _$SessionFeaturesModelToJson(
  _SessionFeaturesModel instance,
) => <String, dynamic>{
  'peakFrequencyHz': instance.peakFrequencyHz,
  'bandPowerRatio': instance.bandPowerRatio,
  'snr': instance.snr,
  'bandRms': instance.bandRms,
  'consistency': instance.consistency,
};
