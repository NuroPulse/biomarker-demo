// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionDetailState()';
}


}

/// @nodoc
class $SessionDetailStateCopyWith<$Res>  {
$SessionDetailStateCopyWith(SessionDetailState _, $Res Function(SessionDetailState) __);
}


/// Adds pattern-matching-related methods to [SessionDetailState].
extension SessionDetailStatePatterns on SessionDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SessionDetailLoading value)?  loading,TResult Function( SessionDetailLoaded value)?  loaded,TResult Function( SessionDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SessionDetailLoading() when loading != null:
return loading(_that);case SessionDetailLoaded() when loaded != null:
return loaded(_that);case SessionDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SessionDetailLoading value)  loading,required TResult Function( SessionDetailLoaded value)  loaded,required TResult Function( SessionDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case SessionDetailLoading():
return loading(_that);case SessionDetailLoaded():
return loaded(_that);case SessionDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SessionDetailLoading value)?  loading,TResult? Function( SessionDetailLoaded value)?  loaded,TResult? Function( SessionDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case SessionDetailLoading() when loading != null:
return loading(_that);case SessionDetailLoaded() when loaded != null:
return loaded(_that);case SessionDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( SessionEntity session,  Failure? actionFailure)?  loaded,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SessionDetailLoading() when loading != null:
return loading();case SessionDetailLoaded() when loaded != null:
return loaded(_that.session,_that.actionFailure);case SessionDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( SessionEntity session,  Failure? actionFailure)  loaded,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case SessionDetailLoading():
return loading();case SessionDetailLoaded():
return loaded(_that.session,_that.actionFailure);case SessionDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( SessionEntity session,  Failure? actionFailure)?  loaded,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case SessionDetailLoading() when loading != null:
return loading();case SessionDetailLoaded() when loaded != null:
return loaded(_that.session,_that.actionFailure);case SessionDetailFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class SessionDetailLoading implements SessionDetailState {
  const SessionDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionDetailState.loading()';
}


}




/// @nodoc


class SessionDetailLoaded implements SessionDetailState {
  const SessionDetailLoaded({required this.session, this.actionFailure});
  

 final  SessionEntity session;
 final  Failure? actionFailure;

/// Create a copy of SessionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionDetailLoadedCopyWith<SessionDetailLoaded> get copyWith => _$SessionDetailLoadedCopyWithImpl<SessionDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionDetailLoaded&&(identical(other.session, session) || other.session == session)&&(identical(other.actionFailure, actionFailure) || other.actionFailure == actionFailure));
}


@override
int get hashCode => Object.hash(runtimeType,session,actionFailure);

@override
String toString() {
  return 'SessionDetailState.loaded(session: $session, actionFailure: $actionFailure)';
}


}

/// @nodoc
abstract mixin class $SessionDetailLoadedCopyWith<$Res> implements $SessionDetailStateCopyWith<$Res> {
  factory $SessionDetailLoadedCopyWith(SessionDetailLoaded value, $Res Function(SessionDetailLoaded) _then) = _$SessionDetailLoadedCopyWithImpl;
@useResult
$Res call({
 SessionEntity session, Failure? actionFailure
});




}
/// @nodoc
class _$SessionDetailLoadedCopyWithImpl<$Res>
    implements $SessionDetailLoadedCopyWith<$Res> {
  _$SessionDetailLoadedCopyWithImpl(this._self, this._then);

  final SessionDetailLoaded _self;
  final $Res Function(SessionDetailLoaded) _then;

/// Create a copy of SessionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,Object? actionFailure = freezed,}) {
  return _then(SessionDetailLoaded(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as SessionEntity,actionFailure: freezed == actionFailure ? _self.actionFailure : actionFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

/// @nodoc


class SessionDetailFailure implements SessionDetailState {
  const SessionDetailFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of SessionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionDetailFailureCopyWith<SessionDetailFailure> get copyWith => _$SessionDetailFailureCopyWithImpl<SessionDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionDetailFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'SessionDetailState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SessionDetailFailureCopyWith<$Res> implements $SessionDetailStateCopyWith<$Res> {
  factory $SessionDetailFailureCopyWith(SessionDetailFailure value, $Res Function(SessionDetailFailure) _then) = _$SessionDetailFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$SessionDetailFailureCopyWithImpl<$Res>
    implements $SessionDetailFailureCopyWith<$Res> {
  _$SessionDetailFailureCopyWithImpl(this._self, this._then);

  final SessionDetailFailure _self;
  final $Res Function(SessionDetailFailure) _then;

/// Create a copy of SessionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(SessionDetailFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
