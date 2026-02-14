// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeacherScheduleItem {

 String get sessionId; String get courseId; String get courseName; String get classId; String get className;@JsonKey(fromJson: _parseDateTimeOrNow) DateTime get startsAt;@JsonKey(fromJson: _parseDateTimeOrNow) DateTime get endsAt; String get day; String get slotId; String get slotName; String get location; String get source;
/// Create a copy of TeacherScheduleItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherScheduleItemCopyWith<TeacherScheduleItem> get copyWith => _$TeacherScheduleItemCopyWithImpl<TeacherScheduleItem>(this as TeacherScheduleItem, _$identity);

  /// Serializes this TeacherScheduleItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherScheduleItem&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.className, className) || other.className == className)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.day, day) || other.day == day)&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.slotName, slotName) || other.slotName == slotName)&&(identical(other.location, location) || other.location == location)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,courseId,courseName,classId,className,startsAt,endsAt,day,slotId,slotName,location,source);

@override
String toString() {
  return 'TeacherScheduleItem(sessionId: $sessionId, courseId: $courseId, courseName: $courseName, classId: $classId, className: $className, startsAt: $startsAt, endsAt: $endsAt, day: $day, slotId: $slotId, slotName: $slotName, location: $location, source: $source)';
}


}

/// @nodoc
abstract mixin class $TeacherScheduleItemCopyWith<$Res>  {
  factory $TeacherScheduleItemCopyWith(TeacherScheduleItem value, $Res Function(TeacherScheduleItem) _then) = _$TeacherScheduleItemCopyWithImpl;
@useResult
$Res call({
 String sessionId, String courseId, String courseName, String classId, String className,@JsonKey(fromJson: _parseDateTimeOrNow) DateTime startsAt,@JsonKey(fromJson: _parseDateTimeOrNow) DateTime endsAt, String day, String slotId, String slotName, String location, String source
});




}
/// @nodoc
class _$TeacherScheduleItemCopyWithImpl<$Res>
    implements $TeacherScheduleItemCopyWith<$Res> {
  _$TeacherScheduleItemCopyWithImpl(this._self, this._then);

  final TeacherScheduleItem _self;
  final $Res Function(TeacherScheduleItem) _then;

/// Create a copy of TeacherScheduleItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? courseId = null,Object? courseName = null,Object? classId = null,Object? className = null,Object? startsAt = null,Object? endsAt = null,Object? day = null,Object? slotId = null,Object? slotName = null,Object? location = null,Object? source = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,courseName: null == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,className: null == className ? _self.className : className // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,slotId: null == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as String,slotName: null == slotName ? _self.slotName : slotName // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherScheduleItem].
extension TeacherScheduleItemPatterns on TeacherScheduleItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherScheduleItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherScheduleItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherScheduleItem value)  $default,){
final _that = this;
switch (_that) {
case _TeacherScheduleItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherScheduleItem value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherScheduleItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId,  String courseId,  String courseName,  String classId,  String className, @JsonKey(fromJson: _parseDateTimeOrNow)  DateTime startsAt, @JsonKey(fromJson: _parseDateTimeOrNow)  DateTime endsAt,  String day,  String slotId,  String slotName,  String location,  String source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherScheduleItem() when $default != null:
return $default(_that.sessionId,_that.courseId,_that.courseName,_that.classId,_that.className,_that.startsAt,_that.endsAt,_that.day,_that.slotId,_that.slotName,_that.location,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId,  String courseId,  String courseName,  String classId,  String className, @JsonKey(fromJson: _parseDateTimeOrNow)  DateTime startsAt, @JsonKey(fromJson: _parseDateTimeOrNow)  DateTime endsAt,  String day,  String slotId,  String slotName,  String location,  String source)  $default,) {final _that = this;
switch (_that) {
case _TeacherScheduleItem():
return $default(_that.sessionId,_that.courseId,_that.courseName,_that.classId,_that.className,_that.startsAt,_that.endsAt,_that.day,_that.slotId,_that.slotName,_that.location,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId,  String courseId,  String courseName,  String classId,  String className, @JsonKey(fromJson: _parseDateTimeOrNow)  DateTime startsAt, @JsonKey(fromJson: _parseDateTimeOrNow)  DateTime endsAt,  String day,  String slotId,  String slotName,  String location,  String source)?  $default,) {final _that = this;
switch (_that) {
case _TeacherScheduleItem() when $default != null:
return $default(_that.sessionId,_that.courseId,_that.courseName,_that.classId,_that.className,_that.startsAt,_that.endsAt,_that.day,_that.slotId,_that.slotName,_that.location,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherScheduleItem extends TeacherScheduleItem {
  const _TeacherScheduleItem({this.sessionId = '', this.courseId = '', this.courseName = '', this.classId = '', this.className = '', @JsonKey(fromJson: _parseDateTimeOrNow) required this.startsAt, @JsonKey(fromJson: _parseDateTimeOrNow) required this.endsAt, this.day = '', this.slotId = '', this.slotName = '', this.location = '', this.source = ''}): super._();
  factory _TeacherScheduleItem.fromJson(Map<String, dynamic> json) => _$TeacherScheduleItemFromJson(json);

@override@JsonKey() final  String sessionId;
@override@JsonKey() final  String courseId;
@override@JsonKey() final  String courseName;
@override@JsonKey() final  String classId;
@override@JsonKey() final  String className;
@override@JsonKey(fromJson: _parseDateTimeOrNow) final  DateTime startsAt;
@override@JsonKey(fromJson: _parseDateTimeOrNow) final  DateTime endsAt;
@override@JsonKey() final  String day;
@override@JsonKey() final  String slotId;
@override@JsonKey() final  String slotName;
@override@JsonKey() final  String location;
@override@JsonKey() final  String source;

/// Create a copy of TeacherScheduleItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherScheduleItemCopyWith<_TeacherScheduleItem> get copyWith => __$TeacherScheduleItemCopyWithImpl<_TeacherScheduleItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherScheduleItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherScheduleItem&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.className, className) || other.className == className)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.day, day) || other.day == day)&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.slotName, slotName) || other.slotName == slotName)&&(identical(other.location, location) || other.location == location)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,courseId,courseName,classId,className,startsAt,endsAt,day,slotId,slotName,location,source);

@override
String toString() {
  return 'TeacherScheduleItem(sessionId: $sessionId, courseId: $courseId, courseName: $courseName, classId: $classId, className: $className, startsAt: $startsAt, endsAt: $endsAt, day: $day, slotId: $slotId, slotName: $slotName, location: $location, source: $source)';
}


}

/// @nodoc
abstract mixin class _$TeacherScheduleItemCopyWith<$Res> implements $TeacherScheduleItemCopyWith<$Res> {
  factory _$TeacherScheduleItemCopyWith(_TeacherScheduleItem value, $Res Function(_TeacherScheduleItem) _then) = __$TeacherScheduleItemCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, String courseId, String courseName, String classId, String className,@JsonKey(fromJson: _parseDateTimeOrNow) DateTime startsAt,@JsonKey(fromJson: _parseDateTimeOrNow) DateTime endsAt, String day, String slotId, String slotName, String location, String source
});




}
/// @nodoc
class __$TeacherScheduleItemCopyWithImpl<$Res>
    implements _$TeacherScheduleItemCopyWith<$Res> {
  __$TeacherScheduleItemCopyWithImpl(this._self, this._then);

  final _TeacherScheduleItem _self;
  final $Res Function(_TeacherScheduleItem) _then;

/// Create a copy of TeacherScheduleItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? courseId = null,Object? courseName = null,Object? classId = null,Object? className = null,Object? startsAt = null,Object? endsAt = null,Object? day = null,Object? slotId = null,Object? slotName = null,Object? location = null,Object? source = null,}) {
  return _then(_TeacherScheduleItem(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,courseName: null == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,className: null == className ? _self.className : className // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,slotId: null == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as String,slotName: null == slotName ? _self.slotName : slotName // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
