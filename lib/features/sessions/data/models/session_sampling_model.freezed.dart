// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_sampling_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionSamplingModel {

 int get requestedPeriodUs; double get effectiveFsHz; double get jitter; double get maxGapMs;
/// Create a copy of SessionSamplingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionSamplingModelCopyWith<SessionSamplingModel> get copyWith => _$SessionSamplingModelCopyWithImpl<SessionSamplingModel>(this as SessionSamplingModel, _$identity);

  /// Serializes this SessionSamplingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionSamplingModel&&(identical(other.requestedPeriodUs, requestedPeriodUs) || other.requestedPeriodUs == requestedPeriodUs)&&(identical(other.effectiveFsHz, effectiveFsHz) || other.effectiveFsHz == effectiveFsHz)&&(identical(other.jitter, jitter) || other.jitter == jitter)&&(identical(other.maxGapMs, maxGapMs) || other.maxGapMs == maxGapMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestedPeriodUs,effectiveFsHz,jitter,maxGapMs);

@override
String toString() {
  return 'SessionSamplingModel(requestedPeriodUs: $requestedPeriodUs, effectiveFsHz: $effectiveFsHz, jitter: $jitter, maxGapMs: $maxGapMs)';
}


}

/// @nodoc
abstract mixin class $SessionSamplingModelCopyWith<$Res>  {
  factory $SessionSamplingModelCopyWith(SessionSamplingModel value, $Res Function(SessionSamplingModel) _then) = _$SessionSamplingModelCopyWithImpl;
@useResult
$Res call({
 int requestedPeriodUs, double effectiveFsHz, double jitter, double maxGapMs
});




}
/// @nodoc
class _$SessionSamplingModelCopyWithImpl<$Res>
    implements $SessionSamplingModelCopyWith<$Res> {
  _$SessionSamplingModelCopyWithImpl(this._self, this._then);

  final SessionSamplingModel _self;
  final $Res Function(SessionSamplingModel) _then;

/// Create a copy of SessionSamplingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestedPeriodUs = null,Object? effectiveFsHz = null,Object? jitter = null,Object? maxGapMs = null,}) {
  return _then(_self.copyWith(
requestedPeriodUs: null == requestedPeriodUs ? _self.requestedPeriodUs : requestedPeriodUs // ignore: cast_nullable_to_non_nullable
as int,effectiveFsHz: null == effectiveFsHz ? _self.effectiveFsHz : effectiveFsHz // ignore: cast_nullable_to_non_nullable
as double,jitter: null == jitter ? _self.jitter : jitter // ignore: cast_nullable_to_non_nullable
as double,maxGapMs: null == maxGapMs ? _self.maxGapMs : maxGapMs // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionSamplingModel].
extension SessionSamplingModelPatterns on SessionSamplingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionSamplingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionSamplingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionSamplingModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionSamplingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionSamplingModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionSamplingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int requestedPeriodUs,  double effectiveFsHz,  double jitter,  double maxGapMs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionSamplingModel() when $default != null:
return $default(_that.requestedPeriodUs,_that.effectiveFsHz,_that.jitter,_that.maxGapMs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int requestedPeriodUs,  double effectiveFsHz,  double jitter,  double maxGapMs)  $default,) {final _that = this;
switch (_that) {
case _SessionSamplingModel():
return $default(_that.requestedPeriodUs,_that.effectiveFsHz,_that.jitter,_that.maxGapMs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int requestedPeriodUs,  double effectiveFsHz,  double jitter,  double maxGapMs)?  $default,) {final _that = this;
switch (_that) {
case _SessionSamplingModel() when $default != null:
return $default(_that.requestedPeriodUs,_that.effectiveFsHz,_that.jitter,_that.maxGapMs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionSamplingModel implements SessionSamplingModel {
  const _SessionSamplingModel({required this.requestedPeriodUs, required this.effectiveFsHz, required this.jitter, required this.maxGapMs});
  factory _SessionSamplingModel.fromJson(Map<String, dynamic> json) => _$SessionSamplingModelFromJson(json);

@override final  int requestedPeriodUs;
@override final  double effectiveFsHz;
@override final  double jitter;
@override final  double maxGapMs;

/// Create a copy of SessionSamplingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionSamplingModelCopyWith<_SessionSamplingModel> get copyWith => __$SessionSamplingModelCopyWithImpl<_SessionSamplingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionSamplingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionSamplingModel&&(identical(other.requestedPeriodUs, requestedPeriodUs) || other.requestedPeriodUs == requestedPeriodUs)&&(identical(other.effectiveFsHz, effectiveFsHz) || other.effectiveFsHz == effectiveFsHz)&&(identical(other.jitter, jitter) || other.jitter == jitter)&&(identical(other.maxGapMs, maxGapMs) || other.maxGapMs == maxGapMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestedPeriodUs,effectiveFsHz,jitter,maxGapMs);

@override
String toString() {
  return 'SessionSamplingModel(requestedPeriodUs: $requestedPeriodUs, effectiveFsHz: $effectiveFsHz, jitter: $jitter, maxGapMs: $maxGapMs)';
}


}

/// @nodoc
abstract mixin class _$SessionSamplingModelCopyWith<$Res> implements $SessionSamplingModelCopyWith<$Res> {
  factory _$SessionSamplingModelCopyWith(_SessionSamplingModel value, $Res Function(_SessionSamplingModel) _then) = __$SessionSamplingModelCopyWithImpl;
@override @useResult
$Res call({
 int requestedPeriodUs, double effectiveFsHz, double jitter, double maxGapMs
});




}
/// @nodoc
class __$SessionSamplingModelCopyWithImpl<$Res>
    implements _$SessionSamplingModelCopyWith<$Res> {
  __$SessionSamplingModelCopyWithImpl(this._self, this._then);

  final _SessionSamplingModel _self;
  final $Res Function(_SessionSamplingModel) _then;

/// Create a copy of SessionSamplingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestedPeriodUs = null,Object? effectiveFsHz = null,Object? jitter = null,Object? maxGapMs = null,}) {
  return _then(_SessionSamplingModel(
requestedPeriodUs: null == requestedPeriodUs ? _self.requestedPeriodUs : requestedPeriodUs // ignore: cast_nullable_to_non_nullable
as int,effectiveFsHz: null == effectiveFsHz ? _self.effectiveFsHz : effectiveFsHz // ignore: cast_nullable_to_non_nullable
as double,jitter: null == jitter ? _self.jitter : jitter // ignore: cast_nullable_to_non_nullable
as double,maxGapMs: null == maxGapMs ? _self.maxGapMs : maxGapMs // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
