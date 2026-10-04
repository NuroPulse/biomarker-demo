// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionDeviceModel _$SessionDeviceModelFromJson(Map<String, dynamic> json) =>
    _SessionDeviceModel(
      model: json['model'] as String,
      os: json['os'] as String,
      appVersion: json['appVersion'] as String,
    );

Map<String, dynamic> _$SessionDeviceModelToJson(_SessionDeviceModel instance) =>
    <String, dynamic>{
      'model': instance.model,
      'os': instance.os,
      'appVersion': instance.appVersion,
    };
