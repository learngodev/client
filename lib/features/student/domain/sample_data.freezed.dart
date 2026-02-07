// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sample_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StudentScheduleItem implements DiagnosticableTreeMixin {

 String get course; String get teacher; String get dayLabel; String get timeRange; String get startTime; String get location; StudentScheduleType get type; bool get isOnline; String? get slotId; String? get slotName; int? get weekDay;
/// Create a copy of StudentScheduleItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentScheduleItemCopyWith<StudentScheduleItem> get copyWith => _$StudentScheduleItemCopyWithImpl<StudentScheduleItem>(this as StudentScheduleItem, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentScheduleItem'))
    ..add(DiagnosticsProperty('course', course))..add(DiagnosticsProperty('teacher', teacher))..add(DiagnosticsProperty('dayLabel', dayLabel))..add(DiagnosticsProperty('timeRange', timeRange))..add(DiagnosticsProperty('startTime', startTime))..add(DiagnosticsProperty('location', location))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('isOnline', isOnline))..add(DiagnosticsProperty('slotId', slotId))..add(DiagnosticsProperty('slotName', slotName))..add(DiagnosticsProperty('weekDay', weekDay));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentScheduleItem&&(identical(other.course, course) || other.course == course)&&(identical(other.teacher, teacher) || other.teacher == teacher)&&(identical(other.dayLabel, dayLabel) || other.dayLabel == dayLabel)&&(identical(other.timeRange, timeRange) || other.timeRange == timeRange)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.location, location) || other.location == location)&&(identical(other.type, type) || other.type == type)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.slotName, slotName) || other.slotName == slotName)&&(identical(other.weekDay, weekDay) || other.weekDay == weekDay));
}


@override
int get hashCode => Object.hash(runtimeType,course,teacher,dayLabel,timeRange,startTime,location,type,isOnline,slotId,slotName,weekDay);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentScheduleItem(course: $course, teacher: $teacher, dayLabel: $dayLabel, timeRange: $timeRange, startTime: $startTime, location: $location, type: $type, isOnline: $isOnline, slotId: $slotId, slotName: $slotName, weekDay: $weekDay)';
}


}

/// @nodoc
abstract mixin class $StudentScheduleItemCopyWith<$Res>  {
  factory $StudentScheduleItemCopyWith(StudentScheduleItem value, $Res Function(StudentScheduleItem) _then) = _$StudentScheduleItemCopyWithImpl;
@useResult
$Res call({
 String course, String teacher, String dayLabel, String timeRange, String startTime, String location, StudentScheduleType type, bool isOnline, String? slotId, String? slotName, int? weekDay
});




}
/// @nodoc
class _$StudentScheduleItemCopyWithImpl<$Res>
    implements $StudentScheduleItemCopyWith<$Res> {
  _$StudentScheduleItemCopyWithImpl(this._self, this._then);

  final StudentScheduleItem _self;
  final $Res Function(StudentScheduleItem) _then;

/// Create a copy of StudentScheduleItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? course = null,Object? teacher = null,Object? dayLabel = null,Object? timeRange = null,Object? startTime = null,Object? location = null,Object? type = null,Object? isOnline = null,Object? slotId = freezed,Object? slotName = freezed,Object? weekDay = freezed,}) {
  return _then(_self.copyWith(
course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as String,teacher: null == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as String,dayLabel: null == dayLabel ? _self.dayLabel : dayLabel // ignore: cast_nullable_to_non_nullable
as String,timeRange: null == timeRange ? _self.timeRange : timeRange // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StudentScheduleType,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,slotId: freezed == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as String?,slotName: freezed == slotName ? _self.slotName : slotName // ignore: cast_nullable_to_non_nullable
as String?,weekDay: freezed == weekDay ? _self.weekDay : weekDay // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentScheduleItem].
extension StudentScheduleItemPatterns on StudentScheduleItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentScheduleItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentScheduleItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentScheduleItem value)  $default,){
final _that = this;
switch (_that) {
case _StudentScheduleItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentScheduleItem value)?  $default,){
final _that = this;
switch (_that) {
case _StudentScheduleItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String course,  String teacher,  String dayLabel,  String timeRange,  String startTime,  String location,  StudentScheduleType type,  bool isOnline,  String? slotId,  String? slotName,  int? weekDay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentScheduleItem() when $default != null:
return $default(_that.course,_that.teacher,_that.dayLabel,_that.timeRange,_that.startTime,_that.location,_that.type,_that.isOnline,_that.slotId,_that.slotName,_that.weekDay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String course,  String teacher,  String dayLabel,  String timeRange,  String startTime,  String location,  StudentScheduleType type,  bool isOnline,  String? slotId,  String? slotName,  int? weekDay)  $default,) {final _that = this;
switch (_that) {
case _StudentScheduleItem():
return $default(_that.course,_that.teacher,_that.dayLabel,_that.timeRange,_that.startTime,_that.location,_that.type,_that.isOnline,_that.slotId,_that.slotName,_that.weekDay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String course,  String teacher,  String dayLabel,  String timeRange,  String startTime,  String location,  StudentScheduleType type,  bool isOnline,  String? slotId,  String? slotName,  int? weekDay)?  $default,) {final _that = this;
switch (_that) {
case _StudentScheduleItem() when $default != null:
return $default(_that.course,_that.teacher,_that.dayLabel,_that.timeRange,_that.startTime,_that.location,_that.type,_that.isOnline,_that.slotId,_that.slotName,_that.weekDay);case _:
  return null;

}
}

}

/// @nodoc


class _StudentScheduleItem extends StudentScheduleItem with DiagnosticableTreeMixin {
  const _StudentScheduleItem({required this.course, required this.teacher, required this.dayLabel, required this.timeRange, required this.startTime, required this.location, required this.type, this.isOnline = false, this.slotId, this.slotName, this.weekDay}): super._();
  

@override final  String course;
@override final  String teacher;
@override final  String dayLabel;
@override final  String timeRange;
@override final  String startTime;
@override final  String location;
@override final  StudentScheduleType type;
@override@JsonKey() final  bool isOnline;
@override final  String? slotId;
@override final  String? slotName;
@override final  int? weekDay;

/// Create a copy of StudentScheduleItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentScheduleItemCopyWith<_StudentScheduleItem> get copyWith => __$StudentScheduleItemCopyWithImpl<_StudentScheduleItem>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentScheduleItem'))
    ..add(DiagnosticsProperty('course', course))..add(DiagnosticsProperty('teacher', teacher))..add(DiagnosticsProperty('dayLabel', dayLabel))..add(DiagnosticsProperty('timeRange', timeRange))..add(DiagnosticsProperty('startTime', startTime))..add(DiagnosticsProperty('location', location))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('isOnline', isOnline))..add(DiagnosticsProperty('slotId', slotId))..add(DiagnosticsProperty('slotName', slotName))..add(DiagnosticsProperty('weekDay', weekDay));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentScheduleItem&&(identical(other.course, course) || other.course == course)&&(identical(other.teacher, teacher) || other.teacher == teacher)&&(identical(other.dayLabel, dayLabel) || other.dayLabel == dayLabel)&&(identical(other.timeRange, timeRange) || other.timeRange == timeRange)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.location, location) || other.location == location)&&(identical(other.type, type) || other.type == type)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.slotName, slotName) || other.slotName == slotName)&&(identical(other.weekDay, weekDay) || other.weekDay == weekDay));
}


