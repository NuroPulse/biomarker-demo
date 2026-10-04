import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_device_model.freezed.dart';
part 'session_device_model.g.dart';

@freezed
abstract class SessionDeviceModel with _$SessionDeviceModel {
  const factory SessionDeviceModel({
    required String model,
    required String os,
    required String appVersion,
  }) = _SessionDeviceModel;

  factory SessionDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$SessionDeviceModelFromJson(json);
}
