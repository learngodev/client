// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_candidate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConversationCandidate {

 String get id; String get displayName; AccountRole get role;
/// Create a copy of ConversationCandidate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationCandidateCopyWith<ConversationCandidate> get copyWith => _$ConversationCandidateCopyWithImpl<ConversationCandidate>(this as ConversationCandidate, _$identity);

  /// Serializes this ConversationCandidate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationCandidate&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,role);

@override
String toString() {
  return 'ConversationCandidate(id: $id, displayName: $displayName, role: $role)';
}


}

/// @nodoc
abstract mixin class $ConversationCandidateCopyWith<$Res>  {
  factory $ConversationCandidateCopyWith(ConversationCandidate value, $Res Function(ConversationCandidate) _then) = _$ConversationCandidateCopyWithImpl;
@useResult
$Res call({
 String id, String displayName, AccountRole role
});




}
/// @nodoc
class _$ConversationCandidateCopyWithImpl<$Res>
    implements $ConversationCandidateCopyWith<$Res> {
  _$ConversationCandidateCopyWithImpl(this._self, this._then);

  final ConversationCandidate _self;
  final $Res Function(ConversationCandidate) _then;

/// Create a copy of ConversationCandidate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = null,Object? role = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AccountRole,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationCandidate].
extension ConversationCandidatePatterns on ConversationCandidate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationCandidate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationCandidate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationCandidate value)  $default,){
final _that = this;
switch (_that) {
case _ConversationCandidate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationCandidate value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationCandidate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String displayName,  AccountRole role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationCandidate() when $default != null:
return $default(_that.id,_that.displayName,_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String displayName,  AccountRole role)  $default,) {final _that = this;
switch (_that) {
case _ConversationCandidate():
return $default(_that.id,_that.displayName,_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String displayName,  AccountRole role)?  $default,) {final _that = this;
switch (_that) {
case _ConversationCandidate() when $default != null:
return $default(_that.id,_that.displayName,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConversationCandidate implements ConversationCandidate {
  const _ConversationCandidate({required this.id, required this.displayName, required this.role});
  factory _ConversationCandidate.fromJson(Map<String, dynamic> json) => _$ConversationCandidateFromJson(json);

@override final  String id;
@override final  String displayName;
@override final  AccountRole role;

/// Create a copy of ConversationCandidate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationCandidateCopyWith<_ConversationCandidate> get copyWith => __$ConversationCandidateCopyWithImpl<_ConversationCandidate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationCandidateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationCandidate&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,role);

@override
String toString() {
  return 'ConversationCandidate(id: $id, displayName: $displayName, role: $role)';
}


}

/// @nodoc
abstract mixin class _$ConversationCandidateCopyWith<$Res> implements $ConversationCandidateCopyWith<$Res> {
  factory _$ConversationCandidateCopyWith(_ConversationCandidate value, $Res Function(_ConversationCandidate) _then) = __$ConversationCandidateCopyWithImpl;
@override @useResult
$Res call({
 String id, String displayName, AccountRole role
});




}
/// @nodoc
class __$ConversationCandidateCopyWithImpl<$Res>
    implements _$ConversationCandidateCopyWith<$Res> {
  __$ConversationCandidateCopyWithImpl(this._self, this._then);

  final _ConversationCandidate _self;
  final $Res Function(_ConversationCandidate) _then;

/// Create a copy of ConversationCandidate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = null,Object? role = null,}) {
  return _then(_ConversationCandidate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AccountRole,
  ));
}


}

// dart format on
