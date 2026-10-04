// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionResultModel {

/// TremorStatus enum name: none, tremor, or invalid.
 String get status;@JsonKey(toJson: _featuresToJson) SessionFeaturesModel? get features;@JsonKey(toJson: _gatesToJson) List<SessionGateModel> get gates;
/// Create a copy of SessionResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionResultModelCopyWith<SessionResultModel> get copyWith => _$SessionResultModelCopyWithImpl<SessionResultModel>(this as SessionResultModel, _$identity);

  /// Serializes this SessionResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionResultModel&&(identical(other.status, status) || other.status == status)&&(identical(other.features, features) || other.features == features)&&const DeepCollectionEquality().equals(other.gates, gates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,features,const DeepCollectionEquality().hash(gates));

@override
String toString() {
  return 'SessionResultModel(status: $status, features: $features, gates: $gates)';
}


}

/// @nodoc
abstract mixin class $SessionResultModelCopyWith<$Res>  {
  factory $SessionResultModelCopyWith(SessionResultModel value, $Res Function(SessionResultModel) _then) = _$SessionResultModelCopyWithImpl;
@useResult
$Res call({
 String status,@JsonKey(toJson: _featuresToJson) SessionFeaturesModel? features,@JsonKey(toJson: _gatesToJson) List<SessionGateModel> gates
});


$SessionFeaturesModelCopyWith<$Res>? get features;

}
/// @nodoc
class _$SessionResultModelCopyWithImpl<$Res>
    implements $SessionResultModelCopyWith<$Res> {
  _$SessionResultModelCopyWithImpl(this._self, this._then);

  final SessionResultModel _self;
  final $Res Function(SessionResultModel) _then;

/// Create a copy of SessionResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? features = freezed,Object? gates = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,features: freezed == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as SessionFeaturesModel?,gates: null == gates ? _self.gates : gates // ignore: cast_nullable_to_non_nullable
as List<SessionGateModel>,
  ));
}
/// Create a copy of SessionResultModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionFeaturesModelCopyWith<$Res>? get features {
    if (_self.features == null) {
    return null;
  }

  return $SessionFeaturesModelCopyWith<$Res>(_self.features!, (value) {
    return _then(_self.copyWith(features: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionResultModel].
extension SessionResultModelPatterns on SessionResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionResultModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status, @JsonKey(toJson: _featuresToJson)  SessionFeaturesModel? features, @JsonKey(toJson: _gatesToJson)  List<SessionGateModel> gates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionResultModel() when $default != null:
return $default(_that.status,_that.features,_that.gates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status, @JsonKey(toJson: _featuresToJson)  SessionFeaturesModel? features, @JsonKey(toJson: _gatesToJson)  List<SessionGateModel> gates)  $default,) {final _that = this;
switch (_that) {
case _SessionResultModel():
return $default(_that.status,_that.features,_that.gates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status, @JsonKey(toJson: _featuresToJson)  SessionFeaturesModel? features, @JsonKey(toJson: _gatesToJson)  List<SessionGateModel> gates)?  $default,) {final _that = this;
switch (_that) {
case _SessionResultModel() when $default != null:
return $default(_that.status,_that.features,_that.gates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionResultModel implements SessionResultModel {
  const _SessionResultModel({required this.status, @JsonKey(toJson: _featuresToJson) this.features, @JsonKey(toJson: _gatesToJson) required final  List<SessionGateModel> gates}): _gates = gates;
  factory _SessionResultModel.fromJson(Map<String, dynamic> json) => _$SessionResultModelFromJson(json);

/// TremorStatus enum name: none, tremor, or invalid.
@override final  String status;
@override@JsonKey(toJson: _featuresToJson) final  SessionFeaturesModel? features;
 final  List<SessionGateModel> _gates;
@override@JsonKey(toJson: _gatesToJson) List<SessionGateModel> get gates {
  if (_gates is EqualUnmodifiableListView) return _gates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_gates);
}


/// Create a copy of SessionResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionResultModelCopyWith<_SessionResultModel> get copyWith => __$SessionResultModelCopyWithImpl<_SessionResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionResultModel&&(identical(other.status, status) || other.status == status)&&(identical(other.features, features) || other.features == features)&&const DeepCollectionEquality().equals(other._gates, _gates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,features,const DeepCollectionEquality().hash(_gates));

@override
String toString() {
  return 'SessionResultModel(status: $status, features: $features, gates: $gates)';
}


}

/// @nodoc
abstract mixin class _$SessionResultModelCopyWith<$Res> implements $SessionResultModelCopyWith<$Res> {
  factory _$SessionResultModelCopyWith(_SessionResultModel value, $Res Function(_SessionResultModel) _then) = __$SessionResultModelCopyWithImpl;
@override @useResult
$Res call({
 String status,@JsonKey(toJson: _featuresToJson) SessionFeaturesModel? features,@JsonKey(toJson: _gatesToJson) List<SessionGateModel> gates
});


@override $SessionFeaturesModelCopyWith<$Res>? get features;

}
/// @nodoc
class __$SessionResultModelCopyWithImpl<$Res>
    implements _$SessionResultModelCopyWith<$Res> {
  __$SessionResultModelCopyWithImpl(this._self, this._then);

  final _SessionResultModel _self;
  final $Res Function(_SessionResultModel) _then;

/// Create a copy of SessionResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? features = freezed,Object? gates = null,}) {
  return _then(_SessionResultModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,features: freezed == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as SessionFeaturesModel?,gates: null == gates ? _self._gates : gates // ignore: cast_nullable_to_non_nullable
as List<SessionGateModel>,
  ));
}

/// Create a copy of SessionResultModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionFeaturesModelCopyWith<$Res>? get features {
    if (_self.features == null) {
    return null;
  }

  return $SessionFeaturesModelCopyWith<$Res>(_self.features!, (value) {
    return _then(_self.copyWith(features: value));
  });
}
}

// dart format on
