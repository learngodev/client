// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_api_requests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetUploadUrlPayload {

 String get fileName; String get fileType; int get size;
/// Create a copy of GetUploadUrlPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetUploadUrlPayloadCopyWith<GetUploadUrlPayload> get copyWith => _$GetUploadUrlPayloadCopyWithImpl<GetUploadUrlPayload>(this as GetUploadUrlPayload, _$identity);

  /// Serializes this GetUploadUrlPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetUploadUrlPayload&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileType, fileType) || other.fileType == fileType)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileName,fileType,size);

@override
String toString() {
  return 'GetUploadUrlPayload(fileName: $fileName, fileType: $fileType, size: $size)';
}


}

/// @nodoc
abstract mixin class $GetUploadUrlPayloadCopyWith<$Res>  {
  factory $GetUploadUrlPayloadCopyWith(GetUploadUrlPayload value, $Res Function(GetUploadUrlPayload) _then) = _$GetUploadUrlPayloadCopyWithImpl;
@useResult
$Res call({
 String fileName, String fileType, int size
});




}
/// @nodoc
class _$GetUploadUrlPayloadCopyWithImpl<$Res>
    implements $GetUploadUrlPayloadCopyWith<$Res> {
  _$GetUploadUrlPayloadCopyWithImpl(this._self, this._then);

  final GetUploadUrlPayload _self;
  final $Res Function(GetUploadUrlPayload) _then;

/// Create a copy of GetUploadUrlPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileName = null,Object? fileType = null,Object? size = null,}) {
  return _then(_self.copyWith(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileType: null == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GetUploadUrlPayload].
extension GetUploadUrlPayloadPatterns on GetUploadUrlPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetUploadUrlPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetUploadUrlPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetUploadUrlPayload value)  $default,){
final _that = this;
switch (_that) {
case _GetUploadUrlPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetUploadUrlPayload value)?  $default,){
final _that = this;
switch (_that) {
case _GetUploadUrlPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fileName,  String fileType,  int size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetUploadUrlPayload() when $default != null:
return $default(_that.fileName,_that.fileType,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fileName,  String fileType,  int size)  $default,) {final _that = this;
switch (_that) {
case _GetUploadUrlPayload():
return $default(_that.fileName,_that.fileType,_that.size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fileName,  String fileType,  int size)?  $default,) {final _that = this;
switch (_that) {
case _GetUploadUrlPayload() when $default != null:
return $default(_that.fileName,_that.fileType,_that.size);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetUploadUrlPayload implements GetUploadUrlPayload {
  const _GetUploadUrlPayload({required this.fileName, required this.fileType, required this.size});
  factory _GetUploadUrlPayload.fromJson(Map<String, dynamic> json) => _$GetUploadUrlPayloadFromJson(json);

@override final  String fileName;
@override final  String fileType;
@override final  int size;

/// Create a copy of GetUploadUrlPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetUploadUrlPayloadCopyWith<_GetUploadUrlPayload> get copyWith => __$GetUploadUrlPayloadCopyWithImpl<_GetUploadUrlPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetUploadUrlPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetUploadUrlPayload&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileType, fileType) || other.fileType == fileType)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileName,fileType,size);

@override
String toString() {
  return 'GetUploadUrlPayload(fileName: $fileName, fileType: $fileType, size: $size)';
}


}

/// @nodoc
abstract mixin class _$GetUploadUrlPayloadCopyWith<$Res> implements $GetUploadUrlPayloadCopyWith<$Res> {
  factory _$GetUploadUrlPayloadCopyWith(_GetUploadUrlPayload value, $Res Function(_GetUploadUrlPayload) _then) = __$GetUploadUrlPayloadCopyWithImpl;
@override @useResult
$Res call({
 String fileName, String fileType, int size
});




}
/// @nodoc
class __$GetUploadUrlPayloadCopyWithImpl<$Res>
    implements _$GetUploadUrlPayloadCopyWith<$Res> {
  __$GetUploadUrlPayloadCopyWithImpl(this._self, this._then);

  final _GetUploadUrlPayload _self;
  final $Res Function(_GetUploadUrlPayload) _then;

/// Create a copy of GetUploadUrlPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileName = null,Object? fileType = null,Object? size = null,}) {
  return _then(_GetUploadUrlPayload(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileType: null == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DownloadUrlResult {

 String get url;
/// Create a copy of DownloadUrlResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadUrlResultCopyWith<DownloadUrlResult> get copyWith => _$DownloadUrlResultCopyWithImpl<DownloadUrlResult>(this as DownloadUrlResult, _$identity);

  /// Serializes this DownloadUrlResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadUrlResult&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'DownloadUrlResult(url: $url)';
}


}

/// @nodoc
abstract mixin class $DownloadUrlResultCopyWith<$Res>  {
  factory $DownloadUrlResultCopyWith(DownloadUrlResult value, $Res Function(DownloadUrlResult) _then) = _$DownloadUrlResultCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$DownloadUrlResultCopyWithImpl<$Res>
    implements $DownloadUrlResultCopyWith<$Res> {
  _$DownloadUrlResultCopyWithImpl(this._self, this._then);

  final DownloadUrlResult _self;
  final $Res Function(DownloadUrlResult) _then;

/// Create a copy of DownloadUrlResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DownloadUrlResult].
extension DownloadUrlResultPatterns on DownloadUrlResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DownloadUrlResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownloadUrlResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DownloadUrlResult value)  $default,){
final _that = this;
switch (_that) {
case _DownloadUrlResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DownloadUrlResult value)?  $default,){
final _that = this;
switch (_that) {
case _DownloadUrlResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownloadUrlResult() when $default != null:
return $default(_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url)  $default,) {final _that = this;
switch (_that) {
case _DownloadUrlResult():
return $default(_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url)?  $default,) {final _that = this;
switch (_that) {
case _DownloadUrlResult() when $default != null:
return $default(_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DownloadUrlResult implements DownloadUrlResult {
  const _DownloadUrlResult({required this.url});
  factory _DownloadUrlResult.fromJson(Map<String, dynamic> json) => _$DownloadUrlResultFromJson(json);

@override final  String url;

/// Create a copy of DownloadUrlResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadUrlResultCopyWith<_DownloadUrlResult> get copyWith => __$DownloadUrlResultCopyWithImpl<_DownloadUrlResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DownloadUrlResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadUrlResult&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'DownloadUrlResult(url: $url)';
}


}

/// @nodoc
abstract mixin class _$DownloadUrlResultCopyWith<$Res> implements $DownloadUrlResultCopyWith<$Res> {
  factory _$DownloadUrlResultCopyWith(_DownloadUrlResult value, $Res Function(_DownloadUrlResult) _then) = __$DownloadUrlResultCopyWithImpl;
@override @useResult
$Res call({
 String url
});




}
/// @nodoc
class __$DownloadUrlResultCopyWithImpl<$Res>
    implements _$DownloadUrlResultCopyWith<$Res> {
  __$DownloadUrlResultCopyWithImpl(this._self, this._then);

  final _DownloadUrlResult _self;
  final $Res Function(_DownloadUrlResult) _then;

/// Create a copy of DownloadUrlResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(_DownloadUrlResult(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$RelayUploadFilePayload {

 File get file; String? get fileId; String get fileName; String get fileType;
/// Create a copy of RelayUploadFilePayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RelayUploadFilePayloadCopyWith<RelayUploadFilePayload> get copyWith => _$RelayUploadFilePayloadCopyWithImpl<RelayUploadFilePayload>(this as RelayUploadFilePayload, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RelayUploadFilePayload&&(identical(other.file, file) || other.file == file)&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileType, fileType) || other.fileType == fileType));
}


@override
int get hashCode => Object.hash(runtimeType,file,fileId,fileName,fileType);

@override
String toString() {
  return 'RelayUploadFilePayload(file: $file, fileId: $fileId, fileName: $fileName, fileType: $fileType)';
}


}

/// @nodoc
abstract mixin class $RelayUploadFilePayloadCopyWith<$Res>  {
  factory $RelayUploadFilePayloadCopyWith(RelayUploadFilePayload value, $Res Function(RelayUploadFilePayload) _then) = _$RelayUploadFilePayloadCopyWithImpl;
@useResult
$Res call({
 File file, String? fileId, String fileName, String fileType
});




}
/// @nodoc
class _$RelayUploadFilePayloadCopyWithImpl<$Res>
    implements $RelayUploadFilePayloadCopyWith<$Res> {
  _$RelayUploadFilePayloadCopyWithImpl(this._self, this._then);

  final RelayUploadFilePayload _self;
  final $Res Function(RelayUploadFilePayload) _then;

/// Create a copy of RelayUploadFilePayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? file = null,Object? fileId = freezed,Object? fileName = null,Object? fileType = null,}) {
  return _then(_self.copyWith(
file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,fileId: freezed == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String?,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileType: null == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RelayUploadFilePayload].
extension RelayUploadFilePayloadPatterns on RelayUploadFilePayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RelayUploadFilePayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RelayUploadFilePayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RelayUploadFilePayload value)  $default,){
final _that = this;
switch (_that) {
case _RelayUploadFilePayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RelayUploadFilePayload value)?  $default,){
final _that = this;
switch (_that) {
case _RelayUploadFilePayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( File file,  String? fileId,  String fileName,  String fileType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RelayUploadFilePayload() when $default != null:
return $default(_that.file,_that.fileId,_that.fileName,_that.fileType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( File file,  String? fileId,  String fileName,  String fileType)  $default,) {final _that = this;
switch (_that) {
case _RelayUploadFilePayload():
return $default(_that.file,_that.fileId,_that.fileName,_that.fileType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( File file,  String? fileId,  String fileName,  String fileType)?  $default,) {final _that = this;
switch (_that) {
case _RelayUploadFilePayload() when $default != null:
return $default(_that.file,_that.fileId,_that.fileName,_that.fileType);case _:
  return null;

}
}

}

/// @nodoc


class _RelayUploadFilePayload implements RelayUploadFilePayload {
  const _RelayUploadFilePayload({required this.file, this.fileId, required this.fileName, required this.fileType});
  

@override final  File file;
@override final  String? fileId;
@override final  String fileName;
@override final  String fileType;

/// Create a copy of RelayUploadFilePayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RelayUploadFilePayloadCopyWith<_RelayUploadFilePayload> get copyWith => __$RelayUploadFilePayloadCopyWithImpl<_RelayUploadFilePayload>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RelayUploadFilePayload&&(identical(other.file, file) || other.file == file)&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileType, fileType) || other.fileType == fileType));
}


@override
int get hashCode => Object.hash(runtimeType,file,fileId,fileName,fileType);

@override
String toString() {
  return 'RelayUploadFilePayload(file: $file, fileId: $fileId, fileName: $fileName, fileType: $fileType)';
}


}

/// @nodoc
abstract mixin class _$RelayUploadFilePayloadCopyWith<$Res> implements $RelayUploadFilePayloadCopyWith<$Res> {
  factory _$RelayUploadFilePayloadCopyWith(_RelayUploadFilePayload value, $Res Function(_RelayUploadFilePayload) _then) = __$RelayUploadFilePayloadCopyWithImpl;
@override @useResult
$Res call({
 File file, String? fileId, String fileName, String fileType
});




}
/// @nodoc
class __$RelayUploadFilePayloadCopyWithImpl<$Res>
    implements _$RelayUploadFilePayloadCopyWith<$Res> {
  __$RelayUploadFilePayloadCopyWithImpl(this._self, this._then);

  final _RelayUploadFilePayload _self;
  final $Res Function(_RelayUploadFilePayload) _then;

/// Create a copy of RelayUploadFilePayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? file = null,Object? fileId = freezed,Object? fileName = null,Object? fileType = null,}) {
  return _then(_RelayUploadFilePayload(
file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,fileId: freezed == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String?,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileType: null == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
