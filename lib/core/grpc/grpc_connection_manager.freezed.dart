// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grpc_connection_manager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GrpcConnectionState {

 GrpcConnectionStatus get status; int get attempt; String? get lastErrorMessage; Duration? get nextRetryIn;
/// Create a copy of GrpcConnectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GrpcConnectionStateCopyWith<GrpcConnectionState> get copyWith => _$GrpcConnectionStateCopyWithImpl<GrpcConnectionState>(this as GrpcConnectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GrpcConnectionState&&(identical(other.status, status) || other.status == status)&&(identical(other.attempt, attempt) || other.attempt == attempt)&&(identical(other.lastErrorMessage, lastErrorMessage) || other.lastErrorMessage == lastErrorMessage)&&(identical(other.nextRetryIn, nextRetryIn) || other.nextRetryIn == nextRetryIn));
}


@override
int get hashCode => Object.hash(runtimeType,status,attempt,lastErrorMessage,nextRetryIn);

@override
String toString() {
  return 'GrpcConnectionState(status: $status, attempt: $attempt, lastErrorMessage: $lastErrorMessage, nextRetryIn: $nextRetryIn)';
}


}

/// @nodoc
abstract mixin class $GrpcConnectionStateCopyWith<$Res>  {
  factory $GrpcConnectionStateCopyWith(GrpcConnectionState value, $Res Function(GrpcConnectionState) _then) = _$GrpcConnectionStateCopyWithImpl;
@useResult
$Res call({
 GrpcConnectionStatus status, int attempt, String? lastErrorMessage, Duration? nextRetryIn
});




}
/// @nodoc
class _$GrpcConnectionStateCopyWithImpl<$Res>
    implements $GrpcConnectionStateCopyWith<$Res> {
  _$GrpcConnectionStateCopyWithImpl(this._self, this._then);

  final GrpcConnectionState _self;
  final $Res Function(GrpcConnectionState) _then;

/// Create a copy of GrpcConnectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? attempt = null,Object? lastErrorMessage = freezed,Object? nextRetryIn = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GrpcConnectionStatus,attempt: null == attempt ? _self.attempt : attempt // ignore: cast_nullable_to_non_nullable
as int,lastErrorMessage: freezed == lastErrorMessage ? _self.lastErrorMessage : lastErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,nextRetryIn: freezed == nextRetryIn ? _self.nextRetryIn : nextRetryIn // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}

}


/// Adds pattern-matching-related methods to [GrpcConnectionState].
extension GrpcConnectionStatePatterns on GrpcConnectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GrpcConnectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GrpcConnectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GrpcConnectionState value)  $default,){
final _that = this;
switch (_that) {
case _GrpcConnectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GrpcConnectionState value)?  $default,){
final _that = this;
switch (_that) {
case _GrpcConnectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GrpcConnectionStatus status,  int attempt,  String? lastErrorMessage,  Duration? nextRetryIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GrpcConnectionState() when $default != null:
return $default(_that.status,_that.attempt,_that.lastErrorMessage,_that.nextRetryIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GrpcConnectionStatus status,  int attempt,  String? lastErrorMessage,  Duration? nextRetryIn)  $default,) {final _that = this;
switch (_that) {
case _GrpcConnectionState():
return $default(_that.status,_that.attempt,_that.lastErrorMessage,_that.nextRetryIn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GrpcConnectionStatus status,  int attempt,  String? lastErrorMessage,  Duration? nextRetryIn)?  $default,) {final _that = this;
switch (_that) {
case _GrpcConnectionState() when $default != null:
return $default(_that.status,_that.attempt,_that.lastErrorMessage,_that.nextRetryIn);case _:
  return null;

}
}

}

/// @nodoc


class _GrpcConnectionState implements GrpcConnectionState {
  const _GrpcConnectionState({required this.status, this.attempt = 0, this.lastErrorMessage, this.nextRetryIn});
  

@override final  GrpcConnectionStatus status;
@override@JsonKey() final  int attempt;
@override final  String? lastErrorMessage;
@override final  Duration? nextRetryIn;

/// Create a copy of GrpcConnectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GrpcConnectionStateCopyWith<_GrpcConnectionState> get copyWith => __$GrpcConnectionStateCopyWithImpl<_GrpcConnectionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GrpcConnectionState&&(identical(other.status, status) || other.status == status)&&(identical(other.attempt, attempt) || other.attempt == attempt)&&(identical(other.lastErrorMessage, lastErrorMessage) || other.lastErrorMessage == lastErrorMessage)&&(identical(other.nextRetryIn, nextRetryIn) || other.nextRetryIn == nextRetryIn));
}


@override
int get hashCode => Object.hash(runtimeType,status,attempt,lastErrorMessage,nextRetryIn);

@override
String toString() {
  return 'GrpcConnectionState(status: $status, attempt: $attempt, lastErrorMessage: $lastErrorMessage, nextRetryIn: $nextRetryIn)';
}


}

/// @nodoc
abstract mixin class _$GrpcConnectionStateCopyWith<$Res> implements $GrpcConnectionStateCopyWith<$Res> {
  factory _$GrpcConnectionStateCopyWith(_GrpcConnectionState value, $Res Function(_GrpcConnectionState) _then) = __$GrpcConnectionStateCopyWithImpl;
@override @useResult
$Res call({
 GrpcConnectionStatus status, int attempt, String? lastErrorMessage, Duration? nextRetryIn
});




}
/// @nodoc
class __$GrpcConnectionStateCopyWithImpl<$Res>
    implements _$GrpcConnectionStateCopyWith<$Res> {
  __$GrpcConnectionStateCopyWithImpl(this._self, this._then);

  final _GrpcConnectionState _self;
  final $Res Function(_GrpcConnectionState) _then;

/// Create a copy of GrpcConnectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? attempt = null,Object? lastErrorMessage = freezed,Object? nextRetryIn = freezed,}) {
  return _then(_GrpcConnectionState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GrpcConnectionStatus,attempt: null == attempt ? _self.attempt : attempt // ignore: cast_nullable_to_non_nullable
as int,lastErrorMessage: freezed == lastErrorMessage ? _self.lastErrorMessage : lastErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,nextRetryIn: freezed == nextRetryIn ? _self.nextRetryIn : nextRetryIn // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}


}

// dart format on
