// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimeSlot {

 String get id; String get schoolId; String get name; String get startTime; String get endTime;
/// Create a copy of TimeSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeSlotCopyWith<TimeSlot> get copyWith => _$TimeSlotCopyWithImpl<TimeSlot>(this as TimeSlot, _$identity);

  /// Serializes this TimeSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,name,startTime,endTime);

@override
String toString() {
  return 'TimeSlot(id: $id, schoolId: $schoolId, name: $name, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class $TimeSlotCopyWith<$Res>  {
  factory $TimeSlotCopyWith(TimeSlot value, $Res Function(TimeSlot) _then) = _$TimeSlotCopyWithImpl;
@useResult
$Res call({
 String id, String schoolId, String name, String startTime, String endTime
});




}
/// @nodoc
class _$TimeSlotCopyWithImpl<$Res>
    implements $TimeSlotCopyWith<$Res> {
  _$TimeSlotCopyWithImpl(this._self, this._then);

  final TimeSlot _self;
  final $Res Function(TimeSlot) _then;

/// Create a copy of TimeSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? schoolId = null,Object? name = null,Object? startTime = null,Object? endTime = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeSlot].
extension TimeSlotPatterns on TimeSlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeSlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeSlot value)  $default,){
final _that = this;
switch (_that) {
case _TimeSlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeSlot value)?  $default,){
final _that = this;
switch (_that) {
case _TimeSlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String schoolId,  String name,  String startTime,  String endTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeSlot() when $default != null:
return $default(_that.id,_that.schoolId,_that.name,_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String schoolId,  String name,  String startTime,  String endTime)  $default,) {final _that = this;
switch (_that) {
case _TimeSlot():
return $default(_that.id,_that.schoolId,_that.name,_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String schoolId,  String name,  String startTime,  String endTime)?  $default,) {final _that = this;
switch (_that) {
case _TimeSlot() when $default != null:
return $default(_that.id,_that.schoolId,_that.name,_that.startTime,_that.endTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeSlot implements TimeSlot {
  const _TimeSlot({required this.id, required this.schoolId, required this.name, required this.startTime, required this.endTime});
  factory _TimeSlot.fromJson(Map<String, dynamic> json) => _$TimeSlotFromJson(json);

@override final  String id;
@override final  String schoolId;
@override final  String name;
@override final  String startTime;
@override final  String endTime;

/// Create a copy of TimeSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeSlotCopyWith<_TimeSlot> get copyWith => __$TimeSlotCopyWithImpl<_TimeSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeSlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,name,startTime,endTime);

@override
String toString() {
  return 'TimeSlot(id: $id, schoolId: $schoolId, name: $name, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class _$TimeSlotCopyWith<$Res> implements $TimeSlotCopyWith<$Res> {
  factory _$TimeSlotCopyWith(_TimeSlot value, $Res Function(_TimeSlot) _then) = __$TimeSlotCopyWithImpl;
@override @useResult
$Res call({
 String id, String schoolId, String name, String startTime, String endTime
});




}
/// @nodoc
class __$TimeSlotCopyWithImpl<$Res>
    implements _$TimeSlotCopyWith<$Res> {
  __$TimeSlotCopyWithImpl(this._self, this._then);

  final _TimeSlot _self;
  final $Res Function(_TimeSlot) _then;

/// Create a copy of TimeSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? schoolId = null,Object? name = null,Object? startTime = null,Object? endTime = null,}) {
  return _then(_TimeSlot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CourseSchedule {

 String get id; String get schoolId; String get courseId; String get classId; String? get teacherId; String get slotId; String? get classroomId; int get dayOfWeek; String? get location; DateTime get startDate; DateTime get endDate; String? get courseName; String? get className; String? get teacherName; String? get slotName; String? get classroomLocation;
/// Create a copy of CourseSchedule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseScheduleCopyWith<CourseSchedule> get copyWith => _$CourseScheduleCopyWithImpl<CourseSchedule>(this as CourseSchedule, _$identity);

  /// Serializes this CourseSchedule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseSchedule&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.classroomId, classroomId) || other.classroomId == classroomId)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.location, location) || other.location == location)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.className, className) || other.className == className)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&(identical(other.slotName, slotName) || other.slotName == slotName)&&(identical(other.classroomLocation, classroomLocation) || other.classroomLocation == classroomLocation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,courseId,classId,teacherId,slotId,classroomId,dayOfWeek,location,startDate,endDate,courseName,className,teacherName,slotName,classroomLocation);

@override
String toString() {
  return 'CourseSchedule(id: $id, schoolId: $schoolId, courseId: $courseId, classId: $classId, teacherId: $teacherId, slotId: $slotId, classroomId: $classroomId, dayOfWeek: $dayOfWeek, location: $location, startDate: $startDate, endDate: $endDate, courseName: $courseName, className: $className, teacherName: $teacherName, slotName: $slotName, classroomLocation: $classroomLocation)';
}


}

/// @nodoc
abstract mixin class $CourseScheduleCopyWith<$Res>  {
  factory $CourseScheduleCopyWith(CourseSchedule value, $Res Function(CourseSchedule) _then) = _$CourseScheduleCopyWithImpl;
@useResult
$Res call({
 String id, String schoolId, String courseId, String classId, String? teacherId, String slotId, String? classroomId, int dayOfWeek, String? location, DateTime startDate, DateTime endDate, String? courseName, String? className, String? teacherName, String? slotName, String? classroomLocation
});




}
/// @nodoc
class _$CourseScheduleCopyWithImpl<$Res>
    implements $CourseScheduleCopyWith<$Res> {
  _$CourseScheduleCopyWithImpl(this._self, this._then);

  final CourseSchedule _self;
  final $Res Function(CourseSchedule) _then;

/// Create a copy of CourseSchedule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? schoolId = null,Object? courseId = null,Object? classId = null,Object? teacherId = freezed,Object? slotId = null,Object? classroomId = freezed,Object? dayOfWeek = null,Object? location = freezed,Object? startDate = null,Object? endDate = null,Object? courseName = freezed,Object? className = freezed,Object? teacherName = freezed,Object? slotName = freezed,Object? classroomLocation = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,teacherId: freezed == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String?,slotId: null == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as String,classroomId: freezed == classroomId ? _self.classroomId : classroomId // ignore: cast_nullable_to_non_nullable
as String?,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,courseName: freezed == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String?,className: freezed == className ? _self.className : className // ignore: cast_nullable_to_non_nullable
as String?,teacherName: freezed == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String?,slotName: freezed == slotName ? _self.slotName : slotName // ignore: cast_nullable_to_non_nullable
as String?,classroomLocation: freezed == classroomLocation ? _self.classroomLocation : classroomLocation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseSchedule].
extension CourseSchedulePatterns on CourseSchedule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseSchedule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseSchedule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseSchedule value)  $default,){
final _that = this;
switch (_that) {
case _CourseSchedule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseSchedule value)?  $default,){
final _that = this;
switch (_that) {
case _CourseSchedule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String schoolId,  String courseId,  String classId,  String? teacherId,  String slotId,  String? classroomId,  int dayOfWeek,  String? location,  DateTime startDate,  DateTime endDate,  String? courseName,  String? className,  String? teacherName,  String? slotName,  String? classroomLocation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseSchedule() when $default != null:
return $default(_that.id,_that.schoolId,_that.courseId,_that.classId,_that.teacherId,_that.slotId,_that.classroomId,_that.dayOfWeek,_that.location,_that.startDate,_that.endDate,_that.courseName,_that.className,_that.teacherName,_that.slotName,_that.classroomLocation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String schoolId,  String courseId,  String classId,  String? teacherId,  String slotId,  String? classroomId,  int dayOfWeek,  String? location,  DateTime startDate,  DateTime endDate,  String? courseName,  String? className,  String? teacherName,  String? slotName,  String? classroomLocation)  $default,) {final _that = this;
switch (_that) {
case _CourseSchedule():
return $default(_that.id,_that.schoolId,_that.courseId,_that.classId,_that.teacherId,_that.slotId,_that.classroomId,_that.dayOfWeek,_that.location,_that.startDate,_that.endDate,_that.courseName,_that.className,_that.teacherName,_that.slotName,_that.classroomLocation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String schoolId,  String courseId,  String classId,  String? teacherId,  String slotId,  String? classroomId,  int dayOfWeek,  String? location,  DateTime startDate,  DateTime endDate,  String? courseName,  String? className,  String? teacherName,  String? slotName,  String? classroomLocation)?  $default,) {final _that = this;
switch (_that) {
case _CourseSchedule() when $default != null:
return $default(_that.id,_that.schoolId,_that.courseId,_that.classId,_that.teacherId,_that.slotId,_that.classroomId,_that.dayOfWeek,_that.location,_that.startDate,_that.endDate,_that.courseName,_that.className,_that.teacherName,_that.slotName,_that.classroomLocation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CourseSchedule implements CourseSchedule {
  const _CourseSchedule({required this.id, required this.schoolId, required this.courseId, required this.classId, this.teacherId, required this.slotId, this.classroomId, required this.dayOfWeek, this.location, required this.startDate, required this.endDate, this.courseName, this.className, this.teacherName, this.slotName, this.classroomLocation});
  factory _CourseSchedule.fromJson(Map<String, dynamic> json) => _$CourseScheduleFromJson(json);

@override final  String id;
@override final  String schoolId;
@override final  String courseId;
@override final  String classId;
@override final  String? teacherId;
@override final  String slotId;
@override final  String? classroomId;
@override final  int dayOfWeek;
@override final  String? location;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  String? courseName;
@override final  String? className;
@override final  String? teacherName;
@override final  String? slotName;
@override final  String? classroomLocation;

/// Create a copy of CourseSchedule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseScheduleCopyWith<_CourseSchedule> get copyWith => __$CourseScheduleCopyWithImpl<_CourseSchedule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourseScheduleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseSchedule&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.classroomId, classroomId) || other.classroomId == classroomId)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.location, location) || other.location == location)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.className, className) || other.className == className)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName)&&(identical(other.slotName, slotName) || other.slotName == slotName)&&(identical(other.classroomLocation, classroomLocation) || other.classroomLocation == classroomLocation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,courseId,classId,teacherId,slotId,classroomId,dayOfWeek,location,startDate,endDate,courseName,className,teacherName,slotName,classroomLocation);

@override
String toString() {
  return 'CourseSchedule(id: $id, schoolId: $schoolId, courseId: $courseId, classId: $classId, teacherId: $teacherId, slotId: $slotId, classroomId: $classroomId, dayOfWeek: $dayOfWeek, location: $location, startDate: $startDate, endDate: $endDate, courseName: $courseName, className: $className, teacherName: $teacherName, slotName: $slotName, classroomLocation: $classroomLocation)';
}


}

/// @nodoc
abstract mixin class _$CourseScheduleCopyWith<$Res> implements $CourseScheduleCopyWith<$Res> {
  factory _$CourseScheduleCopyWith(_CourseSchedule value, $Res Function(_CourseSchedule) _then) = __$CourseScheduleCopyWithImpl;
@override @useResult
$Res call({
 String id, String schoolId, String courseId, String classId, String? teacherId, String slotId, String? classroomId, int dayOfWeek, String? location, DateTime startDate, DateTime endDate, String? courseName, String? className, String? teacherName, String? slotName, String? classroomLocation
});




}
/// @nodoc
class __$CourseScheduleCopyWithImpl<$Res>
    implements _$CourseScheduleCopyWith<$Res> {
  __$CourseScheduleCopyWithImpl(this._self, this._then);

  final _CourseSchedule _self;
  final $Res Function(_CourseSchedule) _then;

/// Create a copy of CourseSchedule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? schoolId = null,Object? courseId = null,Object? classId = null,Object? teacherId = freezed,Object? slotId = null,Object? classroomId = freezed,Object? dayOfWeek = null,Object? location = freezed,Object? startDate = null,Object? endDate = null,Object? courseName = freezed,Object? className = freezed,Object? teacherName = freezed,Object? slotName = freezed,Object? classroomLocation = freezed,}) {
  return _then(_CourseSchedule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,teacherId: freezed == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String?,slotId: null == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as String,classroomId: freezed == classroomId ? _self.classroomId : classroomId // ignore: cast_nullable_to_non_nullable
as String?,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,courseName: freezed == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String?,className: freezed == className ? _self.className : className // ignore: cast_nullable_to_non_nullable
as String?,teacherName: freezed == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String?,slotName: freezed == slotName ? _self.slotName : slotName // ignore: cast_nullable_to_non_nullable
as String?,classroomLocation: freezed == classroomLocation ? _self.classroomLocation : classroomLocation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ScheduleStats {

 int get totalRules; int get totalCourses; int get scheduledCoursesCount; int get unscheduledCoursesCount; Map<int, int> get rulesByDay;
/// Create a copy of ScheduleStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleStatsCopyWith<ScheduleStats> get copyWith => _$ScheduleStatsCopyWithImpl<ScheduleStats>(this as ScheduleStats, _$identity);

  /// Serializes this ScheduleStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleStats&&(identical(other.totalRules, totalRules) || other.totalRules == totalRules)&&(identical(other.totalCourses, totalCourses) || other.totalCourses == totalCourses)&&(identical(other.scheduledCoursesCount, scheduledCoursesCount) || other.scheduledCoursesCount == scheduledCoursesCount)&&(identical(other.unscheduledCoursesCount, unscheduledCoursesCount) || other.unscheduledCoursesCount == unscheduledCoursesCount)&&const DeepCollectionEquality().equals(other.rulesByDay, rulesByDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalRules,totalCourses,scheduledCoursesCount,unscheduledCoursesCount,const DeepCollectionEquality().hash(rulesByDay));

@override
String toString() {
  return 'ScheduleStats(totalRules: $totalRules, totalCourses: $totalCourses, scheduledCoursesCount: $scheduledCoursesCount, unscheduledCoursesCount: $unscheduledCoursesCount, rulesByDay: $rulesByDay)';
}


}

/// @nodoc
abstract mixin class $ScheduleStatsCopyWith<$Res>  {
  factory $ScheduleStatsCopyWith(ScheduleStats value, $Res Function(ScheduleStats) _then) = _$ScheduleStatsCopyWithImpl;
@useResult
$Res call({
 int totalRules, int totalCourses, int scheduledCoursesCount, int unscheduledCoursesCount, Map<int, int> rulesByDay
});




}
/// @nodoc
class _$ScheduleStatsCopyWithImpl<$Res>
    implements $ScheduleStatsCopyWith<$Res> {
  _$ScheduleStatsCopyWithImpl(this._self, this._then);

  final ScheduleStats _self;
  final $Res Function(ScheduleStats) _then;

/// Create a copy of ScheduleStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalRules = null,Object? totalCourses = null,Object? scheduledCoursesCount = null,Object? unscheduledCoursesCount = null,Object? rulesByDay = null,}) {
  return _then(_self.copyWith(
totalRules: null == totalRules ? _self.totalRules : totalRules // ignore: cast_nullable_to_non_nullable
as int,totalCourses: null == totalCourses ? _self.totalCourses : totalCourses // ignore: cast_nullable_to_non_nullable
as int,scheduledCoursesCount: null == scheduledCoursesCount ? _self.scheduledCoursesCount : scheduledCoursesCount // ignore: cast_nullable_to_non_nullable
as int,unscheduledCoursesCount: null == unscheduledCoursesCount ? _self.unscheduledCoursesCount : unscheduledCoursesCount // ignore: cast_nullable_to_non_nullable
as int,rulesByDay: null == rulesByDay ? _self.rulesByDay : rulesByDay // ignore: cast_nullable_to_non_nullable
as Map<int, int>,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleStats].
extension ScheduleStatsPatterns on ScheduleStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleStats value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleStats value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalRules,  int totalCourses,  int scheduledCoursesCount,  int unscheduledCoursesCount,  Map<int, int> rulesByDay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleStats() when $default != null:
return $default(_that.totalRules,_that.totalCourses,_that.scheduledCoursesCount,_that.unscheduledCoursesCount,_that.rulesByDay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalRules,  int totalCourses,  int scheduledCoursesCount,  int unscheduledCoursesCount,  Map<int, int> rulesByDay)  $default,) {final _that = this;
switch (_that) {
case _ScheduleStats():
return $default(_that.totalRules,_that.totalCourses,_that.scheduledCoursesCount,_that.unscheduledCoursesCount,_that.rulesByDay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalRules,  int totalCourses,  int scheduledCoursesCount,  int unscheduledCoursesCount,  Map<int, int> rulesByDay)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleStats() when $default != null:
return $default(_that.totalRules,_that.totalCourses,_that.scheduledCoursesCount,_that.unscheduledCoursesCount,_that.rulesByDay);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScheduleStats implements ScheduleStats {
  const _ScheduleStats({required this.totalRules, required this.totalCourses, required this.scheduledCoursesCount, required this.unscheduledCoursesCount, required final  Map<int, int> rulesByDay}): _rulesByDay = rulesByDay;
  factory _ScheduleStats.fromJson(Map<String, dynamic> json) => _$ScheduleStatsFromJson(json);

@override final  int totalRules;
@override final  int totalCourses;
@override final  int scheduledCoursesCount;
@override final  int unscheduledCoursesCount;
 final  Map<int, int> _rulesByDay;
@override Map<int, int> get rulesByDay {
  if (_rulesByDay is EqualUnmodifiableMapView) return _rulesByDay;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_rulesByDay);
}


/// Create a copy of ScheduleStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleStatsCopyWith<_ScheduleStats> get copyWith => __$ScheduleStatsCopyWithImpl<_ScheduleStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScheduleStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleStats&&(identical(other.totalRules, totalRules) || other.totalRules == totalRules)&&(identical(other.totalCourses, totalCourses) || other.totalCourses == totalCourses)&&(identical(other.scheduledCoursesCount, scheduledCoursesCount) || other.scheduledCoursesCount == scheduledCoursesCount)&&(identical(other.unscheduledCoursesCount, unscheduledCoursesCount) || other.unscheduledCoursesCount == unscheduledCoursesCount)&&const DeepCollectionEquality().equals(other._rulesByDay, _rulesByDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalRules,totalCourses,scheduledCoursesCount,unscheduledCoursesCount,const DeepCollectionEquality().hash(_rulesByDay));

@override
String toString() {
  return 'ScheduleStats(totalRules: $totalRules, totalCourses: $totalCourses, scheduledCoursesCount: $scheduledCoursesCount, unscheduledCoursesCount: $unscheduledCoursesCount, rulesByDay: $rulesByDay)';
}


}

/// @nodoc
abstract mixin class _$ScheduleStatsCopyWith<$Res> implements $ScheduleStatsCopyWith<$Res> {
  factory _$ScheduleStatsCopyWith(_ScheduleStats value, $Res Function(_ScheduleStats) _then) = __$ScheduleStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalRules, int totalCourses, int scheduledCoursesCount, int unscheduledCoursesCount, Map<int, int> rulesByDay
});




}
/// @nodoc
class __$ScheduleStatsCopyWithImpl<$Res>
    implements _$ScheduleStatsCopyWith<$Res> {
  __$ScheduleStatsCopyWithImpl(this._self, this._then);

  final _ScheduleStats _self;
  final $Res Function(_ScheduleStats) _then;

/// Create a copy of ScheduleStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalRules = null,Object? totalCourses = null,Object? scheduledCoursesCount = null,Object? unscheduledCoursesCount = null,Object? rulesByDay = null,}) {
  return _then(_ScheduleStats(
totalRules: null == totalRules ? _self.totalRules : totalRules // ignore: cast_nullable_to_non_nullable
as int,totalCourses: null == totalCourses ? _self.totalCourses : totalCourses // ignore: cast_nullable_to_non_nullable
as int,scheduledCoursesCount: null == scheduledCoursesCount ? _self.scheduledCoursesCount : scheduledCoursesCount // ignore: cast_nullable_to_non_nullable
as int,unscheduledCoursesCount: null == unscheduledCoursesCount ? _self.unscheduledCoursesCount : unscheduledCoursesCount // ignore: cast_nullable_to_non_nullable
as int,rulesByDay: null == rulesByDay ? _self._rulesByDay : rulesByDay // ignore: cast_nullable_to_non_nullable
as Map<int, int>,
  ));
}


}

// dart format on
