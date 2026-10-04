// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionModel {

 String get sessionId;/// UTC ISO-8601, for example "2026-10-03T03:15:00.000Z".
 String get createdAt; String get subjectCode; String get hand; String get condition; int get repetition; double? get simulatedFrequencyHz; String get notes;@JsonKey(toJson: _deviceToJson) SessionDeviceModel get device;@JsonKey(toJson: _samplingToJson) SessionSamplingModel get sampling; String get algoVersion;@JsonKey(toJson: _resultToJson) SessionResultModel get result;
/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionModelCopyWith<SessionModel> get copyWith => _$SessionModelCopyWithImpl<SessionModel>(this as SessionModel, _$identity);

  /// Serializes this SessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionModel&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.subjectCode, subjectCode) || other.subjectCode == subjectCode)&&(identical(other.hand, hand) || other.hand == hand)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.repetition, repetition) || other.repetition == repetition)&&(identical(other.simulatedFrequencyHz, simulatedFrequencyHz) || other.simulatedFrequencyHz == simulatedFrequencyHz)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.device, device) || other.device == device)&&(identical(other.sampling, sampling) || other.sampling == sampling)&&(identical(other.algoVersion, algoVersion) || other.algoVersion == algoVersion)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,createdAt,subjectCode,hand,condition,repetition,simulatedFrequencyHz,notes,device,sampling,algoVersion,result);

@override
String toString() {
  return 'SessionModel(sessionId: $sessionId, createdAt: $createdAt, subjectCode: $subjectCode, hand: $hand, condition: $condition, repetition: $repetition, simulatedFrequencyHz: $simulatedFrequencyHz, notes: $notes, device: $device, sampling: $sampling, algoVersion: $algoVersion, result: $result)';
}


}

/// @nodoc
abstract mixin class $SessionModelCopyWith<$Res>  {
  factory $SessionModelCopyWith(SessionModel value, $Res Function(SessionModel) _then) = _$SessionModelCopyWithImpl;
@useResult
$Res call({
 String sessionId, String createdAt, String subjectCode, String hand, String condition, int repetition, double? simulatedFrequencyHz, String notes,@JsonKey(toJson: _deviceToJson) SessionDeviceModel device,@JsonKey(toJson: _samplingToJson) SessionSamplingModel sampling, String algoVersion,@JsonKey(toJson: _resultToJson) SessionResultModel result
});


$SessionDeviceModelCopyWith<$Res> get device;$SessionSamplingModelCopyWith<$Res> get sampling;$SessionResultModelCopyWith<$Res> get result;

}
/// @nodoc
class _$SessionModelCopyWithImpl<$Res>
    implements $SessionModelCopyWith<$Res> {
  _$SessionModelCopyWithImpl(this._self, this._then);

  final SessionModel _self;
  final $Res Function(SessionModel) _then;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? createdAt = null,Object? subjectCode = null,Object? hand = null,Object? condition = null,Object? repetition = null,Object? simulatedFrequencyHz = freezed,Object? notes = null,Object? device = null,Object? sampling = null,Object? algoVersion = null,Object? result = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,subjectCode: null == subjectCode ? _self.subjectCode : subjectCode // ignore: cast_nullable_to_non_nullable
as String,hand: null == hand ? _self.hand : hand // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,repetition: null == repetition ? _self.repetition : repetition // ignore: cast_nullable_to_non_nullable
as int,simulatedFrequencyHz: freezed == simulatedFrequencyHz ? _self.simulatedFrequencyHz : simulatedFrequencyHz // ignore: cast_nullable_to_non_nullable
as double?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as SessionDeviceModel,sampling: null == sampling ? _self.sampling : sampling // ignore: cast_nullable_to_non_nullable
as SessionSamplingModel,algoVersion: null == algoVersion ? _self.algoVersion : algoVersion // ignore: cast_nullable_to_non_nullable
as String,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as SessionResultModel,
  ));
}
/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionDeviceModelCopyWith<$Res> get device {
  
  return $SessionDeviceModelCopyWith<$Res>(_self.device, (value) {
    return _then(_self.copyWith(device: value));
  });
}/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionSamplingModelCopyWith<$Res> get sampling {
  
  return $SessionSamplingModelCopyWith<$Res>(_self.sampling, (value) {
    return _then(_self.copyWith(sampling: value));
  });
}/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionResultModelCopyWith<$Res> get result {
  
  return $SessionResultModelCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionModel].
