// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_chapter_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CourseChapterSummary implements DiagnosticableTreeMixin {

 String get id; String get courseId; String get teacherId; String get title; int get orderIndex; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of CourseChapterSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseChapterSummaryCopyWith<CourseChapterSummary> get copyWith => _$CourseChapterSummaryCopyWithImpl<CourseChapterSummary>(this as CourseChapterSummary, _$identity);

  /// Serializes this CourseChapterSummary to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CourseChapterSummary'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('courseId', courseId))..add(DiagnosticsProperty('teacherId', teacherId))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('orderIndex', orderIndex))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseChapterSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.title, title) || other.title == title)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseId,teacherId,title,orderIndex,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CourseChapterSummary(id: $id, courseId: $courseId, teacherId: $teacherId, title: $title, orderIndex: $orderIndex, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CourseChapterSummaryCopyWith<$Res>  {
  factory $CourseChapterSummaryCopyWith(CourseChapterSummary value, $Res Function(CourseChapterSummary) _then) = _$CourseChapterSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String courseId, String teacherId, String title, int orderIndex, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$CourseChapterSummaryCopyWithImpl<$Res>
    implements $CourseChapterSummaryCopyWith<$Res> {
  _$CourseChapterSummaryCopyWithImpl(this._self, this._then);

  final CourseChapterSummary _self;
  final $Res Function(CourseChapterSummary) _then;

/// Create a copy of CourseChapterSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? courseId = null,Object? teacherId = null,Object? title = null,Object? orderIndex = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseChapterSummary].
extension CourseChapterSummaryPatterns on CourseChapterSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseChapterSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseChapterSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseChapterSummary value)  $default,){
final _that = this;
switch (_that) {
case _CourseChapterSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseChapterSummary value)?  $default,){
final _that = this;
switch (_that) {
case _CourseChapterSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String courseId,  String teacherId,  String title,  int orderIndex,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseChapterSummary() when $default != null:
return $default(_that.id,_that.courseId,_that.teacherId,_that.title,_that.orderIndex,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String courseId,  String teacherId,  String title,  int orderIndex,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CourseChapterSummary():
return $default(_that.id,_that.courseId,_that.teacherId,_that.title,_that.orderIndex,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String courseId,  String teacherId,  String title,  int orderIndex,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CourseChapterSummary() when $default != null:
return $default(_that.id,_that.courseId,_that.teacherId,_that.title,_that.orderIndex,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _CourseChapterSummary with DiagnosticableTreeMixin implements CourseChapterSummary {
  const _CourseChapterSummary({this.id = '', this.courseId = '', this.teacherId = '', this.title = '', this.orderIndex = 0, this.createdAt, this.updatedAt});
  factory _CourseChapterSummary.fromJson(Map<String, dynamic> json) => _$CourseChapterSummaryFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String courseId;
@override@JsonKey() final  String teacherId;
@override@JsonKey() final  String title;
@override@JsonKey() final  int orderIndex;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of CourseChapterSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseChapterSummaryCopyWith<_CourseChapterSummary> get copyWith => __$CourseChapterSummaryCopyWithImpl<_CourseChapterSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourseChapterSummaryToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CourseChapterSummary'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('courseId', courseId))..add(DiagnosticsProperty('teacherId', teacherId))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('orderIndex', orderIndex))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseChapterSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.title, title) || other.title == title)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseId,teacherId,title,orderIndex,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CourseChapterSummary(id: $id, courseId: $courseId, teacherId: $teacherId, title: $title, orderIndex: $orderIndex, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CourseChapterSummaryCopyWith<$Res> implements $CourseChapterSummaryCopyWith<$Res> {
  factory _$CourseChapterSummaryCopyWith(_CourseChapterSummary value, $Res Function(_CourseChapterSummary) _then) = __$CourseChapterSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String courseId, String teacherId, String title, int orderIndex, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$CourseChapterSummaryCopyWithImpl<$Res>
    implements _$CourseChapterSummaryCopyWith<$Res> {
  __$CourseChapterSummaryCopyWithImpl(this._self, this._then);

  final _CourseChapterSummary _self;
  final $Res Function(_CourseChapterSummary) _then;

/// Create a copy of CourseChapterSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? courseId = null,Object? teacherId = null,Object? title = null,Object? orderIndex = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_CourseChapterSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$CourseChapterAttachment implements DiagnosticableTreeMixin {

 String get id; String get name; String get type; int get size; String get relayUrl;
/// Create a copy of CourseChapterAttachment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseChapterAttachmentCopyWith<CourseChapterAttachment> get copyWith => _$CourseChapterAttachmentCopyWithImpl<CourseChapterAttachment>(this as CourseChapterAttachment, _$identity);

  /// Serializes this CourseChapterAttachment to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CourseChapterAttachment'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('size', size))..add(DiagnosticsProperty('relayUrl', relayUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseChapterAttachment&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.size, size) || other.size == size)&&(identical(other.relayUrl, relayUrl) || other.relayUrl == relayUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,size,relayUrl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CourseChapterAttachment(id: $id, name: $name, type: $type, size: $size, relayUrl: $relayUrl)';
}


}

/// @nodoc
abstract mixin class $CourseChapterAttachmentCopyWith<$Res>  {
  factory $CourseChapterAttachmentCopyWith(CourseChapterAttachment value, $Res Function(CourseChapterAttachment) _then) = _$CourseChapterAttachmentCopyWithImpl;
@useResult
$Res call({
 String id, String name, String type, int size, String relayUrl
});




}
/// @nodoc
class _$CourseChapterAttachmentCopyWithImpl<$Res>
    implements $CourseChapterAttachmentCopyWith<$Res> {
  _$CourseChapterAttachmentCopyWithImpl(this._self, this._then);

  final CourseChapterAttachment _self;
  final $Res Function(CourseChapterAttachment) _then;

/// Create a copy of CourseChapterAttachment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? size = null,Object? relayUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,relayUrl: null == relayUrl ? _self.relayUrl : relayUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseChapterAttachment].
extension CourseChapterAttachmentPatterns on CourseChapterAttachment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseChapterAttachment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseChapterAttachment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseChapterAttachment value)  $default,){
final _that = this;
switch (_that) {
case _CourseChapterAttachment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseChapterAttachment value)?  $default,){
final _that = this;
switch (_that) {
case _CourseChapterAttachment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String type,  int size,  String relayUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseChapterAttachment() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.size,_that.relayUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String type,  int size,  String relayUrl)  $default,) {final _that = this;
switch (_that) {
case _CourseChapterAttachment():
return $default(_that.id,_that.name,_that.type,_that.size,_that.relayUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String type,  int size,  String relayUrl)?  $default,) {final _that = this;
switch (_that) {
case _CourseChapterAttachment() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.size,_that.relayUrl);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _CourseChapterAttachment extends CourseChapterAttachment with DiagnosticableTreeMixin {
  const _CourseChapterAttachment({this.id = '', this.name = '', this.type = 'application/octet-stream', this.size = 0, this.relayUrl = ''}): super._();
  factory _CourseChapterAttachment.fromJson(Map<String, dynamic> json) => _$CourseChapterAttachmentFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String type;
@override@JsonKey() final  int size;
@override@JsonKey() final  String relayUrl;

/// Create a copy of CourseChapterAttachment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseChapterAttachmentCopyWith<_CourseChapterAttachment> get copyWith => __$CourseChapterAttachmentCopyWithImpl<_CourseChapterAttachment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourseChapterAttachmentToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CourseChapterAttachment'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('size', size))..add(DiagnosticsProperty('relayUrl', relayUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseChapterAttachment&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.size, size) || other.size == size)&&(identical(other.relayUrl, relayUrl) || other.relayUrl == relayUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,size,relayUrl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CourseChapterAttachment(id: $id, name: $name, type: $type, size: $size, relayUrl: $relayUrl)';
}


}

/// @nodoc
abstract mixin class _$CourseChapterAttachmentCopyWith<$Res> implements $CourseChapterAttachmentCopyWith<$Res> {
  factory _$CourseChapterAttachmentCopyWith(_CourseChapterAttachment value, $Res Function(_CourseChapterAttachment) _then) = __$CourseChapterAttachmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String type, int size, String relayUrl
});




}
/// @nodoc
class __$CourseChapterAttachmentCopyWithImpl<$Res>
    implements _$CourseChapterAttachmentCopyWith<$Res> {
  __$CourseChapterAttachmentCopyWithImpl(this._self, this._then);

  final _CourseChapterAttachment _self;
  final $Res Function(_CourseChapterAttachment) _then;

/// Create a copy of CourseChapterAttachment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? size = null,Object? relayUrl = null,}) {
  return _then(_CourseChapterAttachment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,relayUrl: null == relayUrl ? _self.relayUrl : relayUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CourseChapterDetail implements DiagnosticableTreeMixin {

 String get id; String get courseId; String get teacherId; String get title; String get content; int get orderIndex; List<CourseChapterAttachment> get attachments; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of CourseChapterDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseChapterDetailCopyWith<CourseChapterDetail> get copyWith => _$CourseChapterDetailCopyWithImpl<CourseChapterDetail>(this as CourseChapterDetail, _$identity);

  /// Serializes this CourseChapterDetail to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CourseChapterDetail'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('courseId', courseId))..add(DiagnosticsProperty('teacherId', teacherId))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('content', content))..add(DiagnosticsProperty('orderIndex', orderIndex))..add(DiagnosticsProperty('attachments', attachments))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseChapterDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseId,teacherId,title,content,orderIndex,const DeepCollectionEquality().hash(attachments),createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CourseChapterDetail(id: $id, courseId: $courseId, teacherId: $teacherId, title: $title, content: $content, orderIndex: $orderIndex, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CourseChapterDetailCopyWith<$Res>  {
  factory $CourseChapterDetailCopyWith(CourseChapterDetail value, $Res Function(CourseChapterDetail) _then) = _$CourseChapterDetailCopyWithImpl;
@useResult
$Res call({
 String id, String courseId, String teacherId, String title, String content, int orderIndex, List<CourseChapterAttachment> attachments, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$CourseChapterDetailCopyWithImpl<$Res>
    implements $CourseChapterDetailCopyWith<$Res> {
  _$CourseChapterDetailCopyWithImpl(this._self, this._then);

  final CourseChapterDetail _self;
  final $Res Function(CourseChapterDetail) _then;

/// Create a copy of CourseChapterDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? courseId = null,Object? teacherId = null,Object? title = null,Object? content = null,Object? orderIndex = null,Object? attachments = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<CourseChapterAttachment>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseChapterDetail].
extension CourseChapterDetailPatterns on CourseChapterDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseChapterDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseChapterDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseChapterDetail value)  $default,){
final _that = this;
switch (_that) {
case _CourseChapterDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseChapterDetail value)?  $default,){
final _that = this;
switch (_that) {
case _CourseChapterDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String courseId,  String teacherId,  String title,  String content,  int orderIndex,  List<CourseChapterAttachment> attachments,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseChapterDetail() when $default != null:
return $default(_that.id,_that.courseId,_that.teacherId,_that.title,_that.content,_that.orderIndex,_that.attachments,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String courseId,  String teacherId,  String title,  String content,  int orderIndex,  List<CourseChapterAttachment> attachments,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CourseChapterDetail():
return $default(_that.id,_that.courseId,_that.teacherId,_that.title,_that.content,_that.orderIndex,_that.attachments,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String courseId,  String teacherId,  String title,  String content,  int orderIndex,  List<CourseChapterAttachment> attachments,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CourseChapterDetail() when $default != null:
return $default(_that.id,_that.courseId,_that.teacherId,_that.title,_that.content,_that.orderIndex,_that.attachments,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CourseChapterDetail with DiagnosticableTreeMixin implements CourseChapterDetail {
  const _CourseChapterDetail({this.id = '', this.courseId = '', this.teacherId = '', this.title = '', this.content = '', this.orderIndex = 0, final  List<CourseChapterAttachment> attachments = const [], this.createdAt, this.updatedAt}): _attachments = attachments;
  factory _CourseChapterDetail.fromJson(Map<String, dynamic> json) => _$CourseChapterDetailFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String courseId;
@override@JsonKey() final  String teacherId;
@override@JsonKey() final  String title;
@override@JsonKey() final  String content;
@override@JsonKey() final  int orderIndex;
 final  List<CourseChapterAttachment> _attachments;
@override@JsonKey() List<CourseChapterAttachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of CourseChapterDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseChapterDetailCopyWith<_CourseChapterDetail> get copyWith => __$CourseChapterDetailCopyWithImpl<_CourseChapterDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourseChapterDetailToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CourseChapterDetail'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('courseId', courseId))..add(DiagnosticsProperty('teacherId', teacherId))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('content', content))..add(DiagnosticsProperty('orderIndex', orderIndex))..add(DiagnosticsProperty('attachments', attachments))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseChapterDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseId,teacherId,title,content,orderIndex,const DeepCollectionEquality().hash(_attachments),createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CourseChapterDetail(id: $id, courseId: $courseId, teacherId: $teacherId, title: $title, content: $content, orderIndex: $orderIndex, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CourseChapterDetailCopyWith<$Res> implements $CourseChapterDetailCopyWith<$Res> {
  factory _$CourseChapterDetailCopyWith(_CourseChapterDetail value, $Res Function(_CourseChapterDetail) _then) = __$CourseChapterDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String courseId, String teacherId, String title, String content, int orderIndex, List<CourseChapterAttachment> attachments, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$CourseChapterDetailCopyWithImpl<$Res>
    implements _$CourseChapterDetailCopyWith<$Res> {
  __$CourseChapterDetailCopyWithImpl(this._self, this._then);

  final _CourseChapterDetail _self;
  final $Res Function(_CourseChapterDetail) _then;

/// Create a copy of CourseChapterDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? courseId = null,Object? teacherId = null,Object? title = null,Object? content = null,Object? orderIndex = null,Object? attachments = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_CourseChapterDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<CourseChapterAttachment>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
