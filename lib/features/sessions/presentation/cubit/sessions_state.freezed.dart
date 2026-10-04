// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sessions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionsState()';
}


}

/// @nodoc
class $SessionsStateCopyWith<$Res>  {
$SessionsStateCopyWith(SessionsState _, $Res Function(SessionsState) __);
}


/// Adds pattern-matching-related methods to [SessionsState].
extension SessionsStatePatterns on SessionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SessionsLoading value)?  loading,TResult Function( SessionsLoaded value)?  loaded,TResult Function( SessionsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SessionsLoading() when loading != null:
return loading(_that);case SessionsLoaded() when loaded != null:
return loaded(_that);case SessionsFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SessionsLoading value)  loading,required TResult Function( SessionsLoaded value)  loaded,required TResult Function( SessionsFailure value)  failure,}){
final _that = this;
switch (_that) {
case SessionsLoading():
return loading(_that);case SessionsLoaded():
return loaded(_that);case SessionsFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SessionsLoading value)?  loading,TResult? Function( SessionsLoaded value)?  loaded,TResult? Function( SessionsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case SessionsLoading() when loading != null:
return loading(_that);case SessionsLoaded() when loaded != null:
return loaded(_that);case SessionsFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<SessionEntity> sessions,  Failure? actionFailure)?  loaded,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SessionsLoading() when loading != null:
return loading();case SessionsLoaded() when loaded != null:
return loaded(_that.sessions,_that.actionFailure);case SessionsFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<SessionEntity> sessions,  Failure? actionFailure)  loaded,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case SessionsLoading():
return loading();case SessionsLoaded():
return loaded(_that.sessions,_that.actionFailure);case SessionsFailure():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<SessionEntity> sessions,  Failure? actionFailure)?  loaded,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case SessionsLoading() when loading != null:
return loading();case SessionsLoaded() when loaded != null:
return loaded(_that.sessions,_that.actionFailure);case SessionsFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class SessionsLoading implements SessionsState {
  const SessionsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionsState.loading()';
}


}




/// @nodoc


class SessionsLoaded implements SessionsState {
  const SessionsLoaded({required final  List<SessionEntity> sessions, this.actionFailure}): _sessions = sessions;
  

 final  List<SessionEntity> _sessions;
 List<SessionEntity> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}

 final  Failure? actionFailure;

/// Create a copy of SessionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionsLoadedCopyWith<SessionsLoaded> get copyWith => _$SessionsLoadedCopyWithImpl<SessionsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionsLoaded&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&(identical(other.actionFailure, actionFailure) || other.actionFailure == actionFailure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sessions),actionFailure);

@override
String toString() {
  return 'SessionsState.loaded(sessions: $sessions, actionFailure: $actionFailure)';
}


}

/// @nodoc
abstract mixin class $SessionsLoadedCopyWith<$Res> implements $SessionsStateCopyWith<$Res> {
  factory $SessionsLoadedCopyWith(SessionsLoaded value, $Res Function(SessionsLoaded) _then) = _$SessionsLoadedCopyWithImpl;
@useResult
$Res call({
 List<SessionEntity> sessions, Failure? actionFailure
});




}
/// @nodoc
class _$SessionsLoadedCopyWithImpl<$Res>
    implements $SessionsLoadedCopyWith<$Res> {
  _$SessionsLoadedCopyWithImpl(this._self, this._then);

  final SessionsLoaded _self;
  final $Res Function(SessionsLoaded) _then;

/// Create a copy of SessionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessions = null,Object? actionFailure = freezed,}) {
  return _then(SessionsLoaded(
sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionEntity>,actionFailure: freezed == actionFailure ? _self.actionFailure : actionFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

/// @nodoc


class SessionsFailure implements SessionsState {
  const SessionsFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of SessionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionsFailureCopyWith<SessionsFailure> get copyWith => _$SessionsFailureCopyWithImpl<SessionsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionsFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'SessionsState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SessionsFailureCopyWith<$Res> implements $SessionsStateCopyWith<$Res> {
  factory $SessionsFailureCopyWith(SessionsFailure value, $Res Function(SessionsFailure) _then) = _$SessionsFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$SessionsFailureCopyWithImpl<$Res>
    implements $SessionsFailureCopyWith<$Res> {
  _$SessionsFailureCopyWithImpl(this._self, this._then);

  final SessionsFailure _self;
  final $Res Function(SessionsFailure) _then;

/// Create a copy of SessionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(SessionsFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