@override
int get hashCode => Object.hash(runtimeType,course,teacher,dayLabel,timeRange,startTime,location,type,isOnline,slotId,slotName,weekDay);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentScheduleItem(course: $course, teacher: $teacher, dayLabel: $dayLabel, timeRange: $timeRange, startTime: $startTime, location: $location, type: $type, isOnline: $isOnline, slotId: $slotId, slotName: $slotName, weekDay: $weekDay)';
}


}

/// @nodoc
abstract mixin class _$StudentScheduleItemCopyWith<$Res> implements $StudentScheduleItemCopyWith<$Res> {
  factory _$StudentScheduleItemCopyWith(_StudentScheduleItem value, $Res Function(_StudentScheduleItem) _then) = __$StudentScheduleItemCopyWithImpl;
@override @useResult
$Res call({
 String course, String teacher, String dayLabel, String timeRange, String startTime, String location, StudentScheduleType type, bool isOnline, String? slotId, String? slotName, int? weekDay
});




}
/// @nodoc
class __$StudentScheduleItemCopyWithImpl<$Res>
    implements _$StudentScheduleItemCopyWith<$Res> {
  __$StudentScheduleItemCopyWithImpl(this._self, this._then);

  final _StudentScheduleItem _self;
  final $Res Function(_StudentScheduleItem) _then;

/// Create a copy of StudentScheduleItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? course = null,Object? teacher = null,Object? dayLabel = null,Object? timeRange = null,Object? startTime = null,Object? location = null,Object? type = null,Object? isOnline = null,Object? slotId = freezed,Object? slotName = freezed,Object? weekDay = freezed,}) {
  return _then(_StudentScheduleItem(
course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as String,teacher: null == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as String,dayLabel: null == dayLabel ? _self.dayLabel : dayLabel // ignore: cast_nullable_to_non_nullable
as String,timeRange: null == timeRange ? _self.timeRange : timeRange // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StudentScheduleType,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,slotId: freezed == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as String?,slotName: freezed == slotName ? _self.slotName : slotName // ignore: cast_nullable_to_non_nullable
as String?,weekDay: freezed == weekDay ? _self.weekDay : weekDay // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$StudentReminderItem implements DiagnosticableTreeMixin {

 String get id; String get title; String get description; String get timeLabel; IconData get icon; StudentReminderPriority get priority; String? get route; bool get isCompleted; bool get isCustom;
/// Create a copy of StudentReminderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentReminderItemCopyWith<StudentReminderItem> get copyWith => _$StudentReminderItemCopyWithImpl<StudentReminderItem>(this as StudentReminderItem, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentReminderItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('timeLabel', timeLabel))..add(DiagnosticsProperty('icon', icon))..add(DiagnosticsProperty('priority', priority))..add(DiagnosticsProperty('route', route))..add(DiagnosticsProperty('isCompleted', isCompleted))..add(DiagnosticsProperty('isCustom', isCustom));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentReminderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.timeLabel, timeLabel) || other.timeLabel == timeLabel)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.route, route) || other.route == route)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,timeLabel,icon,priority,route,isCompleted,isCustom);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentReminderItem(id: $id, title: $title, description: $description, timeLabel: $timeLabel, icon: $icon, priority: $priority, route: $route, isCompleted: $isCompleted, isCustom: $isCustom)';
}


}

/// @nodoc
abstract mixin class $StudentReminderItemCopyWith<$Res>  {
  factory $StudentReminderItemCopyWith(StudentReminderItem value, $Res Function(StudentReminderItem) _then) = _$StudentReminderItemCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, String timeLabel, IconData icon, StudentReminderPriority priority, String? route, bool isCompleted, bool isCustom
});




}
/// @nodoc
class _$StudentReminderItemCopyWithImpl<$Res>
    implements $StudentReminderItemCopyWith<$Res> {
  _$StudentReminderItemCopyWithImpl(this._self, this._then);

  final StudentReminderItem _self;
  final $Res Function(StudentReminderItem) _then;

/// Create a copy of StudentReminderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? timeLabel = null,Object? icon = null,Object? priority = null,Object? route = freezed,Object? isCompleted = null,Object? isCustom = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,timeLabel: null == timeLabel ? _self.timeLabel : timeLabel // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as StudentReminderPriority,route: freezed == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentReminderItem].
extension StudentReminderItemPatterns on StudentReminderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentReminderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentReminderItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentReminderItem value)  $default,){
final _that = this;
switch (_that) {
case _StudentReminderItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentReminderItem value)?  $default,){
final _that = this;
switch (_that) {
case _StudentReminderItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String timeLabel,  IconData icon,  StudentReminderPriority priority,  String? route,  bool isCompleted,  bool isCustom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentReminderItem() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.timeLabel,_that.icon,_that.priority,_that.route,_that.isCompleted,_that.isCustom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String timeLabel,  IconData icon,  StudentReminderPriority priority,  String? route,  bool isCompleted,  bool isCustom)  $default,) {final _that = this;
switch (_that) {
case _StudentReminderItem():
return $default(_that.id,_that.title,_that.description,_that.timeLabel,_that.icon,_that.priority,_that.route,_that.isCompleted,_that.isCustom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  String timeLabel,  IconData icon,  StudentReminderPriority priority,  String? route,  bool isCompleted,  bool isCustom)?  $default,) {final _that = this;
switch (_that) {
case _StudentReminderItem() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.timeLabel,_that.icon,_that.priority,_that.route,_that.isCompleted,_that.isCustom);case _:
  return null;

}
}

}

/// @nodoc


class _StudentReminderItem extends StudentReminderItem with DiagnosticableTreeMixin {
  const _StudentReminderItem({required this.id, required this.title, required this.description, required this.timeLabel, required this.icon, this.priority = StudentReminderPriority.normal, this.route, this.isCompleted = false, this.isCustom = false}): super._();
  

@override final  String id;
@override final  String title;
@override final  String description;
@override final  String timeLabel;
@override final  IconData icon;
@override@JsonKey() final  StudentReminderPriority priority;
@override final  String? route;
@override@JsonKey() final  bool isCompleted;
@override@JsonKey() final  bool isCustom;

/// Create a copy of StudentReminderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentReminderItemCopyWith<_StudentReminderItem> get copyWith => __$StudentReminderItemCopyWithImpl<_StudentReminderItem>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentReminderItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('timeLabel', timeLabel))..add(DiagnosticsProperty('icon', icon))..add(DiagnosticsProperty('priority', priority))..add(DiagnosticsProperty('route', route))..add(DiagnosticsProperty('isCompleted', isCompleted))..add(DiagnosticsProperty('isCustom', isCustom));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentReminderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.timeLabel, timeLabel) || other.timeLabel == timeLabel)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.route, route) || other.route == route)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,timeLabel,icon,priority,route,isCompleted,isCustom);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentReminderItem(id: $id, title: $title, description: $description, timeLabel: $timeLabel, icon: $icon, priority: $priority, route: $route, isCompleted: $isCompleted, isCustom: $isCustom)';
}


}

