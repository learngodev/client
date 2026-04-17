// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Resource {

 String get id; String get title; String get description; String? get departmentId; String get departmentName; String get gradeLevel; String get teacherId; String get teacherName; List<String> get tags; int get fileCount; int get favoriteCount; int get viewCount; int get downloadCount; bool get isFavorited; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceCopyWith<Resource> get copyWith => _$ResourceCopyWithImpl<Resource>(this as Resource, _$identity);

  /// Serializes this Resource to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Resource&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.departmentName, departmentName) || other.departmentName == departmentName)&&(identical(other.gradeLevel, gradeLevel) || other.gradeLevel == gradeLevel)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.fileCount, fileCount) || other.fileCount == fileCount)&&(identical(other.favoriteCount, favoriteCount) || other.favoriteCount == favoriteCount)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,departmentId,departmentName,gradeLevel,teacherId,teacherName,const DeepCollectionEquality().hash(tags),fileCount,favoriteCount,viewCount,downloadCount,isFavorited,createdAt,updatedAt);

@override
String toString() {
  return 'Resource(id: $id, title: $title, description: $description, departmentId: $departmentId, departmentName: $departmentName, gradeLevel: $gradeLevel, teacherId: $teacherId, teacherName: $teacherName, tags: $tags, fileCount: $fileCount, favoriteCount: $favoriteCount, viewCount: $viewCount, downloadCount: $downloadCount, isFavorited: $isFavorited, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ResourceCopyWith<$Res>  {
  factory $ResourceCopyWith(Resource value, $Res Function(Resource) _then) = _$ResourceCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, String? departmentId, String departmentName, String gradeLevel, String teacherId, String teacherName, List<String> tags, int fileCount, int favoriteCount, int viewCount, int downloadCount, bool isFavorited, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$ResourceCopyWithImpl<$Res>
    implements $ResourceCopyWith<$Res> {
  _$ResourceCopyWithImpl(this._self, this._then);

  final Resource _self;
  final $Res Function(Resource) _then;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? departmentId = freezed,Object? departmentName = null,Object? gradeLevel = null,Object? teacherId = null,Object? teacherName = null,Object? tags = null,Object? fileCount = null,Object? favoriteCount = null,Object? viewCount = null,Object? downloadCount = null,Object? isFavorited = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,departmentName: null == departmentName ? _self.departmentName : departmentName // ignore: cast_nullable_to_non_nullable
as String,gradeLevel: null == gradeLevel ? _self.gradeLevel : gradeLevel // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,teacherName: null == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,fileCount: null == fileCount ? _self.fileCount : fileCount // ignore: cast_nullable_to_non_nullable
as int,favoriteCount: null == favoriteCount ? _self.favoriteCount : favoriteCount // ignore: cast_nullable_to_non_nullable
as int,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,downloadCount: null == downloadCount ? _self.downloadCount : downloadCount // ignore: cast_nullable_to_non_nullable
as int,isFavorited: null == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Resource].
extension ResourcePatterns on Resource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Resource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Resource() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Resource value)  $default,){
final _that = this;
switch (_that) {
case _Resource():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Resource value)?  $default,){
final _that = this;
switch (_that) {
case _Resource() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String? departmentId,  String departmentName,  String gradeLevel,  String teacherId,  String teacherName,  List<String> tags,  int fileCount,  int favoriteCount,  int viewCount,  int downloadCount,  bool isFavorited,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Resource() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.departmentId,_that.departmentName,_that.gradeLevel,_that.teacherId,_that.teacherName,_that.tags,_that.fileCount,_that.favoriteCount,_that.viewCount,_that.downloadCount,_that.isFavorited,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String? departmentId,  String departmentName,  String gradeLevel,  String teacherId,  String teacherName,  List<String> tags,  int fileCount,  int favoriteCount,  int viewCount,  int downloadCount,  bool isFavorited,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Resource():
return $default(_that.id,_that.title,_that.description,_that.departmentId,_that.departmentName,_that.gradeLevel,_that.teacherId,_that.teacherName,_that.tags,_that.fileCount,_that.favoriteCount,_that.viewCount,_that.downloadCount,_that.isFavorited,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  String? departmentId,  String departmentName,  String gradeLevel,  String teacherId,  String teacherName,  List<String> tags,  int fileCount,  int favoriteCount,  int viewCount,  int downloadCount,  bool isFavorited,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Resource() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.departmentId,_that.departmentName,_that.gradeLevel,_that.teacherId,_that.teacherName,_that.tags,_that.fileCount,_that.favoriteCount,_that.viewCount,_that.downloadCount,_that.isFavorited,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Resource implements Resource {
  const _Resource({this.id = '', this.title = '', this.description = '', this.departmentId, this.departmentName = '', this.gradeLevel = '', this.teacherId = '', this.teacherName = '', final  List<String> tags = const [], this.fileCount = 0, this.favoriteCount = 0, this.viewCount = 0, this.downloadCount = 0, this.isFavorited = false, this.createdAt, this.updatedAt}): _tags = tags;
  factory _Resource.fromJson(Map<String, dynamic> json) => _$ResourceFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override final  String? departmentId;
@override@JsonKey() final  String departmentName;
@override@JsonKey() final  String gradeLevel;
@override@JsonKey() final  String teacherId;
@override@JsonKey() final  String teacherName;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  int fileCount;
@override@JsonKey() final  int favoriteCount;
@override@JsonKey() final  int viewCount;
@override@JsonKey() final  int downloadCount;
@override@JsonKey() final  bool isFavorited;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceCopyWith<_Resource> get copyWith => __$ResourceCopyWithImpl<_Resource>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResourceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resource&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.departmentName, departmentName) || other.departmentName == departmentName)&&(identical(other.gradeLevel, gradeLevel) || other.gradeLevel == gradeLevel)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.fileCount, fileCount) || other.fileCount == fileCount)&&(identical(other.favoriteCount, favoriteCount) || other.favoriteCount == favoriteCount)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,departmentId,departmentName,gradeLevel,teacherId,teacherName,const DeepCollectionEquality().hash(_tags),fileCount,favoriteCount,viewCount,downloadCount,isFavorited,createdAt,updatedAt);

