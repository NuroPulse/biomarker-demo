import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_sampling_model.freezed.dart';
part 'session_sampling_model.g.dart';

@freezed
abstract class SessionSamplingModel with _$SessionSamplingModel {
  const factory SessionSamplingModel({
    required int requestedPeriodUs,
    required double effectiveFsHz,
    required double jitter,
    required double maxGapMs,
  }) = _SessionSamplingModel;

  factory SessionSamplingModel.fromJson(Map<String, dynamic> json) =>
      _$SessionSamplingModelFromJson(json);
}
