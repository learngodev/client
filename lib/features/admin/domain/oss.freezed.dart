// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oss.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminOssCredential {

 String get id; String get name; String get endpoint; String get internalEndpoint; String get region; String get bucket; String get directoryPrefix; String get accessKeyMasked; bool get allowPublicRead; bool get allowMultipartUpload; bool get useRelayUpload; bool get isPrimary; bool get active;@JsonKey(fromJson: _parseDateDefault0) DateTime get createdAt;@JsonKey(fromJson: _parseNullableDate) DateTime? get lastRotatedAt;
/// Create a copy of AdminOssCredential
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminOssCredentialCopyWith<AdminOssCredential> get copyWith => _$AdminOssCredentialCopyWithImpl<AdminOssCredential>(this as AdminOssCredential, _$identity);

  /// Serializes this AdminOssCredential to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminOssCredential&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.endpoint, endpoint) || other.endpoint == endpoint)&&(identical(other.internalEndpoint, internalEndpoint) || other.internalEndpoint == internalEndpoint)&&(identical(other.region, region) || other.region == region)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.directoryPrefix, directoryPrefix) || other.directoryPrefix == directoryPrefix)&&(identical(other.accessKeyMasked, accessKeyMasked) || other.accessKeyMasked == accessKeyMasked)&&(identical(other.allowPublicRead, allowPublicRead) || other.allowPublicRead == allowPublicRead)&&(identical(other.allowMultipartUpload, allowMultipartUpload) || other.allowMultipartUpload == allowMultipartUpload)&&(identical(other.useRelayUpload, useRelayUpload) || other.useRelayUpload == useRelayUpload)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary)&&(identical(other.active, active) || other.active == active)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastRotatedAt, lastRotatedAt) || other.lastRotatedAt == lastRotatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,endpoint,internalEndpoint,region,bucket,directoryPrefix,accessKeyMasked,allowPublicRead,allowMultipartUpload,useRelayUpload,isPrimary,active,createdAt,lastRotatedAt);

@override
String toString() {
  return 'AdminOssCredential(id: $id, name: $name, endpoint: $endpoint, internalEndpoint: $internalEndpoint, region: $region, bucket: $bucket, directoryPrefix: $directoryPrefix, accessKeyMasked: $accessKeyMasked, allowPublicRead: $allowPublicRead, allowMultipartUpload: $allowMultipartUpload, useRelayUpload: $useRelayUpload, isPrimary: $isPrimary, active: $active, createdAt: $createdAt, lastRotatedAt: $lastRotatedAt)';
}


}

