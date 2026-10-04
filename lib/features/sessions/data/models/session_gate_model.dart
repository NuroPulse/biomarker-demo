import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_gate_model.freezed.dart';
part 'session_gate_model.g.dart';

@freezed
abstract class SessionGateModel with _$SessionGateModel {
  const factory SessionGateModel({
    /// GateCheck enum name, for example "dataGap".
    required String check,
    required bool passed,
  }) = _SessionGateModel;

  factory SessionGateModel.fromJson(Map<String, dynamic> json) =>
      _$SessionGateModelFromJson(json);
}
