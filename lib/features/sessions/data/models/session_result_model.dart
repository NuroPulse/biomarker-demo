import 'package:freezed_annotation/freezed_annotation.dart';

import 'session_features_model.dart';
import 'session_gate_model.dart';

part 'session_result_model.freezed.dart';
part 'session_result_model.g.dart';

@Freezed(toJson: true, fromJson: true)
abstract class SessionResultModel with _$SessionResultModel {
  const factory SessionResultModel({
    /// TremorStatus enum name: none, tremor, or invalid.
    required String status,
    @JsonKey(toJson: _featuresToJson) SessionFeaturesModel? features,
    @JsonKey(toJson: _gatesToJson) required List<SessionGateModel> gates,
  }) = _SessionResultModel;

  factory SessionResultModel.fromJson(Map<String, dynamic> json) =>
      _$SessionResultModelFromJson(json);
}

// json_serializable writes nested objects as-is unless told otherwise. These
// functions make nested models serialize to Maps, which Hive and jsonEncode need.
Map<String, dynamic>? _featuresToJson(SessionFeaturesModel? value) =>
    value?.toJson();

List<Map<String, dynamic>> _gatesToJson(List<SessionGateModel> value) => [
  for (final gate in value) gate.toJson(),
];