/// @nodoc
abstract mixin class _$StudentReminderItemCopyWith<$Res> implements $StudentReminderItemCopyWith<$Res> {
  factory _$StudentReminderItemCopyWith(_StudentReminderItem value, $Res Function(_StudentReminderItem) _then) = __$StudentReminderItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, String timeLabel, IconData icon, StudentReminderPriority priority, String? route, bool isCompleted, bool isCustom
});




}
/// @nodoc
class __$StudentReminderItemCopyWithImpl<$Res>
    implements _$StudentReminderItemCopyWith<$Res> {
  __$StudentReminderItemCopyWithImpl(this._self, this._then);

  final _StudentReminderItem _self;
  final $Res Function(_StudentReminderItem) _then;

/// Create a copy of StudentReminderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? timeLabel = null,Object? icon = null,Object? priority = null,Object? route = freezed,Object? isCompleted = null,Object? isCustom = null,}) {
  return _then(_StudentReminderItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,timeLabel: null == timeLabel ? _self.timeLabel : timeLabel // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as StudentReminderPriority,route: freezed == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$StudentAssignmentItem implements DiagnosticableTreeMixin {

 String get id; String get title; String get course; String get teacher; String get dueLabel; StudentAssignmentStatus get status; int get progress; bool get allowResubmit; bool get isOverdue; String? get scoreLabel; String? get feedback; DateTime? get dueAt; DateTime? get startAt;
/// Create a copy of StudentAssignmentItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentAssignmentItemCopyWith<StudentAssignmentItem> get copyWith => _$StudentAssignmentItemCopyWithImpl<StudentAssignmentItem>(this as StudentAssignmentItem, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentAssignmentItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('course', course))..add(DiagnosticsProperty('teacher', teacher))..add(DiagnosticsProperty('dueLabel', dueLabel))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('progress', progress))..add(DiagnosticsProperty('allowResubmit', allowResubmit))..add(DiagnosticsProperty('isOverdue', isOverdue))..add(DiagnosticsProperty('scoreLabel', scoreLabel))..add(DiagnosticsProperty('feedback', feedback))..add(DiagnosticsProperty('dueAt', dueAt))..add(DiagnosticsProperty('startAt', startAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentAssignmentItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.course, course) || other.course == course)&&(identical(other.teacher, teacher) || other.teacher == teacher)&&(identical(other.dueLabel, dueLabel) || other.dueLabel == dueLabel)&&(identical(other.status, status) || other.status == status)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.allowResubmit, allowResubmit) || other.allowResubmit == allowResubmit)&&(identical(other.isOverdue, isOverdue) || other.isOverdue == isOverdue)&&(identical(other.scoreLabel, scoreLabel) || other.scoreLabel == scoreLabel)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&(identical(other.startAt, startAt) || other.startAt == startAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,course,teacher,dueLabel,status,progress,allowResubmit,isOverdue,scoreLabel,feedback,dueAt,startAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentAssignmentItem(id: $id, title: $title, course: $course, teacher: $teacher, dueLabel: $dueLabel, status: $status, progress: $progress, allowResubmit: $allowResubmit, isOverdue: $isOverdue, scoreLabel: $scoreLabel, feedback: $feedback, dueAt: $dueAt, startAt: $startAt)';
}


}

