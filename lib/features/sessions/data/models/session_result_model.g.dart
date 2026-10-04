// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionResultModel _$SessionResultModelFromJson(Map<String, dynamic> json) =>
    _SessionResultModel(
      status: json['status'] as String,
      features: json['features'] == null
          ? null
          : SessionFeaturesModel.fromJson(
              json['features'] as Map<String, dynamic>,
            ),
      gates: (json['gates'] as List<dynamic>)
          .map((e) => SessionGateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SessionResultModelToJson(_SessionResultModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'features': _featuresToJson(instance.features),
      'gates': _gatesToJson(instance.gates),
    };
