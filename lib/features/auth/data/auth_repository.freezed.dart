// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginResult {

 Account get account; String get accessToken; String get refreshToken; bool get requiresPasswordReset;
/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResultCopyWith<LoginResult> get copyWith => _$LoginResultCopyWithImpl<LoginResult>(this as LoginResult, _$identity);

  /// Serializes this LoginResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResult&&(identical(other.account, account) || other.account == account)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.requiresPasswordReset, requiresPasswordReset) || other.requiresPasswordReset == requiresPasswordReset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,account,accessToken,refreshToken,requiresPasswordReset);

@override
String toString() {
  return 'LoginResult(account: $account, accessToken: $accessToken, refreshToken: $refreshToken, requiresPasswordReset: $requiresPasswordReset)';
}


}

/// @nodoc
abstract mixin class $LoginResultCopyWith<$Res>  {
  factory $LoginResultCopyWith(LoginResult value, $Res Function(LoginResult) _then) = _$LoginResultCopyWithImpl;
@useResult
$Res call({
 Account account, String accessToken, String refreshToken, bool requiresPasswordReset
});


$AccountCopyWith<$Res> get account;

}
/// @nodoc
class _$LoginResultCopyWithImpl<$Res>
    implements $LoginResultCopyWith<$Res> {
  _$LoginResultCopyWithImpl(this._self, this._then);

  final LoginResult _self;
  final $Res Function(LoginResult) _then;

/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? account = null,Object? accessToken = null,Object? refreshToken = null,Object? requiresPasswordReset = null,}) {
  return _then(_self.copyWith(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Account,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,requiresPasswordReset: null == requiresPasswordReset ? _self.requiresPasswordReset : requiresPasswordReset // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountCopyWith<$Res> get account {
  
  return $AccountCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginResult].
extension LoginResultPatterns on LoginResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResult value)  $default,){
final _that = this;
switch (_that) {
case _LoginResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResult value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Account account,  String accessToken,  String refreshToken,  bool requiresPasswordReset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResult() when $default != null:
return $default(_that.account,_that.accessToken,_that.refreshToken,_that.requiresPasswordReset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Account account,  String accessToken,  String refreshToken,  bool requiresPasswordReset)  $default,) {final _that = this;
switch (_that) {
case _LoginResult():
return $default(_that.account,_that.accessToken,_that.refreshToken,_that.requiresPasswordReset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Account account,  String accessToken,  String refreshToken,  bool requiresPasswordReset)?  $default,) {final _that = this;
switch (_that) {
case _LoginResult() when $default != null:
return $default(_that.account,_that.accessToken,_that.refreshToken,_that.requiresPasswordReset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResult extends LoginResult {
  const _LoginResult({required this.account, required this.accessToken, required this.refreshToken, this.requiresPasswordReset = false}): super._();
  factory _LoginResult.fromJson(Map<String, dynamic> json) => _$LoginResultFromJson(json);

@override final  Account account;
@override final  String accessToken;
@override final  String refreshToken;
@override@JsonKey() final  bool requiresPasswordReset;

/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResultCopyWith<_LoginResult> get copyWith => __$LoginResultCopyWithImpl<_LoginResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResult&&(identical(other.account, account) || other.account == account)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.requiresPasswordReset, requiresPasswordReset) || other.requiresPasswordReset == requiresPasswordReset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,account,accessToken,refreshToken,requiresPasswordReset);

@override
String toString() {
  return 'LoginResult(account: $account, accessToken: $accessToken, refreshToken: $refreshToken, requiresPasswordReset: $requiresPasswordReset)';
}


}

/// @nodoc
abstract mixin class _$LoginResultCopyWith<$Res> implements $LoginResultCopyWith<$Res> {
  factory _$LoginResultCopyWith(_LoginResult value, $Res Function(_LoginResult) _then) = __$LoginResultCopyWithImpl;
@override @useResult
$Res call({
 Account account, String accessToken, String refreshToken, bool requiresPasswordReset
});


@override $AccountCopyWith<$Res> get account;

}
/// @nodoc
class __$LoginResultCopyWithImpl<$Res>
    implements _$LoginResultCopyWith<$Res> {
  __$LoginResultCopyWithImpl(this._self, this._then);

  final _LoginResult _self;
  final $Res Function(_LoginResult) _then;

/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? account = null,Object? accessToken = null,Object? refreshToken = null,Object? requiresPasswordReset = null,}) {
  return _then(_LoginResult(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Account,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,requiresPasswordReset: null == requiresPasswordReset ? _self.requiresPasswordReset : requiresPasswordReset // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountCopyWith<$Res> get account {
  
  return $AccountCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}

SignInPayload _$SignInPayloadFromJson(
  Map<String, dynamic> json
) {
    return _SignInPayloadImpl.fromJson(
      json
    );
}

/// @nodoc
mixin _$SignInPayload {

 String get schoolId; String get identifier; String get password;
/// Create a copy of SignInPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInPayloadCopyWith<SignInPayload> get copyWith => _$SignInPayloadCopyWithImpl<SignInPayload>(this as SignInPayload, _$identity);

  /// Serializes this SignInPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.identifier, identifier) || other.identifier == identifier)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,identifier,password);

@override
String toString() {
  return 'SignInPayload(schoolId: $schoolId, identifier: $identifier, password: $password)';
}


}

/// @nodoc
abstract mixin class $SignInPayloadCopyWith<$Res>  {
  factory $SignInPayloadCopyWith(SignInPayload value, $Res Function(SignInPayload) _then) = _$SignInPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String identifier, String password
});




}
/// @nodoc
class _$SignInPayloadCopyWithImpl<$Res>
    implements $SignInPayloadCopyWith<$Res> {
  _$SignInPayloadCopyWithImpl(this._self, this._then);

  final SignInPayload _self;
  final $Res Function(SignInPayload) _then;

/// Create a copy of SignInPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? identifier = null,Object? password = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,identifier: null == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SignInPayload].
extension SignInPayloadPatterns on SignInPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignInPayloadImpl value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignInPayloadImpl() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignInPayloadImpl value)  $default,){
final _that = this;
switch (_that) {
case _SignInPayloadImpl():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignInPayloadImpl value)?  $default,){
final _that = this;
switch (_that) {
case _SignInPayloadImpl() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String identifier,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignInPayloadImpl() when $default != null:
return $default(_that.schoolId,_that.identifier,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String identifier,  String password)  $default,) {final _that = this;
switch (_that) {
case _SignInPayloadImpl():
return $default(_that.schoolId,_that.identifier,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String identifier,  String password)?  $default,) {final _that = this;
switch (_that) {
case _SignInPayloadImpl() when $default != null:
return $default(_that.schoolId,_that.identifier,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignInPayloadImpl implements SignInPayload {
  const _SignInPayloadImpl({required this.schoolId, required this.identifier, required this.password});
  factory _SignInPayloadImpl.fromJson(Map<String, dynamic> json) => _$SignInPayloadImplFromJson(json);

@override final  String schoolId;
@override final  String identifier;
@override final  String password;

/// Create a copy of SignInPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignInPayloadImplCopyWith<_SignInPayloadImpl> get copyWith => __$SignInPayloadImplCopyWithImpl<_SignInPayloadImpl>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignInPayloadImplToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInPayloadImpl&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.identifier, identifier) || other.identifier == identifier)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,identifier,password);

@override
String toString() {
  return 'SignInPayload(schoolId: $schoolId, identifier: $identifier, password: $password)';
}


}

/// @nodoc
abstract mixin class _$SignInPayloadImplCopyWith<$Res> implements $SignInPayloadCopyWith<$Res> {
  factory _$SignInPayloadImplCopyWith(_SignInPayloadImpl value, $Res Function(_SignInPayloadImpl) _then) = __$SignInPayloadImplCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String identifier, String password
});




}
/// @nodoc
class __$SignInPayloadImplCopyWithImpl<$Res>
    implements _$SignInPayloadImplCopyWith<$Res> {
  __$SignInPayloadImplCopyWithImpl(this._self, this._then);

  final _SignInPayloadImpl _self;
  final $Res Function(_SignInPayloadImpl) _then;

/// Create a copy of SignInPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? identifier = null,Object? password = null,}) {
  return _then(_SignInPayloadImpl(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,identifier: null == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SchoolsResult {

 List<School> get schools;
/// Create a copy of SchoolsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SchoolsResultCopyWith<SchoolsResult> get copyWith => _$SchoolsResultCopyWithImpl<SchoolsResult>(this as SchoolsResult, _$identity);

  /// Serializes this SchoolsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SchoolsResult&&const DeepCollectionEquality().equals(other.schools, schools));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(schools));

@override
String toString() {
  return 'SchoolsResult(schools: $schools)';
}


}

/// @nodoc
abstract mixin class $SchoolsResultCopyWith<$Res>  {
  factory $SchoolsResultCopyWith(SchoolsResult value, $Res Function(SchoolsResult) _then) = _$SchoolsResultCopyWithImpl;
@useResult
$Res call({
 List<School> schools
});




}
/// @nodoc
class _$SchoolsResultCopyWithImpl<$Res>
    implements $SchoolsResultCopyWith<$Res> {
  _$SchoolsResultCopyWithImpl(this._self, this._then);

  final SchoolsResult _self;
  final $Res Function(SchoolsResult) _then;

/// Create a copy of SchoolsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schools = null,}) {
  return _then(_self.copyWith(
schools: null == schools ? _self.schools : schools // ignore: cast_nullable_to_non_nullable
as List<School>,
  ));
}

}


/// Adds pattern-matching-related methods to [SchoolsResult].
extension SchoolsResultPatterns on SchoolsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SchoolsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SchoolsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SchoolsResult value)  $default,){
final _that = this;
switch (_that) {
case _SchoolsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SchoolsResult value)?  $default,){
final _that = this;
switch (_that) {
case _SchoolsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<School> schools)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SchoolsResult() when $default != null:
return $default(_that.schools);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<School> schools)  $default,) {final _that = this;
switch (_that) {
case _SchoolsResult():
return $default(_that.schools);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<School> schools)?  $default,) {final _that = this;
switch (_that) {
case _SchoolsResult() when $default != null:
return $default(_that.schools);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SchoolsResult implements SchoolsResult {
  const _SchoolsResult({required final  List<School> schools}): _schools = schools;
  factory _SchoolsResult.fromJson(Map<String, dynamic> json) => _$SchoolsResultFromJson(json);

 final  List<School> _schools;
@override List<School> get schools {
  if (_schools is EqualUnmodifiableListView) return _schools;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_schools);
}


/// Create a copy of SchoolsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SchoolsResultCopyWith<_SchoolsResult> get copyWith => __$SchoolsResultCopyWithImpl<_SchoolsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SchoolsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SchoolsResult&&const DeepCollectionEquality().equals(other._schools, _schools));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_schools));

@override
String toString() {
  return 'SchoolsResult(schools: $schools)';
}


}

/// @nodoc
abstract mixin class _$SchoolsResultCopyWith<$Res> implements $SchoolsResultCopyWith<$Res> {
  factory _$SchoolsResultCopyWith(_SchoolsResult value, $Res Function(_SchoolsResult) _then) = __$SchoolsResultCopyWithImpl;
@override @useResult
$Res call({
 List<School> schools
});




}
/// @nodoc
class __$SchoolsResultCopyWithImpl<$Res>
    implements _$SchoolsResultCopyWith<$Res> {
  __$SchoolsResultCopyWithImpl(this._self, this._then);

  final _SchoolsResult _self;
  final $Res Function(_SchoolsResult) _then;

/// Create a copy of SchoolsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schools = null,}) {
  return _then(_SchoolsResult(
schools: null == schools ? _self._schools : schools // ignore: cast_nullable_to_non_nullable
as List<School>,
  ));
}


}

RequestPasswordResetPayload _$RequestPasswordResetPayloadFromJson(
  Map<String, dynamic> json
) {
    return _RequestPasswordResetPayloadImpl.fromJson(
      json
    );
}

/// @nodoc
mixin _$RequestPasswordResetPayload {

 String get schoolId; String get identifier;
/// Create a copy of RequestPasswordResetPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestPasswordResetPayloadCopyWith<RequestPasswordResetPayload> get copyWith => _$RequestPasswordResetPayloadCopyWithImpl<RequestPasswordResetPayload>(this as RequestPasswordResetPayload, _$identity);

  /// Serializes this RequestPasswordResetPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestPasswordResetPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.identifier, identifier) || other.identifier == identifier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,identifier);

@override
String toString() {
  return 'RequestPasswordResetPayload(schoolId: $schoolId, identifier: $identifier)';
}


}

/// @nodoc
abstract mixin class $RequestPasswordResetPayloadCopyWith<$Res>  {
  factory $RequestPasswordResetPayloadCopyWith(RequestPasswordResetPayload value, $Res Function(RequestPasswordResetPayload) _then) = _$RequestPasswordResetPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String identifier
});




}
/// @nodoc
class _$RequestPasswordResetPayloadCopyWithImpl<$Res>
    implements $RequestPasswordResetPayloadCopyWith<$Res> {
  _$RequestPasswordResetPayloadCopyWithImpl(this._self, this._then);

  final RequestPasswordResetPayload _self;
  final $Res Function(RequestPasswordResetPayload) _then;

/// Create a copy of RequestPasswordResetPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? identifier = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,identifier: null == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestPasswordResetPayload].
extension RequestPasswordResetPayloadPatterns on RequestPasswordResetPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestPasswordResetPayloadImpl value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestPasswordResetPayloadImpl() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestPasswordResetPayloadImpl value)  $default,){
final _that = this;
switch (_that) {
case _RequestPasswordResetPayloadImpl():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestPasswordResetPayloadImpl value)?  $default,){
final _that = this;
switch (_that) {
case _RequestPasswordResetPayloadImpl() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String identifier)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestPasswordResetPayloadImpl() when $default != null:
return $default(_that.schoolId,_that.identifier);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String identifier)  $default,) {final _that = this;
switch (_that) {
case _RequestPasswordResetPayloadImpl():
return $default(_that.schoolId,_that.identifier);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String identifier)?  $default,) {final _that = this;
switch (_that) {
case _RequestPasswordResetPayloadImpl() when $default != null:
return $default(_that.schoolId,_that.identifier);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestPasswordResetPayloadImpl implements RequestPasswordResetPayload {
  const _RequestPasswordResetPayloadImpl({required this.schoolId, required this.identifier});
  factory _RequestPasswordResetPayloadImpl.fromJson(Map<String, dynamic> json) => _$RequestPasswordResetPayloadImplFromJson(json);

@override final  String schoolId;
@override final  String identifier;

/// Create a copy of RequestPasswordResetPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestPasswordResetPayloadImplCopyWith<_RequestPasswordResetPayloadImpl> get copyWith => __$RequestPasswordResetPayloadImplCopyWithImpl<_RequestPasswordResetPayloadImpl>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestPasswordResetPayloadImplToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestPasswordResetPayloadImpl&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.identifier, identifier) || other.identifier == identifier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,identifier);

@override
String toString() {
  return 'RequestPasswordResetPayload(schoolId: $schoolId, identifier: $identifier)';
}


}

/// @nodoc
abstract mixin class _$RequestPasswordResetPayloadImplCopyWith<$Res> implements $RequestPasswordResetPayloadCopyWith<$Res> {
  factory _$RequestPasswordResetPayloadImplCopyWith(_RequestPasswordResetPayloadImpl value, $Res Function(_RequestPasswordResetPayloadImpl) _then) = __$RequestPasswordResetPayloadImplCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String identifier
});




}
/// @nodoc
class __$RequestPasswordResetPayloadImplCopyWithImpl<$Res>
    implements _$RequestPasswordResetPayloadImplCopyWith<$Res> {
  __$RequestPasswordResetPayloadImplCopyWithImpl(this._self, this._then);

  final _RequestPasswordResetPayloadImpl _self;
  final $Res Function(_RequestPasswordResetPayloadImpl) _then;

/// Create a copy of RequestPasswordResetPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? identifier = null,}) {
  return _then(_RequestPasswordResetPayloadImpl(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,identifier: null == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

_RequestPasswordResetResult _$RequestPasswordResetResultFromJson(
  Map<String, dynamic> json
) {
    return _RequestPasswordResetResultImpl.fromJson(
      json
    );
}

/// @nodoc
mixin _$RequestPasswordResetResult {

 String get resetToken;
/// Create a copy of _RequestPasswordResetResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestPasswordResetResultCopyWith<_RequestPasswordResetResult> get copyWith => __$RequestPasswordResetResultCopyWithImpl<_RequestPasswordResetResult>(this as _RequestPasswordResetResult, _$identity);

  /// Serializes this _RequestPasswordResetResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestPasswordResetResult&&(identical(other.resetToken, resetToken) || other.resetToken == resetToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resetToken);

@override
String toString() {
  return '_RequestPasswordResetResult(resetToken: $resetToken)';
}


}

/// @nodoc
abstract mixin class _$RequestPasswordResetResultCopyWith<$Res>  {
  factory _$RequestPasswordResetResultCopyWith(_RequestPasswordResetResult value, $Res Function(_RequestPasswordResetResult) _then) = __$RequestPasswordResetResultCopyWithImpl;
@useResult
$Res call({
 String resetToken
});




}
/// @nodoc
class __$RequestPasswordResetResultCopyWithImpl<$Res>
    implements _$RequestPasswordResetResultCopyWith<$Res> {
  __$RequestPasswordResetResultCopyWithImpl(this._self, this._then);

  final _RequestPasswordResetResult _self;
  final $Res Function(_RequestPasswordResetResult) _then;

/// Create a copy of _RequestPasswordResetResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resetToken = null,}) {
  return _then(_self.copyWith(
resetToken: null == resetToken ? _self.resetToken : resetToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [_RequestPasswordResetResult].
extension _RequestPasswordResetResultPatterns on _RequestPasswordResetResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestPasswordResetResultImpl value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestPasswordResetResultImpl() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestPasswordResetResultImpl value)  $default,){
final _that = this;
switch (_that) {
case _RequestPasswordResetResultImpl():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestPasswordResetResultImpl value)?  $default,){
final _that = this;
switch (_that) {
case _RequestPasswordResetResultImpl() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String resetToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestPasswordResetResultImpl() when $default != null:
return $default(_that.resetToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String resetToken)  $default,) {final _that = this;
switch (_that) {
case _RequestPasswordResetResultImpl():
return $default(_that.resetToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String resetToken)?  $default,) {final _that = this;
switch (_that) {
case _RequestPasswordResetResultImpl() when $default != null:
return $default(_that.resetToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestPasswordResetResultImpl implements _RequestPasswordResetResult {
  const _RequestPasswordResetResultImpl({required this.resetToken});
  factory _RequestPasswordResetResultImpl.fromJson(Map<String, dynamic> json) => _$RequestPasswordResetResultImplFromJson(json);

@override final  String resetToken;

/// Create a copy of _RequestPasswordResetResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestPasswordResetResultImplCopyWith<_RequestPasswordResetResultImpl> get copyWith => __$RequestPasswordResetResultImplCopyWithImpl<_RequestPasswordResetResultImpl>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestPasswordResetResultImplToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestPasswordResetResultImpl&&(identical(other.resetToken, resetToken) || other.resetToken == resetToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resetToken);

@override
String toString() {
  return '_RequestPasswordResetResult(resetToken: $resetToken)';
}


}

/// @nodoc
abstract mixin class _$RequestPasswordResetResultImplCopyWith<$Res> implements _$RequestPasswordResetResultCopyWith<$Res> {
  factory _$RequestPasswordResetResultImplCopyWith(_RequestPasswordResetResultImpl value, $Res Function(_RequestPasswordResetResultImpl) _then) = __$RequestPasswordResetResultImplCopyWithImpl;
@override @useResult
$Res call({
 String resetToken
});




}
/// @nodoc
class __$RequestPasswordResetResultImplCopyWithImpl<$Res>
    implements _$RequestPasswordResetResultImplCopyWith<$Res> {
  __$RequestPasswordResetResultImplCopyWithImpl(this._self, this._then);

  final _RequestPasswordResetResultImpl _self;
  final $Res Function(_RequestPasswordResetResultImpl) _then;

/// Create a copy of _RequestPasswordResetResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resetToken = null,}) {
  return _then(_RequestPasswordResetResultImpl(
resetToken: null == resetToken ? _self.resetToken : resetToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

ConfirmPasswordResetPayload _$ConfirmPasswordResetPayloadFromJson(
  Map<String, dynamic> json
) {
    return _ConfirmPasswordResetPayloadImpl.fromJson(
      json
    );
}

/// @nodoc
mixin _$ConfirmPasswordResetPayload {

 String get schoolId; String get identifier; String get token; String get newPassword;
/// Create a copy of ConfirmPasswordResetPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmPasswordResetPayloadCopyWith<ConfirmPasswordResetPayload> get copyWith => _$ConfirmPasswordResetPayloadCopyWithImpl<ConfirmPasswordResetPayload>(this as ConfirmPasswordResetPayload, _$identity);

  /// Serializes this ConfirmPasswordResetPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmPasswordResetPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.identifier, identifier) || other.identifier == identifier)&&(identical(other.token, token) || other.token == token)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,identifier,token,newPassword);

@override
String toString() {
  return 'ConfirmPasswordResetPayload(schoolId: $schoolId, identifier: $identifier, token: $token, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class $ConfirmPasswordResetPayloadCopyWith<$Res>  {
  factory $ConfirmPasswordResetPayloadCopyWith(ConfirmPasswordResetPayload value, $Res Function(ConfirmPasswordResetPayload) _then) = _$ConfirmPasswordResetPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String identifier, String token, String newPassword
});




}
/// @nodoc
class _$ConfirmPasswordResetPayloadCopyWithImpl<$Res>
    implements $ConfirmPasswordResetPayloadCopyWith<$Res> {
  _$ConfirmPasswordResetPayloadCopyWithImpl(this._self, this._then);

  final ConfirmPasswordResetPayload _self;
  final $Res Function(ConfirmPasswordResetPayload) _then;

/// Create a copy of ConfirmPasswordResetPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? identifier = null,Object? token = null,Object? newPassword = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,identifier: null == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfirmPasswordResetPayload].
extension ConfirmPasswordResetPayloadPatterns on ConfirmPasswordResetPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfirmPasswordResetPayloadImpl value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfirmPasswordResetPayloadImpl() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfirmPasswordResetPayloadImpl value)  $default,){
final _that = this;
switch (_that) {
case _ConfirmPasswordResetPayloadImpl():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfirmPasswordResetPayloadImpl value)?  $default,){
final _that = this;
switch (_that) {
case _ConfirmPasswordResetPayloadImpl() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String identifier,  String token,  String newPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfirmPasswordResetPayloadImpl() when $default != null:
return $default(_that.schoolId,_that.identifier,_that.token,_that.newPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String identifier,  String token,  String newPassword)  $default,) {final _that = this;
switch (_that) {
case _ConfirmPasswordResetPayloadImpl():
return $default(_that.schoolId,_that.identifier,_that.token,_that.newPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String identifier,  String token,  String newPassword)?  $default,) {final _that = this;
switch (_that) {
case _ConfirmPasswordResetPayloadImpl() when $default != null:
return $default(_that.schoolId,_that.identifier,_that.token,_that.newPassword);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConfirmPasswordResetPayloadImpl implements ConfirmPasswordResetPayload {
  const _ConfirmPasswordResetPayloadImpl({required this.schoolId, required this.identifier, required this.token, required this.newPassword});
  factory _ConfirmPasswordResetPayloadImpl.fromJson(Map<String, dynamic> json) => _$ConfirmPasswordResetPayloadImplFromJson(json);

@override final  String schoolId;
@override final  String identifier;
@override final  String token;
@override final  String newPassword;

/// Create a copy of ConfirmPasswordResetPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmPasswordResetPayloadImplCopyWith<_ConfirmPasswordResetPayloadImpl> get copyWith => __$ConfirmPasswordResetPayloadImplCopyWithImpl<_ConfirmPasswordResetPayloadImpl>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfirmPasswordResetPayloadImplToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmPasswordResetPayloadImpl&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.identifier, identifier) || other.identifier == identifier)&&(identical(other.token, token) || other.token == token)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,identifier,token,newPassword);

@override
String toString() {
  return 'ConfirmPasswordResetPayload(schoolId: $schoolId, identifier: $identifier, token: $token, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$ConfirmPasswordResetPayloadImplCopyWith<$Res> implements $ConfirmPasswordResetPayloadCopyWith<$Res> {
  factory _$ConfirmPasswordResetPayloadImplCopyWith(_ConfirmPasswordResetPayloadImpl value, $Res Function(_ConfirmPasswordResetPayloadImpl) _then) = __$ConfirmPasswordResetPayloadImplCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String identifier, String token, String newPassword
});




}
/// @nodoc
class __$ConfirmPasswordResetPayloadImplCopyWithImpl<$Res>
    implements _$ConfirmPasswordResetPayloadImplCopyWith<$Res> {
  __$ConfirmPasswordResetPayloadImplCopyWithImpl(this._self, this._then);

  final _ConfirmPasswordResetPayloadImpl _self;
  final $Res Function(_ConfirmPasswordResetPayloadImpl) _then;

/// Create a copy of ConfirmPasswordResetPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? identifier = null,Object? token = null,Object? newPassword = null,}) {
  return _then(_ConfirmPasswordResetPayloadImpl(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,identifier: null == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