/// @nodoc
abstract mixin class $StudentAssignmentItemCopyWith<$Res>  {
  factory $StudentAssignmentItemCopyWith(StudentAssignmentItem value, $Res Function(StudentAssignmentItem) _then) = _$StudentAssignmentItemCopyWithImpl;
@useResult
$Res call({
 String id, String title, String course, String teacher, String dueLabel, StudentAssignmentStatus status, int progress, bool allowResubmit, bool isOverdue, String? scoreLabel, String? feedback, DateTime? dueAt, DateTime? startAt
});




}
/// @nodoc
class _$StudentAssignmentItemCopyWithImpl<$Res>
    implements $StudentAssignmentItemCopyWith<$Res> {
  _$StudentAssignmentItemCopyWithImpl(this._self, this._then);

  final StudentAssignmentItem _self;
  final $Res Function(StudentAssignmentItem) _then;

/// Create a copy of StudentAssignmentItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? course = null,Object? teacher = null,Object? dueLabel = null,Object? status = null,Object? progress = null,Object? allowResubmit = null,Object? isOverdue = null,Object? scoreLabel = freezed,Object? feedback = freezed,Object? dueAt = freezed,Object? startAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as String,teacher: null == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as String,dueLabel: null == dueLabel ? _self.dueLabel : dueLabel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StudentAssignmentStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,allowResubmit: null == allowResubmit ? _self.allowResubmit : allowResubmit // ignore: cast_nullable_to_non_nullable
as bool,isOverdue: null == isOverdue ? _self.isOverdue : isOverdue // ignore: cast_nullable_to_non_nullable
as bool,scoreLabel: freezed == scoreLabel ? _self.scoreLabel : scoreLabel // ignore: cast_nullable_to_non_nullable
as String?,feedback: freezed == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String?,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentAssignmentItem].
extension StudentAssignmentItemPatterns on StudentAssignmentItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentAssignmentItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentAssignmentItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentAssignmentItem value)  $default,){
final _that = this;
switch (_that) {
case _StudentAssignmentItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentAssignmentItem value)?  $default,){
final _that = this;
switch (_that) {
case _StudentAssignmentItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String course,  String teacher,  String dueLabel,  StudentAssignmentStatus status,  int progress,  bool allowResubmit,  bool isOverdue,  String? scoreLabel,  String? feedback,  DateTime? dueAt,  DateTime? startAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentAssignmentItem() when $default != null:
return $default(_that.id,_that.title,_that.course,_that.teacher,_that.dueLabel,_that.status,_that.progress,_that.allowResubmit,_that.isOverdue,_that.scoreLabel,_that.feedback,_that.dueAt,_that.startAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String course,  String teacher,  String dueLabel,  StudentAssignmentStatus status,  int progress,  bool allowResubmit,  bool isOverdue,  String? scoreLabel,  String? feedback,  DateTime? dueAt,  DateTime? startAt)  $default,) {final _that = this;
switch (_that) {
case _StudentAssignmentItem():
return $default(_that.id,_that.title,_that.course,_that.teacher,_that.dueLabel,_that.status,_that.progress,_that.allowResubmit,_that.isOverdue,_that.scoreLabel,_that.feedback,_that.dueAt,_that.startAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String course,  String teacher,  String dueLabel,  StudentAssignmentStatus status,  int progress,  bool allowResubmit,  bool isOverdue,  String? scoreLabel,  String? feedback,  DateTime? dueAt,  DateTime? startAt)?  $default,) {final _that = this;
switch (_that) {
case _StudentAssignmentItem() when $default != null:
return $default(_that.id,_that.title,_that.course,_that.teacher,_that.dueLabel,_that.status,_that.progress,_that.allowResubmit,_that.isOverdue,_that.scoreLabel,_that.feedback,_that.dueAt,_that.startAt);case _:
  return null;

}
}

}

/// @nodoc


class _StudentAssignmentItem extends StudentAssignmentItem with DiagnosticableTreeMixin {
  const _StudentAssignmentItem({required this.id, required this.title, required this.course, required this.teacher, required this.dueLabel, required this.status, this.progress = 0, this.allowResubmit = false, this.isOverdue = false, this.scoreLabel, this.feedback, this.dueAt, this.startAt}): super._();
  

@override final  String id;
@override final  String title;
@override final  String course;
@override final  String teacher;
@override final  String dueLabel;
@override final  StudentAssignmentStatus status;
@override@JsonKey() final  int progress;
@override@JsonKey() final  bool allowResubmit;
@override@JsonKey() final  bool isOverdue;
@override final  String? scoreLabel;
@override final  String? feedback;
@override final  DateTime? dueAt;
@override final  DateTime? startAt;

/// Create a copy of StudentAssignmentItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentAssignmentItemCopyWith<_StudentAssignmentItem> get copyWith => __$StudentAssignmentItemCopyWithImpl<_StudentAssignmentItem>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentAssignmentItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('course', course))..add(DiagnosticsProperty('teacher', teacher))..add(DiagnosticsProperty('dueLabel', dueLabel))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('progress', progress))..add(DiagnosticsProperty('allowResubmit', allowResubmit))..add(DiagnosticsProperty('isOverdue', isOverdue))..add(DiagnosticsProperty('scoreLabel', scoreLabel))..add(DiagnosticsProperty('feedback', feedback))..add(DiagnosticsProperty('dueAt', dueAt))..add(DiagnosticsProperty('startAt', startAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentAssignmentItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.course, course) || other.course == course)&&(identical(other.teacher, teacher) || other.teacher == teacher)&&(identical(other.dueLabel, dueLabel) || other.dueLabel == dueLabel)&&(identical(other.status, status) || other.status == status)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.allowResubmit, allowResubmit) || other.allowResubmit == allowResubmit)&&(identical(other.isOverdue, isOverdue) || other.isOverdue == isOverdue)&&(identical(other.scoreLabel, scoreLabel) || other.scoreLabel == scoreLabel)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&(identical(other.startAt, startAt) || other.startAt == startAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,course,teacher,dueLabel,status,progress,allowResubmit,isOverdue,scoreLabel,feedback,dueAt,startAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentAssignmentItem(id: $id, title: $title, course: $course, teacher: $teacher, dueLabel: $dueLabel, status: $status, progress: $progress, allowResubmit: $allowResubmit, isOverdue: $isOverdue, scoreLabel: $scoreLabel, feedback: $feedback, dueAt: $dueAt, startAt: $startAt)';
}


}

