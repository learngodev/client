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

 String get id;@JsonKey(name: 'school_id') String get schoolId; String get name;@JsonKey(name: 'start_time') String get startTime;@JsonKey(name: 'end_time') String get endTime;
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
 String id,@JsonKey(name: 'school_id') String schoolId, String name,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'school_id')  String schoolId,  String name, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'school_id')  String schoolId,  String name, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'school_id')  String schoolId,  String name, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime)?  $default,) {final _that = this;
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
  const _TimeSlot({required this.id, @JsonKey(name: 'school_id') required this.schoolId, required this.name, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime});
  factory _TimeSlot.fromJson(Map<String, dynamic> json) => _$TimeSlotFromJson(json);

@override final  String id;
@override@JsonKey(name: 'school_id') final  String schoolId;
@override final  String name;
@override@JsonKey(name: 'start_time') final  String startTime;
@override@JsonKey(name: 'end_time') final  String endTime;

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
 String id,@JsonKey(name: 'school_id') String schoolId, String name,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime
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

 String get id;@JsonKey(name: 'school_id') String get schoolId;@JsonKey(name: 'course_id') String get courseId;@JsonKey(name: 'class_id') String get classId;@JsonKey(name: 'teacher_id') String get teacherId;@JsonKey(name: 'slot_id') String get slotId;@JsonKey(name: 'day_of_week') int get dayOfWeek; String? get location;@JsonKey(name: 'start_date') DateTime get startDate;@JsonKey(name: 'end_date') DateTime get endDate;
/// Create a copy of CourseSchedule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseScheduleCopyWith<CourseSchedule> get copyWith => _$CourseScheduleCopyWithImpl<CourseSchedule>(this as CourseSchedule, _$identity);

  /// Serializes this CourseSchedule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseSchedule&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.location, location) || other.location == location)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,courseId,classId,teacherId,slotId,dayOfWeek,location,startDate,endDate);

@override
String toString() {
  return 'CourseSchedule(id: $id, schoolId: $schoolId, courseId: $courseId, classId: $classId, teacherId: $teacherId, slotId: $slotId, dayOfWeek: $dayOfWeek, location: $location, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $CourseScheduleCopyWith<$Res>  {
  factory $CourseScheduleCopyWith(CourseSchedule value, $Res Function(CourseSchedule) _then) = _$CourseScheduleCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'school_id') String schoolId,@JsonKey(name: 'course_id') String courseId,@JsonKey(name: 'class_id') String classId,@JsonKey(name: 'teacher_id') String teacherId,@JsonKey(name: 'slot_id') String slotId,@JsonKey(name: 'day_of_week') int dayOfWeek, String? location,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? schoolId = null,Object? courseId = null,Object? classId = null,Object? teacherId = null,Object? slotId = null,Object? dayOfWeek = null,Object? location = freezed,Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,slotId: null == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'school_id')  String schoolId, @JsonKey(name: 'course_id')  String courseId, @JsonKey(name: 'class_id')  String classId, @JsonKey(name: 'teacher_id')  String teacherId, @JsonKey(name: 'slot_id')  String slotId, @JsonKey(name: 'day_of_week')  int dayOfWeek,  String? location, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseSchedule() when $default != null:
return $default(_that.id,_that.schoolId,_that.courseId,_that.classId,_that.teacherId,_that.slotId,_that.dayOfWeek,_that.location,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'school_id')  String schoolId, @JsonKey(name: 'course_id')  String courseId, @JsonKey(name: 'class_id')  String classId, @JsonKey(name: 'teacher_id')  String teacherId, @JsonKey(name: 'slot_id')  String slotId, @JsonKey(name: 'day_of_week')  int dayOfWeek,  String? location, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate)  $default,) {final _that = this;
switch (_that) {
case _CourseSchedule():
return $default(_that.id,_that.schoolId,_that.courseId,_that.classId,_that.teacherId,_that.slotId,_that.dayOfWeek,_that.location,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'school_id')  String schoolId, @JsonKey(name: 'course_id')  String courseId, @JsonKey(name: 'class_id')  String classId, @JsonKey(name: 'teacher_id')  String teacherId, @JsonKey(name: 'slot_id')  String slotId, @JsonKey(name: 'day_of_week')  int dayOfWeek,  String? location, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate)?  $default,) {final _that = this;
switch (_that) {
case _CourseSchedule() when $default != null:
return $default(_that.id,_that.schoolId,_that.courseId,_that.classId,_that.teacherId,_that.slotId,_that.dayOfWeek,_that.location,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CourseSchedule implements CourseSchedule {
  const _CourseSchedule({required this.id, @JsonKey(name: 'school_id') required this.schoolId, @JsonKey(name: 'course_id') required this.courseId, @JsonKey(name: 'class_id') required this.classId, @JsonKey(name: 'teacher_id') required this.teacherId, @JsonKey(name: 'slot_id') required this.slotId, @JsonKey(name: 'day_of_week') required this.dayOfWeek, this.location, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate});
  factory _CourseSchedule.fromJson(Map<String, dynamic> json) => _$CourseScheduleFromJson(json);

@override final  String id;
@override@JsonKey(name: 'school_id') final  String schoolId;
@override@JsonKey(name: 'course_id') final  String courseId;
@override@JsonKey(name: 'class_id') final  String classId;
@override@JsonKey(name: 'teacher_id') final  String teacherId;
@override@JsonKey(name: 'slot_id') final  String slotId;
@override@JsonKey(name: 'day_of_week') final  int dayOfWeek;
@override final  String? location;
@override@JsonKey(name: 'start_date') final  DateTime startDate;
@override@JsonKey(name: 'end_date') final  DateTime endDate;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseSchedule&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.location, location) || other.location == location)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,courseId,classId,teacherId,slotId,dayOfWeek,location,startDate,endDate);

@override
String toString() {
  return 'CourseSchedule(id: $id, schoolId: $schoolId, courseId: $courseId, classId: $classId, teacherId: $teacherId, slotId: $slotId, dayOfWeek: $dayOfWeek, location: $location, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$CourseScheduleCopyWith<$Res> implements $CourseScheduleCopyWith<$Res> {
  factory _$CourseScheduleCopyWith(_CourseSchedule value, $Res Function(_CourseSchedule) _then) = __$CourseScheduleCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'school_id') String schoolId,@JsonKey(name: 'course_id') String courseId,@JsonKey(name: 'class_id') String classId,@JsonKey(name: 'teacher_id') String teacherId,@JsonKey(name: 'slot_id') String slotId,@JsonKey(name: 'day_of_week') int dayOfWeek, String? location,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? schoolId = null,Object? courseId = null,Object? classId = null,Object? teacherId = null,Object? slotId = null,Object? dayOfWeek = null,Object? location = freezed,Object? startDate = null,Object? endDate = null,}) {
  return _then(_CourseSchedule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,slotId: null == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