@override
String toString() {
  return 'Resource(id: $id, title: $title, description: $description, departmentId: $departmentId, departmentName: $departmentName, gradeLevel: $gradeLevel, teacherId: $teacherId, teacherName: $teacherName, tags: $tags, fileCount: $fileCount, favoriteCount: $favoriteCount, viewCount: $viewCount, downloadCount: $downloadCount, isFavorited: $isFavorited, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ResourceCopyWith<$Res> implements $ResourceCopyWith<$Res> {
  factory _$ResourceCopyWith(_Resource value, $Res Function(_Resource) _then) = __$ResourceCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, String? departmentId, String departmentName, String gradeLevel, String teacherId, String teacherName, List<String> tags, int fileCount, int favoriteCount, int viewCount, int downloadCount, bool isFavorited, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$ResourceCopyWithImpl<$Res>
    implements _$ResourceCopyWith<$Res> {
  __$ResourceCopyWithImpl(this._self, this._then);

  final _Resource _self;
  final $Res Function(_Resource) _then;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? departmentId = freezed,Object? departmentName = null,Object? gradeLevel = null,Object? teacherId = null,Object? teacherName = null,Object? tags = null,Object? fileCount = null,Object? favoriteCount = null,Object? viewCount = null,Object? downloadCount = null,Object? isFavorited = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Resource(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,departmentName: null == departmentName ? _self.departmentName : departmentName // ignore: cast_nullable_to_non_nullable
as String,gradeLevel: null == gradeLevel ? _self.gradeLevel : gradeLevel // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,teacherName: null == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,fileCount: null == fileCount ? _self.fileCount : fileCount // ignore: cast_nullable_to_non_nullable
as int,favoriteCount: null == favoriteCount ? _self.favoriteCount : favoriteCount // ignore: cast_nullable_to_non_nullable
as int,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,downloadCount: null == downloadCount ? _self.downloadCount : downloadCount // ignore: cast_nullable_to_non_nullable
as int,isFavorited: null == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ResourceFile {

 String get id; String get name; String get fileType; int get size; String get url; DateTime? get uploadedAt;
/// Create a copy of ResourceFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceFileCopyWith<ResourceFile> get copyWith => _$ResourceFileCopyWithImpl<ResourceFile>(this as ResourceFile, _$identity);

  /// Serializes this ResourceFile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceFile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.fileType, fileType) || other.fileType == fileType)&&(identical(other.size, size) || other.size == size)&&(identical(other.url, url) || other.url == url)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,fileType,size,url,uploadedAt);

@override
String toString() {
  return 'ResourceFile(id: $id, name: $name, fileType: $fileType, size: $size, url: $url, uploadedAt: $uploadedAt)';
}


}

/// @nodoc
abstract mixin class $ResourceFileCopyWith<$Res>  {
  factory $ResourceFileCopyWith(ResourceFile value, $Res Function(ResourceFile) _then) = _$ResourceFileCopyWithImpl;
@useResult
$Res call({
 String id, String name, String fileType, int size, String url, DateTime? uploadedAt
});




}
/// @nodoc
class _$ResourceFileCopyWithImpl<$Res>
    implements $ResourceFileCopyWith<$Res> {
  _$ResourceFileCopyWithImpl(this._self, this._then);

  final ResourceFile _self;
  final $Res Function(ResourceFile) _then;

/// Create a copy of ResourceFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? fileType = null,Object? size = null,Object? url = null,Object? uploadedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fileType: null == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: freezed == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResourceFile].
extension ResourceFilePatterns on ResourceFile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResourceFile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResourceFile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResourceFile value)  $default,){
final _that = this;
switch (_that) {
case _ResourceFile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResourceFile value)?  $default,){
final _that = this;
switch (_that) {
case _ResourceFile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String fileType,  int size,  String url,  DateTime? uploadedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResourceFile() when $default != null:
return $default(_that.id,_that.name,_that.fileType,_that.size,_that.url,_that.uploadedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String fileType,  int size,  String url,  DateTime? uploadedAt)  $default,) {final _that = this;
switch (_that) {
case _ResourceFile():
return $default(_that.id,_that.name,_that.fileType,_that.size,_that.url,_that.uploadedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String fileType,  int size,  String url,  DateTime? uploadedAt)?  $default,) {final _that = this;
switch (_that) {
case _ResourceFile() when $default != null:
return $default(_that.id,_that.name,_that.fileType,_that.size,_that.url,_that.uploadedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResourceFile implements ResourceFile {
  const _ResourceFile({this.id = '', this.name = '', this.fileType = '', this.size = 0, this.url = '', this.uploadedAt});
  factory _ResourceFile.fromJson(Map<String, dynamic> json) => _$ResourceFileFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String fileType;
@override@JsonKey() final  int size;
@override@JsonKey() final  String url;
@override final  DateTime? uploadedAt;

/// Create a copy of ResourceFile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceFileCopyWith<_ResourceFile> get copyWith => __$ResourceFileCopyWithImpl<_ResourceFile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResourceFileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResourceFile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.fileType, fileType) || other.fileType == fileType)&&(identical(other.size, size) || other.size == size)&&(identical(other.url, url) || other.url == url)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,fileType,size,url,uploadedAt);

@override
String toString() {
  return 'ResourceFile(id: $id, name: $name, fileType: $fileType, size: $size, url: $url, uploadedAt: $uploadedAt)';
}


}

/// @nodoc
abstract mixin class _$ResourceFileCopyWith<$Res> implements $ResourceFileCopyWith<$Res> {
  factory _$ResourceFileCopyWith(_ResourceFile value, $Res Function(_ResourceFile) _then) = __$ResourceFileCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String fileType, int size, String url, DateTime? uploadedAt
});




}
/// @nodoc
class __$ResourceFileCopyWithImpl<$Res>
    implements _$ResourceFileCopyWith<$Res> {
  __$ResourceFileCopyWithImpl(this._self, this._then);

  final _ResourceFile _self;
  final $Res Function(_ResourceFile) _then;

/// Create a copy of ResourceFile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? fileType = null,Object? size = null,Object? url = null,Object? uploadedAt = freezed,}) {
  return _then(_ResourceFile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fileType: null == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: freezed == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ResourceDetail {

 Resource get resource; List<ResourceFile> get files;
/// Create a copy of ResourceDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceDetailCopyWith<ResourceDetail> get copyWith => _$ResourceDetailCopyWithImpl<ResourceDetail>(this as ResourceDetail, _$identity);

  /// Serializes this ResourceDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceDetail&&(identical(other.resource, resource) || other.resource == resource)&&const DeepCollectionEquality().equals(other.files, files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resource,const DeepCollectionEquality().hash(files));

@override
String toString() {
  return 'ResourceDetail(resource: $resource, files: $files)';
}


}

/// @nodoc
abstract mixin class $ResourceDetailCopyWith<$Res>  {
  factory $ResourceDetailCopyWith(ResourceDetail value, $Res Function(ResourceDetail) _then) = _$ResourceDetailCopyWithImpl;
@useResult
$Res call({
 Resource resource, List<ResourceFile> files
});


$ResourceCopyWith<$Res> get resource;

}
/// @nodoc
class _$ResourceDetailCopyWithImpl<$Res>
    implements $ResourceDetailCopyWith<$Res> {
  _$ResourceDetailCopyWithImpl(this._self, this._then);

  final ResourceDetail _self;
  final $Res Function(ResourceDetail) _then;

/// Create a copy of ResourceDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resource = null,Object? files = null,}) {
  return _then(_self.copyWith(
resource: null == resource ? _self.resource : resource // ignore: cast_nullable_to_non_nullable
as Resource,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<ResourceFile>,
  ));
}
/// Create a copy of ResourceDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceCopyWith<$Res> get resource {
  
  return $ResourceCopyWith<$Res>(_self.resource, (value) {
    return _then(_self.copyWith(resource: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResourceDetail].
extension ResourceDetailPatterns on ResourceDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResourceDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResourceDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResourceDetail value)  $default,){
final _that = this;
switch (_that) {
case _ResourceDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResourceDetail value)?  $default,){
final _that = this;
switch (_that) {
case _ResourceDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Resource resource,  List<ResourceFile> files)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResourceDetail() when $default != null:
return $default(_that.resource,_that.files);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Resource resource,  List<ResourceFile> files)  $default,) {final _that = this;
switch (_that) {
case _ResourceDetail():
return $default(_that.resource,_that.files);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Resource resource,  List<ResourceFile> files)?  $default,) {final _that = this;
switch (_that) {
case _ResourceDetail() when $default != null:
return $default(_that.resource,_that.files);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResourceDetail implements ResourceDetail {
  const _ResourceDetail({required this.resource, final  List<ResourceFile> files = const []}): _files = files;
  factory _ResourceDetail.fromJson(Map<String, dynamic> json) => _$ResourceDetailFromJson(json);

@override final  Resource resource;
 final  List<ResourceFile> _files;
@override@JsonKey() List<ResourceFile> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}


/// Create a copy of ResourceDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceDetailCopyWith<_ResourceDetail> get copyWith => __$ResourceDetailCopyWithImpl<_ResourceDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResourceDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResourceDetail&&(identical(other.resource, resource) || other.resource == resource)&&const DeepCollectionEquality().equals(other._files, _files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resource,const DeepCollectionEquality().hash(_files));

@override
String toString() {
  return 'ResourceDetail(resource: $resource, files: $files)';
}


}

/// @nodoc
abstract mixin class _$ResourceDetailCopyWith<$Res> implements $ResourceDetailCopyWith<$Res> {
  factory _$ResourceDetailCopyWith(_ResourceDetail value, $Res Function(_ResourceDetail) _then) = __$ResourceDetailCopyWithImpl;
@override @useResult
$Res call({
 Resource resource, List<ResourceFile> files
});


@override $ResourceCopyWith<$Res> get resource;

}
/// @nodoc
class __$ResourceDetailCopyWithImpl<$Res>
    implements _$ResourceDetailCopyWith<$Res> {
  __$ResourceDetailCopyWithImpl(this._self, this._then);

  final _ResourceDetail _self;
  final $Res Function(_ResourceDetail) _then;

/// Create a copy of ResourceDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resource = null,Object? files = null,}) {
  return _then(_ResourceDetail(
resource: null == resource ? _self.resource : resource // ignore: cast_nullable_to_non_nullable
as Resource,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<ResourceFile>,
  ));
}

/// Create a copy of ResourceDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceCopyWith<$Res> get resource {
  
  return $ResourceCopyWith<$Res>(_self.resource, (value) {
    return _then(_self.copyWith(resource: value));
  });
}
}


/// @nodoc
mixin _$ResourceListResult {

 List<Resource> get items; int get total; int get page; int get size;
/// Create a copy of ResourceListResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceListResultCopyWith<ResourceListResult> get copyWith => _$ResourceListResultCopyWithImpl<ResourceListResult>(this as ResourceListResult, _$identity);

  /// Serializes this ResourceListResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceListResult&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total,page,size);

@override
String toString() {
  return 'ResourceListResult(items: $items, total: $total, page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class $ResourceListResultCopyWith<$Res>  {
  factory $ResourceListResultCopyWith(ResourceListResult value, $Res Function(ResourceListResult) _then) = _$ResourceListResultCopyWithImpl;
@useResult
$Res call({
 List<Resource> items, int total, int page, int size
});




}
/// @nodoc
class _$ResourceListResultCopyWithImpl<$Res>
    implements $ResourceListResultCopyWith<$Res> {
  _$ResourceListResultCopyWithImpl(this._self, this._then);

  final ResourceListResult _self;
  final $Res Function(ResourceListResult) _then;

/// Create a copy of ResourceListResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = null,Object? page = null,Object? size = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Resource>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ResourceListResult].
extension ResourceListResultPatterns on ResourceListResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResourceListResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResourceListResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResourceListResult value)  $default,){
final _that = this;
switch (_that) {
case _ResourceListResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResourceListResult value)?  $default,){
final _that = this;
switch (_that) {
case _ResourceListResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Resource> items,  int total,  int page,  int size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResourceListResult() when $default != null:
return $default(_that.items,_that.total,_that.page,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Resource> items,  int total,  int page,  int size)  $default,) {final _that = this;
switch (_that) {
case _ResourceListResult():
return $default(_that.items,_that.total,_that.page,_that.size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Resource> items,  int total,  int page,  int size)?  $default,) {final _that = this;
switch (_that) {
case _ResourceListResult() when $default != null:
return $default(_that.items,_that.total,_that.page,_that.size);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResourceListResult implements ResourceListResult {
  const _ResourceListResult({final  List<Resource> items = const [], this.total = 0, this.page = 1, this.size = 20}): _items = items;
  factory _ResourceListResult.fromJson(Map<String, dynamic> json) => _$ResourceListResultFromJson(json);

 final  List<Resource> _items;
@override@JsonKey() List<Resource> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  int page;
@override@JsonKey() final  int size;

/// Create a copy of ResourceListResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceListResultCopyWith<_ResourceListResult> get copyWith => __$ResourceListResultCopyWithImpl<_ResourceListResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResourceListResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResourceListResult&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total,page,size);

@override
String toString() {
  return 'ResourceListResult(items: $items, total: $total, page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class _$ResourceListResultCopyWith<$Res> implements $ResourceListResultCopyWith<$Res> {
  factory _$ResourceListResultCopyWith(_ResourceListResult value, $Res Function(_ResourceListResult) _then) = __$ResourceListResultCopyWithImpl;
@override @useResult
$Res call({
 List<Resource> items, int total, int page, int size
});




}
/// @nodoc
class __$ResourceListResultCopyWithImpl<$Res>
    implements _$ResourceListResultCopyWith<$Res> {
  __$ResourceListResultCopyWithImpl(this._self, this._then);

  final _ResourceListResult _self;
  final $Res Function(_ResourceListResult) _then;

/// Create a copy of ResourceListResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,Object? page = null,Object? size = null,}) {
  return _then(_ResourceListResult(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Resource>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CreateResourceParams {

 String get title; String get description; String? get departmentId; String get gradeLevel; List<String> get tags; List<String> get fileIds;
/// Create a copy of CreateResourceParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateResourceParamsCopyWith<CreateResourceParams> get copyWith => _$CreateResourceParamsCopyWithImpl<CreateResourceParams>(this as CreateResourceParams, _$identity);

  /// Serializes this CreateResourceParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateResourceParams&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.gradeLevel, gradeLevel) || other.gradeLevel == gradeLevel)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.fileIds, fileIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,departmentId,gradeLevel,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(fileIds));

@override
String toString() {
  return 'CreateResourceParams(title: $title, description: $description, departmentId: $departmentId, gradeLevel: $gradeLevel, tags: $tags, fileIds: $fileIds)';
}


}

/// @nodoc
abstract mixin class $CreateResourceParamsCopyWith<$Res>  {
  factory $CreateResourceParamsCopyWith(CreateResourceParams value, $Res Function(CreateResourceParams) _then) = _$CreateResourceParamsCopyWithImpl;
@useResult
$Res call({
 String title, String description, String? departmentId, String gradeLevel, List<String> tags, List<String> fileIds
});




}
/// @nodoc
class _$CreateResourceParamsCopyWithImpl<$Res>
    implements $CreateResourceParamsCopyWith<$Res> {
  _$CreateResourceParamsCopyWithImpl(this._self, this._then);

  final CreateResourceParams _self;
  final $Res Function(CreateResourceParams) _then;

/// Create a copy of CreateResourceParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? departmentId = freezed,Object? gradeLevel = null,Object? tags = null,Object? fileIds = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,gradeLevel: null == gradeLevel ? _self.gradeLevel : gradeLevel // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,fileIds: null == fileIds ? _self.fileIds : fileIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateResourceParams].
extension CreateResourceParamsPatterns on CreateResourceParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateResourceParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateResourceParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateResourceParams value)  $default,){
final _that = this;
switch (_that) {
case _CreateResourceParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateResourceParams value)?  $default,){
final _that = this;
switch (_that) {
case _CreateResourceParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  String? departmentId,  String gradeLevel,  List<String> tags,  List<String> fileIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateResourceParams() when $default != null:
return $default(_that.title,_that.description,_that.departmentId,_that.gradeLevel,_that.tags,_that.fileIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  String? departmentId,  String gradeLevel,  List<String> tags,  List<String> fileIds)  $default,) {final _that = this;
switch (_that) {
case _CreateResourceParams():
return $default(_that.title,_that.description,_that.departmentId,_that.gradeLevel,_that.tags,_that.fileIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  String? departmentId,  String gradeLevel,  List<String> tags,  List<String> fileIds)?  $default,) {final _that = this;
switch (_that) {
case _CreateResourceParams() when $default != null:
return $default(_that.title,_that.description,_that.departmentId,_that.gradeLevel,_that.tags,_that.fileIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateResourceParams implements CreateResourceParams {
  const _CreateResourceParams({required this.title, required this.description, this.departmentId, required this.gradeLevel, final  List<String> tags = const [], final  List<String> fileIds = const []}): _tags = tags,_fileIds = fileIds;
  factory _CreateResourceParams.fromJson(Map<String, dynamic> json) => _$CreateResourceParamsFromJson(json);

@override final  String title;
@override final  String description;
@override final  String? departmentId;
@override final  String gradeLevel;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<String> _fileIds;
@override@JsonKey() List<String> get fileIds {
  if (_fileIds is EqualUnmodifiableListView) return _fileIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fileIds);
}


/// Create a copy of CreateResourceParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateResourceParamsCopyWith<_CreateResourceParams> get copyWith => __$CreateResourceParamsCopyWithImpl<_CreateResourceParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateResourceParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateResourceParams&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.gradeLevel, gradeLevel) || other.gradeLevel == gradeLevel)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._fileIds, _fileIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,departmentId,gradeLevel,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_fileIds));

@override
String toString() {
  return 'CreateResourceParams(title: $title, description: $description, departmentId: $departmentId, gradeLevel: $gradeLevel, tags: $tags, fileIds: $fileIds)';
}


}

/// @nodoc
abstract mixin class _$CreateResourceParamsCopyWith<$Res> implements $CreateResourceParamsCopyWith<$Res> {
  factory _$CreateResourceParamsCopyWith(_CreateResourceParams value, $Res Function(_CreateResourceParams) _then) = __$CreateResourceParamsCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, String? departmentId, String gradeLevel, List<String> tags, List<String> fileIds
});




}
/// @nodoc
class __$CreateResourceParamsCopyWithImpl<$Res>
    implements _$CreateResourceParamsCopyWith<$Res> {
  __$CreateResourceParamsCopyWithImpl(this._self, this._then);

  final _CreateResourceParams _self;
  final $Res Function(_CreateResourceParams) _then;

/// Create a copy of CreateResourceParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? departmentId = freezed,Object? gradeLevel = null,Object? tags = null,Object? fileIds = null,}) {
  return _then(_CreateResourceParams(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,gradeLevel: null == gradeLevel ? _self.gradeLevel : gradeLevel // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,fileIds: null == fileIds ? _self._fileIds : fileIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$UpdateResourceParams {

 String? get title; String? get description; String? get departmentId; String? get gradeLevel; List<String>? get tags;
/// Create a copy of UpdateResourceParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateResourceParamsCopyWith<UpdateResourceParams> get copyWith => _$UpdateResourceParamsCopyWithImpl<UpdateResourceParams>(this as UpdateResourceParams, _$identity);

  /// Serializes this UpdateResourceParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateResourceParams&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.gradeLevel, gradeLevel) || other.gradeLevel == gradeLevel)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,departmentId,gradeLevel,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'UpdateResourceParams(title: $title, description: $description, departmentId: $departmentId, gradeLevel: $gradeLevel, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $UpdateResourceParamsCopyWith<$Res>  {
  factory $UpdateResourceParamsCopyWith(UpdateResourceParams value, $Res Function(UpdateResourceParams) _then) = _$UpdateResourceParamsCopyWithImpl;
@useResult
$Res call({
 String? title, String? description, String? departmentId, String? gradeLevel, List<String>? tags
});




}
/// @nodoc
class _$UpdateResourceParamsCopyWithImpl<$Res>
    implements $UpdateResourceParamsCopyWith<$Res> {
  _$UpdateResourceParamsCopyWithImpl(this._self, this._then);

  final UpdateResourceParams _self;
  final $Res Function(UpdateResourceParams) _then;

/// Create a copy of UpdateResourceParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? description = freezed,Object? departmentId = freezed,Object? gradeLevel = freezed,Object? tags = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,gradeLevel: freezed == gradeLevel ? _self.gradeLevel : gradeLevel // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateResourceParams].
extension UpdateResourceParamsPatterns on UpdateResourceParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateResourceParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateResourceParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateResourceParams value)  $default,){
final _that = this;
switch (_that) {
case _UpdateResourceParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateResourceParams value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateResourceParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  String? description,  String? departmentId,  String? gradeLevel,  List<String>? tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateResourceParams() when $default != null:
return $default(_that.title,_that.description,_that.departmentId,_that.gradeLevel,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  String? description,  String? departmentId,  String? gradeLevel,  List<String>? tags)  $default,) {final _that = this;
switch (_that) {
case _UpdateResourceParams():
return $default(_that.title,_that.description,_that.departmentId,_that.gradeLevel,_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  String? description,  String? departmentId,  String? gradeLevel,  List<String>? tags)?  $default,) {final _that = this;
switch (_that) {
case _UpdateResourceParams() when $default != null:
return $default(_that.title,_that.description,_that.departmentId,_that.gradeLevel,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateResourceParams implements UpdateResourceParams {
  const _UpdateResourceParams({this.title, this.description, this.departmentId, this.gradeLevel, final  List<String>? tags}): _tags = tags;
  factory _UpdateResourceParams.fromJson(Map<String, dynamic> json) => _$UpdateResourceParamsFromJson(json);

@override final  String? title;
@override final  String? description;
@override final  String? departmentId;
@override final  String? gradeLevel;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UpdateResourceParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateResourceParamsCopyWith<_UpdateResourceParams> get copyWith => __$UpdateResourceParamsCopyWithImpl<_UpdateResourceParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateResourceParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateResourceParams&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.gradeLevel, gradeLevel) || other.gradeLevel == gradeLevel)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,departmentId,gradeLevel,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'UpdateResourceParams(title: $title, description: $description, departmentId: $departmentId, gradeLevel: $gradeLevel, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$UpdateResourceParamsCopyWith<$Res> implements $UpdateResourceParamsCopyWith<$Res> {
  factory _$UpdateResourceParamsCopyWith(_UpdateResourceParams value, $Res Function(_UpdateResourceParams) _then) = __$UpdateResourceParamsCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? description, String? departmentId, String? gradeLevel, List<String>? tags
});




}
/// @nodoc
class __$UpdateResourceParamsCopyWithImpl<$Res>
    implements _$UpdateResourceParamsCopyWith<$Res> {
  __$UpdateResourceParamsCopyWithImpl(this._self, this._then);

  final _UpdateResourceParams _self;
  final $Res Function(_UpdateResourceParams) _then;

/// Create a copy of UpdateResourceParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? description = freezed,Object? departmentId = freezed,Object? gradeLevel = freezed,Object? tags = freezed,}) {
  return _then(_UpdateResourceParams(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,gradeLevel: freezed == gradeLevel ? _self.gradeLevel : gradeLevel // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