/// @nodoc
abstract mixin class _$StudentAssignmentItemCopyWith<$Res> implements $StudentAssignmentItemCopyWith<$Res> {
  factory _$StudentAssignmentItemCopyWith(_StudentAssignmentItem value, $Res Function(_StudentAssignmentItem) _then) = __$StudentAssignmentItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String course, String teacher, String dueLabel, StudentAssignmentStatus status, int progress, bool allowResubmit, bool isOverdue, String? scoreLabel, String? feedback, DateTime? dueAt, DateTime? startAt
});




}
/// @nodoc
class __$StudentAssignmentItemCopyWithImpl<$Res>
    implements _$StudentAssignmentItemCopyWith<$Res> {
  __$StudentAssignmentItemCopyWithImpl(this._self, this._then);

  final _StudentAssignmentItem _self;
  final $Res Function(_StudentAssignmentItem) _then;

/// Create a copy of StudentAssignmentItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? course = null,Object? teacher = null,Object? dueLabel = null,Object? status = null,Object? progress = null,Object? allowResubmit = null,Object? isOverdue = null,Object? scoreLabel = freezed,Object? feedback = freezed,Object? dueAt = freezed,Object? startAt = freezed,}) {
  return _then(_StudentAssignmentItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as String,teacher: null == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as String,dueLabel: null == dueLabel ? _self.dueLabel : dueLabel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StudentAssignmentStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,allowResubmit: null == allowResubmit ? _self.allowResubmit : allowResubmit // ignore: cast_nullable_to_non_nullable
as bool,isOverdue: null == isOverdue ? _self.isOverdue : isOverdue // ignore: cast_nullable_to_non_nullable
as bool,scoreLabel: freezed == scoreLabel ? _self.scoreLabel : scoreLabel // ignore: cast_nullable_to_non_nullable
as String?,feedback: freezed == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String?,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$StudentExamItem implements DiagnosticableTreeMixin {

 String get id; String get course; String get dateLabel; String get timeRange; String get location; StudentExamStatus get status; String get countdownLabel; String? get seat; String? get scoreLabel; DateTime? get startAt; DateTime? get endAt;
/// Create a copy of StudentExamItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentExamItemCopyWith<StudentExamItem> get copyWith => _$StudentExamItemCopyWithImpl<StudentExamItem>(this as StudentExamItem, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentExamItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('course', course))..add(DiagnosticsProperty('dateLabel', dateLabel))..add(DiagnosticsProperty('timeRange', timeRange))..add(DiagnosticsProperty('location', location))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('countdownLabel', countdownLabel))..add(DiagnosticsProperty('seat', seat))..add(DiagnosticsProperty('scoreLabel', scoreLabel))..add(DiagnosticsProperty('startAt', startAt))..add(DiagnosticsProperty('endAt', endAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentExamItem&&(identical(other.id, id) || other.id == id)&&(identical(other.course, course) || other.course == course)&&(identical(other.dateLabel, dateLabel) || other.dateLabel == dateLabel)&&(identical(other.timeRange, timeRange) || other.timeRange == timeRange)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.countdownLabel, countdownLabel) || other.countdownLabel == countdownLabel)&&(identical(other.seat, seat) || other.seat == seat)&&(identical(other.scoreLabel, scoreLabel) || other.scoreLabel == scoreLabel)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,course,dateLabel,timeRange,location,status,countdownLabel,seat,scoreLabel,startAt,endAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentExamItem(id: $id, course: $course, dateLabel: $dateLabel, timeRange: $timeRange, location: $location, status: $status, countdownLabel: $countdownLabel, seat: $seat, scoreLabel: $scoreLabel, startAt: $startAt, endAt: $endAt)';
}


}

/// @nodoc
abstract mixin class $StudentExamItemCopyWith<$Res>  {
  factory $StudentExamItemCopyWith(StudentExamItem value, $Res Function(StudentExamItem) _then) = _$StudentExamItemCopyWithImpl;
@useResult
$Res call({
 String id, String course, String dateLabel, String timeRange, String location, StudentExamStatus status, String countdownLabel, String? seat, String? scoreLabel, DateTime? startAt, DateTime? endAt
});




}
/// @nodoc
class _$StudentExamItemCopyWithImpl<$Res>
    implements $StudentExamItemCopyWith<$Res> {
  _$StudentExamItemCopyWithImpl(this._self, this._then);

  final StudentExamItem _self;
  final $Res Function(StudentExamItem) _then;

/// Create a copy of StudentExamItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? course = null,Object? dateLabel = null,Object? timeRange = null,Object? location = null,Object? status = null,Object? countdownLabel = null,Object? seat = freezed,Object? scoreLabel = freezed,Object? startAt = freezed,Object? endAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as String,dateLabel: null == dateLabel ? _self.dateLabel : dateLabel // ignore: cast_nullable_to_non_nullable
as String,timeRange: null == timeRange ? _self.timeRange : timeRange // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StudentExamStatus,countdownLabel: null == countdownLabel ? _self.countdownLabel : countdownLabel // ignore: cast_nullable_to_non_nullable
as String,seat: freezed == seat ? _self.seat : seat // ignore: cast_nullable_to_non_nullable
as String?,scoreLabel: freezed == scoreLabel ? _self.scoreLabel : scoreLabel // ignore: cast_nullable_to_non_nullable
as String?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentExamItem].
extension StudentExamItemPatterns on StudentExamItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentExamItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentExamItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentExamItem value)  $default,){
final _that = this;
switch (_that) {
case _StudentExamItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentExamItem value)?  $default,){
final _that = this;
switch (_that) {
case _StudentExamItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String course,  String dateLabel,  String timeRange,  String location,  StudentExamStatus status,  String countdownLabel,  String? seat,  String? scoreLabel,  DateTime? startAt,  DateTime? endAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentExamItem() when $default != null:
return $default(_that.id,_that.course,_that.dateLabel,_that.timeRange,_that.location,_that.status,_that.countdownLabel,_that.seat,_that.scoreLabel,_that.startAt,_that.endAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String course,  String dateLabel,  String timeRange,  String location,  StudentExamStatus status,  String countdownLabel,  String? seat,  String? scoreLabel,  DateTime? startAt,  DateTime? endAt)  $default,) {final _that = this;
switch (_that) {
case _StudentExamItem():
return $default(_that.id,_that.course,_that.dateLabel,_that.timeRange,_that.location,_that.status,_that.countdownLabel,_that.seat,_that.scoreLabel,_that.startAt,_that.endAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String course,  String dateLabel,  String timeRange,  String location,  StudentExamStatus status,  String countdownLabel,  String? seat,  String? scoreLabel,  DateTime? startAt,  DateTime? endAt)?  $default,) {final _that = this;
switch (_that) {
case _StudentExamItem() when $default != null:
return $default(_that.id,_that.course,_that.dateLabel,_that.timeRange,_that.location,_that.status,_that.countdownLabel,_that.seat,_that.scoreLabel,_that.startAt,_that.endAt);case _:
  return null;

}
}

}

/// @nodoc


class _StudentExamItem extends StudentExamItem with DiagnosticableTreeMixin {
  const _StudentExamItem({required this.id, required this.course, required this.dateLabel, required this.timeRange, required this.location, required this.status, required this.countdownLabel, this.seat, this.scoreLabel, this.startAt, this.endAt}): super._();
  

@override final  String id;
@override final  String course;
@override final  String dateLabel;
@override final  String timeRange;
@override final  String location;
@override final  StudentExamStatus status;
@override final  String countdownLabel;
@override final  String? seat;
@override final  String? scoreLabel;
@override final  DateTime? startAt;
@override final  DateTime? endAt;

/// Create a copy of StudentExamItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentExamItemCopyWith<_StudentExamItem> get copyWith => __$StudentExamItemCopyWithImpl<_StudentExamItem>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentExamItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('course', course))..add(DiagnosticsProperty('dateLabel', dateLabel))..add(DiagnosticsProperty('timeRange', timeRange))..add(DiagnosticsProperty('location', location))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('countdownLabel', countdownLabel))..add(DiagnosticsProperty('seat', seat))..add(DiagnosticsProperty('scoreLabel', scoreLabel))..add(DiagnosticsProperty('startAt', startAt))..add(DiagnosticsProperty('endAt', endAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentExamItem&&(identical(other.id, id) || other.id == id)&&(identical(other.course, course) || other.course == course)&&(identical(other.dateLabel, dateLabel) || other.dateLabel == dateLabel)&&(identical(other.timeRange, timeRange) || other.timeRange == timeRange)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.countdownLabel, countdownLabel) || other.countdownLabel == countdownLabel)&&(identical(other.seat, seat) || other.seat == seat)&&(identical(other.scoreLabel, scoreLabel) || other.scoreLabel == scoreLabel)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,course,dateLabel,timeRange,location,status,countdownLabel,seat,scoreLabel,startAt,endAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentExamItem(id: $id, course: $course, dateLabel: $dateLabel, timeRange: $timeRange, location: $location, status: $status, countdownLabel: $countdownLabel, seat: $seat, scoreLabel: $scoreLabel, startAt: $startAt, endAt: $endAt)';
}


}