/// @nodoc
abstract mixin class $AdminOssCredentialCopyWith<$Res>  {
  factory $AdminOssCredentialCopyWith(AdminOssCredential value, $Res Function(AdminOssCredential) _then) = _$AdminOssCredentialCopyWithImpl;
@useResult
$Res call({
 String id, String name, String endpoint, String internalEndpoint, String region, String bucket, String directoryPrefix, String accessKeyMasked, bool allowPublicRead, bool allowMultipartUpload, bool useRelayUpload, bool isPrimary, bool active,@JsonKey(fromJson: _parseDateDefault0) DateTime createdAt,@JsonKey(fromJson: _parseNullableDate) DateTime? lastRotatedAt
});




}
/// @nodoc
class _$AdminOssCredentialCopyWithImpl<$Res>
    implements $AdminOssCredentialCopyWith<$Res> {
  _$AdminOssCredentialCopyWithImpl(this._self, this._then);

  final AdminOssCredential _self;
  final $Res Function(AdminOssCredential) _then;

/// Create a copy of AdminOssCredential
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? endpoint = null,Object? internalEndpoint = null,Object? region = null,Object? bucket = null,Object? directoryPrefix = null,Object? accessKeyMasked = null,Object? allowPublicRead = null,Object? allowMultipartUpload = null,Object? useRelayUpload = null,Object? isPrimary = null,Object? active = null,Object? createdAt = null,Object? lastRotatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,endpoint: null == endpoint ? _self.endpoint : endpoint // ignore: cast_nullable_to_non_nullable
as String,internalEndpoint: null == internalEndpoint ? _self.internalEndpoint : internalEndpoint // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as String,directoryPrefix: null == directoryPrefix ? _self.directoryPrefix : directoryPrefix // ignore: cast_nullable_to_non_nullable
as String,accessKeyMasked: null == accessKeyMasked ? _self.accessKeyMasked : accessKeyMasked // ignore: cast_nullable_to_non_nullable
as String,allowPublicRead: null == allowPublicRead ? _self.allowPublicRead : allowPublicRead // ignore: cast_nullable_to_non_nullable
as bool,allowMultipartUpload: null == allowMultipartUpload ? _self.allowMultipartUpload : allowMultipartUpload // ignore: cast_nullable_to_non_nullable
as bool,useRelayUpload: null == useRelayUpload ? _self.useRelayUpload : useRelayUpload // ignore: cast_nullable_to_non_nullable
as bool,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastRotatedAt: freezed == lastRotatedAt ? _self.lastRotatedAt : lastRotatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminOssCredential].
extension AdminOssCredentialPatterns on AdminOssCredential {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminOssCredential value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminOssCredential() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminOssCredential value)  $default,){
final _that = this;
switch (_that) {
case _AdminOssCredential():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminOssCredential value)?  $default,){
final _that = this;
switch (_that) {
case _AdminOssCredential() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String endpoint,  String internalEndpoint,  String region,  String bucket,  String directoryPrefix,  String accessKeyMasked,  bool allowPublicRead,  bool allowMultipartUpload,  bool useRelayUpload,  bool isPrimary,  bool active, @JsonKey(fromJson: _parseDateDefault0)  DateTime createdAt, @JsonKey(fromJson: _parseNullableDate)  DateTime? lastRotatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminOssCredential() when $default != null:
return $default(_that.id,_that.name,_that.endpoint,_that.internalEndpoint,_that.region,_that.bucket,_that.directoryPrefix,_that.accessKeyMasked,_that.allowPublicRead,_that.allowMultipartUpload,_that.useRelayUpload,_that.isPrimary,_that.active,_that.createdAt,_that.lastRotatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String endpoint,  String internalEndpoint,  String region,  String bucket,  String directoryPrefix,  String accessKeyMasked,  bool allowPublicRead,  bool allowMultipartUpload,  bool useRelayUpload,  bool isPrimary,  bool active, @JsonKey(fromJson: _parseDateDefault0)  DateTime createdAt, @JsonKey(fromJson: _parseNullableDate)  DateTime? lastRotatedAt)  $default,) {final _that = this;
switch (_that) {
case _AdminOssCredential():
return $default(_that.id,_that.name,_that.endpoint,_that.internalEndpoint,_that.region,_that.bucket,_that.directoryPrefix,_that.accessKeyMasked,_that.allowPublicRead,_that.allowMultipartUpload,_that.useRelayUpload,_that.isPrimary,_that.active,_that.createdAt,_that.lastRotatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String endpoint,  String internalEndpoint,  String region,  String bucket,  String directoryPrefix,  String accessKeyMasked,  bool allowPublicRead,  bool allowMultipartUpload,  bool useRelayUpload,  bool isPrimary,  bool active, @JsonKey(fromJson: _parseDateDefault0)  DateTime createdAt, @JsonKey(fromJson: _parseNullableDate)  DateTime? lastRotatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AdminOssCredential() when $default != null:
return $default(_that.id,_that.name,_that.endpoint,_that.internalEndpoint,_that.region,_that.bucket,_that.directoryPrefix,_that.accessKeyMasked,_that.allowPublicRead,_that.allowMultipartUpload,_that.useRelayUpload,_that.isPrimary,_that.active,_that.createdAt,_that.lastRotatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminOssCredential extends AdminOssCredential {
  const _AdminOssCredential({this.id = '', this.name = '', this.endpoint = '', this.internalEndpoint = '', this.region = '', this.bucket = '', this.directoryPrefix = '', this.accessKeyMasked = '', this.allowPublicRead = false, this.allowMultipartUpload = false, this.useRelayUpload = false, this.isPrimary = false, this.active = false, @JsonKey(fromJson: _parseDateDefault0) required this.createdAt, @JsonKey(fromJson: _parseNullableDate) this.lastRotatedAt}): super._();
  factory _AdminOssCredential.fromJson(Map<String, dynamic> json) => _$AdminOssCredentialFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String endpoint;
@override@JsonKey() final  String internalEndpoint;
@override@JsonKey() final  String region;
@override@JsonKey() final  String bucket;
@override@JsonKey() final  String directoryPrefix;
@override@JsonKey() final  String accessKeyMasked;
@override@JsonKey() final  bool allowPublicRead;
@override@JsonKey() final  bool allowMultipartUpload;
@override@JsonKey() final  bool useRelayUpload;
@override@JsonKey() final  bool isPrimary;
@override@JsonKey() final  bool active;
@override@JsonKey(fromJson: _parseDateDefault0) final  DateTime createdAt;
@override@JsonKey(fromJson: _parseNullableDate) final  DateTime? lastRotatedAt;

/// Create a copy of AdminOssCredential
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminOssCredentialCopyWith<_AdminOssCredential> get copyWith => __$AdminOssCredentialCopyWithImpl<_AdminOssCredential>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminOssCredentialToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminOssCredential&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.endpoint, endpoint) || other.endpoint == endpoint)&&(identical(other.internalEndpoint, internalEndpoint) || other.internalEndpoint == internalEndpoint)&&(identical(other.region, region) || other.region == region)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.directoryPrefix, directoryPrefix) || other.directoryPrefix == directoryPrefix)&&(identical(other.accessKeyMasked, accessKeyMasked) || other.accessKeyMasked == accessKeyMasked)&&(identical(other.allowPublicRead, allowPublicRead) || other.allowPublicRead == allowPublicRead)&&(identical(other.allowMultipartUpload, allowMultipartUpload) || other.allowMultipartUpload == allowMultipartUpload)&&(identical(other.useRelayUpload, useRelayUpload) || other.useRelayUpload == useRelayUpload)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary)&&(identical(other.active, active) || other.active == active)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastRotatedAt, lastRotatedAt) || other.lastRotatedAt == lastRotatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,endpoint,internalEndpoint,region,bucket,directoryPrefix,accessKeyMasked,allowPublicRead,allowMultipartUpload,useRelayUpload,isPrimary,active,createdAt,lastRotatedAt);

