// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_features_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionFeaturesModel {

 double get peakFrequencyHz; double get bandPowerRatio; double get snr; double get bandRms; double get consistency;
/// Create a copy of SessionFeaturesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionFeaturesModelCopyWith<SessionFeaturesModel> get copyWith => _$SessionFeaturesModelCopyWithImpl<SessionFeaturesModel>(this as SessionFeaturesModel, _$identity);

  /// Serializes this SessionFeaturesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionFeaturesModel&&(identical(other.peakFrequencyHz, peakFrequencyHz) || other.peakFrequencyHz == peakFrequencyHz)&&(identical(other.bandPowerRatio, bandPowerRatio) || other.bandPowerRatio == bandPowerRatio)&&(identical(other.snr, snr) || other.snr == snr)&&(identical(other.bandRms, bandRms) || other.bandRms == bandRms)&&(identical(other.consistency, consistency) || other.consistency == consistency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,peakFrequencyHz,bandPowerRatio,snr,bandRms,consistency);

@override
String toString() {
  return 'SessionFeaturesModel(peakFrequencyHz: $peakFrequencyHz, bandPowerRatio: $bandPowerRatio, snr: $snr, bandRms: $bandRms, consistency: $consistency)';
}


}

/// @nodoc
abstract mixin class $SessionFeaturesModelCopyWith<$Res>  {
  factory $SessionFeaturesModelCopyWith(SessionFeaturesModel value, $Res Function(SessionFeaturesModel) _then) = _$SessionFeaturesModelCopyWithImpl;
@useResult
$Res call({
 double peakFrequencyHz, double bandPowerRatio, double snr, double bandRms, double consistency
});




}
/// @nodoc
class _$SessionFeaturesModelCopyWithImpl<$Res>
    implements $SessionFeaturesModelCopyWith<$Res> {
  _$SessionFeaturesModelCopyWithImpl(this._self, this._then);

  final SessionFeaturesModel _self;
  final $Res Function(SessionFeaturesModel) _then;

/// Create a copy of SessionFeaturesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? peakFrequencyHz = null,Object? bandPowerRatio = null,Object? snr = null,Object? bandRms = null,Object? consistency = null,}) {
  return _then(_self.copyWith(
peakFrequencyHz: null == peakFrequencyHz ? _self.peakFrequencyHz : peakFrequencyHz // ignore: cast_nullable_to_non_nullable
as double,bandPowerRatio: null == bandPowerRatio ? _self.bandPowerRatio : bandPowerRatio // ignore: cast_nullable_to_non_nullable
as double,snr: null == snr ? _self.snr : snr // ignore: cast_nullable_to_non_nullable
as double,bandRms: null == bandRms ? _self.bandRms : bandRms // ignore: cast_nullable_to_non_nullable
as double,consistency: null == consistency ? _self.consistency : consistency // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionFeaturesModel].
extension SessionFeaturesModelPatterns on SessionFeaturesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionFeaturesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionFeaturesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionFeaturesModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionFeaturesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionFeaturesModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionFeaturesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double peakFrequencyHz,  double bandPowerRatio,  double snr,  double bandRms,  double consistency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionFeaturesModel() when $default != null:
return $default(_that.peakFrequencyHz,_that.bandPowerRatio,_that.snr,_that.bandRms,_that.consistency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double peakFrequencyHz,  double bandPowerRatio,  double snr,  double bandRms,  double consistency)  $default,) {final _that = this;
switch (_that) {
case _SessionFeaturesModel():
return $default(_that.peakFrequencyHz,_that.bandPowerRatio,_that.snr,_that.bandRms,_that.consistency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double peakFrequencyHz,  double bandPowerRatio,  double snr,  double bandRms,  double consistency)?  $default,) {final _that = this;
switch (_that) {
case _SessionFeaturesModel() when $default != null:
return $default(_that.peakFrequencyHz,_that.bandPowerRatio,_that.snr,_that.bandRms,_that.consistency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionFeaturesModel implements SessionFeaturesModel {
  const _SessionFeaturesModel({required this.peakFrequencyHz, required this.bandPowerRatio, required this.snr, required this.bandRms, required this.consistency});
  factory _SessionFeaturesModel.fromJson(Map<String, dynamic> json) => _$SessionFeaturesModelFromJson(json);

@override final  double peakFrequencyHz;
@override final  double bandPowerRatio;
@override final  double snr;
@override final  double bandRms;
@override final  double consistency;

/// Create a copy of SessionFeaturesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionFeaturesModelCopyWith<_SessionFeaturesModel> get copyWith => __$SessionFeaturesModelCopyWithImpl<_SessionFeaturesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionFeaturesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionFeaturesModel&&(identical(other.peakFrequencyHz, peakFrequencyHz) || other.peakFrequencyHz == peakFrequencyHz)&&(identical(other.bandPowerRatio, bandPowerRatio) || other.bandPowerRatio == bandPowerRatio)&&(identical(other.snr, snr) || other.snr == snr)&&(identical(other.bandRms, bandRms) || other.bandRms == bandRms)&&(identical(other.consistency, consistency) || other.consistency == consistency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,peakFrequencyHz,bandPowerRatio,snr,bandRms,consistency);

@override
String toString() {
  return 'SessionFeaturesModel(peakFrequencyHz: $peakFrequencyHz, bandPowerRatio: $bandPowerRatio, snr: $snr, bandRms: $bandRms, consistency: $consistency)';
}


}

/// @nodoc
abstract mixin class _$SessionFeaturesModelCopyWith<$Res> implements $SessionFeaturesModelCopyWith<$Res> {
  factory _$SessionFeaturesModelCopyWith(_SessionFeaturesModel value, $Res Function(_SessionFeaturesModel) _then) = __$SessionFeaturesModelCopyWithImpl;
@override @useResult
$Res call({
 double peakFrequencyHz, double bandPowerRatio, double snr, double bandRms, double consistency
});




}
/// @nodoc
class __$SessionFeaturesModelCopyWithImpl<$Res>
    implements _$SessionFeaturesModelCopyWith<$Res> {
  __$SessionFeaturesModelCopyWithImpl(this._self, this._then);

  final _SessionFeaturesModel _self;
  final $Res Function(_SessionFeaturesModel) _then;

/// Create a copy of SessionFeaturesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? peakFrequencyHz = null,Object? bandPowerRatio = null,Object? snr = null,Object? bandRms = null,Object? consistency = null,}) {
  return _then(_SessionFeaturesModel(
peakFrequencyHz: null == peakFrequencyHz ? _self.peakFrequencyHz : peakFrequencyHz // ignore: cast_nullable_to_non_nullable
as double,bandPowerRatio: null == bandPowerRatio ? _self.bandPowerRatio : bandPowerRatio // ignore: cast_nullable_to_non_nullable
as double,snr: null == snr ? _self.snr : snr // ignore: cast_nullable_to_non_nullable
as double,bandRms: null == bandRms ? _self.bandRms : bandRms // ignore: cast_nullable_to_non_nullable
as double,consistency: null == consistency ? _self.consistency : consistency // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