/// @nodoc
abstract mixin class _$StudentExamItemCopyWith<$Res> implements $StudentExamItemCopyWith<$Res> {
  factory _$StudentExamItemCopyWith(_StudentExamItem value, $Res Function(_StudentExamItem) _then) = __$StudentExamItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String course, String dateLabel, String timeRange, String location, StudentExamStatus status, String countdownLabel, String? seat, String? scoreLabel, DateTime? startAt, DateTime? endAt
});




}
/// @nodoc
class __$StudentExamItemCopyWithImpl<$Res>
    implements _$StudentExamItemCopyWith<$Res> {
  __$StudentExamItemCopyWithImpl(this._self, this._then);

  final _StudentExamItem _self;
  final $Res Function(_StudentExamItem) _then;

/// Create a copy of StudentExamItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? course = null,Object? dateLabel = null,Object? timeRange = null,Object? location = null,Object? status = null,Object? countdownLabel = null,Object? seat = freezed,Object? scoreLabel = freezed,Object? startAt = freezed,Object? endAt = freezed,}) {
  return _then(_StudentExamItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as String,dateLabel: null == dateLabel ? _self.dateLabel : dateLabel // ignore: cast_nullable_to_non_nullable
as String,timeRange: null == timeRange ? _self.timeRange : timeRange // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StudentExamStatus,countdownLabel: null == countdownLabel ? _self.countdownLabel : countdownLabel // ignore: cast_nullable_to_non_nullable
as String,seat: freezed == seat ? _self.seat : seat // ignore: cast_nullable_to_non_nullable
as String?,scoreLabel: freezed == scoreLabel ? _self.scoreLabel : scoreLabel // ignore: cast_nullable_to_non_nullable
as String?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$StudentNoteItem implements DiagnosticableTreeMixin {

 String get id; String get title; String get updatedAtLabel; String get preview; List<String> get tags; bool get pinned;
/// Create a copy of StudentNoteItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentNoteItemCopyWith<StudentNoteItem> get copyWith => _$StudentNoteItemCopyWithImpl<StudentNoteItem>(this as StudentNoteItem, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentNoteItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('updatedAtLabel', updatedAtLabel))..add(DiagnosticsProperty('preview', preview))..add(DiagnosticsProperty('tags', tags))..add(DiagnosticsProperty('pinned', pinned));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentNoteItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.updatedAtLabel, updatedAtLabel) || other.updatedAtLabel == updatedAtLabel)&&(identical(other.preview, preview) || other.preview == preview)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.pinned, pinned) || other.pinned == pinned));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,updatedAtLabel,preview,const DeepCollectionEquality().hash(tags),pinned);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentNoteItem(id: $id, title: $title, updatedAtLabel: $updatedAtLabel, preview: $preview, tags: $tags, pinned: $pinned)';
}


}

/// @nodoc
abstract mixin class $StudentNoteItemCopyWith<$Res>  {
  factory $StudentNoteItemCopyWith(StudentNoteItem value, $Res Function(StudentNoteItem) _then) = _$StudentNoteItemCopyWithImpl;
@useResult
$Res call({
 String id, String title, String updatedAtLabel, String preview, List<String> tags, bool pinned
});




}
/// @nodoc
class _$StudentNoteItemCopyWithImpl<$Res>
    implements $StudentNoteItemCopyWith<$Res> {
  _$StudentNoteItemCopyWithImpl(this._self, this._then);

  final StudentNoteItem _self;
  final $Res Function(StudentNoteItem) _then;

/// Create a copy of StudentNoteItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? updatedAtLabel = null,Object? preview = null,Object? tags = null,Object? pinned = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,updatedAtLabel: null == updatedAtLabel ? _self.updatedAtLabel : updatedAtLabel // ignore: cast_nullable_to_non_nullable
as String,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,pinned: null == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentNoteItem].
extension StudentNoteItemPatterns on StudentNoteItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentNoteItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentNoteItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentNoteItem value)  $default,){
final _that = this;
switch (_that) {
case _StudentNoteItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentNoteItem value)?  $default,){
final _that = this;
switch (_that) {
case _StudentNoteItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String updatedAtLabel,  String preview,  List<String> tags,  bool pinned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentNoteItem() when $default != null:
return $default(_that.id,_that.title,_that.updatedAtLabel,_that.preview,_that.tags,_that.pinned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String updatedAtLabel,  String preview,  List<String> tags,  bool pinned)  $default,) {final _that = this;
switch (_that) {
case _StudentNoteItem():
return $default(_that.id,_that.title,_that.updatedAtLabel,_that.preview,_that.tags,_that.pinned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String updatedAtLabel,  String preview,  List<String> tags,  bool pinned)?  $default,) {final _that = this;
switch (_that) {
case _StudentNoteItem() when $default != null:
return $default(_that.id,_that.title,_that.updatedAtLabel,_that.preview,_that.tags,_that.pinned);case _:
  return null;

}
}

}

/// @nodoc


class _StudentNoteItem extends StudentNoteItem with DiagnosticableTreeMixin {
  const _StudentNoteItem({required this.id, required this.title, required this.updatedAtLabel, required this.preview, final  List<String> tags = const [], this.pinned = false}): _tags = tags,super._();
  

@override final  String id;
@override final  String title;
@override final  String updatedAtLabel;
@override final  String preview;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  bool pinned;

/// Create a copy of StudentNoteItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentNoteItemCopyWith<_StudentNoteItem> get copyWith => __$StudentNoteItemCopyWithImpl<_StudentNoteItem>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentNoteItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('updatedAtLabel', updatedAtLabel))..add(DiagnosticsProperty('preview', preview))..add(DiagnosticsProperty('tags', tags))..add(DiagnosticsProperty('pinned', pinned));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentNoteItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.updatedAtLabel, updatedAtLabel) || other.updatedAtLabel == updatedAtLabel)&&(identical(other.preview, preview) || other.preview == preview)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.pinned, pinned) || other.pinned == pinned));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,updatedAtLabel,preview,const DeepCollectionEquality().hash(_tags),pinned);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentNoteItem(id: $id, title: $title, updatedAtLabel: $updatedAtLabel, preview: $preview, tags: $tags, pinned: $pinned)';
}


}

