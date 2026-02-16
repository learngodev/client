// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_api_requests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeacherApiTimeSlotsResult {

 List<TimeSlot> get timeSlots;
/// Create a copy of TeacherApiTimeSlotsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherApiTimeSlotsResultCopyWith<TeacherApiTimeSlotsResult> get copyWith => _$TeacherApiTimeSlotsResultCopyWithImpl<TeacherApiTimeSlotsResult>(this as TeacherApiTimeSlotsResult, _$identity);

  /// Serializes this TeacherApiTimeSlotsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherApiTimeSlotsResult&&const DeepCollectionEquality().equals(other.timeSlots, timeSlots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(timeSlots));

@override
String toString() {
  return 'TeacherApiTimeSlotsResult(timeSlots: $timeSlots)';
}


}

/// @nodoc
abstract mixin class $TeacherApiTimeSlotsResultCopyWith<$Res>  {
  factory $TeacherApiTimeSlotsResultCopyWith(TeacherApiTimeSlotsResult value, $Res Function(TeacherApiTimeSlotsResult) _then) = _$TeacherApiTimeSlotsResultCopyWithImpl;
@useResult
$Res call({
 List<TimeSlot> timeSlots
});




}
/// @nodoc
class _$TeacherApiTimeSlotsResultCopyWithImpl<$Res>
    implements $TeacherApiTimeSlotsResultCopyWith<$Res> {
  _$TeacherApiTimeSlotsResultCopyWithImpl(this._self, this._then);

  final TeacherApiTimeSlotsResult _self;
  final $Res Function(TeacherApiTimeSlotsResult) _then;

/// Create a copy of TeacherApiTimeSlotsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timeSlots = null,}) {
  return _then(_self.copyWith(
timeSlots: null == timeSlots ? _self.timeSlots : timeSlots // ignore: cast_nullable_to_non_nullable
as List<TimeSlot>,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherApiTimeSlotsResult].
extension TeacherApiTimeSlotsResultPatterns on TeacherApiTimeSlotsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherApiTimeSlotsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherApiTimeSlotsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherApiTimeSlotsResult value)  $default,){
final _that = this;
switch (_that) {
case _TeacherApiTimeSlotsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherApiTimeSlotsResult value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherApiTimeSlotsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TimeSlot> timeSlots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherApiTimeSlotsResult() when $default != null:
return $default(_that.timeSlots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TimeSlot> timeSlots)  $default,) {final _that = this;
switch (_that) {
case _TeacherApiTimeSlotsResult():
return $default(_that.timeSlots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TimeSlot> timeSlots)?  $default,) {final _that = this;
switch (_that) {
case _TeacherApiTimeSlotsResult() when $default != null:
return $default(_that.timeSlots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherApiTimeSlotsResult implements TeacherApiTimeSlotsResult {
  const _TeacherApiTimeSlotsResult({required final  List<TimeSlot> timeSlots}): _timeSlots = timeSlots;
  factory _TeacherApiTimeSlotsResult.fromJson(Map<String, dynamic> json) => _$TeacherApiTimeSlotsResultFromJson(json);

 final  List<TimeSlot> _timeSlots;
@override List<TimeSlot> get timeSlots {
  if (_timeSlots is EqualUnmodifiableListView) return _timeSlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeSlots);
}


/// Create a copy of TeacherApiTimeSlotsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherApiTimeSlotsResultCopyWith<_TeacherApiTimeSlotsResult> get copyWith => __$TeacherApiTimeSlotsResultCopyWithImpl<_TeacherApiTimeSlotsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherApiTimeSlotsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherApiTimeSlotsResult&&const DeepCollectionEquality().equals(other._timeSlots, _timeSlots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_timeSlots));

@override
String toString() {
  return 'TeacherApiTimeSlotsResult(timeSlots: $timeSlots)';
}


}

/// @nodoc
abstract mixin class _$TeacherApiTimeSlotsResultCopyWith<$Res> implements $TeacherApiTimeSlotsResultCopyWith<$Res> {
  factory _$TeacherApiTimeSlotsResultCopyWith(_TeacherApiTimeSlotsResult value, $Res Function(_TeacherApiTimeSlotsResult) _then) = __$TeacherApiTimeSlotsResultCopyWithImpl;
@override @useResult
$Res call({
 List<TimeSlot> timeSlots
});




}
/// @nodoc
class __$TeacherApiTimeSlotsResultCopyWithImpl<$Res>
    implements _$TeacherApiTimeSlotsResultCopyWith<$Res> {
  __$TeacherApiTimeSlotsResultCopyWithImpl(this._self, this._then);

  final _TeacherApiTimeSlotsResult _self;
  final $Res Function(_TeacherApiTimeSlotsResult) _then;

/// Create a copy of TeacherApiTimeSlotsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timeSlots = null,}) {
  return _then(_TeacherApiTimeSlotsResult(
timeSlots: null == timeSlots ? _self._timeSlots : timeSlots // ignore: cast_nullable_to_non_nullable
as List<TimeSlot>,
  ));
}


}


/// @nodoc
mixin _$TeacherApiCoursesResult {

 List<TeacherCourse> get courses;
/// Create a copy of TeacherApiCoursesResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherApiCoursesResultCopyWith<TeacherApiCoursesResult> get copyWith => _$TeacherApiCoursesResultCopyWithImpl<TeacherApiCoursesResult>(this as TeacherApiCoursesResult, _$identity);

  /// Serializes this TeacherApiCoursesResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherApiCoursesResult&&const DeepCollectionEquality().equals(other.courses, courses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(courses));

@override
String toString() {
  return 'TeacherApiCoursesResult(courses: $courses)';
}


}

/// @nodoc
abstract mixin class $TeacherApiCoursesResultCopyWith<$Res>  {
  factory $TeacherApiCoursesResultCopyWith(TeacherApiCoursesResult value, $Res Function(TeacherApiCoursesResult) _then) = _$TeacherApiCoursesResultCopyWithImpl;
@useResult
$Res call({
 List<TeacherCourse> courses
});




}
/// @nodoc
class _$TeacherApiCoursesResultCopyWithImpl<$Res>
    implements $TeacherApiCoursesResultCopyWith<$Res> {
  _$TeacherApiCoursesResultCopyWithImpl(this._self, this._then);

  final TeacherApiCoursesResult _self;
  final $Res Function(TeacherApiCoursesResult) _then;

/// Create a copy of TeacherApiCoursesResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? courses = null,}) {
  return _then(_self.copyWith(
courses: null == courses ? _self.courses : courses // ignore: cast_nullable_to_non_nullable
as List<TeacherCourse>,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherApiCoursesResult].
extension TeacherApiCoursesResultPatterns on TeacherApiCoursesResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherApiCoursesResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherApiCoursesResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherApiCoursesResult value)  $default,){
final _that = this;
switch (_that) {
case _TeacherApiCoursesResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherApiCoursesResult value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherApiCoursesResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TeacherCourse> courses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherApiCoursesResult() when $default != null:
return $default(_that.courses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TeacherCourse> courses)  $default,) {final _that = this;
switch (_that) {
case _TeacherApiCoursesResult():
return $default(_that.courses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TeacherCourse> courses)?  $default,) {final _that = this;
switch (_that) {
case _TeacherApiCoursesResult() when $default != null:
return $default(_that.courses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherApiCoursesResult implements TeacherApiCoursesResult {
  const _TeacherApiCoursesResult({required final  List<TeacherCourse> courses}): _courses = courses;
  factory _TeacherApiCoursesResult.fromJson(Map<String, dynamic> json) => _$TeacherApiCoursesResultFromJson(json);

 final  List<TeacherCourse> _courses;
@override List<TeacherCourse> get courses {
  if (_courses is EqualUnmodifiableListView) return _courses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_courses);
}


/// Create a copy of TeacherApiCoursesResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherApiCoursesResultCopyWith<_TeacherApiCoursesResult> get copyWith => __$TeacherApiCoursesResultCopyWithImpl<_TeacherApiCoursesResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherApiCoursesResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherApiCoursesResult&&const DeepCollectionEquality().equals(other._courses, _courses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_courses));

@override
String toString() {
  return 'TeacherApiCoursesResult(courses: $courses)';
}


}

/// @nodoc
abstract mixin class _$TeacherApiCoursesResultCopyWith<$Res> implements $TeacherApiCoursesResultCopyWith<$Res> {
  factory _$TeacherApiCoursesResultCopyWith(_TeacherApiCoursesResult value, $Res Function(_TeacherApiCoursesResult) _then) = __$TeacherApiCoursesResultCopyWithImpl;
@override @useResult
$Res call({
 List<TeacherCourse> courses
});




}
/// @nodoc
class __$TeacherApiCoursesResultCopyWithImpl<$Res>
    implements _$TeacherApiCoursesResultCopyWith<$Res> {
  __$TeacherApiCoursesResultCopyWithImpl(this._self, this._then);

  final _TeacherApiCoursesResult _self;
  final $Res Function(_TeacherApiCoursesResult) _then;

/// Create a copy of TeacherApiCoursesResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? courses = null,}) {
  return _then(_TeacherApiCoursesResult(
courses: null == courses ? _self._courses : courses // ignore: cast_nullable_to_non_nullable
as List<TeacherCourse>,
  ));
}


}


/// @nodoc
mixin _$TeacherApiCourseClassesResult {

 List<TeacherClass> get classes;
/// Create a copy of TeacherApiCourseClassesResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherApiCourseClassesResultCopyWith<TeacherApiCourseClassesResult> get copyWith => _$TeacherApiCourseClassesResultCopyWithImpl<TeacherApiCourseClassesResult>(this as TeacherApiCourseClassesResult, _$identity);

  /// Serializes this TeacherApiCourseClassesResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherApiCourseClassesResult&&const DeepCollectionEquality().equals(other.classes, classes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(classes));

@override
String toString() {
  return 'TeacherApiCourseClassesResult(classes: $classes)';
}


}

/// @nodoc
abstract mixin class $TeacherApiCourseClassesResultCopyWith<$Res>  {
  factory $TeacherApiCourseClassesResultCopyWith(TeacherApiCourseClassesResult value, $Res Function(TeacherApiCourseClassesResult) _then) = _$TeacherApiCourseClassesResultCopyWithImpl;
@useResult
$Res call({
 List<TeacherClass> classes
});




}
/// @nodoc
class _$TeacherApiCourseClassesResultCopyWithImpl<$Res>
    implements $TeacherApiCourseClassesResultCopyWith<$Res> {
  _$TeacherApiCourseClassesResultCopyWithImpl(this._self, this._then);

  final TeacherApiCourseClassesResult _self;
  final $Res Function(TeacherApiCourseClassesResult) _then;

/// Create a copy of TeacherApiCourseClassesResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? classes = null,}) {
  return _then(_self.copyWith(
classes: null == classes ? _self.classes : classes // ignore: cast_nullable_to_non_nullable
as List<TeacherClass>,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherApiCourseClassesResult].
extension TeacherApiCourseClassesResultPatterns on TeacherApiCourseClassesResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherApiCourseClassesResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherApiCourseClassesResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherApiCourseClassesResult value)  $default,){
final _that = this;
switch (_that) {
case _TeacherApiCourseClassesResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherApiCourseClassesResult value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherApiCourseClassesResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TeacherClass> classes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherApiCourseClassesResult() when $default != null:
return $default(_that.classes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TeacherClass> classes)  $default,) {final _that = this;
switch (_that) {
case _TeacherApiCourseClassesResult():
return $default(_that.classes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TeacherClass> classes)?  $default,) {final _that = this;
switch (_that) {
case _TeacherApiCourseClassesResult() when $default != null:
return $default(_that.classes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherApiCourseClassesResult implements TeacherApiCourseClassesResult {
  const _TeacherApiCourseClassesResult({required final  List<TeacherClass> classes}): _classes = classes;
  factory _TeacherApiCourseClassesResult.fromJson(Map<String, dynamic> json) => _$TeacherApiCourseClassesResultFromJson(json);

 final  List<TeacherClass> _classes;
@override List<TeacherClass> get classes {
  if (_classes is EqualUnmodifiableListView) return _classes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_classes);
}


/// Create a copy of TeacherApiCourseClassesResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherApiCourseClassesResultCopyWith<_TeacherApiCourseClassesResult> get copyWith => __$TeacherApiCourseClassesResultCopyWithImpl<_TeacherApiCourseClassesResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherApiCourseClassesResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherApiCourseClassesResult&&const DeepCollectionEquality().equals(other._classes, _classes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_classes));

@override
String toString() {
  return 'TeacherApiCourseClassesResult(classes: $classes)';
}


}

/// @nodoc
abstract mixin class _$TeacherApiCourseClassesResultCopyWith<$Res> implements $TeacherApiCourseClassesResultCopyWith<$Res> {
  factory _$TeacherApiCourseClassesResultCopyWith(_TeacherApiCourseClassesResult value, $Res Function(_TeacherApiCourseClassesResult) _then) = __$TeacherApiCourseClassesResultCopyWithImpl;
@override @useResult
$Res call({
 List<TeacherClass> classes
});




}
/// @nodoc
class __$TeacherApiCourseClassesResultCopyWithImpl<$Res>
    implements _$TeacherApiCourseClassesResultCopyWith<$Res> {
  __$TeacherApiCourseClassesResultCopyWithImpl(this._self, this._then);

  final _TeacherApiCourseClassesResult _self;
  final $Res Function(_TeacherApiCourseClassesResult) _then;

/// Create a copy of TeacherApiCourseClassesResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? classes = null,}) {
  return _then(_TeacherApiCourseClassesResult(
classes: null == classes ? _self._classes : classes // ignore: cast_nullable_to_non_nullable
as List<TeacherClass>,
  ));
}


}


/// @nodoc
mixin _$TeacherApiCourseChaptersResult {

 List<CourseChapterSummary> get items;
/// Create a copy of TeacherApiCourseChaptersResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherApiCourseChaptersResultCopyWith<TeacherApiCourseChaptersResult> get copyWith => _$TeacherApiCourseChaptersResultCopyWithImpl<TeacherApiCourseChaptersResult>(this as TeacherApiCourseChaptersResult, _$identity);

  /// Serializes this TeacherApiCourseChaptersResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherApiCourseChaptersResult&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'TeacherApiCourseChaptersResult(items: $items)';
}


}

/// @nodoc
abstract mixin class $TeacherApiCourseChaptersResultCopyWith<$Res>  {
  factory $TeacherApiCourseChaptersResultCopyWith(TeacherApiCourseChaptersResult value, $Res Function(TeacherApiCourseChaptersResult) _then) = _$TeacherApiCourseChaptersResultCopyWithImpl;
@useResult
$Res call({
 List<CourseChapterSummary> items
});




}
/// @nodoc
class _$TeacherApiCourseChaptersResultCopyWithImpl<$Res>
    implements $TeacherApiCourseChaptersResultCopyWith<$Res> {
  _$TeacherApiCourseChaptersResultCopyWithImpl(this._self, this._then);

  final TeacherApiCourseChaptersResult _self;
  final $Res Function(TeacherApiCourseChaptersResult) _then;

/// Create a copy of TeacherApiCourseChaptersResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CourseChapterSummary>,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherApiCourseChaptersResult].
extension TeacherApiCourseChaptersResultPatterns on TeacherApiCourseChaptersResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherApiCourseChaptersResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherApiCourseChaptersResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherApiCourseChaptersResult value)  $default,){
final _that = this;
switch (_that) {
case _TeacherApiCourseChaptersResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherApiCourseChaptersResult value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherApiCourseChaptersResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CourseChapterSummary> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherApiCourseChaptersResult() when $default != null:
return $default(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CourseChapterSummary> items)  $default,) {final _that = this;
switch (_that) {
case _TeacherApiCourseChaptersResult():
return $default(_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CourseChapterSummary> items)?  $default,) {final _that = this;
switch (_that) {
case _TeacherApiCourseChaptersResult() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherApiCourseChaptersResult implements TeacherApiCourseChaptersResult {
  const _TeacherApiCourseChaptersResult({required final  List<CourseChapterSummary> items}): _items = items;
  factory _TeacherApiCourseChaptersResult.fromJson(Map<String, dynamic> json) => _$TeacherApiCourseChaptersResultFromJson(json);

 final  List<CourseChapterSummary> _items;
@override List<CourseChapterSummary> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of TeacherApiCourseChaptersResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherApiCourseChaptersResultCopyWith<_TeacherApiCourseChaptersResult> get copyWith => __$TeacherApiCourseChaptersResultCopyWithImpl<_TeacherApiCourseChaptersResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherApiCourseChaptersResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherApiCourseChaptersResult&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'TeacherApiCourseChaptersResult(items: $items)';
}


}

/// @nodoc
abstract mixin class _$TeacherApiCourseChaptersResultCopyWith<$Res> implements $TeacherApiCourseChaptersResultCopyWith<$Res> {
  factory _$TeacherApiCourseChaptersResultCopyWith(_TeacherApiCourseChaptersResult value, $Res Function(_TeacherApiCourseChaptersResult) _then) = __$TeacherApiCourseChaptersResultCopyWithImpl;
@override @useResult
$Res call({
 List<CourseChapterSummary> items
});




}
/// @nodoc
class __$TeacherApiCourseChaptersResultCopyWithImpl<$Res>
    implements _$TeacherApiCourseChaptersResultCopyWith<$Res> {
  __$TeacherApiCourseChaptersResultCopyWithImpl(this._self, this._then);

  final _TeacherApiCourseChaptersResult _self;
  final $Res Function(_TeacherApiCourseChaptersResult) _then;

/// Create a copy of TeacherApiCourseChaptersResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_TeacherApiCourseChaptersResult(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CourseChapterSummary>,
  ));
}


}


/// @nodoc
mixin _$TeacherReturnSubmissionPayload {

 String get comment;
/// Create a copy of TeacherReturnSubmissionPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherReturnSubmissionPayloadCopyWith<TeacherReturnSubmissionPayload> get copyWith => _$TeacherReturnSubmissionPayloadCopyWithImpl<TeacherReturnSubmissionPayload>(this as TeacherReturnSubmissionPayload, _$identity);

  /// Serializes this TeacherReturnSubmissionPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherReturnSubmissionPayload&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comment);

@override
String toString() {
  return 'TeacherReturnSubmissionPayload(comment: $comment)';
}


}

/// @nodoc
abstract mixin class $TeacherReturnSubmissionPayloadCopyWith<$Res>  {
  factory $TeacherReturnSubmissionPayloadCopyWith(TeacherReturnSubmissionPayload value, $Res Function(TeacherReturnSubmissionPayload) _then) = _$TeacherReturnSubmissionPayloadCopyWithImpl;
@useResult
$Res call({
 String comment
});




}
/// @nodoc
class _$TeacherReturnSubmissionPayloadCopyWithImpl<$Res>
    implements $TeacherReturnSubmissionPayloadCopyWith<$Res> {
  _$TeacherReturnSubmissionPayloadCopyWithImpl(this._self, this._then);

  final TeacherReturnSubmissionPayload _self;
  final $Res Function(TeacherReturnSubmissionPayload) _then;

/// Create a copy of TeacherReturnSubmissionPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comment = null,}) {
  return _then(_self.copyWith(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherReturnSubmissionPayload].
extension TeacherReturnSubmissionPayloadPatterns on TeacherReturnSubmissionPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherReturnSubmissionPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherReturnSubmissionPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherReturnSubmissionPayload value)  $default,){
final _that = this;
switch (_that) {
case _TeacherReturnSubmissionPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherReturnSubmissionPayload value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherReturnSubmissionPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherReturnSubmissionPayload() when $default != null:
return $default(_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String comment)  $default,) {final _that = this;
switch (_that) {
case _TeacherReturnSubmissionPayload():
return $default(_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String comment)?  $default,) {final _that = this;
switch (_that) {
case _TeacherReturnSubmissionPayload() when $default != null:
return $default(_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherReturnSubmissionPayload implements TeacherReturnSubmissionPayload {
  const _TeacherReturnSubmissionPayload({required this.comment});
  factory _TeacherReturnSubmissionPayload.fromJson(Map<String, dynamic> json) => _$TeacherReturnSubmissionPayloadFromJson(json);

@override final  String comment;

/// Create a copy of TeacherReturnSubmissionPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherReturnSubmissionPayloadCopyWith<_TeacherReturnSubmissionPayload> get copyWith => __$TeacherReturnSubmissionPayloadCopyWithImpl<_TeacherReturnSubmissionPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherReturnSubmissionPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherReturnSubmissionPayload&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comment);

@override
String toString() {
  return 'TeacherReturnSubmissionPayload(comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$TeacherReturnSubmissionPayloadCopyWith<$Res> implements $TeacherReturnSubmissionPayloadCopyWith<$Res> {
  factory _$TeacherReturnSubmissionPayloadCopyWith(_TeacherReturnSubmissionPayload value, $Res Function(_TeacherReturnSubmissionPayload) _then) = __$TeacherReturnSubmissionPayloadCopyWithImpl;
@override @useResult
$Res call({
 String comment
});




}
/// @nodoc
class __$TeacherReturnSubmissionPayloadCopyWithImpl<$Res>
    implements _$TeacherReturnSubmissionPayloadCopyWith<$Res> {
  __$TeacherReturnSubmissionPayloadCopyWithImpl(this._self, this._then);

  final _TeacherReturnSubmissionPayload _self;
  final $Res Function(_TeacherReturnSubmissionPayload) _then;

/// Create a copy of TeacherReturnSubmissionPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comment = null,}) {
  return _then(_TeacherReturnSubmissionPayload(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TeacherGenerateQuestionsPayload {

 String get topic; int get count; String get difficulty;
/// Create a copy of TeacherGenerateQuestionsPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherGenerateQuestionsPayloadCopyWith<TeacherGenerateQuestionsPayload> get copyWith => _$TeacherGenerateQuestionsPayloadCopyWithImpl<TeacherGenerateQuestionsPayload>(this as TeacherGenerateQuestionsPayload, _$identity);

  /// Serializes this TeacherGenerateQuestionsPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherGenerateQuestionsPayload&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.count, count) || other.count == count)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,count,difficulty);

@override
String toString() {
  return 'TeacherGenerateQuestionsPayload(topic: $topic, count: $count, difficulty: $difficulty)';
}


}

/// @nodoc
abstract mixin class $TeacherGenerateQuestionsPayloadCopyWith<$Res>  {
  factory $TeacherGenerateQuestionsPayloadCopyWith(TeacherGenerateQuestionsPayload value, $Res Function(TeacherGenerateQuestionsPayload) _then) = _$TeacherGenerateQuestionsPayloadCopyWithImpl;
@useResult
$Res call({
 String topic, int count, String difficulty
});




}
/// @nodoc
class _$TeacherGenerateQuestionsPayloadCopyWithImpl<$Res>
    implements $TeacherGenerateQuestionsPayloadCopyWith<$Res> {
  _$TeacherGenerateQuestionsPayloadCopyWithImpl(this._self, this._then);

  final TeacherGenerateQuestionsPayload _self;
  final $Res Function(TeacherGenerateQuestionsPayload) _then;

/// Create a copy of TeacherGenerateQuestionsPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topic = null,Object? count = null,Object? difficulty = null,}) {
  return _then(_self.copyWith(
topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherGenerateQuestionsPayload].
extension TeacherGenerateQuestionsPayloadPatterns on TeacherGenerateQuestionsPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherGenerateQuestionsPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherGenerateQuestionsPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherGenerateQuestionsPayload value)  $default,){
final _that = this;
switch (_that) {
case _TeacherGenerateQuestionsPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherGenerateQuestionsPayload value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherGenerateQuestionsPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String topic,  int count,  String difficulty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherGenerateQuestionsPayload() when $default != null:
return $default(_that.topic,_that.count,_that.difficulty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String topic,  int count,  String difficulty)  $default,) {final _that = this;
switch (_that) {
case _TeacherGenerateQuestionsPayload():
return $default(_that.topic,_that.count,_that.difficulty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String topic,  int count,  String difficulty)?  $default,) {final _that = this;
switch (_that) {
case _TeacherGenerateQuestionsPayload() when $default != null:
return $default(_that.topic,_that.count,_that.difficulty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherGenerateQuestionsPayload implements TeacherGenerateQuestionsPayload {
  const _TeacherGenerateQuestionsPayload({required this.topic, required this.count, required this.difficulty});
  factory _TeacherGenerateQuestionsPayload.fromJson(Map<String, dynamic> json) => _$TeacherGenerateQuestionsPayloadFromJson(json);

@override final  String topic;
@override final  int count;
@override final  String difficulty;

/// Create a copy of TeacherGenerateQuestionsPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherGenerateQuestionsPayloadCopyWith<_TeacherGenerateQuestionsPayload> get copyWith => __$TeacherGenerateQuestionsPayloadCopyWithImpl<_TeacherGenerateQuestionsPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherGenerateQuestionsPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherGenerateQuestionsPayload&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.count, count) || other.count == count)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,count,difficulty);

@override
String toString() {
  return 'TeacherGenerateQuestionsPayload(topic: $topic, count: $count, difficulty: $difficulty)';
}


}

/// @nodoc
abstract mixin class _$TeacherGenerateQuestionsPayloadCopyWith<$Res> implements $TeacherGenerateQuestionsPayloadCopyWith<$Res> {
  factory _$TeacherGenerateQuestionsPayloadCopyWith(_TeacherGenerateQuestionsPayload value, $Res Function(_TeacherGenerateQuestionsPayload) _then) = __$TeacherGenerateQuestionsPayloadCopyWithImpl;
@override @useResult
$Res call({
 String topic, int count, String difficulty
});




}
/// @nodoc
class __$TeacherGenerateQuestionsPayloadCopyWithImpl<$Res>
    implements _$TeacherGenerateQuestionsPayloadCopyWith<$Res> {
  __$TeacherGenerateQuestionsPayloadCopyWithImpl(this._self, this._then);

  final _TeacherGenerateQuestionsPayload _self;
  final $Res Function(_TeacherGenerateQuestionsPayload) _then;

/// Create a copy of TeacherGenerateQuestionsPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topic = null,Object? count = null,Object? difficulty = null,}) {
  return _then(_TeacherGenerateQuestionsPayload(
topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TeacherGenerateQuestionsResult {

 List<CreateAssignmentQuestionInput> get questions;
/// Create a copy of TeacherGenerateQuestionsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherGenerateQuestionsResultCopyWith<TeacherGenerateQuestionsResult> get copyWith => _$TeacherGenerateQuestionsResultCopyWithImpl<TeacherGenerateQuestionsResult>(this as TeacherGenerateQuestionsResult, _$identity);

  /// Serializes this TeacherGenerateQuestionsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherGenerateQuestionsResult&&const DeepCollectionEquality().equals(other.questions, questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(questions));

@override
String toString() {
  return 'TeacherGenerateQuestionsResult(questions: $questions)';
}


}

/// @nodoc
abstract mixin class $TeacherGenerateQuestionsResultCopyWith<$Res>  {
  factory $TeacherGenerateQuestionsResultCopyWith(TeacherGenerateQuestionsResult value, $Res Function(TeacherGenerateQuestionsResult) _then) = _$TeacherGenerateQuestionsResultCopyWithImpl;
@useResult
$Res call({
 List<CreateAssignmentQuestionInput> questions
});




}
/// @nodoc
class _$TeacherGenerateQuestionsResultCopyWithImpl<$Res>
    implements $TeacherGenerateQuestionsResultCopyWith<$Res> {
  _$TeacherGenerateQuestionsResultCopyWithImpl(this._self, this._then);

  final TeacherGenerateQuestionsResult _self;
  final $Res Function(TeacherGenerateQuestionsResult) _then;

/// Create a copy of TeacherGenerateQuestionsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questions = null,}) {
  return _then(_self.copyWith(
questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<CreateAssignmentQuestionInput>,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherGenerateQuestionsResult].
extension TeacherGenerateQuestionsResultPatterns on TeacherGenerateQuestionsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherGenerateQuestionsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherGenerateQuestionsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherGenerateQuestionsResult value)  $default,){
final _that = this;
switch (_that) {
case _TeacherGenerateQuestionsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherGenerateQuestionsResult value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherGenerateQuestionsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CreateAssignmentQuestionInput> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherGenerateQuestionsResult() when $default != null:
return $default(_that.questions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CreateAssignmentQuestionInput> questions)  $default,) {final _that = this;
switch (_that) {
case _TeacherGenerateQuestionsResult():
return $default(_that.questions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CreateAssignmentQuestionInput> questions)?  $default,) {final _that = this;
switch (_that) {
case _TeacherGenerateQuestionsResult() when $default != null:
return $default(_that.questions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherGenerateQuestionsResult implements TeacherGenerateQuestionsResult {
  const _TeacherGenerateQuestionsResult({required final  List<CreateAssignmentQuestionInput> questions}): _questions = questions;
  factory _TeacherGenerateQuestionsResult.fromJson(Map<String, dynamic> json) => _$TeacherGenerateQuestionsResultFromJson(json);

 final  List<CreateAssignmentQuestionInput> _questions;
@override List<CreateAssignmentQuestionInput> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of TeacherGenerateQuestionsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherGenerateQuestionsResultCopyWith<_TeacherGenerateQuestionsResult> get copyWith => __$TeacherGenerateQuestionsResultCopyWithImpl<_TeacherGenerateQuestionsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherGenerateQuestionsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherGenerateQuestionsResult&&const DeepCollectionEquality().equals(other._questions, _questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'TeacherGenerateQuestionsResult(questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$TeacherGenerateQuestionsResultCopyWith<$Res> implements $TeacherGenerateQuestionsResultCopyWith<$Res> {
  factory _$TeacherGenerateQuestionsResultCopyWith(_TeacherGenerateQuestionsResult value, $Res Function(_TeacherGenerateQuestionsResult) _then) = __$TeacherGenerateQuestionsResultCopyWithImpl;
@override @useResult
$Res call({
 List<CreateAssignmentQuestionInput> questions
});




}
/// @nodoc
class __$TeacherGenerateQuestionsResultCopyWithImpl<$Res>
    implements _$TeacherGenerateQuestionsResultCopyWith<$Res> {
  __$TeacherGenerateQuestionsResultCopyWithImpl(this._self, this._then);

  final _TeacherGenerateQuestionsResult _self;
  final $Res Function(_TeacherGenerateQuestionsResult) _then;

/// Create a copy of TeacherGenerateQuestionsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questions = null,}) {
  return _then(_TeacherGenerateQuestionsResult(
questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<CreateAssignmentQuestionInput>,
  ));
}


}


/// @nodoc
mixin _$TeacherUpdateSessionPayload {

 String? get location; String? get status;
/// Create a copy of TeacherUpdateSessionPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherUpdateSessionPayloadCopyWith<TeacherUpdateSessionPayload> get copyWith => _$TeacherUpdateSessionPayloadCopyWithImpl<TeacherUpdateSessionPayload>(this as TeacherUpdateSessionPayload, _$identity);

  /// Serializes this TeacherUpdateSessionPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherUpdateSessionPayload&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,location,status);

@override
String toString() {
  return 'TeacherUpdateSessionPayload(location: $location, status: $status)';
}


}

/// @nodoc
abstract mixin class $TeacherUpdateSessionPayloadCopyWith<$Res>  {
  factory $TeacherUpdateSessionPayloadCopyWith(TeacherUpdateSessionPayload value, $Res Function(TeacherUpdateSessionPayload) _then) = _$TeacherUpdateSessionPayloadCopyWithImpl;
@useResult
$Res call({
 String? location, String? status
});




}
/// @nodoc
class _$TeacherUpdateSessionPayloadCopyWithImpl<$Res>
    implements $TeacherUpdateSessionPayloadCopyWith<$Res> {
  _$TeacherUpdateSessionPayloadCopyWithImpl(this._self, this._then);

  final TeacherUpdateSessionPayload _self;
  final $Res Function(TeacherUpdateSessionPayload) _then;

/// Create a copy of TeacherUpdateSessionPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? location = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherUpdateSessionPayload].
extension TeacherUpdateSessionPayloadPatterns on TeacherUpdateSessionPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherUpdateSessionPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherUpdateSessionPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherUpdateSessionPayload value)  $default,){
final _that = this;
switch (_that) {
case _TeacherUpdateSessionPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherUpdateSessionPayload value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherUpdateSessionPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? location,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherUpdateSessionPayload() when $default != null:
return $default(_that.location,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? location,  String? status)  $default,) {final _that = this;
switch (_that) {
case _TeacherUpdateSessionPayload():
return $default(_that.location,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? location,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _TeacherUpdateSessionPayload() when $default != null:
return $default(_that.location,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherUpdateSessionPayload implements TeacherUpdateSessionPayload {
  const _TeacherUpdateSessionPayload({this.location, this.status});
  factory _TeacherUpdateSessionPayload.fromJson(Map<String, dynamic> json) => _$TeacherUpdateSessionPayloadFromJson(json);

@override final  String? location;
@override final  String? status;

/// Create a copy of TeacherUpdateSessionPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherUpdateSessionPayloadCopyWith<_TeacherUpdateSessionPayload> get copyWith => __$TeacherUpdateSessionPayloadCopyWithImpl<_TeacherUpdateSessionPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherUpdateSessionPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherUpdateSessionPayload&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,location,status);

@override
String toString() {
  return 'TeacherUpdateSessionPayload(location: $location, status: $status)';
}


}

/// @nodoc
abstract mixin class _$TeacherUpdateSessionPayloadCopyWith<$Res> implements $TeacherUpdateSessionPayloadCopyWith<$Res> {
  factory _$TeacherUpdateSessionPayloadCopyWith(_TeacherUpdateSessionPayload value, $Res Function(_TeacherUpdateSessionPayload) _then) = __$TeacherUpdateSessionPayloadCopyWithImpl;
@override @useResult
$Res call({
 String? location, String? status
});




}
/// @nodoc
class __$TeacherUpdateSessionPayloadCopyWithImpl<$Res>
    implements _$TeacherUpdateSessionPayloadCopyWith<$Res> {
  __$TeacherUpdateSessionPayloadCopyWithImpl(this._self, this._then);

  final _TeacherUpdateSessionPayload _self;
  final $Res Function(_TeacherUpdateSessionPayload) _then;

/// Create a copy of TeacherUpdateSessionPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? location = freezed,Object? status = freezed,}) {
  return _then(_TeacherUpdateSessionPayload(
location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TeacherCreateCoursePayload {

 String get schoolId; String get name; String get description; String? get imageUrl; List<String>? get classIds;
/// Create a copy of TeacherCreateCoursePayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherCreateCoursePayloadCopyWith<TeacherCreateCoursePayload> get copyWith => _$TeacherCreateCoursePayloadCopyWithImpl<TeacherCreateCoursePayload>(this as TeacherCreateCoursePayload, _$identity);

  /// Serializes this TeacherCreateCoursePayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherCreateCoursePayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.classIds, classIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name,description,imageUrl,const DeepCollectionEquality().hash(classIds));

@override
String toString() {
  return 'TeacherCreateCoursePayload(schoolId: $schoolId, name: $name, description: $description, imageUrl: $imageUrl, classIds: $classIds)';
}


}

/// @nodoc
abstract mixin class $TeacherCreateCoursePayloadCopyWith<$Res>  {
  factory $TeacherCreateCoursePayloadCopyWith(TeacherCreateCoursePayload value, $Res Function(TeacherCreateCoursePayload) _then) = _$TeacherCreateCoursePayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String name, String description, String? imageUrl, List<String>? classIds
});




}
/// @nodoc
class _$TeacherCreateCoursePayloadCopyWithImpl<$Res>
    implements $TeacherCreateCoursePayloadCopyWith<$Res> {
  _$TeacherCreateCoursePayloadCopyWithImpl(this._self, this._then);

  final TeacherCreateCoursePayload _self;
  final $Res Function(TeacherCreateCoursePayload) _then;

/// Create a copy of TeacherCreateCoursePayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? name = null,Object? description = null,Object? imageUrl = freezed,Object? classIds = freezed,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,classIds: freezed == classIds ? _self.classIds : classIds // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherCreateCoursePayload].
extension TeacherCreateCoursePayloadPatterns on TeacherCreateCoursePayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherCreateCoursePayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherCreateCoursePayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherCreateCoursePayload value)  $default,){
final _that = this;
switch (_that) {
case _TeacherCreateCoursePayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherCreateCoursePayload value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherCreateCoursePayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String name,  String description,  String? imageUrl,  List<String>? classIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherCreateCoursePayload() when $default != null:
return $default(_that.schoolId,_that.name,_that.description,_that.imageUrl,_that.classIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String name,  String description,  String? imageUrl,  List<String>? classIds)  $default,) {final _that = this;
switch (_that) {
case _TeacherCreateCoursePayload():
return $default(_that.schoolId,_that.name,_that.description,_that.imageUrl,_that.classIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String name,  String description,  String? imageUrl,  List<String>? classIds)?  $default,) {final _that = this;
switch (_that) {
case _TeacherCreateCoursePayload() when $default != null:
return $default(_that.schoolId,_that.name,_that.description,_that.imageUrl,_that.classIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherCreateCoursePayload implements TeacherCreateCoursePayload {
  const _TeacherCreateCoursePayload({required this.schoolId, required this.name, required this.description, this.imageUrl, final  List<String>? classIds}): _classIds = classIds;
  factory _TeacherCreateCoursePayload.fromJson(Map<String, dynamic> json) => _$TeacherCreateCoursePayloadFromJson(json);

@override final  String schoolId;
@override final  String name;
@override final  String description;
@override final  String? imageUrl;
 final  List<String>? _classIds;
@override List<String>? get classIds {
  final value = _classIds;
  if (value == null) return null;
  if (_classIds is EqualUnmodifiableListView) return _classIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TeacherCreateCoursePayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherCreateCoursePayloadCopyWith<_TeacherCreateCoursePayload> get copyWith => __$TeacherCreateCoursePayloadCopyWithImpl<_TeacherCreateCoursePayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherCreateCoursePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherCreateCoursePayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._classIds, _classIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name,description,imageUrl,const DeepCollectionEquality().hash(_classIds));

@override
String toString() {
  return 'TeacherCreateCoursePayload(schoolId: $schoolId, name: $name, description: $description, imageUrl: $imageUrl, classIds: $classIds)';
}


}

/// @nodoc
abstract mixin class _$TeacherCreateCoursePayloadCopyWith<$Res> implements $TeacherCreateCoursePayloadCopyWith<$Res> {
  factory _$TeacherCreateCoursePayloadCopyWith(_TeacherCreateCoursePayload value, $Res Function(_TeacherCreateCoursePayload) _then) = __$TeacherCreateCoursePayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String name, String description, String? imageUrl, List<String>? classIds
});




}
/// @nodoc
class __$TeacherCreateCoursePayloadCopyWithImpl<$Res>
    implements _$TeacherCreateCoursePayloadCopyWith<$Res> {
  __$TeacherCreateCoursePayloadCopyWithImpl(this._self, this._then);

  final _TeacherCreateCoursePayload _self;
  final $Res Function(_TeacherCreateCoursePayload) _then;

/// Create a copy of TeacherCreateCoursePayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? name = null,Object? description = null,Object? imageUrl = freezed,Object? classIds = freezed,}) {
  return _then(_TeacherCreateCoursePayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,classIds: freezed == classIds ? _self._classIds : classIds // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$TeacherUpdateCoursePayload {

 String get schoolId; String? get name; String? get description; String? get imageUrl;
/// Create a copy of TeacherUpdateCoursePayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherUpdateCoursePayloadCopyWith<TeacherUpdateCoursePayload> get copyWith => _$TeacherUpdateCoursePayloadCopyWithImpl<TeacherUpdateCoursePayload>(this as TeacherUpdateCoursePayload, _$identity);

  /// Serializes this TeacherUpdateCoursePayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherUpdateCoursePayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name,description,imageUrl);

@override
String toString() {
  return 'TeacherUpdateCoursePayload(schoolId: $schoolId, name: $name, description: $description, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $TeacherUpdateCoursePayloadCopyWith<$Res>  {
  factory $TeacherUpdateCoursePayloadCopyWith(TeacherUpdateCoursePayload value, $Res Function(TeacherUpdateCoursePayload) _then) = _$TeacherUpdateCoursePayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String? name, String? description, String? imageUrl
});




}
/// @nodoc
class _$TeacherUpdateCoursePayloadCopyWithImpl<$Res>
    implements $TeacherUpdateCoursePayloadCopyWith<$Res> {
  _$TeacherUpdateCoursePayloadCopyWithImpl(this._self, this._then);

  final TeacherUpdateCoursePayload _self;
  final $Res Function(TeacherUpdateCoursePayload) _then;

/// Create a copy of TeacherUpdateCoursePayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? name = freezed,Object? description = freezed,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherUpdateCoursePayload].
extension TeacherUpdateCoursePayloadPatterns on TeacherUpdateCoursePayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherUpdateCoursePayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherUpdateCoursePayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherUpdateCoursePayload value)  $default,){
final _that = this;
switch (_that) {
case _TeacherUpdateCoursePayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherUpdateCoursePayload value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherUpdateCoursePayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String? name,  String? description,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherUpdateCoursePayload() when $default != null:
return $default(_that.schoolId,_that.name,_that.description,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String? name,  String? description,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _TeacherUpdateCoursePayload():
return $default(_that.schoolId,_that.name,_that.description,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String? name,  String? description,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _TeacherUpdateCoursePayload() when $default != null:
return $default(_that.schoolId,_that.name,_that.description,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherUpdateCoursePayload implements TeacherUpdateCoursePayload {
  const _TeacherUpdateCoursePayload({required this.schoolId, this.name, this.description, this.imageUrl});
  factory _TeacherUpdateCoursePayload.fromJson(Map<String, dynamic> json) => _$TeacherUpdateCoursePayloadFromJson(json);

@override final  String schoolId;
@override final  String? name;
@override final  String? description;
@override final  String? imageUrl;

/// Create a copy of TeacherUpdateCoursePayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherUpdateCoursePayloadCopyWith<_TeacherUpdateCoursePayload> get copyWith => __$TeacherUpdateCoursePayloadCopyWithImpl<_TeacherUpdateCoursePayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherUpdateCoursePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherUpdateCoursePayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name,description,imageUrl);

@override
String toString() {
  return 'TeacherUpdateCoursePayload(schoolId: $schoolId, name: $name, description: $description, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$TeacherUpdateCoursePayloadCopyWith<$Res> implements $TeacherUpdateCoursePayloadCopyWith<$Res> {
  factory _$TeacherUpdateCoursePayloadCopyWith(_TeacherUpdateCoursePayload value, $Res Function(_TeacherUpdateCoursePayload) _then) = __$TeacherUpdateCoursePayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String? name, String? description, String? imageUrl
});




}
/// @nodoc
class __$TeacherUpdateCoursePayloadCopyWithImpl<$Res>
    implements _$TeacherUpdateCoursePayloadCopyWith<$Res> {
  __$TeacherUpdateCoursePayloadCopyWithImpl(this._self, this._then);

  final _TeacherUpdateCoursePayload _self;
  final $Res Function(_TeacherUpdateCoursePayload) _then;

/// Create a copy of TeacherUpdateCoursePayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? name = freezed,Object? description = freezed,Object? imageUrl = freezed,}) {
  return _then(_TeacherUpdateCoursePayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TeacherUpdateCourseResult {

 TeacherCourse get course;
/// Create a copy of TeacherUpdateCourseResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherUpdateCourseResultCopyWith<TeacherUpdateCourseResult> get copyWith => _$TeacherUpdateCourseResultCopyWithImpl<TeacherUpdateCourseResult>(this as TeacherUpdateCourseResult, _$identity);

  /// Serializes this TeacherUpdateCourseResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherUpdateCourseResult&&(identical(other.course, course) || other.course == course));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,course);

@override
String toString() {
  return 'TeacherUpdateCourseResult(course: $course)';
}


}

/// @nodoc
abstract mixin class $TeacherUpdateCourseResultCopyWith<$Res>  {
  factory $TeacherUpdateCourseResultCopyWith(TeacherUpdateCourseResult value, $Res Function(TeacherUpdateCourseResult) _then) = _$TeacherUpdateCourseResultCopyWithImpl;
@useResult
$Res call({
 TeacherCourse course
});


$TeacherCourseCopyWith<$Res> get course;

}
/// @nodoc
class _$TeacherUpdateCourseResultCopyWithImpl<$Res>
    implements $TeacherUpdateCourseResultCopyWith<$Res> {
  _$TeacherUpdateCourseResultCopyWithImpl(this._self, this._then);

  final TeacherUpdateCourseResult _self;
  final $Res Function(TeacherUpdateCourseResult) _then;

/// Create a copy of TeacherUpdateCourseResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? course = null,}) {
  return _then(_self.copyWith(
course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as TeacherCourse,
  ));
}
/// Create a copy of TeacherUpdateCourseResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeacherCourseCopyWith<$Res> get course {
  
  return $TeacherCourseCopyWith<$Res>(_self.course, (value) {
    return _then(_self.copyWith(course: value));
  });
}
}


/// Adds pattern-matching-related methods to [TeacherUpdateCourseResult].
extension TeacherUpdateCourseResultPatterns on TeacherUpdateCourseResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherUpdateCourseResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherUpdateCourseResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherUpdateCourseResult value)  $default,){
final _that = this;
switch (_that) {
case _TeacherUpdateCourseResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherUpdateCourseResult value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherUpdateCourseResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TeacherCourse course)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherUpdateCourseResult() when $default != null:
return $default(_that.course);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TeacherCourse course)  $default,) {final _that = this;
switch (_that) {
case _TeacherUpdateCourseResult():
return $default(_that.course);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TeacherCourse course)?  $default,) {final _that = this;
switch (_that) {
case _TeacherUpdateCourseResult() when $default != null:
return $default(_that.course);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherUpdateCourseResult implements TeacherUpdateCourseResult {
  const _TeacherUpdateCourseResult({required this.course});
  factory _TeacherUpdateCourseResult.fromJson(Map<String, dynamic> json) => _$TeacherUpdateCourseResultFromJson(json);

@override final  TeacherCourse course;

/// Create a copy of TeacherUpdateCourseResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherUpdateCourseResultCopyWith<_TeacherUpdateCourseResult> get copyWith => __$TeacherUpdateCourseResultCopyWithImpl<_TeacherUpdateCourseResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherUpdateCourseResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherUpdateCourseResult&&(identical(other.course, course) || other.course == course));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,course);

@override
String toString() {
  return 'TeacherUpdateCourseResult(course: $course)';
}


}

/// @nodoc
abstract mixin class _$TeacherUpdateCourseResultCopyWith<$Res> implements $TeacherUpdateCourseResultCopyWith<$Res> {
  factory _$TeacherUpdateCourseResultCopyWith(_TeacherUpdateCourseResult value, $Res Function(_TeacherUpdateCourseResult) _then) = __$TeacherUpdateCourseResultCopyWithImpl;
@override @useResult
$Res call({
 TeacherCourse course
});


@override $TeacherCourseCopyWith<$Res> get course;

}
/// @nodoc
class __$TeacherUpdateCourseResultCopyWithImpl<$Res>
    implements _$TeacherUpdateCourseResultCopyWith<$Res> {
  __$TeacherUpdateCourseResultCopyWithImpl(this._self, this._then);

  final _TeacherUpdateCourseResult _self;
  final $Res Function(_TeacherUpdateCourseResult) _then;

/// Create a copy of TeacherUpdateCourseResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? course = null,}) {
  return _then(_TeacherUpdateCourseResult(
course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as TeacherCourse,
  ));
}

/// Create a copy of TeacherUpdateCourseResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeacherCourseCopyWith<$Res> get course {
  
  return $TeacherCourseCopyWith<$Res>(_self.course, (value) {
    return _then(_self.copyWith(course: value));
  });
}
}


/// @nodoc
mixin _$TeacherListClassStudentsResult {

 List<TeacherStudent> get students;
/// Create a copy of TeacherListClassStudentsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherListClassStudentsResultCopyWith<TeacherListClassStudentsResult> get copyWith => _$TeacherListClassStudentsResultCopyWithImpl<TeacherListClassStudentsResult>(this as TeacherListClassStudentsResult, _$identity);

  /// Serializes this TeacherListClassStudentsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherListClassStudentsResult&&const DeepCollectionEquality().equals(other.students, students));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(students));

@override
String toString() {
  return 'TeacherListClassStudentsResult(students: $students)';
}


}

/// @nodoc
abstract mixin class $TeacherListClassStudentsResultCopyWith<$Res>  {
  factory $TeacherListClassStudentsResultCopyWith(TeacherListClassStudentsResult value, $Res Function(TeacherListClassStudentsResult) _then) = _$TeacherListClassStudentsResultCopyWithImpl;
@useResult
$Res call({
 List<TeacherStudent> students
});




}
/// @nodoc
class _$TeacherListClassStudentsResultCopyWithImpl<$Res>
    implements $TeacherListClassStudentsResultCopyWith<$Res> {
  _$TeacherListClassStudentsResultCopyWithImpl(this._self, this._then);

  final TeacherListClassStudentsResult _self;
  final $Res Function(TeacherListClassStudentsResult) _then;

/// Create a copy of TeacherListClassStudentsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? students = null,}) {
  return _then(_self.copyWith(
students: null == students ? _self.students : students // ignore: cast_nullable_to_non_nullable
as List<TeacherStudent>,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherListClassStudentsResult].
extension TeacherListClassStudentsResultPatterns on TeacherListClassStudentsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherListClassStudentsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherListClassStudentsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherListClassStudentsResult value)  $default,){
final _that = this;
switch (_that) {
case _TeacherListClassStudentsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherListClassStudentsResult value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherListClassStudentsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TeacherStudent> students)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherListClassStudentsResult() when $default != null:
return $default(_that.students);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TeacherStudent> students)  $default,) {final _that = this;
switch (_that) {
case _TeacherListClassStudentsResult():
return $default(_that.students);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TeacherStudent> students)?  $default,) {final _that = this;
switch (_that) {
case _TeacherListClassStudentsResult() when $default != null:
return $default(_that.students);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherListClassStudentsResult implements TeacherListClassStudentsResult {
  const _TeacherListClassStudentsResult({required final  List<TeacherStudent> students}): _students = students;
  factory _TeacherListClassStudentsResult.fromJson(Map<String, dynamic> json) => _$TeacherListClassStudentsResultFromJson(json);

 final  List<TeacherStudent> _students;
@override List<TeacherStudent> get students {
  if (_students is EqualUnmodifiableListView) return _students;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_students);
}


/// Create a copy of TeacherListClassStudentsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherListClassStudentsResultCopyWith<_TeacherListClassStudentsResult> get copyWith => __$TeacherListClassStudentsResultCopyWithImpl<_TeacherListClassStudentsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherListClassStudentsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherListClassStudentsResult&&const DeepCollectionEquality().equals(other._students, _students));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_students));

@override
String toString() {
  return 'TeacherListClassStudentsResult(students: $students)';
}


}

/// @nodoc
abstract mixin class _$TeacherListClassStudentsResultCopyWith<$Res> implements $TeacherListClassStudentsResultCopyWith<$Res> {
  factory _$TeacherListClassStudentsResultCopyWith(_TeacherListClassStudentsResult value, $Res Function(_TeacherListClassStudentsResult) _then) = __$TeacherListClassStudentsResultCopyWithImpl;
@override @useResult
$Res call({
 List<TeacherStudent> students
});




}
/// @nodoc
class __$TeacherListClassStudentsResultCopyWithImpl<$Res>
    implements _$TeacherListClassStudentsResultCopyWith<$Res> {
  __$TeacherListClassStudentsResultCopyWithImpl(this._self, this._then);

  final _TeacherListClassStudentsResult _self;
  final $Res Function(_TeacherListClassStudentsResult) _then;

/// Create a copy of TeacherListClassStudentsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? students = null,}) {
  return _then(_TeacherListClassStudentsResult(
students: null == students ? _self._students : students // ignore: cast_nullable_to_non_nullable
as List<TeacherStudent>,
  ));
}


}


/// @nodoc
mixin _$TeacherListMyClassesPayload {

 String get from; String get to;
/// Create a copy of TeacherListMyClassesPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherListMyClassesPayloadCopyWith<TeacherListMyClassesPayload> get copyWith => _$TeacherListMyClassesPayloadCopyWithImpl<TeacherListMyClassesPayload>(this as TeacherListMyClassesPayload, _$identity);

  /// Serializes this TeacherListMyClassesPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherListMyClassesPayload&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to);

@override
String toString() {
  return 'TeacherListMyClassesPayload(from: $from, to: $to)';
}


}

/// @nodoc
abstract mixin class $TeacherListMyClassesPayloadCopyWith<$Res>  {
  factory $TeacherListMyClassesPayloadCopyWith(TeacherListMyClassesPayload value, $Res Function(TeacherListMyClassesPayload) _then) = _$TeacherListMyClassesPayloadCopyWithImpl;
@useResult
$Res call({
 String from, String to
});




}
/// @nodoc
class _$TeacherListMyClassesPayloadCopyWithImpl<$Res>
    implements $TeacherListMyClassesPayloadCopyWith<$Res> {
  _$TeacherListMyClassesPayloadCopyWithImpl(this._self, this._then);

  final TeacherListMyClassesPayload _self;
  final $Res Function(TeacherListMyClassesPayload) _then;

/// Create a copy of TeacherListMyClassesPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? from = null,Object? to = null,}) {
  return _then(_self.copyWith(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as String,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherListMyClassesPayload].
extension TeacherListMyClassesPayloadPatterns on TeacherListMyClassesPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherListMyClassesPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherListMyClassesPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherListMyClassesPayload value)  $default,){
final _that = this;
switch (_that) {
case _TeacherListMyClassesPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherListMyClassesPayload value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherListMyClassesPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String from,  String to)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherListMyClassesPayload() when $default != null:
return $default(_that.from,_that.to);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String from,  String to)  $default,) {final _that = this;
switch (_that) {
case _TeacherListMyClassesPayload():
return $default(_that.from,_that.to);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String from,  String to)?  $default,) {final _that = this;
switch (_that) {
case _TeacherListMyClassesPayload() when $default != null:
return $default(_that.from,_that.to);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherListMyClassesPayload implements TeacherListMyClassesPayload {
  const _TeacherListMyClassesPayload({required this.from, required this.to});
  factory _TeacherListMyClassesPayload.fromJson(Map<String, dynamic> json) => _$TeacherListMyClassesPayloadFromJson(json);

@override final  String from;
@override final  String to;

/// Create a copy of TeacherListMyClassesPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherListMyClassesPayloadCopyWith<_TeacherListMyClassesPayload> get copyWith => __$TeacherListMyClassesPayloadCopyWithImpl<_TeacherListMyClassesPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherListMyClassesPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherListMyClassesPayload&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to);

@override
String toString() {
  return 'TeacherListMyClassesPayload(from: $from, to: $to)';
}


}

/// @nodoc
abstract mixin class _$TeacherListMyClassesPayloadCopyWith<$Res> implements $TeacherListMyClassesPayloadCopyWith<$Res> {
  factory _$TeacherListMyClassesPayloadCopyWith(_TeacherListMyClassesPayload value, $Res Function(_TeacherListMyClassesPayload) _then) = __$TeacherListMyClassesPayloadCopyWithImpl;
@override @useResult
$Res call({
 String from, String to
});




}
/// @nodoc
class __$TeacherListMyClassesPayloadCopyWithImpl<$Res>
    implements _$TeacherListMyClassesPayloadCopyWith<$Res> {
  __$TeacherListMyClassesPayloadCopyWithImpl(this._self, this._then);

  final _TeacherListMyClassesPayload _self;
  final $Res Function(_TeacherListMyClassesPayload) _then;

/// Create a copy of TeacherListMyClassesPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,}) {
  return _then(_TeacherListMyClassesPayload(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as String,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TeacherListMyClassesSession {

 String? get classId; String? get className; String? get courseId; String? get courseName;
/// Create a copy of TeacherListMyClassesSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherListMyClassesSessionCopyWith<TeacherListMyClassesSession> get copyWith => _$TeacherListMyClassesSessionCopyWithImpl<TeacherListMyClassesSession>(this as TeacherListMyClassesSession, _$identity);

  /// Serializes this TeacherListMyClassesSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherListMyClassesSession&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.className, className) || other.className == className)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.courseName, courseName) || other.courseName == courseName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,classId,className,courseId,courseName);

@override
String toString() {
  return 'TeacherListMyClassesSession(classId: $classId, className: $className, courseId: $courseId, courseName: $courseName)';
}


}

/// @nodoc
abstract mixin class $TeacherListMyClassesSessionCopyWith<$Res>  {
  factory $TeacherListMyClassesSessionCopyWith(TeacherListMyClassesSession value, $Res Function(TeacherListMyClassesSession) _then) = _$TeacherListMyClassesSessionCopyWithImpl;
@useResult
$Res call({
 String? classId, String? className, String? courseId, String? courseName
});




}
/// @nodoc
class _$TeacherListMyClassesSessionCopyWithImpl<$Res>
    implements $TeacherListMyClassesSessionCopyWith<$Res> {
  _$TeacherListMyClassesSessionCopyWithImpl(this._self, this._then);

  final TeacherListMyClassesSession _self;
  final $Res Function(TeacherListMyClassesSession) _then;

/// Create a copy of TeacherListMyClassesSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? classId = freezed,Object? className = freezed,Object? courseId = freezed,Object? courseName = freezed,}) {
  return _then(_self.copyWith(
classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,className: freezed == className ? _self.className : className // ignore: cast_nullable_to_non_nullable
as String?,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,courseName: freezed == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherListMyClassesSession].
extension TeacherListMyClassesSessionPatterns on TeacherListMyClassesSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherListMyClassesSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherListMyClassesSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherListMyClassesSession value)  $default,){
final _that = this;
switch (_that) {
case _TeacherListMyClassesSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherListMyClassesSession value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherListMyClassesSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? classId,  String? className,  String? courseId,  String? courseName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherListMyClassesSession() when $default != null:
return $default(_that.classId,_that.className,_that.courseId,_that.courseName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? classId,  String? className,  String? courseId,  String? courseName)  $default,) {final _that = this;
switch (_that) {
case _TeacherListMyClassesSession():
return $default(_that.classId,_that.className,_that.courseId,_that.courseName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? classId,  String? className,  String? courseId,  String? courseName)?  $default,) {final _that = this;
switch (_that) {
case _TeacherListMyClassesSession() when $default != null:
return $default(_that.classId,_that.className,_that.courseId,_that.courseName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherListMyClassesSession implements TeacherListMyClassesSession {
  const _TeacherListMyClassesSession({this.classId, this.className, this.courseId, this.courseName});
  factory _TeacherListMyClassesSession.fromJson(Map<String, dynamic> json) => _$TeacherListMyClassesSessionFromJson(json);

@override final  String? classId;
@override final  String? className;
@override final  String? courseId;
@override final  String? courseName;

/// Create a copy of TeacherListMyClassesSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherListMyClassesSessionCopyWith<_TeacherListMyClassesSession> get copyWith => __$TeacherListMyClassesSessionCopyWithImpl<_TeacherListMyClassesSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherListMyClassesSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherListMyClassesSession&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.className, className) || other.className == className)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.courseName, courseName) || other.courseName == courseName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,classId,className,courseId,courseName);

@override
String toString() {
  return 'TeacherListMyClassesSession(classId: $classId, className: $className, courseId: $courseId, courseName: $courseName)';
}


}

/// @nodoc
abstract mixin class _$TeacherListMyClassesSessionCopyWith<$Res> implements $TeacherListMyClassesSessionCopyWith<$Res> {
  factory _$TeacherListMyClassesSessionCopyWith(_TeacherListMyClassesSession value, $Res Function(_TeacherListMyClassesSession) _then) = __$TeacherListMyClassesSessionCopyWithImpl;
@override @useResult
$Res call({
 String? classId, String? className, String? courseId, String? courseName
});




}
/// @nodoc
class __$TeacherListMyClassesSessionCopyWithImpl<$Res>
    implements _$TeacherListMyClassesSessionCopyWith<$Res> {
  __$TeacherListMyClassesSessionCopyWithImpl(this._self, this._then);

  final _TeacherListMyClassesSession _self;
  final $Res Function(_TeacherListMyClassesSession) _then;

/// Create a copy of TeacherListMyClassesSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? classId = freezed,Object? className = freezed,Object? courseId = freezed,Object? courseName = freezed,}) {
  return _then(_TeacherListMyClassesSession(
classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,className: freezed == className ? _self.className : className // ignore: cast_nullable_to_non_nullable
as String?,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,courseName: freezed == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TeacherListMyClassesResult {

 List<TeacherListMyClassesSession> get sessions;
/// Create a copy of TeacherListMyClassesResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherListMyClassesResultCopyWith<TeacherListMyClassesResult> get copyWith => _$TeacherListMyClassesResultCopyWithImpl<TeacherListMyClassesResult>(this as TeacherListMyClassesResult, _$identity);

  /// Serializes this TeacherListMyClassesResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherListMyClassesResult&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'TeacherListMyClassesResult(sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $TeacherListMyClassesResultCopyWith<$Res>  {
  factory $TeacherListMyClassesResultCopyWith(TeacherListMyClassesResult value, $Res Function(TeacherListMyClassesResult) _then) = _$TeacherListMyClassesResultCopyWithImpl;
@useResult
$Res call({
 List<TeacherListMyClassesSession> sessions
});




}
/// @nodoc
class _$TeacherListMyClassesResultCopyWithImpl<$Res>
    implements $TeacherListMyClassesResultCopyWith<$Res> {
  _$TeacherListMyClassesResultCopyWithImpl(this._self, this._then);

  final TeacherListMyClassesResult _self;
  final $Res Function(TeacherListMyClassesResult) _then;

/// Create a copy of TeacherListMyClassesResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessions = null,}) {
  return _then(_self.copyWith(
sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<TeacherListMyClassesSession>,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherListMyClassesResult].
extension TeacherListMyClassesResultPatterns on TeacherListMyClassesResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherListMyClassesResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherListMyClassesResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherListMyClassesResult value)  $default,){
final _that = this;
switch (_that) {
case _TeacherListMyClassesResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherListMyClassesResult value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherListMyClassesResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TeacherListMyClassesSession> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherListMyClassesResult() when $default != null:
return $default(_that.sessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TeacherListMyClassesSession> sessions)  $default,) {final _that = this;
switch (_that) {
case _TeacherListMyClassesResult():
return $default(_that.sessions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TeacherListMyClassesSession> sessions)?  $default,) {final _that = this;
switch (_that) {
case _TeacherListMyClassesResult() when $default != null:
return $default(_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherListMyClassesResult implements TeacherListMyClassesResult {
  const _TeacherListMyClassesResult({required final  List<TeacherListMyClassesSession> sessions}): _sessions = sessions;
  factory _TeacherListMyClassesResult.fromJson(Map<String, dynamic> json) => _$TeacherListMyClassesResultFromJson(json);

 final  List<TeacherListMyClassesSession> _sessions;
@override List<TeacherListMyClassesSession> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of TeacherListMyClassesResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherListMyClassesResultCopyWith<_TeacherListMyClassesResult> get copyWith => __$TeacherListMyClassesResultCopyWithImpl<_TeacherListMyClassesResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherListMyClassesResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherListMyClassesResult&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'TeacherListMyClassesResult(sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$TeacherListMyClassesResultCopyWith<$Res> implements $TeacherListMyClassesResultCopyWith<$Res> {
  factory _$TeacherListMyClassesResultCopyWith(_TeacherListMyClassesResult value, $Res Function(_TeacherListMyClassesResult) _then) = __$TeacherListMyClassesResultCopyWithImpl;
@override @useResult
$Res call({
 List<TeacherListMyClassesSession> sessions
});




}
/// @nodoc
class __$TeacherListMyClassesResultCopyWithImpl<$Res>
    implements _$TeacherListMyClassesResultCopyWith<$Res> {
  __$TeacherListMyClassesResultCopyWithImpl(this._self, this._then);

  final _TeacherListMyClassesResult _self;
  final $Res Function(_TeacherListMyClassesResult) _then;

/// Create a copy of TeacherListMyClassesResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessions = null,}) {
  return _then(_TeacherListMyClassesResult(
sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<TeacherListMyClassesSession>,
  ));
}


}


/// @nodoc
mixin _$TeacherAssignCourseClassPayload {

 String get classId;
/// Create a copy of TeacherAssignCourseClassPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherAssignCourseClassPayloadCopyWith<TeacherAssignCourseClassPayload> get copyWith => _$TeacherAssignCourseClassPayloadCopyWithImpl<TeacherAssignCourseClassPayload>(this as TeacherAssignCourseClassPayload, _$identity);

  /// Serializes this TeacherAssignCourseClassPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherAssignCourseClassPayload&&(identical(other.classId, classId) || other.classId == classId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,classId);

@override
String toString() {
  return 'TeacherAssignCourseClassPayload(classId: $classId)';
}


}

/// @nodoc
abstract mixin class $TeacherAssignCourseClassPayloadCopyWith<$Res>  {
  factory $TeacherAssignCourseClassPayloadCopyWith(TeacherAssignCourseClassPayload value, $Res Function(TeacherAssignCourseClassPayload) _then) = _$TeacherAssignCourseClassPayloadCopyWithImpl;
@useResult
$Res call({
 String classId
});




}
/// @nodoc
class _$TeacherAssignCourseClassPayloadCopyWithImpl<$Res>
    implements $TeacherAssignCourseClassPayloadCopyWith<$Res> {
  _$TeacherAssignCourseClassPayloadCopyWithImpl(this._self, this._then);

  final TeacherAssignCourseClassPayload _self;
  final $Res Function(TeacherAssignCourseClassPayload) _then;

/// Create a copy of TeacherAssignCourseClassPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? classId = null,}) {
  return _then(_self.copyWith(
classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherAssignCourseClassPayload].
extension TeacherAssignCourseClassPayloadPatterns on TeacherAssignCourseClassPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherAssignCourseClassPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherAssignCourseClassPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherAssignCourseClassPayload value)  $default,){
final _that = this;
switch (_that) {
case _TeacherAssignCourseClassPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherAssignCourseClassPayload value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherAssignCourseClassPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String classId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherAssignCourseClassPayload() when $default != null:
return $default(_that.classId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String classId)  $default,) {final _that = this;
switch (_that) {
case _TeacherAssignCourseClassPayload():
return $default(_that.classId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String classId)?  $default,) {final _that = this;
switch (_that) {
case _TeacherAssignCourseClassPayload() when $default != null:
return $default(_that.classId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherAssignCourseClassPayload implements TeacherAssignCourseClassPayload {
  const _TeacherAssignCourseClassPayload({required this.classId});
  factory _TeacherAssignCourseClassPayload.fromJson(Map<String, dynamic> json) => _$TeacherAssignCourseClassPayloadFromJson(json);

@override final  String classId;

/// Create a copy of TeacherAssignCourseClassPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherAssignCourseClassPayloadCopyWith<_TeacherAssignCourseClassPayload> get copyWith => __$TeacherAssignCourseClassPayloadCopyWithImpl<_TeacherAssignCourseClassPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherAssignCourseClassPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherAssignCourseClassPayload&&(identical(other.classId, classId) || other.classId == classId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,classId);

@override
String toString() {
  return 'TeacherAssignCourseClassPayload(classId: $classId)';
}


}

/// @nodoc
abstract mixin class _$TeacherAssignCourseClassPayloadCopyWith<$Res> implements $TeacherAssignCourseClassPayloadCopyWith<$Res> {
  factory _$TeacherAssignCourseClassPayloadCopyWith(_TeacherAssignCourseClassPayload value, $Res Function(_TeacherAssignCourseClassPayload) _then) = __$TeacherAssignCourseClassPayloadCopyWithImpl;
@override @useResult
$Res call({
 String classId
});




}
/// @nodoc
class __$TeacherAssignCourseClassPayloadCopyWithImpl<$Res>
    implements _$TeacherAssignCourseClassPayloadCopyWith<$Res> {
  __$TeacherAssignCourseClassPayloadCopyWithImpl(this._self, this._then);

  final _TeacherAssignCourseClassPayload _self;
  final $Res Function(_TeacherAssignCourseClassPayload) _then;

/// Create a copy of TeacherAssignCourseClassPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? classId = null,}) {
  return _then(_TeacherAssignCourseClassPayload(
classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TeacherListSchedulePayload {

 String get from; String get to;
/// Create a copy of TeacherListSchedulePayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherListSchedulePayloadCopyWith<TeacherListSchedulePayload> get copyWith => _$TeacherListSchedulePayloadCopyWithImpl<TeacherListSchedulePayload>(this as TeacherListSchedulePayload, _$identity);

  /// Serializes this TeacherListSchedulePayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherListSchedulePayload&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to);

@override
String toString() {
  return 'TeacherListSchedulePayload(from: $from, to: $to)';
}


}

/// @nodoc
abstract mixin class $TeacherListSchedulePayloadCopyWith<$Res>  {
  factory $TeacherListSchedulePayloadCopyWith(TeacherListSchedulePayload value, $Res Function(TeacherListSchedulePayload) _then) = _$TeacherListSchedulePayloadCopyWithImpl;
@useResult
$Res call({
 String from, String to
});




}
/// @nodoc
class _$TeacherListSchedulePayloadCopyWithImpl<$Res>
    implements $TeacherListSchedulePayloadCopyWith<$Res> {
  _$TeacherListSchedulePayloadCopyWithImpl(this._self, this._then);

  final TeacherListSchedulePayload _self;
  final $Res Function(TeacherListSchedulePayload) _then;

/// Create a copy of TeacherListSchedulePayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? from = null,Object? to = null,}) {
  return _then(_self.copyWith(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as String,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherListSchedulePayload].
extension TeacherListSchedulePayloadPatterns on TeacherListSchedulePayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherListSchedulePayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherListSchedulePayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherListSchedulePayload value)  $default,){
final _that = this;
switch (_that) {
case _TeacherListSchedulePayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherListSchedulePayload value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherListSchedulePayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String from,  String to)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherListSchedulePayload() when $default != null:
return $default(_that.from,_that.to);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String from,  String to)  $default,) {final _that = this;
switch (_that) {
case _TeacherListSchedulePayload():
return $default(_that.from,_that.to);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String from,  String to)?  $default,) {final _that = this;
switch (_that) {
case _TeacherListSchedulePayload() when $default != null:
return $default(_that.from,_that.to);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherListSchedulePayload implements TeacherListSchedulePayload {
  const _TeacherListSchedulePayload({required this.from, required this.to});
  factory _TeacherListSchedulePayload.fromJson(Map<String, dynamic> json) => _$TeacherListSchedulePayloadFromJson(json);

@override final  String from;
@override final  String to;

/// Create a copy of TeacherListSchedulePayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherListSchedulePayloadCopyWith<_TeacherListSchedulePayload> get copyWith => __$TeacherListSchedulePayloadCopyWithImpl<_TeacherListSchedulePayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherListSchedulePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherListSchedulePayload&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to);

@override
String toString() {
  return 'TeacherListSchedulePayload(from: $from, to: $to)';
}


}

/// @nodoc
abstract mixin class _$TeacherListSchedulePayloadCopyWith<$Res> implements $TeacherListSchedulePayloadCopyWith<$Res> {
  factory _$TeacherListSchedulePayloadCopyWith(_TeacherListSchedulePayload value, $Res Function(_TeacherListSchedulePayload) _then) = __$TeacherListSchedulePayloadCopyWithImpl;
@override @useResult
$Res call({
 String from, String to
});




}
/// @nodoc
class __$TeacherListSchedulePayloadCopyWithImpl<$Res>
    implements _$TeacherListSchedulePayloadCopyWith<$Res> {
  __$TeacherListSchedulePayloadCopyWithImpl(this._self, this._then);

  final _TeacherListSchedulePayload _self;
  final $Res Function(_TeacherListSchedulePayload) _then;

/// Create a copy of TeacherListSchedulePayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,}) {
  return _then(_TeacherListSchedulePayload(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as String,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TeacherListScheduleResult {

 List<TeacherScheduleItem> get sessions;
/// Create a copy of TeacherListScheduleResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherListScheduleResultCopyWith<TeacherListScheduleResult> get copyWith => _$TeacherListScheduleResultCopyWithImpl<TeacherListScheduleResult>(this as TeacherListScheduleResult, _$identity);

  /// Serializes this TeacherListScheduleResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherListScheduleResult&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'TeacherListScheduleResult(sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $TeacherListScheduleResultCopyWith<$Res>  {
  factory $TeacherListScheduleResultCopyWith(TeacherListScheduleResult value, $Res Function(TeacherListScheduleResult) _then) = _$TeacherListScheduleResultCopyWithImpl;
@useResult
$Res call({
 List<TeacherScheduleItem> sessions
});




}
/// @nodoc
class _$TeacherListScheduleResultCopyWithImpl<$Res>
    implements $TeacherListScheduleResultCopyWith<$Res> {
  _$TeacherListScheduleResultCopyWithImpl(this._self, this._then);

  final TeacherListScheduleResult _self;
  final $Res Function(TeacherListScheduleResult) _then;

/// Create a copy of TeacherListScheduleResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessions = null,}) {
  return _then(_self.copyWith(
sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<TeacherScheduleItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherListScheduleResult].
extension TeacherListScheduleResultPatterns on TeacherListScheduleResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherListScheduleResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherListScheduleResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherListScheduleResult value)  $default,){
final _that = this;
switch (_that) {
case _TeacherListScheduleResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherListScheduleResult value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherListScheduleResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TeacherScheduleItem> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherListScheduleResult() when $default != null:
return $default(_that.sessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TeacherScheduleItem> sessions)  $default,) {final _that = this;
switch (_that) {
case _TeacherListScheduleResult():
return $default(_that.sessions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TeacherScheduleItem> sessions)?  $default,) {final _that = this;
switch (_that) {
case _TeacherListScheduleResult() when $default != null:
return $default(_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherListScheduleResult implements TeacherListScheduleResult {
  const _TeacherListScheduleResult({required final  List<TeacherScheduleItem> sessions}): _sessions = sessions;
  factory _TeacherListScheduleResult.fromJson(Map<String, dynamic> json) => _$TeacherListScheduleResultFromJson(json);

 final  List<TeacherScheduleItem> _sessions;
@override List<TeacherScheduleItem> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of TeacherListScheduleResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherListScheduleResultCopyWith<_TeacherListScheduleResult> get copyWith => __$TeacherListScheduleResultCopyWithImpl<_TeacherListScheduleResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherListScheduleResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherListScheduleResult&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'TeacherListScheduleResult(sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$TeacherListScheduleResultCopyWith<$Res> implements $TeacherListScheduleResultCopyWith<$Res> {
  factory _$TeacherListScheduleResultCopyWith(_TeacherListScheduleResult value, $Res Function(_TeacherListScheduleResult) _then) = __$TeacherListScheduleResultCopyWithImpl;
@override @useResult
$Res call({
 List<TeacherScheduleItem> sessions
});




}
/// @nodoc
class __$TeacherListScheduleResultCopyWithImpl<$Res>
    implements _$TeacherListScheduleResultCopyWith<$Res> {
  __$TeacherListScheduleResultCopyWithImpl(this._self, this._then);

  final _TeacherListScheduleResult _self;
  final $Res Function(_TeacherListScheduleResult) _then;

/// Create a copy of TeacherListScheduleResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessions = null,}) {
  return _then(_TeacherListScheduleResult(
sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<TeacherScheduleItem>,
  ));
}


}


/// @nodoc
mixin _$TeacherListAssignmentsResult {

 List<TeacherAssignment> get assignments;
/// Create a copy of TeacherListAssignmentsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherListAssignmentsResultCopyWith<TeacherListAssignmentsResult> get copyWith => _$TeacherListAssignmentsResultCopyWithImpl<TeacherListAssignmentsResult>(this as TeacherListAssignmentsResult, _$identity);

  /// Serializes this TeacherListAssignmentsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherListAssignmentsResult&&const DeepCollectionEquality().equals(other.assignments, assignments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(assignments));

@override
String toString() {
  return 'TeacherListAssignmentsResult(assignments: $assignments)';
}


}

/// @nodoc
abstract mixin class $TeacherListAssignmentsResultCopyWith<$Res>  {
  factory $TeacherListAssignmentsResultCopyWith(TeacherListAssignmentsResult value, $Res Function(TeacherListAssignmentsResult) _then) = _$TeacherListAssignmentsResultCopyWithImpl;
@useResult
$Res call({
 List<TeacherAssignment> assignments
});




}
/// @nodoc
class _$TeacherListAssignmentsResultCopyWithImpl<$Res>
    implements $TeacherListAssignmentsResultCopyWith<$Res> {
  _$TeacherListAssignmentsResultCopyWithImpl(this._self, this._then);

  final TeacherListAssignmentsResult _self;
  final $Res Function(TeacherListAssignmentsResult) _then;

/// Create a copy of TeacherListAssignmentsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assignments = null,}) {
  return _then(_self.copyWith(
assignments: null == assignments ? _self.assignments : assignments // ignore: cast_nullable_to_non_nullable
as List<TeacherAssignment>,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherListAssignmentsResult].
extension TeacherListAssignmentsResultPatterns on TeacherListAssignmentsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherListAssignmentsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherListAssignmentsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherListAssignmentsResult value)  $default,){
final _that = this;
switch (_that) {
case _TeacherListAssignmentsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherListAssignmentsResult value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherListAssignmentsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TeacherAssignment> assignments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherListAssignmentsResult() when $default != null:
return $default(_that.assignments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TeacherAssignment> assignments)  $default,) {final _that = this;
switch (_that) {
case _TeacherListAssignmentsResult():
return $default(_that.assignments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TeacherAssignment> assignments)?  $default,) {final _that = this;
switch (_that) {
case _TeacherListAssignmentsResult() when $default != null:
return $default(_that.assignments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherListAssignmentsResult implements TeacherListAssignmentsResult {
  const _TeacherListAssignmentsResult({required final  List<TeacherAssignment> assignments}): _assignments = assignments;
  factory _TeacherListAssignmentsResult.fromJson(Map<String, dynamic> json) => _$TeacherListAssignmentsResultFromJson(json);

 final  List<TeacherAssignment> _assignments;
@override List<TeacherAssignment> get assignments {
  if (_assignments is EqualUnmodifiableListView) return _assignments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assignments);
}


/// Create a copy of TeacherListAssignmentsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherListAssignmentsResultCopyWith<_TeacherListAssignmentsResult> get copyWith => __$TeacherListAssignmentsResultCopyWithImpl<_TeacherListAssignmentsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherListAssignmentsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherListAssignmentsResult&&const DeepCollectionEquality().equals(other._assignments, _assignments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_assignments));

@override
String toString() {
  return 'TeacherListAssignmentsResult(assignments: $assignments)';
}


}

/// @nodoc
abstract mixin class _$TeacherListAssignmentsResultCopyWith<$Res> implements $TeacherListAssignmentsResultCopyWith<$Res> {
  factory _$TeacherListAssignmentsResultCopyWith(_TeacherListAssignmentsResult value, $Res Function(_TeacherListAssignmentsResult) _then) = __$TeacherListAssignmentsResultCopyWithImpl;
@override @useResult
$Res call({
 List<TeacherAssignment> assignments
});




}
/// @nodoc
class __$TeacherListAssignmentsResultCopyWithImpl<$Res>
    implements _$TeacherListAssignmentsResultCopyWith<$Res> {
  __$TeacherListAssignmentsResultCopyWithImpl(this._self, this._then);

  final _TeacherListAssignmentsResult _self;
  final $Res Function(_TeacherListAssignmentsResult) _then;

/// Create a copy of TeacherListAssignmentsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assignments = null,}) {
  return _then(_TeacherListAssignmentsResult(
assignments: null == assignments ? _self._assignments : assignments // ignore: cast_nullable_to_non_nullable
as List<TeacherAssignment>,
  ));
}


}


/// @nodoc
mixin _$TeacherListSubmissionsResult {

 List<SubmissionSummary> get submissions;
/// Create a copy of TeacherListSubmissionsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherListSubmissionsResultCopyWith<TeacherListSubmissionsResult> get copyWith => _$TeacherListSubmissionsResultCopyWithImpl<TeacherListSubmissionsResult>(this as TeacherListSubmissionsResult, _$identity);

  /// Serializes this TeacherListSubmissionsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherListSubmissionsResult&&const DeepCollectionEquality().equals(other.submissions, submissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(submissions));

@override
String toString() {
  return 'TeacherListSubmissionsResult(submissions: $submissions)';
}


}

/// @nodoc
abstract mixin class $TeacherListSubmissionsResultCopyWith<$Res>  {
  factory $TeacherListSubmissionsResultCopyWith(TeacherListSubmissionsResult value, $Res Function(TeacherListSubmissionsResult) _then) = _$TeacherListSubmissionsResultCopyWithImpl;
@useResult
$Res call({
 List<SubmissionSummary> submissions
});




}
/// @nodoc
class _$TeacherListSubmissionsResultCopyWithImpl<$Res>
    implements $TeacherListSubmissionsResultCopyWith<$Res> {
  _$TeacherListSubmissionsResultCopyWithImpl(this._self, this._then);

  final TeacherListSubmissionsResult _self;
  final $Res Function(TeacherListSubmissionsResult) _then;

/// Create a copy of TeacherListSubmissionsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? submissions = null,}) {
  return _then(_self.copyWith(
submissions: null == submissions ? _self.submissions : submissions // ignore: cast_nullable_to_non_nullable
as List<SubmissionSummary>,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherListSubmissionsResult].
extension TeacherListSubmissionsResultPatterns on TeacherListSubmissionsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherListSubmissionsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherListSubmissionsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherListSubmissionsResult value)  $default,){
final _that = this;
switch (_that) {
case _TeacherListSubmissionsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherListSubmissionsResult value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherListSubmissionsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SubmissionSummary> submissions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherListSubmissionsResult() when $default != null:
return $default(_that.submissions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SubmissionSummary> submissions)  $default,) {final _that = this;
switch (_that) {
case _TeacherListSubmissionsResult():
return $default(_that.submissions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SubmissionSummary> submissions)?  $default,) {final _that = this;
switch (_that) {
case _TeacherListSubmissionsResult() when $default != null:
return $default(_that.submissions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherListSubmissionsResult implements TeacherListSubmissionsResult {
  const _TeacherListSubmissionsResult({required final  List<SubmissionSummary> submissions}): _submissions = submissions;
  factory _TeacherListSubmissionsResult.fromJson(Map<String, dynamic> json) => _$TeacherListSubmissionsResultFromJson(json);

 final  List<SubmissionSummary> _submissions;
@override List<SubmissionSummary> get submissions {
  if (_submissions is EqualUnmodifiableListView) return _submissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_submissions);
}


/// Create a copy of TeacherListSubmissionsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherListSubmissionsResultCopyWith<_TeacherListSubmissionsResult> get copyWith => __$TeacherListSubmissionsResultCopyWithImpl<_TeacherListSubmissionsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherListSubmissionsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherListSubmissionsResult&&const DeepCollectionEquality().equals(other._submissions, _submissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_submissions));

@override
String toString() {
  return 'TeacherListSubmissionsResult(submissions: $submissions)';
}


}

/// @nodoc
abstract mixin class _$TeacherListSubmissionsResultCopyWith<$Res> implements $TeacherListSubmissionsResultCopyWith<$Res> {
  factory _$TeacherListSubmissionsResultCopyWith(_TeacherListSubmissionsResult value, $Res Function(_TeacherListSubmissionsResult) _then) = __$TeacherListSubmissionsResultCopyWithImpl;
@override @useResult
$Res call({
 List<SubmissionSummary> submissions
});




}
/// @nodoc
class __$TeacherListSubmissionsResultCopyWithImpl<$Res>
    implements _$TeacherListSubmissionsResultCopyWith<$Res> {
  __$TeacherListSubmissionsResultCopyWithImpl(this._self, this._then);

  final _TeacherListSubmissionsResult _self;
  final $Res Function(_TeacherListSubmissionsResult) _then;

/// Create a copy of TeacherListSubmissionsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? submissions = null,}) {
  return _then(_TeacherListSubmissionsResult(
submissions: null == submissions ? _self._submissions : submissions // ignore: cast_nullable_to_non_nullable
as List<SubmissionSummary>,
  ));
}


}


/// @nodoc
mixin _$TeacherCreateCourseChapterPayload {

 String get title; String get content; int get orderIndex;
/// Create a copy of TeacherCreateCourseChapterPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherCreateCourseChapterPayloadCopyWith<TeacherCreateCourseChapterPayload> get copyWith => _$TeacherCreateCourseChapterPayloadCopyWithImpl<TeacherCreateCourseChapterPayload>(this as TeacherCreateCourseChapterPayload, _$identity);

  /// Serializes this TeacherCreateCourseChapterPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherCreateCourseChapterPayload&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,content,orderIndex);

@override
String toString() {
  return 'TeacherCreateCourseChapterPayload(title: $title, content: $content, orderIndex: $orderIndex)';
}


}

/// @nodoc
abstract mixin class $TeacherCreateCourseChapterPayloadCopyWith<$Res>  {
  factory $TeacherCreateCourseChapterPayloadCopyWith(TeacherCreateCourseChapterPayload value, $Res Function(TeacherCreateCourseChapterPayload) _then) = _$TeacherCreateCourseChapterPayloadCopyWithImpl;
@useResult
$Res call({
 String title, String content, int orderIndex
});




}
/// @nodoc
class _$TeacherCreateCourseChapterPayloadCopyWithImpl<$Res>
    implements $TeacherCreateCourseChapterPayloadCopyWith<$Res> {
  _$TeacherCreateCourseChapterPayloadCopyWithImpl(this._self, this._then);

  final TeacherCreateCourseChapterPayload _self;
  final $Res Function(TeacherCreateCourseChapterPayload) _then;

/// Create a copy of TeacherCreateCourseChapterPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? content = null,Object? orderIndex = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherCreateCourseChapterPayload].
extension TeacherCreateCourseChapterPayloadPatterns on TeacherCreateCourseChapterPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherCreateCourseChapterPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherCreateCourseChapterPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherCreateCourseChapterPayload value)  $default,){
final _that = this;
switch (_that) {
case _TeacherCreateCourseChapterPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherCreateCourseChapterPayload value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherCreateCourseChapterPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String content,  int orderIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherCreateCourseChapterPayload() when $default != null:
return $default(_that.title,_that.content,_that.orderIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String content,  int orderIndex)  $default,) {final _that = this;
switch (_that) {
case _TeacherCreateCourseChapterPayload():
return $default(_that.title,_that.content,_that.orderIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String content,  int orderIndex)?  $default,) {final _that = this;
switch (_that) {
case _TeacherCreateCourseChapterPayload() when $default != null:
return $default(_that.title,_that.content,_that.orderIndex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherCreateCourseChapterPayload implements TeacherCreateCourseChapterPayload {
  const _TeacherCreateCourseChapterPayload({required this.title, this.content = '', this.orderIndex = 0});
  factory _TeacherCreateCourseChapterPayload.fromJson(Map<String, dynamic> json) => _$TeacherCreateCourseChapterPayloadFromJson(json);

@override final  String title;
@override@JsonKey() final  String content;
@override@JsonKey() final  int orderIndex;

/// Create a copy of TeacherCreateCourseChapterPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherCreateCourseChapterPayloadCopyWith<_TeacherCreateCourseChapterPayload> get copyWith => __$TeacherCreateCourseChapterPayloadCopyWithImpl<_TeacherCreateCourseChapterPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherCreateCourseChapterPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherCreateCourseChapterPayload&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,content,orderIndex);

@override
String toString() {
  return 'TeacherCreateCourseChapterPayload(title: $title, content: $content, orderIndex: $orderIndex)';
}


}

/// @nodoc
abstract mixin class _$TeacherCreateCourseChapterPayloadCopyWith<$Res> implements $TeacherCreateCourseChapterPayloadCopyWith<$Res> {
  factory _$TeacherCreateCourseChapterPayloadCopyWith(_TeacherCreateCourseChapterPayload value, $Res Function(_TeacherCreateCourseChapterPayload) _then) = __$TeacherCreateCourseChapterPayloadCopyWithImpl;
@override @useResult
$Res call({
 String title, String content, int orderIndex
});




}
/// @nodoc
class __$TeacherCreateCourseChapterPayloadCopyWithImpl<$Res>
    implements _$TeacherCreateCourseChapterPayloadCopyWith<$Res> {
  __$TeacherCreateCourseChapterPayloadCopyWithImpl(this._self, this._then);

  final _TeacherCreateCourseChapterPayload _self;
  final $Res Function(_TeacherCreateCourseChapterPayload) _then;

/// Create a copy of TeacherCreateCourseChapterPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? content = null,Object? orderIndex = null,}) {
  return _then(_TeacherCreateCourseChapterPayload(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TeacherCreateCourseChapterResult {

 CourseChapterSummary get chapter;
/// Create a copy of TeacherCreateCourseChapterResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherCreateCourseChapterResultCopyWith<TeacherCreateCourseChapterResult> get copyWith => _$TeacherCreateCourseChapterResultCopyWithImpl<TeacherCreateCourseChapterResult>(this as TeacherCreateCourseChapterResult, _$identity);

  /// Serializes this TeacherCreateCourseChapterResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherCreateCourseChapterResult&&(identical(other.chapter, chapter) || other.chapter == chapter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chapter);

@override
String toString() {
  return 'TeacherCreateCourseChapterResult(chapter: $chapter)';
}


}

/// @nodoc
abstract mixin class $TeacherCreateCourseChapterResultCopyWith<$Res>  {
  factory $TeacherCreateCourseChapterResultCopyWith(TeacherCreateCourseChapterResult value, $Res Function(TeacherCreateCourseChapterResult) _then) = _$TeacherCreateCourseChapterResultCopyWithImpl;
@useResult
$Res call({
 CourseChapterSummary chapter
});


$CourseChapterSummaryCopyWith<$Res> get chapter;

}
/// @nodoc
class _$TeacherCreateCourseChapterResultCopyWithImpl<$Res>
    implements $TeacherCreateCourseChapterResultCopyWith<$Res> {
  _$TeacherCreateCourseChapterResultCopyWithImpl(this._self, this._then);

  final TeacherCreateCourseChapterResult _self;
  final $Res Function(TeacherCreateCourseChapterResult) _then;

/// Create a copy of TeacherCreateCourseChapterResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chapter = null,}) {
  return _then(_self.copyWith(
chapter: null == chapter ? _self.chapter : chapter // ignore: cast_nullable_to_non_nullable
as CourseChapterSummary,
  ));
}
/// Create a copy of TeacherCreateCourseChapterResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseChapterSummaryCopyWith<$Res> get chapter {
  
  return $CourseChapterSummaryCopyWith<$Res>(_self.chapter, (value) {
    return _then(_self.copyWith(chapter: value));
  });
}
}


/// Adds pattern-matching-related methods to [TeacherCreateCourseChapterResult].
extension TeacherCreateCourseChapterResultPatterns on TeacherCreateCourseChapterResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherCreateCourseChapterResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherCreateCourseChapterResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherCreateCourseChapterResult value)  $default,){
final _that = this;
switch (_that) {
case _TeacherCreateCourseChapterResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherCreateCourseChapterResult value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherCreateCourseChapterResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CourseChapterSummary chapter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherCreateCourseChapterResult() when $default != null:
return $default(_that.chapter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CourseChapterSummary chapter)  $default,) {final _that = this;
switch (_that) {
case _TeacherCreateCourseChapterResult():
return $default(_that.chapter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CourseChapterSummary chapter)?  $default,) {final _that = this;
switch (_that) {
case _TeacherCreateCourseChapterResult() when $default != null:
return $default(_that.chapter);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherCreateCourseChapterResult implements TeacherCreateCourseChapterResult {
  const _TeacherCreateCourseChapterResult({required this.chapter});
  factory _TeacherCreateCourseChapterResult.fromJson(Map<String, dynamic> json) => _$TeacherCreateCourseChapterResultFromJson(json);

@override final  CourseChapterSummary chapter;

/// Create a copy of TeacherCreateCourseChapterResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherCreateCourseChapterResultCopyWith<_TeacherCreateCourseChapterResult> get copyWith => __$TeacherCreateCourseChapterResultCopyWithImpl<_TeacherCreateCourseChapterResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherCreateCourseChapterResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherCreateCourseChapterResult&&(identical(other.chapter, chapter) || other.chapter == chapter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chapter);

@override
String toString() {
  return 'TeacherCreateCourseChapterResult(chapter: $chapter)';
}


}

/// @nodoc
abstract mixin class _$TeacherCreateCourseChapterResultCopyWith<$Res> implements $TeacherCreateCourseChapterResultCopyWith<$Res> {
  factory _$TeacherCreateCourseChapterResultCopyWith(_TeacherCreateCourseChapterResult value, $Res Function(_TeacherCreateCourseChapterResult) _then) = __$TeacherCreateCourseChapterResultCopyWithImpl;
@override @useResult
$Res call({
 CourseChapterSummary chapter
});


@override $CourseChapterSummaryCopyWith<$Res> get chapter;

}
/// @nodoc
class __$TeacherCreateCourseChapterResultCopyWithImpl<$Res>
    implements _$TeacherCreateCourseChapterResultCopyWith<$Res> {
  __$TeacherCreateCourseChapterResultCopyWithImpl(this._self, this._then);

  final _TeacherCreateCourseChapterResult _self;
  final $Res Function(_TeacherCreateCourseChapterResult) _then;

/// Create a copy of TeacherCreateCourseChapterResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chapter = null,}) {
  return _then(_TeacherCreateCourseChapterResult(
chapter: null == chapter ? _self.chapter : chapter // ignore: cast_nullable_to_non_nullable
as CourseChapterSummary,
  ));
}

/// Create a copy of TeacherCreateCourseChapterResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseChapterSummaryCopyWith<$Res> get chapter {
  
  return $CourseChapterSummaryCopyWith<$Res>(_self.chapter, (value) {
    return _then(_self.copyWith(chapter: value));
  });
}
}


/// @nodoc
mixin _$TeacherUpdateCourseChapterPayload {

 String? get title; String? get content; int? get orderIndex;
/// Create a copy of TeacherUpdateCourseChapterPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherUpdateCourseChapterPayloadCopyWith<TeacherUpdateCourseChapterPayload> get copyWith => _$TeacherUpdateCourseChapterPayloadCopyWithImpl<TeacherUpdateCourseChapterPayload>(this as TeacherUpdateCourseChapterPayload, _$identity);

  /// Serializes this TeacherUpdateCourseChapterPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherUpdateCourseChapterPayload&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,content,orderIndex);

@override
String toString() {
  return 'TeacherUpdateCourseChapterPayload(title: $title, content: $content, orderIndex: $orderIndex)';
}


}

/// @nodoc
abstract mixin class $TeacherUpdateCourseChapterPayloadCopyWith<$Res>  {
  factory $TeacherUpdateCourseChapterPayloadCopyWith(TeacherUpdateCourseChapterPayload value, $Res Function(TeacherUpdateCourseChapterPayload) _then) = _$TeacherUpdateCourseChapterPayloadCopyWithImpl;
@useResult
$Res call({
 String? title, String? content, int? orderIndex
});




}
/// @nodoc
class _$TeacherUpdateCourseChapterPayloadCopyWithImpl<$Res>
    implements $TeacherUpdateCourseChapterPayloadCopyWith<$Res> {
  _$TeacherUpdateCourseChapterPayloadCopyWithImpl(this._self, this._then);

  final TeacherUpdateCourseChapterPayload _self;
  final $Res Function(TeacherUpdateCourseChapterPayload) _then;

/// Create a copy of TeacherUpdateCourseChapterPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? content = freezed,Object? orderIndex = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,orderIndex: freezed == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherUpdateCourseChapterPayload].
extension TeacherUpdateCourseChapterPayloadPatterns on TeacherUpdateCourseChapterPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherUpdateCourseChapterPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherUpdateCourseChapterPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherUpdateCourseChapterPayload value)  $default,){
final _that = this;
switch (_that) {
case _TeacherUpdateCourseChapterPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherUpdateCourseChapterPayload value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherUpdateCourseChapterPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  String? content,  int? orderIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherUpdateCourseChapterPayload() when $default != null:
return $default(_that.title,_that.content,_that.orderIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  String? content,  int? orderIndex)  $default,) {final _that = this;
switch (_that) {
case _TeacherUpdateCourseChapterPayload():
return $default(_that.title,_that.content,_that.orderIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  String? content,  int? orderIndex)?  $default,) {final _that = this;
switch (_that) {
case _TeacherUpdateCourseChapterPayload() when $default != null:
return $default(_that.title,_that.content,_that.orderIndex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherUpdateCourseChapterPayload implements TeacherUpdateCourseChapterPayload {
  const _TeacherUpdateCourseChapterPayload({this.title, this.content, this.orderIndex});
  factory _TeacherUpdateCourseChapterPayload.fromJson(Map<String, dynamic> json) => _$TeacherUpdateCourseChapterPayloadFromJson(json);

@override final  String? title;
@override final  String? content;
@override final  int? orderIndex;

/// Create a copy of TeacherUpdateCourseChapterPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherUpdateCourseChapterPayloadCopyWith<_TeacherUpdateCourseChapterPayload> get copyWith => __$TeacherUpdateCourseChapterPayloadCopyWithImpl<_TeacherUpdateCourseChapterPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherUpdateCourseChapterPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherUpdateCourseChapterPayload&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,content,orderIndex);

@override
String toString() {
  return 'TeacherUpdateCourseChapterPayload(title: $title, content: $content, orderIndex: $orderIndex)';
}


}

/// @nodoc
abstract mixin class _$TeacherUpdateCourseChapterPayloadCopyWith<$Res> implements $TeacherUpdateCourseChapterPayloadCopyWith<$Res> {
  factory _$TeacherUpdateCourseChapterPayloadCopyWith(_TeacherUpdateCourseChapterPayload value, $Res Function(_TeacherUpdateCourseChapterPayload) _then) = __$TeacherUpdateCourseChapterPayloadCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? content, int? orderIndex
});




}
/// @nodoc
class __$TeacherUpdateCourseChapterPayloadCopyWithImpl<$Res>
    implements _$TeacherUpdateCourseChapterPayloadCopyWith<$Res> {
  __$TeacherUpdateCourseChapterPayloadCopyWithImpl(this._self, this._then);

  final _TeacherUpdateCourseChapterPayload _self;
  final $Res Function(_TeacherUpdateCourseChapterPayload) _then;

/// Create a copy of TeacherUpdateCourseChapterPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? content = freezed,Object? orderIndex = freezed,}) {
  return _then(_TeacherUpdateCourseChapterPayload(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,orderIndex: freezed == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$TeacherAttachCourseChapterFilePayload {

 String get fileId;
/// Create a copy of TeacherAttachCourseChapterFilePayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherAttachCourseChapterFilePayloadCopyWith<TeacherAttachCourseChapterFilePayload> get copyWith => _$TeacherAttachCourseChapterFilePayloadCopyWithImpl<TeacherAttachCourseChapterFilePayload>(this as TeacherAttachCourseChapterFilePayload, _$identity);

  /// Serializes this TeacherAttachCourseChapterFilePayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherAttachCourseChapterFilePayload&&(identical(other.fileId, fileId) || other.fileId == fileId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileId);

@override
String toString() {
  return 'TeacherAttachCourseChapterFilePayload(fileId: $fileId)';
}


}

/// @nodoc
abstract mixin class $TeacherAttachCourseChapterFilePayloadCopyWith<$Res>  {
  factory $TeacherAttachCourseChapterFilePayloadCopyWith(TeacherAttachCourseChapterFilePayload value, $Res Function(TeacherAttachCourseChapterFilePayload) _then) = _$TeacherAttachCourseChapterFilePayloadCopyWithImpl;
@useResult
$Res call({
 String fileId
});




}
/// @nodoc
class _$TeacherAttachCourseChapterFilePayloadCopyWithImpl<$Res>
    implements $TeacherAttachCourseChapterFilePayloadCopyWith<$Res> {
  _$TeacherAttachCourseChapterFilePayloadCopyWithImpl(this._self, this._then);

  final TeacherAttachCourseChapterFilePayload _self;
  final $Res Function(TeacherAttachCourseChapterFilePayload) _then;

/// Create a copy of TeacherAttachCourseChapterFilePayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileId = null,}) {
  return _then(_self.copyWith(
fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherAttachCourseChapterFilePayload].
extension TeacherAttachCourseChapterFilePayloadPatterns on TeacherAttachCourseChapterFilePayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherAttachCourseChapterFilePayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherAttachCourseChapterFilePayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherAttachCourseChapterFilePayload value)  $default,){
final _that = this;
switch (_that) {
case _TeacherAttachCourseChapterFilePayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherAttachCourseChapterFilePayload value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherAttachCourseChapterFilePayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fileId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherAttachCourseChapterFilePayload() when $default != null:
return $default(_that.fileId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fileId)  $default,) {final _that = this;
switch (_that) {
case _TeacherAttachCourseChapterFilePayload():
return $default(_that.fileId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fileId)?  $default,) {final _that = this;
switch (_that) {
case _TeacherAttachCourseChapterFilePayload() when $default != null:
return $default(_that.fileId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherAttachCourseChapterFilePayload implements TeacherAttachCourseChapterFilePayload {
  const _TeacherAttachCourseChapterFilePayload({required this.fileId});
  factory _TeacherAttachCourseChapterFilePayload.fromJson(Map<String, dynamic> json) => _$TeacherAttachCourseChapterFilePayloadFromJson(json);

@override final  String fileId;

/// Create a copy of TeacherAttachCourseChapterFilePayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherAttachCourseChapterFilePayloadCopyWith<_TeacherAttachCourseChapterFilePayload> get copyWith => __$TeacherAttachCourseChapterFilePayloadCopyWithImpl<_TeacherAttachCourseChapterFilePayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherAttachCourseChapterFilePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherAttachCourseChapterFilePayload&&(identical(other.fileId, fileId) || other.fileId == fileId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileId);

@override
String toString() {
  return 'TeacherAttachCourseChapterFilePayload(fileId: $fileId)';
}


}

/// @nodoc
abstract mixin class _$TeacherAttachCourseChapterFilePayloadCopyWith<$Res> implements $TeacherAttachCourseChapterFilePayloadCopyWith<$Res> {
  factory _$TeacherAttachCourseChapterFilePayloadCopyWith(_TeacherAttachCourseChapterFilePayload value, $Res Function(_TeacherAttachCourseChapterFilePayload) _then) = __$TeacherAttachCourseChapterFilePayloadCopyWithImpl;
@override @useResult
$Res call({
 String fileId
});




}
/// @nodoc
class __$TeacherAttachCourseChapterFilePayloadCopyWithImpl<$Res>
    implements _$TeacherAttachCourseChapterFilePayloadCopyWith<$Res> {
  __$TeacherAttachCourseChapterFilePayloadCopyWithImpl(this._self, this._then);

  final _TeacherAttachCourseChapterFilePayload _self;
  final $Res Function(_TeacherAttachCourseChapterFilePayload) _then;

/// Create a copy of TeacherAttachCourseChapterFilePayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileId = null,}) {
  return _then(_TeacherAttachCourseChapterFilePayload(
fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TeacherGradeAssignmentPayload {

 String get title; String get description; String get content; String get rubrics;
/// Create a copy of TeacherGradeAssignmentPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherGradeAssignmentPayloadCopyWith<TeacherGradeAssignmentPayload> get copyWith => _$TeacherGradeAssignmentPayloadCopyWithImpl<TeacherGradeAssignmentPayload>(this as TeacherGradeAssignmentPayload, _$identity);

  /// Serializes this TeacherGradeAssignmentPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherGradeAssignmentPayload&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.content, content) || other.content == content)&&(identical(other.rubrics, rubrics) || other.rubrics == rubrics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,content,rubrics);

@override
String toString() {
  return 'TeacherGradeAssignmentPayload(title: $title, description: $description, content: $content, rubrics: $rubrics)';
}


}

/// @nodoc
abstract mixin class $TeacherGradeAssignmentPayloadCopyWith<$Res>  {
  factory $TeacherGradeAssignmentPayloadCopyWith(TeacherGradeAssignmentPayload value, $Res Function(TeacherGradeAssignmentPayload) _then) = _$TeacherGradeAssignmentPayloadCopyWithImpl;
@useResult
$Res call({
 String title, String description, String content, String rubrics
});




}
/// @nodoc
class _$TeacherGradeAssignmentPayloadCopyWithImpl<$Res>
    implements $TeacherGradeAssignmentPayloadCopyWith<$Res> {
  _$TeacherGradeAssignmentPayloadCopyWithImpl(this._self, this._then);

  final TeacherGradeAssignmentPayload _self;
  final $Res Function(TeacherGradeAssignmentPayload) _then;

/// Create a copy of TeacherGradeAssignmentPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? content = null,Object? rubrics = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,rubrics: null == rubrics ? _self.rubrics : rubrics // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherGradeAssignmentPayload].
extension TeacherGradeAssignmentPayloadPatterns on TeacherGradeAssignmentPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherGradeAssignmentPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherGradeAssignmentPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherGradeAssignmentPayload value)  $default,){
final _that = this;
switch (_that) {
case _TeacherGradeAssignmentPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherGradeAssignmentPayload value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherGradeAssignmentPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  String content,  String rubrics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherGradeAssignmentPayload() when $default != null:
return $default(_that.title,_that.description,_that.content,_that.rubrics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  String content,  String rubrics)  $default,) {final _that = this;
switch (_that) {
case _TeacherGradeAssignmentPayload():
return $default(_that.title,_that.description,_that.content,_that.rubrics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  String content,  String rubrics)?  $default,) {final _that = this;
switch (_that) {
case _TeacherGradeAssignmentPayload() when $default != null:
return $default(_that.title,_that.description,_that.content,_that.rubrics);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherGradeAssignmentPayload implements TeacherGradeAssignmentPayload {
  const _TeacherGradeAssignmentPayload({required this.title, required this.description, required this.content, required this.rubrics});
  factory _TeacherGradeAssignmentPayload.fromJson(Map<String, dynamic> json) => _$TeacherGradeAssignmentPayloadFromJson(json);

@override final  String title;
@override final  String description;
@override final  String content;
@override final  String rubrics;

/// Create a copy of TeacherGradeAssignmentPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherGradeAssignmentPayloadCopyWith<_TeacherGradeAssignmentPayload> get copyWith => __$TeacherGradeAssignmentPayloadCopyWithImpl<_TeacherGradeAssignmentPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherGradeAssignmentPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherGradeAssignmentPayload&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.content, content) || other.content == content)&&(identical(other.rubrics, rubrics) || other.rubrics == rubrics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,content,rubrics);

@override
String toString() {
  return 'TeacherGradeAssignmentPayload(title: $title, description: $description, content: $content, rubrics: $rubrics)';
}


}

/// @nodoc
abstract mixin class _$TeacherGradeAssignmentPayloadCopyWith<$Res> implements $TeacherGradeAssignmentPayloadCopyWith<$Res> {
  factory _$TeacherGradeAssignmentPayloadCopyWith(_TeacherGradeAssignmentPayload value, $Res Function(_TeacherGradeAssignmentPayload) _then) = __$TeacherGradeAssignmentPayloadCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, String content, String rubrics
});




}
/// @nodoc
class __$TeacherGradeAssignmentPayloadCopyWithImpl<$Res>
    implements _$TeacherGradeAssignmentPayloadCopyWith<$Res> {
  __$TeacherGradeAssignmentPayloadCopyWithImpl(this._self, this._then);

  final _TeacherGradeAssignmentPayload _self;
  final $Res Function(_TeacherGradeAssignmentPayload) _then;

/// Create a copy of TeacherGradeAssignmentPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? content = null,Object? rubrics = null,}) {
  return _then(_TeacherGradeAssignmentPayload(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,rubrics: null == rubrics ? _self.rubrics : rubrics // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