extension SessionModelPatterns on SessionModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId,  String createdAt,  String subjectCode,  String hand,  String condition,  int repetition,  double? simulatedFrequencyHz,  String notes, @JsonKey(toJson: _deviceToJson)  SessionDeviceModel device, @JsonKey(toJson: _samplingToJson)  SessionSamplingModel sampling,  String algoVersion, @JsonKey(toJson: _resultToJson)  SessionResultModel result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that.sessionId,_that.createdAt,_that.subjectCode,_that.hand,_that.condition,_that.repetition,_that.simulatedFrequencyHz,_that.notes,_that.device,_that.sampling,_that.algoVersion,_that.result);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId,  String createdAt,  String subjectCode,  String hand,  String condition,  int repetition,  double? simulatedFrequencyHz,  String notes, @JsonKey(toJson: _deviceToJson)  SessionDeviceModel device, @JsonKey(toJson: _samplingToJson)  SessionSamplingModel sampling,  String algoVersion, @JsonKey(toJson: _resultToJson)  SessionResultModel result)  $default,) {final _that = this;
switch (_that) {
case _SessionModel():
return $default(_that.sessionId,_that.createdAt,_that.subjectCode,_that.hand,_that.condition,_that.repetition,_that.simulatedFrequencyHz,_that.notes,_that.device,_that.sampling,_that.algoVersion,_that.result);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId,  String createdAt,  String subjectCode,  String hand,  String condition,  int repetition,  double? simulatedFrequencyHz,  String notes, @JsonKey(toJson: _deviceToJson)  SessionDeviceModel device, @JsonKey(toJson: _samplingToJson)  SessionSamplingModel sampling,  String algoVersion, @JsonKey(toJson: _resultToJson)  SessionResultModel result)?  $default,) {final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that.sessionId,_that.createdAt,_that.subjectCode,_that.hand,_that.condition,_that.repetition,_that.simulatedFrequencyHz,_that.notes,_that.device,_that.sampling,_that.algoVersion,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionModel extends SessionModel {
  const _SessionModel({required this.sessionId, required this.createdAt, required this.subjectCode, required this.hand, required this.condition, required this.repetition, this.simulatedFrequencyHz, required this.notes, @JsonKey(toJson: _deviceToJson) required this.device, @JsonKey(toJson: _samplingToJson) required this.sampling, required this.algoVersion, @JsonKey(toJson: _resultToJson) required this.result}): super._();
  factory _SessionModel.fromJson(Map<String, dynamic> json) => _$SessionModelFromJson(json);

@override final  String sessionId;
/// UTC ISO-8601, for example "2026-10-03T03:15:00.000Z".
@override final  String createdAt;
@override final  String subjectCode;
@override final  String hand;
@override final  String condition;
@override final  int repetition;
@override final  double? simulatedFrequencyHz;
@override final  String notes;
@override@JsonKey(toJson: _deviceToJson) final  SessionDeviceModel device;
@override@JsonKey(toJson: _samplingToJson) final  SessionSamplingModel sampling;
@override final  String algoVersion;
@override@JsonKey(toJson: _resultToJson) final  SessionResultModel result;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionModelCopyWith<_SessionModel> get copyWith => __$SessionModelCopyWithImpl<_SessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionModel&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.subjectCode, subjectCode) || other.subjectCode == subjectCode)&&(identical(other.hand, hand) || other.hand == hand)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.repetition, repetition) || other.repetition == repetition)&&(identical(other.simulatedFrequencyHz, simulatedFrequencyHz) || other.simulatedFrequencyHz == simulatedFrequencyHz)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.device, device) || other.device == device)&&(identical(other.sampling, sampling) || other.sampling == sampling)&&(identical(other.algoVersion, algoVersion) || other.algoVersion == algoVersion)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,createdAt,subjectCode,hand,condition,repetition,simulatedFrequencyHz,notes,device,sampling,algoVersion,result);

@override
String toString() {
  return 'SessionModel(sessionId: $sessionId, createdAt: $createdAt, subjectCode: $subjectCode, hand: $hand, condition: $condition, repetition: $repetition, simulatedFrequencyHz: $simulatedFrequencyHz, notes: $notes, device: $device, sampling: $sampling, algoVersion: $algoVersion, result: $result)';
}


}

/// @nodoc
abstract mixin class _$SessionModelCopyWith<$Res> implements $SessionModelCopyWith<$Res> {
  factory _$SessionModelCopyWith(_SessionModel value, $Res Function(_SessionModel) _then) = __$SessionModelCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, String createdAt, String subjectCode, String hand, String condition, int repetition, double? simulatedFrequencyHz, String notes,@JsonKey(toJson: _deviceToJson) SessionDeviceModel device,@JsonKey(toJson: _samplingToJson) SessionSamplingModel sampling, String algoVersion,@JsonKey(toJson: _resultToJson) SessionResultModel result
});


@override $SessionDeviceModelCopyWith<$Res> get device;@override $SessionSamplingModelCopyWith<$Res> get sampling;@override $SessionResultModelCopyWith<$Res> get result;

}
/// @nodoc
class __$SessionModelCopyWithImpl<$Res>
    implements _$SessionModelCopyWith<$Res> {
  __$SessionModelCopyWithImpl(this._self, this._then);

  final _SessionModel _self;
  final $Res Function(_SessionModel) _then;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? createdAt = null,Object? subjectCode = null,Object? hand = null,Object? condition = null,Object? repetition = null,Object? simulatedFrequencyHz = freezed,Object? notes = null,Object? device = null,Object? sampling = null,Object? algoVersion = null,Object? result = null,}) {
  return _then(_SessionModel(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,subjectCode: null == subjectCode ? _self.subjectCode : subjectCode // ignore: cast_nullable_to_non_nullable
as String,hand: null == hand ? _self.hand : hand // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,repetition: null == repetition ? _self.repetition : repetition // ignore: cast_nullable_to_non_nullable
as int,simulatedFrequencyHz: freezed == simulatedFrequencyHz ? _self.simulatedFrequencyHz : simulatedFrequencyHz // ignore: cast_nullable_to_non_nullable
as double?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as SessionDeviceModel,sampling: null == sampling ? _self.sampling : sampling // ignore: cast_nullable_to_non_nullable
as SessionSamplingModel,algoVersion: null == algoVersion ? _self.algoVersion : algoVersion // ignore: cast_nullable_to_non_nullable
as String,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as SessionResultModel,
  ));
}

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionDeviceModelCopyWith<$Res> get device {
  
  return $SessionDeviceModelCopyWith<$Res>(_self.device, (value) {
    return _then(_self.copyWith(device: value));
  });
}/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionSamplingModelCopyWith<$Res> get sampling {
  
  return $SessionSamplingModelCopyWith<$Res>(_self.sampling, (value) {
    return _then(_self.copyWith(sampling: value));
  });
}/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionResultModelCopyWith<$Res> get result {
  
  return $SessionResultModelCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
