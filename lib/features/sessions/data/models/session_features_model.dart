import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_features_model.freezed.dart';
part 'session_features_model.g.dart';

@freezed
abstract class SessionFeaturesModel with _$SessionFeaturesModel {
  const factory SessionFeaturesModel({
    required double peakFrequencyHz,
    required double bandPowerRatio,
    required double snr,
    required double bandRms,
    required double consistency,
  }) = _SessionFeaturesModel;

  factory SessionFeaturesModel.fromJson(Map<String, dynamic> json) =>
      _$SessionFeaturesModelFromJson(json);
}