@override
String toString() {
  return 'AdminOssCredential(id: $id, name: $name, endpoint: $endpoint, internalEndpoint: $internalEndpoint, region: $region, bucket: $bucket, directoryPrefix: $directoryPrefix, accessKeyMasked: $accessKeyMasked, allowPublicRead: $allowPublicRead, allowMultipartUpload: $allowMultipartUpload, useRelayUpload: $useRelayUpload, isPrimary: $isPrimary, active: $active, createdAt: $createdAt, lastRotatedAt: $lastRotatedAt)';
}


}

/// @nodoc
abstract mixin class _$AdminOssCredentialCopyWith<$Res> implements $AdminOssCredentialCopyWith<$Res> {
  factory _$AdminOssCredentialCopyWith(_AdminOssCredential value, $Res Function(_AdminOssCredential) _then) = __$AdminOssCredentialCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String endpoint, String internalEndpoint, String region, String bucket, String directoryPrefix, String accessKeyMasked, bool allowPublicRead, bool allowMultipartUpload, bool useRelayUpload, bool isPrimary, bool active,@JsonKey(fromJson: _parseDateDefault0) DateTime createdAt,@JsonKey(fromJson: _parseNullableDate) DateTime? lastRotatedAt
});




}
/// @nodoc
class __$AdminOssCredentialCopyWithImpl<$Res>
    implements _$AdminOssCredentialCopyWith<$Res> {
  __$AdminOssCredentialCopyWithImpl(this._self, this._then);

  final _AdminOssCredential _self;
  final $Res Function(_AdminOssCredential) _then;

/// Create a copy of AdminOssCredential
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? endpoint = null,Object? internalEndpoint = null,Object? region = null,Object? bucket = null,Object? directoryPrefix = null,Object? accessKeyMasked = null,Object? allowPublicRead = null,Object? allowMultipartUpload = null,Object? useRelayUpload = null,Object? isPrimary = null,Object? active = null,Object? createdAt = null,Object? lastRotatedAt = freezed,}) {
  return _then(_AdminOssCredential(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,endpoint: null == endpoint ? _self.endpoint : endpoint // ignore: cast_nullable_to_non_nullable
as String,internalEndpoint: null == internalEndpoint ? _self.internalEndpoint : internalEndpoint // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as String,directoryPrefix: null == directoryPrefix ? _self.directoryPrefix : directoryPrefix // ignore: cast_nullable_to_non_nullable
as String,accessKeyMasked: null == accessKeyMasked ? _self.accessKeyMasked : accessKeyMasked // ignore: cast_nullable_to_non_nullable
as String,allowPublicRead: null == allowPublicRead ? _self.allowPublicRead : allowPublicRead // ignore: cast_nullable_to_non_nullable
as bool,allowMultipartUpload: null == allowMultipartUpload ? _self.allowMultipartUpload : allowMultipartUpload // ignore: cast_nullable_to_non_nullable
as bool,useRelayUpload: null == useRelayUpload ? _self.useRelayUpload : useRelayUpload // ignore: cast_nullable_to_non_nullable
as bool,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastRotatedAt: freezed == lastRotatedAt ? _self.lastRotatedAt : lastRotatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$AdminOssPolicy {

 String get id; String get name; String get description;@JsonKey(fromJson: _parsePolicyStatus) AdminOssPolicyStatus get status; String get appliesTo;@JsonKey(fromJson: _parseDateDefault0) DateTime get lastUpdatedAt;
/// Create a copy of AdminOssPolicy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminOssPolicyCopyWith<AdminOssPolicy> get copyWith => _$AdminOssPolicyCopyWithImpl<AdminOssPolicy>(this as AdminOssPolicy, _$identity);

  /// Serializes this AdminOssPolicy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminOssPolicy&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&(identical(other.lastUpdatedAt, lastUpdatedAt) || other.lastUpdatedAt == lastUpdatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,status,appliesTo,lastUpdatedAt);

@override
String toString() {
  return 'AdminOssPolicy(id: $id, name: $name, description: $description, status: $status, appliesTo: $appliesTo, lastUpdatedAt: $lastUpdatedAt)';
}


}

/// @nodoc
abstract mixin class $AdminOssPolicyCopyWith<$Res>  {
  factory $AdminOssPolicyCopyWith(AdminOssPolicy value, $Res Function(AdminOssPolicy) _then) = _$AdminOssPolicyCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description,@JsonKey(fromJson: _parsePolicyStatus) AdminOssPolicyStatus status, String appliesTo,@JsonKey(fromJson: _parseDateDefault0) DateTime lastUpdatedAt
});




}
/// @nodoc
class _$AdminOssPolicyCopyWithImpl<$Res>
    implements $AdminOssPolicyCopyWith<$Res> {
  _$AdminOssPolicyCopyWithImpl(this._self, this._then);

  final AdminOssPolicy _self;
  final $Res Function(AdminOssPolicy) _then;

/// Create a copy of AdminOssPolicy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? status = null,Object? appliesTo = null,Object? lastUpdatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdminOssPolicyStatus,appliesTo: null == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as String,lastUpdatedAt: null == lastUpdatedAt ? _self.lastUpdatedAt : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminOssPolicy].
extension AdminOssPolicyPatterns on AdminOssPolicy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminOssPolicy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminOssPolicy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminOssPolicy value)  $default,){
final _that = this;
switch (_that) {
case _AdminOssPolicy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminOssPolicy value)?  $default,){
final _that = this;
switch (_that) {
case _AdminOssPolicy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description, @JsonKey(fromJson: _parsePolicyStatus)  AdminOssPolicyStatus status,  String appliesTo, @JsonKey(fromJson: _parseDateDefault0)  DateTime lastUpdatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminOssPolicy() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.status,_that.appliesTo,_that.lastUpdatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description, @JsonKey(fromJson: _parsePolicyStatus)  AdminOssPolicyStatus status,  String appliesTo, @JsonKey(fromJson: _parseDateDefault0)  DateTime lastUpdatedAt)  $default,) {final _that = this;
switch (_that) {
case _AdminOssPolicy():
return $default(_that.id,_that.name,_that.description,_that.status,_that.appliesTo,_that.lastUpdatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description, @JsonKey(fromJson: _parsePolicyStatus)  AdminOssPolicyStatus status,  String appliesTo, @JsonKey(fromJson: _parseDateDefault0)  DateTime lastUpdatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AdminOssPolicy() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.status,_that.appliesTo,_that.lastUpdatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminOssPolicy extends AdminOssPolicy {
  const _AdminOssPolicy({this.id = '', this.name = '', this.description = '', @JsonKey(fromJson: _parsePolicyStatus) required this.status, this.appliesTo = '', @JsonKey(fromJson: _parseDateDefault0) required this.lastUpdatedAt}): super._();
  factory _AdminOssPolicy.fromJson(Map<String, dynamic> json) => _$AdminOssPolicyFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
@override@JsonKey(fromJson: _parsePolicyStatus) final  AdminOssPolicyStatus status;
@override@JsonKey() final  String appliesTo;
@override@JsonKey(fromJson: _parseDateDefault0) final  DateTime lastUpdatedAt;

/// Create a copy of AdminOssPolicy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminOssPolicyCopyWith<_AdminOssPolicy> get copyWith => __$AdminOssPolicyCopyWithImpl<_AdminOssPolicy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminOssPolicyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminOssPolicy&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&(identical(other.lastUpdatedAt, lastUpdatedAt) || other.lastUpdatedAt == lastUpdatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,status,appliesTo,lastUpdatedAt);

@override
String toString() {
  return 'AdminOssPolicy(id: $id, name: $name, description: $description, status: $status, appliesTo: $appliesTo, lastUpdatedAt: $lastUpdatedAt)';
}


}

/// @nodoc
abstract mixin class _$AdminOssPolicyCopyWith<$Res> implements $AdminOssPolicyCopyWith<$Res> {
  factory _$AdminOssPolicyCopyWith(_AdminOssPolicy value, $Res Function(_AdminOssPolicy) _then) = __$AdminOssPolicyCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description,@JsonKey(fromJson: _parsePolicyStatus) AdminOssPolicyStatus status, String appliesTo,@JsonKey(fromJson: _parseDateDefault0) DateTime lastUpdatedAt
});




}
/// @nodoc
class __$AdminOssPolicyCopyWithImpl<$Res>
    implements _$AdminOssPolicyCopyWith<$Res> {
  __$AdminOssPolicyCopyWithImpl(this._self, this._then);

  final _AdminOssPolicy _self;
  final $Res Function(_AdminOssPolicy) _then;

/// Create a copy of AdminOssPolicy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? status = null,Object? appliesTo = null,Object? lastUpdatedAt = null,}) {
  return _then(_AdminOssPolicy(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdminOssPolicyStatus,appliesTo: null == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as String,lastUpdatedAt: null == lastUpdatedAt ? _self.lastUpdatedAt : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$AdminOssAuditLog {

 String get id; String get action; String get operator; String get detail;@JsonKey(fromJson: _parseDateDefault0) DateTime get createdAt;
/// Create a copy of AdminOssAuditLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminOssAuditLogCopyWith<AdminOssAuditLog> get copyWith => _$AdminOssAuditLogCopyWithImpl<AdminOssAuditLog>(this as AdminOssAuditLog, _$identity);

  /// Serializes this AdminOssAuditLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminOssAuditLog&&(identical(other.id, id) || other.id == id)&&(identical(other.action, action) || other.action == action)&&(identical(other.operator, operator) || other.operator == operator)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,action,operator,detail,createdAt);

@override
String toString() {
  return 'AdminOssAuditLog(id: $id, action: $action, operator: $operator, detail: $detail, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AdminOssAuditLogCopyWith<$Res>  {
  factory $AdminOssAuditLogCopyWith(AdminOssAuditLog value, $Res Function(AdminOssAuditLog) _then) = _$AdminOssAuditLogCopyWithImpl;
@useResult
$Res call({
 String id, String action, String operator, String detail,@JsonKey(fromJson: _parseDateDefault0) DateTime createdAt
});




}
/// @nodoc
class _$AdminOssAuditLogCopyWithImpl<$Res>
    implements $AdminOssAuditLogCopyWith<$Res> {
  _$AdminOssAuditLogCopyWithImpl(this._self, this._then);

  final AdminOssAuditLog _self;
  final $Res Function(AdminOssAuditLog) _then;

/// Create a copy of AdminOssAuditLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? action = null,Object? operator = null,Object? detail = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,operator: null == operator ? _self.operator : operator // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminOssAuditLog].
extension AdminOssAuditLogPatterns on AdminOssAuditLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminOssAuditLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminOssAuditLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminOssAuditLog value)  $default,){
final _that = this;
switch (_that) {
case _AdminOssAuditLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminOssAuditLog value)?  $default,){
final _that = this;
switch (_that) {
case _AdminOssAuditLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String action,  String operator,  String detail, @JsonKey(fromJson: _parseDateDefault0)  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminOssAuditLog() when $default != null:
return $default(_that.id,_that.action,_that.operator,_that.detail,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String action,  String operator,  String detail, @JsonKey(fromJson: _parseDateDefault0)  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _AdminOssAuditLog():
return $default(_that.id,_that.action,_that.operator,_that.detail,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String action,  String operator,  String detail, @JsonKey(fromJson: _parseDateDefault0)  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AdminOssAuditLog() when $default != null:
return $default(_that.id,_that.action,_that.operator,_that.detail,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminOssAuditLog extends AdminOssAuditLog {
  const _AdminOssAuditLog({this.id = '', this.action = '', this.operator = '', this.detail = '', @JsonKey(fromJson: _parseDateDefault0) required this.createdAt}): super._();
  factory _AdminOssAuditLog.fromJson(Map<String, dynamic> json) => _$AdminOssAuditLogFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String action;
@override@JsonKey() final  String operator;
@override@JsonKey() final  String detail;
@override@JsonKey(fromJson: _parseDateDefault0) final  DateTime createdAt;

/// Create a copy of AdminOssAuditLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminOssAuditLogCopyWith<_AdminOssAuditLog> get copyWith => __$AdminOssAuditLogCopyWithImpl<_AdminOssAuditLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminOssAuditLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminOssAuditLog&&(identical(other.id, id) || other.id == id)&&(identical(other.action, action) || other.action == action)&&(identical(other.operator, operator) || other.operator == operator)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,action,operator,detail,createdAt);

@override
String toString() {
  return 'AdminOssAuditLog(id: $id, action: $action, operator: $operator, detail: $detail, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AdminOssAuditLogCopyWith<$Res> implements $AdminOssAuditLogCopyWith<$Res> {
  factory _$AdminOssAuditLogCopyWith(_AdminOssAuditLog value, $Res Function(_AdminOssAuditLog) _then) = __$AdminOssAuditLogCopyWithImpl;
@override @useResult
$Res call({
 String id, String action, String operator, String detail,@JsonKey(fromJson: _parseDateDefault0) DateTime createdAt
});




}
/// @nodoc
class __$AdminOssAuditLogCopyWithImpl<$Res>
    implements _$AdminOssAuditLogCopyWith<$Res> {
  __$AdminOssAuditLogCopyWithImpl(this._self, this._then);

  final _AdminOssAuditLog _self;
  final $Res Function(_AdminOssAuditLog) _then;

/// Create a copy of AdminOssAuditLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? action = null,Object? operator = null,Object? detail = null,Object? createdAt = null,}) {
  return _then(_AdminOssAuditLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,operator: null == operator ? _self.operator : operator // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