/// @nodoc
abstract mixin class _$StudentNoteItemCopyWith<$Res> implements $StudentNoteItemCopyWith<$Res> {
  factory _$StudentNoteItemCopyWith(_StudentNoteItem value, $Res Function(_StudentNoteItem) _then) = __$StudentNoteItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String updatedAtLabel, String preview, List<String> tags, bool pinned
});




}
/// @nodoc
class __$StudentNoteItemCopyWithImpl<$Res>
    implements _$StudentNoteItemCopyWith<$Res> {
  __$StudentNoteItemCopyWithImpl(this._self, this._then);

  final _StudentNoteItem _self;
  final $Res Function(_StudentNoteItem) _then;

/// Create a copy of StudentNoteItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? updatedAtLabel = null,Object? preview = null,Object? tags = null,Object? pinned = null,}) {
  return _then(_StudentNoteItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,updatedAtLabel: null == updatedAtLabel ? _self.updatedAtLabel : updatedAtLabel // ignore: cast_nullable_to_non_nullable
as String,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,pinned: null == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$StudentMessageItem implements DiagnosticableTreeMixin {

 String get sender; String get preview; String get timeLabel; StudentMessageCategory get category; int get unreadCount;
/// Create a copy of StudentMessageItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentMessageItemCopyWith<StudentMessageItem> get copyWith => _$StudentMessageItemCopyWithImpl<StudentMessageItem>(this as StudentMessageItem, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentMessageItem'))
    ..add(DiagnosticsProperty('sender', sender))..add(DiagnosticsProperty('preview', preview))..add(DiagnosticsProperty('timeLabel', timeLabel))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('unreadCount', unreadCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentMessageItem&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.timeLabel, timeLabel) || other.timeLabel == timeLabel)&&(identical(other.category, category) || other.category == category)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}


@override
int get hashCode => Object.hash(runtimeType,sender,preview,timeLabel,category,unreadCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentMessageItem(sender: $sender, preview: $preview, timeLabel: $timeLabel, category: $category, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class $StudentMessageItemCopyWith<$Res>  {
  factory $StudentMessageItemCopyWith(StudentMessageItem value, $Res Function(StudentMessageItem) _then) = _$StudentMessageItemCopyWithImpl;
@useResult
$Res call({
 String sender, String preview, String timeLabel, StudentMessageCategory category, int unreadCount
});




}
/// @nodoc
class _$StudentMessageItemCopyWithImpl<$Res>
    implements $StudentMessageItemCopyWith<$Res> {
  _$StudentMessageItemCopyWithImpl(this._self, this._then);

  final StudentMessageItem _self;
  final $Res Function(StudentMessageItem) _then;

/// Create a copy of StudentMessageItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sender = null,Object? preview = null,Object? timeLabel = null,Object? category = null,Object? unreadCount = null,}) {
  return _then(_self.copyWith(
sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as String,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String,timeLabel: null == timeLabel ? _self.timeLabel : timeLabel // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as StudentMessageCategory,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentMessageItem].
extension StudentMessageItemPatterns on StudentMessageItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentMessageItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentMessageItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentMessageItem value)  $default,){
final _that = this;
switch (_that) {
case _StudentMessageItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentMessageItem value)?  $default,){
final _that = this;
switch (_that) {
case _StudentMessageItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sender,  String preview,  String timeLabel,  StudentMessageCategory category,  int unreadCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentMessageItem() when $default != null:
return $default(_that.sender,_that.preview,_that.timeLabel,_that.category,_that.unreadCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sender,  String preview,  String timeLabel,  StudentMessageCategory category,  int unreadCount)  $default,) {final _that = this;
switch (_that) {
case _StudentMessageItem():
return $default(_that.sender,_that.preview,_that.timeLabel,_that.category,_that.unreadCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sender,  String preview,  String timeLabel,  StudentMessageCategory category,  int unreadCount)?  $default,) {final _that = this;
switch (_that) {
case _StudentMessageItem() when $default != null:
return $default(_that.sender,_that.preview,_that.timeLabel,_that.category,_that.unreadCount);case _:
  return null;

}
}

}

/// @nodoc


class _StudentMessageItem extends StudentMessageItem with DiagnosticableTreeMixin {
  const _StudentMessageItem({required this.sender, required this.preview, required this.timeLabel, required this.category, this.unreadCount = 0}): super._();
  

@override final  String sender;
@override final  String preview;
@override final  String timeLabel;
@override final  StudentMessageCategory category;
@override@JsonKey() final  int unreadCount;

/// Create a copy of StudentMessageItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentMessageItemCopyWith<_StudentMessageItem> get copyWith => __$StudentMessageItemCopyWithImpl<_StudentMessageItem>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentMessageItem'))
    ..add(DiagnosticsProperty('sender', sender))..add(DiagnosticsProperty('preview', preview))..add(DiagnosticsProperty('timeLabel', timeLabel))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('unreadCount', unreadCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentMessageItem&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.timeLabel, timeLabel) || other.timeLabel == timeLabel)&&(identical(other.category, category) || other.category == category)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}


@override
int get hashCode => Object.hash(runtimeType,sender,preview,timeLabel,category,unreadCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentMessageItem(sender: $sender, preview: $preview, timeLabel: $timeLabel, category: $category, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class _$StudentMessageItemCopyWith<$Res> implements $StudentMessageItemCopyWith<$Res> {
  factory _$StudentMessageItemCopyWith(_StudentMessageItem value, $Res Function(_StudentMessageItem) _then) = __$StudentMessageItemCopyWithImpl;
@override @useResult
$Res call({
 String sender, String preview, String timeLabel, StudentMessageCategory category, int unreadCount
});




}
/// @nodoc
class __$StudentMessageItemCopyWithImpl<$Res>
    implements _$StudentMessageItemCopyWith<$Res> {
  __$StudentMessageItemCopyWithImpl(this._self, this._then);

  final _StudentMessageItem _self;
  final $Res Function(_StudentMessageItem) _then;

/// Create a copy of StudentMessageItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sender = null,Object? preview = null,Object? timeLabel = null,Object? category = null,Object? unreadCount = null,}) {
  return _then(_StudentMessageItem(
sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as String,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String,timeLabel: null == timeLabel ? _self.timeLabel : timeLabel // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as StudentMessageCategory,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$StudentInsightItem implements DiagnosticableTreeMixin {

 String get label; String get value; double get progress; String get hint; bool get isAlert;
/// Create a copy of StudentInsightItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentInsightItemCopyWith<StudentInsightItem> get copyWith => _$StudentInsightItemCopyWithImpl<StudentInsightItem>(this as StudentInsightItem, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentInsightItem'))
    ..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('value', value))..add(DiagnosticsProperty('progress', progress))..add(DiagnosticsProperty('hint', hint))..add(DiagnosticsProperty('isAlert', isAlert));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentInsightItem&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.isAlert, isAlert) || other.isAlert == isAlert));
}


@override
int get hashCode => Object.hash(runtimeType,label,value,progress,hint,isAlert);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentInsightItem(label: $label, value: $value, progress: $progress, hint: $hint, isAlert: $isAlert)';
}


}

/// @nodoc
abstract mixin class $StudentInsightItemCopyWith<$Res>  {
  factory $StudentInsightItemCopyWith(StudentInsightItem value, $Res Function(StudentInsightItem) _then) = _$StudentInsightItemCopyWithImpl;
@useResult
$Res call({
 String label, String value, double progress, String hint, bool isAlert
});




}
/// @nodoc
class _$StudentInsightItemCopyWithImpl<$Res>
    implements $StudentInsightItemCopyWith<$Res> {
  _$StudentInsightItemCopyWithImpl(this._self, this._then);

  final StudentInsightItem _self;
  final $Res Function(StudentInsightItem) _then;

/// Create a copy of StudentInsightItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value = null,Object? progress = null,Object? hint = null,Object? isAlert = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,isAlert: null == isAlert ? _self.isAlert : isAlert // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentInsightItem].
extension StudentInsightItemPatterns on StudentInsightItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentInsightItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentInsightItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentInsightItem value)  $default,){
final _that = this;
switch (_that) {
case _StudentInsightItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentInsightItem value)?  $default,){
final _that = this;
switch (_that) {
case _StudentInsightItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String value,  double progress,  String hint,  bool isAlert)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentInsightItem() when $default != null:
return $default(_that.label,_that.value,_that.progress,_that.hint,_that.isAlert);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String value,  double progress,  String hint,  bool isAlert)  $default,) {final _that = this;
switch (_that) {
case _StudentInsightItem():
return $default(_that.label,_that.value,_that.progress,_that.hint,_that.isAlert);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String value,  double progress,  String hint,  bool isAlert)?  $default,) {final _that = this;
switch (_that) {
case _StudentInsightItem() when $default != null:
return $default(_that.label,_that.value,_that.progress,_that.hint,_that.isAlert);case _:
  return null;

}
}

}

