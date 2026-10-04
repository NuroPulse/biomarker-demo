// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionDeviceModel {

 String get model; String get os; String get appVersion;
/// Create a copy of SessionDeviceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionDeviceModelCopyWith<SessionDeviceModel> get copyWith => _$SessionDeviceModelCopyWithImpl<SessionDeviceModel>(this as SessionDeviceModel, _$identity);

  /// Serializes this SessionDeviceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionDeviceModel&&(identical(other.model, model) || other.model == model)&&(identical(other.os, os) || other.os == os)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,os,appVersion);

@override
String toString() {
  return 'SessionDeviceModel(model: $model, os: $os, appVersion: $appVersion)';
}


}

/// @nodoc
abstract mixin class $SessionDeviceModelCopyWith<$Res>  {
  factory $SessionDeviceModelCopyWith(SessionDeviceModel value, $Res Function(SessionDeviceModel) _then) = _$SessionDeviceModelCopyWithImpl;
@useResult
$Res call({
 String model, String os, String appVersion
});




}
/// @nodoc
class _$SessionDeviceModelCopyWithImpl<$Res>
    implements $SessionDeviceModelCopyWith<$Res> {
  _$SessionDeviceModelCopyWithImpl(this._self, this._then);

  final SessionDeviceModel _self;
  final $Res Function(SessionDeviceModel) _then;

/// Create a copy of SessionDeviceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? os = null,Object? appVersion = null,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,os: null == os ? _self.os : os // ignore: cast_nullable_to_non_nullable
as String,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionDeviceModel].
extension SessionDeviceModelPatterns on SessionDeviceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionDeviceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionDeviceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionDeviceModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionDeviceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionDeviceModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionDeviceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String model,  String os,  String appVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionDeviceModel() when $default != null:
return $default(_that.model,_that.os,_that.appVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String model,  String os,  String appVersion)  $default,) {final _that = this;
switch (_that) {
case _SessionDeviceModel():
return $default(_that.model,_that.os,_that.appVersion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String model,  String os,  String appVersion)?  $default,) {final _that = this;
switch (_that) {
case _SessionDeviceModel() when $default != null:
return $default(_that.model,_that.os,_that.appVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionDeviceModel implements SessionDeviceModel {
  const _SessionDeviceModel({required this.model, required this.os, required this.appVersion});
  factory _SessionDeviceModel.fromJson(Map<String, dynamic> json) => _$SessionDeviceModelFromJson(json);

@override final  String model;
@override final  String os;
@override final  String appVersion;

/// Create a copy of SessionDeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionDeviceModelCopyWith<_SessionDeviceModel> get copyWith => __$SessionDeviceModelCopyWithImpl<_SessionDeviceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionDeviceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionDeviceModel&&(identical(other.model, model) || other.model == model)&&(identical(other.os, os) || other.os == os)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,os,appVersion);

@override
String toString() {
  return 'SessionDeviceModel(model: $model, os: $os, appVersion: $appVersion)';
}


}

/// @nodoc
abstract mixin class _$SessionDeviceModelCopyWith<$Res> implements $SessionDeviceModelCopyWith<$Res> {
  factory _$SessionDeviceModelCopyWith(_SessionDeviceModel value, $Res Function(_SessionDeviceModel) _then) = __$SessionDeviceModelCopyWithImpl;
@override @useResult
$Res call({
 String model, String os, String appVersion
});




}
/// @nodoc
class __$SessionDeviceModelCopyWithImpl<$Res>
    implements _$SessionDeviceModelCopyWith<$Res> {
  __$SessionDeviceModelCopyWithImpl(this._self, this._then);

  final _SessionDeviceModel _self;
  final $Res Function(_SessionDeviceModel) _then;

/// Create a copy of SessionDeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? os = null,Object? appVersion = null,}) {
  return _then(_SessionDeviceModel(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,os: null == os ? _self.os : os // ignore: cast_nullable_to_non_nullable
as String,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
