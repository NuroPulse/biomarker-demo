// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_gate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionGateModel {

/// GateCheck enum name, for example "dataGap".
 String get check; bool get passed;
/// Create a copy of SessionGateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionGateModelCopyWith<SessionGateModel> get copyWith => _$SessionGateModelCopyWithImpl<SessionGateModel>(this as SessionGateModel, _$identity);

  /// Serializes this SessionGateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionGateModel&&(identical(other.check, check) || other.check == check)&&(identical(other.passed, passed) || other.passed == passed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,check,passed);

@override
String toString() {
  return 'SessionGateModel(check: $check, passed: $passed)';
}


}

/// @nodoc
abstract mixin class $SessionGateModelCopyWith<$Res>  {
  factory $SessionGateModelCopyWith(SessionGateModel value, $Res Function(SessionGateModel) _then) = _$SessionGateModelCopyWithImpl;
@useResult
$Res call({
 String check, bool passed
});




}
/// @nodoc
class _$SessionGateModelCopyWithImpl<$Res>
    implements $SessionGateModelCopyWith<$Res> {
  _$SessionGateModelCopyWithImpl(this._self, this._then);

  final SessionGateModel _self;
  final $Res Function(SessionGateModel) _then;

/// Create a copy of SessionGateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? check = null,Object? passed = null,}) {
  return _then(_self.copyWith(
check: null == check ? _self.check : check // ignore: cast_nullable_to_non_nullable
as String,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionGateModel].
extension SessionGateModelPatterns on SessionGateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionGateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionGateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionGateModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionGateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionGateModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionGateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String check,  bool passed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionGateModel() when $default != null:
return $default(_that.check,_that.passed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String check,  bool passed)  $default,) {final _that = this;
switch (_that) {
case _SessionGateModel():
return $default(_that.check,_that.passed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String check,  bool passed)?  $default,) {final _that = this;
switch (_that) {
case _SessionGateModel() when $default != null:
return $default(_that.check,_that.passed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionGateModel implements SessionGateModel {
  const _SessionGateModel({required this.check, required this.passed});
  factory _SessionGateModel.fromJson(Map<String, dynamic> json) => _$SessionGateModelFromJson(json);

/// GateCheck enum name, for example "dataGap".
@override final  String check;
@override final  bool passed;

/// Create a copy of SessionGateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionGateModelCopyWith<_SessionGateModel> get copyWith => __$SessionGateModelCopyWithImpl<_SessionGateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionGateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionGateModel&&(identical(other.check, check) || other.check == check)&&(identical(other.passed, passed) || other.passed == passed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,check,passed);

@override
String toString() {
  return 'SessionGateModel(check: $check, passed: $passed)';
}


}

/// @nodoc
abstract mixin class _$SessionGateModelCopyWith<$Res> implements $SessionGateModelCopyWith<$Res> {
  factory _$SessionGateModelCopyWith(_SessionGateModel value, $Res Function(_SessionGateModel) _then) = __$SessionGateModelCopyWithImpl;
@override @useResult
$Res call({
 String check, bool passed
});




}
/// @nodoc
class __$SessionGateModelCopyWithImpl<$Res>
    implements _$SessionGateModelCopyWith<$Res> {
  __$SessionGateModelCopyWithImpl(this._self, this._then);

  final _SessionGateModel _self;
  final $Res Function(_SessionGateModel) _then;

/// Create a copy of SessionGateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? check = null,Object? passed = null,}) {
  return _then(_SessionGateModel(
check: null == check ? _self.check : check // ignore: cast_nullable_to_non_nullable
as String,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