/// @nodoc


class _StudentInsightItem extends StudentInsightItem with DiagnosticableTreeMixin {
  const _StudentInsightItem({required this.label, required this.value, required this.progress, required this.hint, this.isAlert = false}): super._();
  

@override final  String label;
@override final  String value;
@override final  double progress;
@override final  String hint;
@override@JsonKey() final  bool isAlert;

/// Create a copy of StudentInsightItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentInsightItemCopyWith<_StudentInsightItem> get copyWith => __$StudentInsightItemCopyWithImpl<_StudentInsightItem>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentInsightItem'))
    ..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('value', value))..add(DiagnosticsProperty('progress', progress))..add(DiagnosticsProperty('hint', hint))..add(DiagnosticsProperty('isAlert', isAlert));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentInsightItem&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.isAlert, isAlert) || other.isAlert == isAlert));
}


@override
int get hashCode => Object.hash(runtimeType,label,value,progress,hint,isAlert);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentInsightItem(label: $label, value: $value, progress: $progress, hint: $hint, isAlert: $isAlert)';
}


}

/// @nodoc
abstract mixin class _$StudentInsightItemCopyWith<$Res> implements $StudentInsightItemCopyWith<$Res> {
  factory _$StudentInsightItemCopyWith(_StudentInsightItem value, $Res Function(_StudentInsightItem) _then) = __$StudentInsightItemCopyWithImpl;
@override @useResult
$Res call({
 String label, String value, double progress, String hint, bool isAlert
});




}
/// @nodoc
class __$StudentInsightItemCopyWithImpl<$Res>
    implements _$StudentInsightItemCopyWith<$Res> {
  __$StudentInsightItemCopyWithImpl(this._self, this._then);

  final _StudentInsightItem _self;
  final $Res Function(_StudentInsightItem) _then;

/// Create a copy of StudentInsightItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = null,Object? progress = null,Object? hint = null,Object? isAlert = null,}) {
  return _then(_StudentInsightItem(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,isAlert: null == isAlert ? _self.isAlert : isAlert // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$StudentQuickLink implements DiagnosticableTreeMixin {

 IconData get icon; String get title; String get subtitle; String get route;
/// Create a copy of StudentQuickLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentQuickLinkCopyWith<StudentQuickLink> get copyWith => _$StudentQuickLinkCopyWithImpl<StudentQuickLink>(this as StudentQuickLink, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentQuickLink'))
    ..add(DiagnosticsProperty('icon', icon))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('subtitle', subtitle))..add(DiagnosticsProperty('route', route));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentQuickLink&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.route, route) || other.route == route));
}


@override
int get hashCode => Object.hash(runtimeType,icon,title,subtitle,route);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentQuickLink(icon: $icon, title: $title, subtitle: $subtitle, route: $route)';
}


}

/// @nodoc
abstract mixin class $StudentQuickLinkCopyWith<$Res>  {
  factory $StudentQuickLinkCopyWith(StudentQuickLink value, $Res Function(StudentQuickLink) _then) = _$StudentQuickLinkCopyWithImpl;
@useResult
$Res call({
 IconData icon, String title, String subtitle, String route
});




}
/// @nodoc
class _$StudentQuickLinkCopyWithImpl<$Res>
    implements $StudentQuickLinkCopyWith<$Res> {
  _$StudentQuickLinkCopyWithImpl(this._self, this._then);

  final StudentQuickLink _self;
  final $Res Function(StudentQuickLink) _then;

/// Create a copy of StudentQuickLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? icon = null,Object? title = null,Object? subtitle = null,Object? route = null,}) {
  return _then(_self.copyWith(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentQuickLink].
extension StudentQuickLinkPatterns on StudentQuickLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentQuickLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentQuickLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentQuickLink value)  $default,){
final _that = this;
switch (_that) {
case _StudentQuickLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentQuickLink value)?  $default,){
final _that = this;
switch (_that) {
case _StudentQuickLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IconData icon,  String title,  String subtitle,  String route)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentQuickLink() when $default != null:
return $default(_that.icon,_that.title,_that.subtitle,_that.route);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IconData icon,  String title,  String subtitle,  String route)  $default,) {final _that = this;
switch (_that) {
case _StudentQuickLink():
return $default(_that.icon,_that.title,_that.subtitle,_that.route);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IconData icon,  String title,  String subtitle,  String route)?  $default,) {final _that = this;
switch (_that) {
case _StudentQuickLink() when $default != null:
return $default(_that.icon,_that.title,_that.subtitle,_that.route);case _:
  return null;

}
}

}

/// @nodoc


class _StudentQuickLink with DiagnosticableTreeMixin implements StudentQuickLink {
  const _StudentQuickLink({required this.icon, required this.title, required this.subtitle, required this.route});
  

@override final  IconData icon;
@override final  String title;
@override final  String subtitle;
@override final  String route;

/// Create a copy of StudentQuickLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentQuickLinkCopyWith<_StudentQuickLink> get copyWith => __$StudentQuickLinkCopyWithImpl<_StudentQuickLink>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentQuickLink'))
    ..add(DiagnosticsProperty('icon', icon))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('subtitle', subtitle))..add(DiagnosticsProperty('route', route));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentQuickLink&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.route, route) || other.route == route));
}


@override
int get hashCode => Object.hash(runtimeType,icon,title,subtitle,route);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentQuickLink(icon: $icon, title: $title, subtitle: $subtitle, route: $route)';
}


}

/// @nodoc
abstract mixin class _$StudentQuickLinkCopyWith<$Res> implements $StudentQuickLinkCopyWith<$Res> {
  factory _$StudentQuickLinkCopyWith(_StudentQuickLink value, $Res Function(_StudentQuickLink) _then) = __$StudentQuickLinkCopyWithImpl;
@override @useResult
$Res call({
 IconData icon, String title, String subtitle, String route
});




}
/// @nodoc
class __$StudentQuickLinkCopyWithImpl<$Res>
    implements _$StudentQuickLinkCopyWith<$Res> {
  __$StudentQuickLinkCopyWithImpl(this._self, this._then);

  final _StudentQuickLink _self;
  final $Res Function(_StudentQuickLink) _then;

/// Create a copy of StudentQuickLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? icon = null,Object? title = null,Object? subtitle = null,Object? route = null,}) {
  return _then(_StudentQuickLink(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
