// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_api_requests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StudentApiTimeSlotsResult {

 List<TimeSlot> get timeSlots;
/// Create a copy of StudentApiTimeSlotsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentApiTimeSlotsResultCopyWith<StudentApiTimeSlotsResult> get copyWith => _$StudentApiTimeSlotsResultCopyWithImpl<StudentApiTimeSlotsResult>(this as StudentApiTimeSlotsResult, _$identity);

  /// Serializes this StudentApiTimeSlotsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentApiTimeSlotsResult&&const DeepCollectionEquality().equals(other.timeSlots, timeSlots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(timeSlots));

@override
String toString() {
  return 'StudentApiTimeSlotsResult(timeSlots: $timeSlots)';
}


}

/// @nodoc
abstract mixin class $StudentApiTimeSlotsResultCopyWith<$Res>  {
  factory $StudentApiTimeSlotsResultCopyWith(StudentApiTimeSlotsResult value, $Res Function(StudentApiTimeSlotsResult) _then) = _$StudentApiTimeSlotsResultCopyWithImpl;
@useResult
$Res call({
 List<TimeSlot> timeSlots
});




}
/// @nodoc
class _$StudentApiTimeSlotsResultCopyWithImpl<$Res>
    implements $StudentApiTimeSlotsResultCopyWith<$Res> {
  _$StudentApiTimeSlotsResultCopyWithImpl(this._self, this._then);

  final StudentApiTimeSlotsResult _self;
  final $Res Function(StudentApiTimeSlotsResult) _then;

/// Create a copy of StudentApiTimeSlotsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timeSlots = null,}) {
  return _then(_self.copyWith(
timeSlots: null == timeSlots ? _self.timeSlots : timeSlots // ignore: cast_nullable_to_non_nullable
as List<TimeSlot>,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentApiTimeSlotsResult].
extension StudentApiTimeSlotsResultPatterns on StudentApiTimeSlotsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentApiTimeSlotsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentApiTimeSlotsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentApiTimeSlotsResult value)  $default,){
final _that = this;
switch (_that) {
case _StudentApiTimeSlotsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentApiTimeSlotsResult value)?  $default,){
final _that = this;
switch (_that) {
case _StudentApiTimeSlotsResult() when $default != null:
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
case _StudentApiTimeSlotsResult() when $default != null:
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
case _StudentApiTimeSlotsResult():
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
case _StudentApiTimeSlotsResult() when $default != null:
return $default(_that.timeSlots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentApiTimeSlotsResult implements StudentApiTimeSlotsResult {
  const _StudentApiTimeSlotsResult({required final  List<TimeSlot> timeSlots}): _timeSlots = timeSlots;
  factory _StudentApiTimeSlotsResult.fromJson(Map<String, dynamic> json) => _$StudentApiTimeSlotsResultFromJson(json);

 final  List<TimeSlot> _timeSlots;
@override List<TimeSlot> get timeSlots {
  if (_timeSlots is EqualUnmodifiableListView) return _timeSlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeSlots);
}


/// Create a copy of StudentApiTimeSlotsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentApiTimeSlotsResultCopyWith<_StudentApiTimeSlotsResult> get copyWith => __$StudentApiTimeSlotsResultCopyWithImpl<_StudentApiTimeSlotsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentApiTimeSlotsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentApiTimeSlotsResult&&const DeepCollectionEquality().equals(other._timeSlots, _timeSlots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_timeSlots));

@override
String toString() {
  return 'StudentApiTimeSlotsResult(timeSlots: $timeSlots)';
}


}

/// @nodoc
abstract mixin class _$StudentApiTimeSlotsResultCopyWith<$Res> implements $StudentApiTimeSlotsResultCopyWith<$Res> {
  factory _$StudentApiTimeSlotsResultCopyWith(_StudentApiTimeSlotsResult value, $Res Function(_StudentApiTimeSlotsResult) _then) = __$StudentApiTimeSlotsResultCopyWithImpl;
@override @useResult
$Res call({
 List<TimeSlot> timeSlots
});




}
/// @nodoc
class __$StudentApiTimeSlotsResultCopyWithImpl<$Res>
    implements _$StudentApiTimeSlotsResultCopyWith<$Res> {
  __$StudentApiTimeSlotsResultCopyWithImpl(this._self, this._then);

  final _StudentApiTimeSlotsResult _self;
  final $Res Function(_StudentApiTimeSlotsResult) _then;

/// Create a copy of StudentApiTimeSlotsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timeSlots = null,}) {
  return _then(_StudentApiTimeSlotsResult(
timeSlots: null == timeSlots ? _self._timeSlots : timeSlots // ignore: cast_nullable_to_non_nullable
as List<TimeSlot>,
  ));
}


}


/// @nodoc
mixin _$StudentApiCoursesResult {

 List<Course> get items;
/// Create a copy of StudentApiCoursesResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentApiCoursesResultCopyWith<StudentApiCoursesResult> get copyWith => _$StudentApiCoursesResultCopyWithImpl<StudentApiCoursesResult>(this as StudentApiCoursesResult, _$identity);

  /// Serializes this StudentApiCoursesResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentApiCoursesResult&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'StudentApiCoursesResult(items: $items)';
}


}

/// @nodoc
abstract mixin class $StudentApiCoursesResultCopyWith<$Res>  {
  factory $StudentApiCoursesResultCopyWith(StudentApiCoursesResult value, $Res Function(StudentApiCoursesResult) _then) = _$StudentApiCoursesResultCopyWithImpl;
@useResult
$Res call({
 List<Course> items
});




}
/// @nodoc
class _$StudentApiCoursesResultCopyWithImpl<$Res>
    implements $StudentApiCoursesResultCopyWith<$Res> {
  _$StudentApiCoursesResultCopyWithImpl(this._self, this._then);

  final StudentApiCoursesResult _self;
  final $Res Function(StudentApiCoursesResult) _then;

/// Create a copy of StudentApiCoursesResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Course>,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentApiCoursesResult].
extension StudentApiCoursesResultPatterns on StudentApiCoursesResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentApiCoursesResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentApiCoursesResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentApiCoursesResult value)  $default,){
final _that = this;
switch (_that) {
case _StudentApiCoursesResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentApiCoursesResult value)?  $default,){
final _that = this;
switch (_that) {
case _StudentApiCoursesResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Course> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentApiCoursesResult() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Course> items)  $default,) {final _that = this;
switch (_that) {
case _StudentApiCoursesResult():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Course> items)?  $default,) {final _that = this;
switch (_that) {
case _StudentApiCoursesResult() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentApiCoursesResult implements StudentApiCoursesResult {
  const _StudentApiCoursesResult({required final  List<Course> items}): _items = items;
  factory _StudentApiCoursesResult.fromJson(Map<String, dynamic> json) => _$StudentApiCoursesResultFromJson(json);

 final  List<Course> _items;
@override List<Course> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of StudentApiCoursesResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentApiCoursesResultCopyWith<_StudentApiCoursesResult> get copyWith => __$StudentApiCoursesResultCopyWithImpl<_StudentApiCoursesResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentApiCoursesResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentApiCoursesResult&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'StudentApiCoursesResult(items: $items)';
}


}

/// @nodoc
abstract mixin class _$StudentApiCoursesResultCopyWith<$Res> implements $StudentApiCoursesResultCopyWith<$Res> {
  factory _$StudentApiCoursesResultCopyWith(_StudentApiCoursesResult value, $Res Function(_StudentApiCoursesResult) _then) = __$StudentApiCoursesResultCopyWithImpl;
@override @useResult
$Res call({
 List<Course> items
});




}
/// @nodoc
class __$StudentApiCoursesResultCopyWithImpl<$Res>
    implements _$StudentApiCoursesResultCopyWith<$Res> {
  __$StudentApiCoursesResultCopyWithImpl(this._self, this._then);

  final _StudentApiCoursesResult _self;
  final $Res Function(_StudentApiCoursesResult) _then;

/// Create a copy of StudentApiCoursesResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_StudentApiCoursesResult(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Course>,
  ));
}


}


/// @nodoc
mixin _$StudentApiCourseChaptersResult {

 List<CourseChapterSummary> get items;
/// Create a copy of StudentApiCourseChaptersResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentApiCourseChaptersResultCopyWith<StudentApiCourseChaptersResult> get copyWith => _$StudentApiCourseChaptersResultCopyWithImpl<StudentApiCourseChaptersResult>(this as StudentApiCourseChaptersResult, _$identity);

  /// Serializes this StudentApiCourseChaptersResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentApiCourseChaptersResult&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'StudentApiCourseChaptersResult(items: $items)';
}


}

/// @nodoc
abstract mixin class $StudentApiCourseChaptersResultCopyWith<$Res>  {
  factory $StudentApiCourseChaptersResultCopyWith(StudentApiCourseChaptersResult value, $Res Function(StudentApiCourseChaptersResult) _then) = _$StudentApiCourseChaptersResultCopyWithImpl;
@useResult
$Res call({
 List<CourseChapterSummary> items
});




}
/// @nodoc
class _$StudentApiCourseChaptersResultCopyWithImpl<$Res>
    implements $StudentApiCourseChaptersResultCopyWith<$Res> {
  _$StudentApiCourseChaptersResultCopyWithImpl(this._self, this._then);

  final StudentApiCourseChaptersResult _self;
  final $Res Function(StudentApiCourseChaptersResult) _then;

/// Create a copy of StudentApiCourseChaptersResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CourseChapterSummary>,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentApiCourseChaptersResult].
extension StudentApiCourseChaptersResultPatterns on StudentApiCourseChaptersResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentApiCourseChaptersResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentApiCourseChaptersResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentApiCourseChaptersResult value)  $default,){
final _that = this;
switch (_that) {
case _StudentApiCourseChaptersResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentApiCourseChaptersResult value)?  $default,){
final _that = this;
switch (_that) {
case _StudentApiCourseChaptersResult() when $default != null:
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
case _StudentApiCourseChaptersResult() when $default != null:
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
case _StudentApiCourseChaptersResult():
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
case _StudentApiCourseChaptersResult() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentApiCourseChaptersResult implements StudentApiCourseChaptersResult {
  const _StudentApiCourseChaptersResult({required final  List<CourseChapterSummary> items}): _items = items;
  factory _StudentApiCourseChaptersResult.fromJson(Map<String, dynamic> json) => _$StudentApiCourseChaptersResultFromJson(json);

 final  List<CourseChapterSummary> _items;
@override List<CourseChapterSummary> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of StudentApiCourseChaptersResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentApiCourseChaptersResultCopyWith<_StudentApiCourseChaptersResult> get copyWith => __$StudentApiCourseChaptersResultCopyWithImpl<_StudentApiCourseChaptersResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentApiCourseChaptersResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentApiCourseChaptersResult&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'StudentApiCourseChaptersResult(items: $items)';
}


}

/// @nodoc
abstract mixin class _$StudentApiCourseChaptersResultCopyWith<$Res> implements $StudentApiCourseChaptersResultCopyWith<$Res> {
  factory _$StudentApiCourseChaptersResultCopyWith(_StudentApiCourseChaptersResult value, $Res Function(_StudentApiCourseChaptersResult) _then) = __$StudentApiCourseChaptersResultCopyWithImpl;
@override @useResult
$Res call({
 List<CourseChapterSummary> items
});




}
/// @nodoc
class __$StudentApiCourseChaptersResultCopyWithImpl<$Res>
    implements _$StudentApiCourseChaptersResultCopyWith<$Res> {
  __$StudentApiCourseChaptersResultCopyWithImpl(this._self, this._then);

  final _StudentApiCourseChaptersResult _self;
  final $Res Function(_StudentApiCourseChaptersResult) _then;

/// Create a copy of StudentApiCourseChaptersResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_StudentApiCourseChaptersResult(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CourseChapterSummary>,
  ));
}


}


/// @nodoc
mixin _$StudentApiAssignmentDetailResult {

 AssignmentDetail get assignment;
/// Create a copy of StudentApiAssignmentDetailResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentApiAssignmentDetailResultCopyWith<StudentApiAssignmentDetailResult> get copyWith => _$StudentApiAssignmentDetailResultCopyWithImpl<StudentApiAssignmentDetailResult>(this as StudentApiAssignmentDetailResult, _$identity);

  /// Serializes this StudentApiAssignmentDetailResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentApiAssignmentDetailResult&&(identical(other.assignment, assignment) || other.assignment == assignment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assignment);

@override
String toString() {
  return 'StudentApiAssignmentDetailResult(assignment: $assignment)';
}


}

/// @nodoc
abstract mixin class $StudentApiAssignmentDetailResultCopyWith<$Res>  {
  factory $StudentApiAssignmentDetailResultCopyWith(StudentApiAssignmentDetailResult value, $Res Function(StudentApiAssignmentDetailResult) _then) = _$StudentApiAssignmentDetailResultCopyWithImpl;
@useResult
$Res call({
 AssignmentDetail assignment
});


$AssignmentDetailCopyWith<$Res> get assignment;

}
/// @nodoc
class _$StudentApiAssignmentDetailResultCopyWithImpl<$Res>
    implements $StudentApiAssignmentDetailResultCopyWith<$Res> {
  _$StudentApiAssignmentDetailResultCopyWithImpl(this._self, this._then);

  final StudentApiAssignmentDetailResult _self;
  final $Res Function(StudentApiAssignmentDetailResult) _then;

/// Create a copy of StudentApiAssignmentDetailResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assignment = null,}) {
  return _then(_self.copyWith(
assignment: null == assignment ? _self.assignment : assignment // ignore: cast_nullable_to_non_nullable
as AssignmentDetail,
  ));
}
/// Create a copy of StudentApiAssignmentDetailResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssignmentDetailCopyWith<$Res> get assignment {
  
  return $AssignmentDetailCopyWith<$Res>(_self.assignment, (value) {
    return _then(_self.copyWith(assignment: value));
  });
}
}


/// Adds pattern-matching-related methods to [StudentApiAssignmentDetailResult].
extension StudentApiAssignmentDetailResultPatterns on StudentApiAssignmentDetailResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentApiAssignmentDetailResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentApiAssignmentDetailResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentApiAssignmentDetailResult value)  $default,){
final _that = this;
switch (_that) {
case _StudentApiAssignmentDetailResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentApiAssignmentDetailResult value)?  $default,){
final _that = this;
switch (_that) {
case _StudentApiAssignmentDetailResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AssignmentDetail assignment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentApiAssignmentDetailResult() when $default != null:
return $default(_that.assignment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AssignmentDetail assignment)  $default,) {final _that = this;
switch (_that) {
case _StudentApiAssignmentDetailResult():
return $default(_that.assignment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AssignmentDetail assignment)?  $default,) {final _that = this;
switch (_that) {
case _StudentApiAssignmentDetailResult() when $default != null:
return $default(_that.assignment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentApiAssignmentDetailResult implements StudentApiAssignmentDetailResult {
  const _StudentApiAssignmentDetailResult({required this.assignment});
  factory _StudentApiAssignmentDetailResult.fromJson(Map<String, dynamic> json) => _$StudentApiAssignmentDetailResultFromJson(json);

@override final  AssignmentDetail assignment;

/// Create a copy of StudentApiAssignmentDetailResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentApiAssignmentDetailResultCopyWith<_StudentApiAssignmentDetailResult> get copyWith => __$StudentApiAssignmentDetailResultCopyWithImpl<_StudentApiAssignmentDetailResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentApiAssignmentDetailResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentApiAssignmentDetailResult&&(identical(other.assignment, assignment) || other.assignment == assignment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assignment);

@override
String toString() {
  return 'StudentApiAssignmentDetailResult(assignment: $assignment)';
}


}

/// @nodoc
abstract mixin class _$StudentApiAssignmentDetailResultCopyWith<$Res> implements $StudentApiAssignmentDetailResultCopyWith<$Res> {
  factory _$StudentApiAssignmentDetailResultCopyWith(_StudentApiAssignmentDetailResult value, $Res Function(_StudentApiAssignmentDetailResult) _then) = __$StudentApiAssignmentDetailResultCopyWithImpl;
@override @useResult
$Res call({
 AssignmentDetail assignment
});


@override $AssignmentDetailCopyWith<$Res> get assignment;

}
/// @nodoc
class __$StudentApiAssignmentDetailResultCopyWithImpl<$Res>
    implements _$StudentApiAssignmentDetailResultCopyWith<$Res> {
  __$StudentApiAssignmentDetailResultCopyWithImpl(this._self, this._then);

  final _StudentApiAssignmentDetailResult _self;
  final $Res Function(_StudentApiAssignmentDetailResult) _then;

/// Create a copy of StudentApiAssignmentDetailResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assignment = null,}) {
  return _then(_StudentApiAssignmentDetailResult(
assignment: null == assignment ? _self.assignment : assignment // ignore: cast_nullable_to_non_nullable
as AssignmentDetail,
  ));
}

/// Create a copy of StudentApiAssignmentDetailResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssignmentDetailCopyWith<$Res> get assignment {
  
  return $AssignmentDetailCopyWith<$Res>(_self.assignment, (value) {
    return _then(_self.copyWith(assignment: value));
  });
}
}


/// @nodoc
mixin _$StudentSubmitAssignmentAnswer {

 String get questionId; String get answer;
/// Create a copy of StudentSubmitAssignmentAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentSubmitAssignmentAnswerCopyWith<StudentSubmitAssignmentAnswer> get copyWith => _$StudentSubmitAssignmentAnswerCopyWithImpl<StudentSubmitAssignmentAnswer>(this as StudentSubmitAssignmentAnswer, _$identity);

  /// Serializes this StudentSubmitAssignmentAnswer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentSubmitAssignmentAnswer&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,answer);

@override
String toString() {
  return 'StudentSubmitAssignmentAnswer(questionId: $questionId, answer: $answer)';
}


}

/// @nodoc
abstract mixin class $StudentSubmitAssignmentAnswerCopyWith<$Res>  {
  factory $StudentSubmitAssignmentAnswerCopyWith(StudentSubmitAssignmentAnswer value, $Res Function(StudentSubmitAssignmentAnswer) _then) = _$StudentSubmitAssignmentAnswerCopyWithImpl;
@useResult
$Res call({
 String questionId, String answer
});




}
/// @nodoc
class _$StudentSubmitAssignmentAnswerCopyWithImpl<$Res>
    implements $StudentSubmitAssignmentAnswerCopyWith<$Res> {
  _$StudentSubmitAssignmentAnswerCopyWithImpl(this._self, this._then);

  final StudentSubmitAssignmentAnswer _self;
  final $Res Function(StudentSubmitAssignmentAnswer) _then;

/// Create a copy of StudentSubmitAssignmentAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionId = null,Object? answer = null,}) {
  return _then(_self.copyWith(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentSubmitAssignmentAnswer].
extension StudentSubmitAssignmentAnswerPatterns on StudentSubmitAssignmentAnswer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentSubmitAssignmentAnswer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentSubmitAssignmentAnswer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentSubmitAssignmentAnswer value)  $default,){
final _that = this;
switch (_that) {
case _StudentSubmitAssignmentAnswer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentSubmitAssignmentAnswer value)?  $default,){
final _that = this;
switch (_that) {
case _StudentSubmitAssignmentAnswer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String questionId,  String answer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentSubmitAssignmentAnswer() when $default != null:
return $default(_that.questionId,_that.answer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String questionId,  String answer)  $default,) {final _that = this;
switch (_that) {
case _StudentSubmitAssignmentAnswer():
return $default(_that.questionId,_that.answer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String questionId,  String answer)?  $default,) {final _that = this;
switch (_that) {
case _StudentSubmitAssignmentAnswer() when $default != null:
return $default(_that.questionId,_that.answer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentSubmitAssignmentAnswer implements StudentSubmitAssignmentAnswer {
  const _StudentSubmitAssignmentAnswer({required this.questionId, required this.answer});
  factory _StudentSubmitAssignmentAnswer.fromJson(Map<String, dynamic> json) => _$StudentSubmitAssignmentAnswerFromJson(json);

@override final  String questionId;
@override final  String answer;

/// Create a copy of StudentSubmitAssignmentAnswer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentSubmitAssignmentAnswerCopyWith<_StudentSubmitAssignmentAnswer> get copyWith => __$StudentSubmitAssignmentAnswerCopyWithImpl<_StudentSubmitAssignmentAnswer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentSubmitAssignmentAnswerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentSubmitAssignmentAnswer&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,answer);

@override
String toString() {
  return 'StudentSubmitAssignmentAnswer(questionId: $questionId, answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$StudentSubmitAssignmentAnswerCopyWith<$Res> implements $StudentSubmitAssignmentAnswerCopyWith<$Res> {
  factory _$StudentSubmitAssignmentAnswerCopyWith(_StudentSubmitAssignmentAnswer value, $Res Function(_StudentSubmitAssignmentAnswer) _then) = __$StudentSubmitAssignmentAnswerCopyWithImpl;
@override @useResult
$Res call({
 String questionId, String answer
});




}
/// @nodoc
class __$StudentSubmitAssignmentAnswerCopyWithImpl<$Res>
    implements _$StudentSubmitAssignmentAnswerCopyWith<$Res> {
  __$StudentSubmitAssignmentAnswerCopyWithImpl(this._self, this._then);

  final _StudentSubmitAssignmentAnswer _self;
  final $Res Function(_StudentSubmitAssignmentAnswer) _then;

/// Create a copy of StudentSubmitAssignmentAnswer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questionId = null,Object? answer = null,}) {
  return _then(_StudentSubmitAssignmentAnswer(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$StudentSubmitAssignmentPayload {

 String get status; List<StudentSubmitAssignmentAnswer> get answers;
/// Create a copy of StudentSubmitAssignmentPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentSubmitAssignmentPayloadCopyWith<StudentSubmitAssignmentPayload> get copyWith => _$StudentSubmitAssignmentPayloadCopyWithImpl<StudentSubmitAssignmentPayload>(this as StudentSubmitAssignmentPayload, _$identity);

  /// Serializes this StudentSubmitAssignmentPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentSubmitAssignmentPayload&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.answers, answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(answers));

@override
String toString() {
  return 'StudentSubmitAssignmentPayload(status: $status, answers: $answers)';
}


}

/// @nodoc
abstract mixin class $StudentSubmitAssignmentPayloadCopyWith<$Res>  {
  factory $StudentSubmitAssignmentPayloadCopyWith(StudentSubmitAssignmentPayload value, $Res Function(StudentSubmitAssignmentPayload) _then) = _$StudentSubmitAssignmentPayloadCopyWithImpl;
@useResult
$Res call({
 String status, List<StudentSubmitAssignmentAnswer> answers
});




}
/// @nodoc
class _$StudentSubmitAssignmentPayloadCopyWithImpl<$Res>
    implements $StudentSubmitAssignmentPayloadCopyWith<$Res> {
  _$StudentSubmitAssignmentPayloadCopyWithImpl(this._self, this._then);

  final StudentSubmitAssignmentPayload _self;
  final $Res Function(StudentSubmitAssignmentPayload) _then;

/// Create a copy of StudentSubmitAssignmentPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? answers = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<StudentSubmitAssignmentAnswer>,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentSubmitAssignmentPayload].
extension StudentSubmitAssignmentPayloadPatterns on StudentSubmitAssignmentPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentSubmitAssignmentPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentSubmitAssignmentPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentSubmitAssignmentPayload value)  $default,){
final _that = this;
switch (_that) {
case _StudentSubmitAssignmentPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentSubmitAssignmentPayload value)?  $default,){
final _that = this;
switch (_that) {
case _StudentSubmitAssignmentPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  List<StudentSubmitAssignmentAnswer> answers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentSubmitAssignmentPayload() when $default != null:
return $default(_that.status,_that.answers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  List<StudentSubmitAssignmentAnswer> answers)  $default,) {final _that = this;
switch (_that) {
case _StudentSubmitAssignmentPayload():
return $default(_that.status,_that.answers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  List<StudentSubmitAssignmentAnswer> answers)?  $default,) {final _that = this;
switch (_that) {
case _StudentSubmitAssignmentPayload() when $default != null:
return $default(_that.status,_that.answers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentSubmitAssignmentPayload implements StudentSubmitAssignmentPayload {
  const _StudentSubmitAssignmentPayload({this.status = 'submitted', required final  List<StudentSubmitAssignmentAnswer> answers}): _answers = answers;
  factory _StudentSubmitAssignmentPayload.fromJson(Map<String, dynamic> json) => _$StudentSubmitAssignmentPayloadFromJson(json);

@override@JsonKey() final  String status;
 final  List<StudentSubmitAssignmentAnswer> _answers;
@override List<StudentSubmitAssignmentAnswer> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}


/// Create a copy of StudentSubmitAssignmentPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentSubmitAssignmentPayloadCopyWith<_StudentSubmitAssignmentPayload> get copyWith => __$StudentSubmitAssignmentPayloadCopyWithImpl<_StudentSubmitAssignmentPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentSubmitAssignmentPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentSubmitAssignmentPayload&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._answers, _answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_answers));

@override
String toString() {
  return 'StudentSubmitAssignmentPayload(status: $status, answers: $answers)';
}


}

/// @nodoc
abstract mixin class _$StudentSubmitAssignmentPayloadCopyWith<$Res> implements $StudentSubmitAssignmentPayloadCopyWith<$Res> {
  factory _$StudentSubmitAssignmentPayloadCopyWith(_StudentSubmitAssignmentPayload value, $Res Function(_StudentSubmitAssignmentPayload) _then) = __$StudentSubmitAssignmentPayloadCopyWithImpl;
@override @useResult
$Res call({
 String status, List<StudentSubmitAssignmentAnswer> answers
});




}
/// @nodoc
class __$StudentSubmitAssignmentPayloadCopyWithImpl<$Res>
    implements _$StudentSubmitAssignmentPayloadCopyWith<$Res> {
  __$StudentSubmitAssignmentPayloadCopyWithImpl(this._self, this._then);

  final _StudentSubmitAssignmentPayload _self;
  final $Res Function(_StudentSubmitAssignmentPayload) _then;

/// Create a copy of StudentSubmitAssignmentPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? answers = null,}) {
  return _then(_StudentSubmitAssignmentPayload(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<StudentSubmitAssignmentAnswer>,
  ));
}


}


/// @nodoc
mixin _$StudentExplainQuestionPayload {

 String get title; String get prompt; String get questionType; List<String> get options;
/// Create a copy of StudentExplainQuestionPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentExplainQuestionPayloadCopyWith<StudentExplainQuestionPayload> get copyWith => _$StudentExplainQuestionPayloadCopyWithImpl<StudentExplainQuestionPayload>(this as StudentExplainQuestionPayload, _$identity);

  /// Serializes this StudentExplainQuestionPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentExplainQuestionPayload&&(identical(other.title, title) || other.title == title)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.questionType, questionType) || other.questionType == questionType)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,prompt,questionType,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'StudentExplainQuestionPayload(title: $title, prompt: $prompt, questionType: $questionType, options: $options)';
}


}

/// @nodoc
abstract mixin class $StudentExplainQuestionPayloadCopyWith<$Res>  {
  factory $StudentExplainQuestionPayloadCopyWith(StudentExplainQuestionPayload value, $Res Function(StudentExplainQuestionPayload) _then) = _$StudentExplainQuestionPayloadCopyWithImpl;
@useResult
$Res call({
 String title, String prompt, String questionType, List<String> options
});




}
/// @nodoc
class _$StudentExplainQuestionPayloadCopyWithImpl<$Res>
    implements $StudentExplainQuestionPayloadCopyWith<$Res> {
  _$StudentExplainQuestionPayloadCopyWithImpl(this._self, this._then);

  final StudentExplainQuestionPayload _self;
  final $Res Function(StudentExplainQuestionPayload) _then;

/// Create a copy of StudentExplainQuestionPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? prompt = null,Object? questionType = null,Object? options = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,questionType: null == questionType ? _self.questionType : questionType // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentExplainQuestionPayload].
extension StudentExplainQuestionPayloadPatterns on StudentExplainQuestionPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentExplainQuestionPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentExplainQuestionPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentExplainQuestionPayload value)  $default,){
final _that = this;
switch (_that) {
case _StudentExplainQuestionPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentExplainQuestionPayload value)?  $default,){
final _that = this;
switch (_that) {
case _StudentExplainQuestionPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String prompt,  String questionType,  List<String> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentExplainQuestionPayload() when $default != null:
return $default(_that.title,_that.prompt,_that.questionType,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String prompt,  String questionType,  List<String> options)  $default,) {final _that = this;
switch (_that) {
case _StudentExplainQuestionPayload():
return $default(_that.title,_that.prompt,_that.questionType,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String prompt,  String questionType,  List<String> options)?  $default,) {final _that = this;
switch (_that) {
case _StudentExplainQuestionPayload() when $default != null:
return $default(_that.title,_that.prompt,_that.questionType,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentExplainQuestionPayload implements StudentExplainQuestionPayload {
  const _StudentExplainQuestionPayload({required this.title, required this.prompt, required this.questionType, final  List<String> options = const <String>[]}): _options = options;
  factory _StudentExplainQuestionPayload.fromJson(Map<String, dynamic> json) => _$StudentExplainQuestionPayloadFromJson(json);

@override final  String title;
@override final  String prompt;
@override final  String questionType;
 final  List<String> _options;
@override@JsonKey() List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of StudentExplainQuestionPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentExplainQuestionPayloadCopyWith<_StudentExplainQuestionPayload> get copyWith => __$StudentExplainQuestionPayloadCopyWithImpl<_StudentExplainQuestionPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentExplainQuestionPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentExplainQuestionPayload&&(identical(other.title, title) || other.title == title)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.questionType, questionType) || other.questionType == questionType)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,prompt,questionType,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'StudentExplainQuestionPayload(title: $title, prompt: $prompt, questionType: $questionType, options: $options)';
}


}

/// @nodoc
abstract mixin class _$StudentExplainQuestionPayloadCopyWith<$Res> implements $StudentExplainQuestionPayloadCopyWith<$Res> {
  factory _$StudentExplainQuestionPayloadCopyWith(_StudentExplainQuestionPayload value, $Res Function(_StudentExplainQuestionPayload) _then) = __$StudentExplainQuestionPayloadCopyWithImpl;
@override @useResult
$Res call({
 String title, String prompt, String questionType, List<String> options
});




}
/// @nodoc
class __$StudentExplainQuestionPayloadCopyWithImpl<$Res>
    implements _$StudentExplainQuestionPayloadCopyWith<$Res> {
  __$StudentExplainQuestionPayloadCopyWithImpl(this._self, this._then);

  final _StudentExplainQuestionPayload _self;
  final $Res Function(_StudentExplainQuestionPayload) _then;

/// Create a copy of StudentExplainQuestionPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? prompt = null,Object? questionType = null,Object? options = null,}) {
  return _then(_StudentExplainQuestionPayload(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,questionType: null == questionType ? _self.questionType : questionType // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$StudentJoinCoursePayload {

 String get code;
/// Create a copy of StudentJoinCoursePayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentJoinCoursePayloadCopyWith<StudentJoinCoursePayload> get copyWith => _$StudentJoinCoursePayloadCopyWithImpl<StudentJoinCoursePayload>(this as StudentJoinCoursePayload, _$identity);

  /// Serializes this StudentJoinCoursePayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentJoinCoursePayload&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code);

@override
String toString() {
  return 'StudentJoinCoursePayload(code: $code)';
}


}

/// @nodoc
abstract mixin class $StudentJoinCoursePayloadCopyWith<$Res>  {
  factory $StudentJoinCoursePayloadCopyWith(StudentJoinCoursePayload value, $Res Function(StudentJoinCoursePayload) _then) = _$StudentJoinCoursePayloadCopyWithImpl;
@useResult
$Res call({
 String code
});




}
/// @nodoc
class _$StudentJoinCoursePayloadCopyWithImpl<$Res>
    implements $StudentJoinCoursePayloadCopyWith<$Res> {
  _$StudentJoinCoursePayloadCopyWithImpl(this._self, this._then);

  final StudentJoinCoursePayload _self;
  final $Res Function(StudentJoinCoursePayload) _then;

/// Create a copy of StudentJoinCoursePayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentJoinCoursePayload].
extension StudentJoinCoursePayloadPatterns on StudentJoinCoursePayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentJoinCoursePayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentJoinCoursePayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentJoinCoursePayload value)  $default,){
final _that = this;
switch (_that) {
case _StudentJoinCoursePayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentJoinCoursePayload value)?  $default,){
final _that = this;
switch (_that) {
case _StudentJoinCoursePayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentJoinCoursePayload() when $default != null:
return $default(_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code)  $default,) {final _that = this;
switch (_that) {
case _StudentJoinCoursePayload():
return $default(_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code)?  $default,) {final _that = this;
switch (_that) {
case _StudentJoinCoursePayload() when $default != null:
return $default(_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentJoinCoursePayload implements StudentJoinCoursePayload {
  const _StudentJoinCoursePayload({required this.code});
  factory _StudentJoinCoursePayload.fromJson(Map<String, dynamic> json) => _$StudentJoinCoursePayloadFromJson(json);

@override final  String code;

/// Create a copy of StudentJoinCoursePayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentJoinCoursePayloadCopyWith<_StudentJoinCoursePayload> get copyWith => __$StudentJoinCoursePayloadCopyWithImpl<_StudentJoinCoursePayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentJoinCoursePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentJoinCoursePayload&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code);

@override
String toString() {
  return 'StudentJoinCoursePayload(code: $code)';
}


}

/// @nodoc
abstract mixin class _$StudentJoinCoursePayloadCopyWith<$Res> implements $StudentJoinCoursePayloadCopyWith<$Res> {
  factory _$StudentJoinCoursePayloadCopyWith(_StudentJoinCoursePayload value, $Res Function(_StudentJoinCoursePayload) _then) = __$StudentJoinCoursePayloadCopyWithImpl;
@override @useResult
$Res call({
 String code
});




}
/// @nodoc
class __$StudentJoinCoursePayloadCopyWithImpl<$Res>
    implements _$StudentJoinCoursePayloadCopyWith<$Res> {
  __$StudentJoinCoursePayloadCopyWithImpl(this._self, this._then);

  final _StudentJoinCoursePayload _self;
  final $Res Function(_StudentJoinCoursePayload) _then;

/// Create a copy of StudentJoinCoursePayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,}) {
  return _then(_StudentJoinCoursePayload(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$StudentApiSubmissionDetailResult {

 AssignmentDetail? get assignment; SubmissionResult get submission; List<SubmissionItem> get items;
/// Create a copy of StudentApiSubmissionDetailResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentApiSubmissionDetailResultCopyWith<StudentApiSubmissionDetailResult> get copyWith => _$StudentApiSubmissionDetailResultCopyWithImpl<StudentApiSubmissionDetailResult>(this as StudentApiSubmissionDetailResult, _$identity);

  /// Serializes this StudentApiSubmissionDetailResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentApiSubmissionDetailResult&&(identical(other.assignment, assignment) || other.assignment == assignment)&&(identical(other.submission, submission) || other.submission == submission)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assignment,submission,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'StudentApiSubmissionDetailResult(assignment: $assignment, submission: $submission, items: $items)';
}


}

/// @nodoc
abstract mixin class $StudentApiSubmissionDetailResultCopyWith<$Res>  {
  factory $StudentApiSubmissionDetailResultCopyWith(StudentApiSubmissionDetailResult value, $Res Function(StudentApiSubmissionDetailResult) _then) = _$StudentApiSubmissionDetailResultCopyWithImpl;
@useResult
$Res call({
 AssignmentDetail? assignment, SubmissionResult submission, List<SubmissionItem> items
});


$AssignmentDetailCopyWith<$Res>? get assignment;$SubmissionResultCopyWith<$Res> get submission;

}
/// @nodoc
class _$StudentApiSubmissionDetailResultCopyWithImpl<$Res>
    implements $StudentApiSubmissionDetailResultCopyWith<$Res> {
  _$StudentApiSubmissionDetailResultCopyWithImpl(this._self, this._then);

  final StudentApiSubmissionDetailResult _self;
  final $Res Function(StudentApiSubmissionDetailResult) _then;

/// Create a copy of StudentApiSubmissionDetailResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assignment = freezed,Object? submission = null,Object? items = null,}) {
  return _then(_self.copyWith(
assignment: freezed == assignment ? _self.assignment : assignment // ignore: cast_nullable_to_non_nullable
as AssignmentDetail?,submission: null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as SubmissionResult,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SubmissionItem>,
  ));
}
/// Create a copy of StudentApiSubmissionDetailResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssignmentDetailCopyWith<$Res>? get assignment {
    if (_self.assignment == null) {
    return null;
  }

  return $AssignmentDetailCopyWith<$Res>(_self.assignment!, (value) {
    return _then(_self.copyWith(assignment: value));
  });
}/// Create a copy of StudentApiSubmissionDetailResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubmissionResultCopyWith<$Res> get submission {
  
  return $SubmissionResultCopyWith<$Res>(_self.submission, (value) {
    return _then(_self.copyWith(submission: value));
  });
}
}


/// Adds pattern-matching-related methods to [StudentApiSubmissionDetailResult].
extension StudentApiSubmissionDetailResultPatterns on StudentApiSubmissionDetailResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentApiSubmissionDetailResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentApiSubmissionDetailResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentApiSubmissionDetailResult value)  $default,){
final _that = this;
switch (_that) {
case _StudentApiSubmissionDetailResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentApiSubmissionDetailResult value)?  $default,){
final _that = this;
switch (_that) {
case _StudentApiSubmissionDetailResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AssignmentDetail? assignment,  SubmissionResult submission,  List<SubmissionItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentApiSubmissionDetailResult() when $default != null:
return $default(_that.assignment,_that.submission,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AssignmentDetail? assignment,  SubmissionResult submission,  List<SubmissionItem> items)  $default,) {final _that = this;
switch (_that) {
case _StudentApiSubmissionDetailResult():
return $default(_that.assignment,_that.submission,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AssignmentDetail? assignment,  SubmissionResult submission,  List<SubmissionItem> items)?  $default,) {final _that = this;
switch (_that) {
case _StudentApiSubmissionDetailResult() when $default != null:
return $default(_that.assignment,_that.submission,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentApiSubmissionDetailResult implements StudentApiSubmissionDetailResult {
  const _StudentApiSubmissionDetailResult({this.assignment, required this.submission, final  List<SubmissionItem> items = const <SubmissionItem>[]}): _items = items;
  factory _StudentApiSubmissionDetailResult.fromJson(Map<String, dynamic> json) => _$StudentApiSubmissionDetailResultFromJson(json);

@override final  AssignmentDetail? assignment;
@override final  SubmissionResult submission;
 final  List<SubmissionItem> _items;
@override@JsonKey() List<SubmissionItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of StudentApiSubmissionDetailResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentApiSubmissionDetailResultCopyWith<_StudentApiSubmissionDetailResult> get copyWith => __$StudentApiSubmissionDetailResultCopyWithImpl<_StudentApiSubmissionDetailResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentApiSubmissionDetailResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentApiSubmissionDetailResult&&(identical(other.assignment, assignment) || other.assignment == assignment)&&(identical(other.submission, submission) || other.submission == submission)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assignment,submission,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'StudentApiSubmissionDetailResult(assignment: $assignment, submission: $submission, items: $items)';
}


}

/// @nodoc
abstract mixin class _$StudentApiSubmissionDetailResultCopyWith<$Res> implements $StudentApiSubmissionDetailResultCopyWith<$Res> {
  factory _$StudentApiSubmissionDetailResultCopyWith(_StudentApiSubmissionDetailResult value, $Res Function(_StudentApiSubmissionDetailResult) _then) = __$StudentApiSubmissionDetailResultCopyWithImpl;
@override @useResult
$Res call({
 AssignmentDetail? assignment, SubmissionResult submission, List<SubmissionItem> items
});


@override $AssignmentDetailCopyWith<$Res>? get assignment;@override $SubmissionResultCopyWith<$Res> get submission;

}
/// @nodoc
class __$StudentApiSubmissionDetailResultCopyWithImpl<$Res>
    implements _$StudentApiSubmissionDetailResultCopyWith<$Res> {
  __$StudentApiSubmissionDetailResultCopyWithImpl(this._self, this._then);

  final _StudentApiSubmissionDetailResult _self;
  final $Res Function(_StudentApiSubmissionDetailResult) _then;

/// Create a copy of StudentApiSubmissionDetailResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assignment = freezed,Object? submission = null,Object? items = null,}) {
  return _then(_StudentApiSubmissionDetailResult(
assignment: freezed == assignment ? _self.assignment : assignment // ignore: cast_nullable_to_non_nullable
as AssignmentDetail?,submission: null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as SubmissionResult,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SubmissionItem>,
  ));
}

/// Create a copy of StudentApiSubmissionDetailResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssignmentDetailCopyWith<$Res>? get assignment {
    if (_self.assignment == null) {
    return null;
  }

  return $AssignmentDetailCopyWith<$Res>(_self.assignment!, (value) {
    return _then(_self.copyWith(assignment: value));
  });
}/// Create a copy of StudentApiSubmissionDetailResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubmissionResultCopyWith<$Res> get submission {
  
  return $SubmissionResultCopyWith<$Res>(_self.submission, (value) {
    return _then(_self.copyWith(submission: value));
  });
}
}


/// @nodoc
mixin _$StudentListAssignmentsPayload {

 int get limit; String? get courseId;
/// Create a copy of StudentListAssignmentsPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentListAssignmentsPayloadCopyWith<StudentListAssignmentsPayload> get copyWith => _$StudentListAssignmentsPayloadCopyWithImpl<StudentListAssignmentsPayload>(this as StudentListAssignmentsPayload, _$identity);

  /// Serializes this StudentListAssignmentsPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentListAssignmentsPayload&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.courseId, courseId) || other.courseId == courseId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,courseId);

@override
String toString() {
  return 'StudentListAssignmentsPayload(limit: $limit, courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class $StudentListAssignmentsPayloadCopyWith<$Res>  {
  factory $StudentListAssignmentsPayloadCopyWith(StudentListAssignmentsPayload value, $Res Function(StudentListAssignmentsPayload) _then) = _$StudentListAssignmentsPayloadCopyWithImpl;
@useResult
$Res call({
 int limit, String? courseId
});




}
/// @nodoc
class _$StudentListAssignmentsPayloadCopyWithImpl<$Res>
    implements $StudentListAssignmentsPayloadCopyWith<$Res> {
  _$StudentListAssignmentsPayloadCopyWithImpl(this._self, this._then);

  final StudentListAssignmentsPayload _self;
  final $Res Function(StudentListAssignmentsPayload) _then;

/// Create a copy of StudentListAssignmentsPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? courseId = freezed,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentListAssignmentsPayload].
extension StudentListAssignmentsPayloadPatterns on StudentListAssignmentsPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentListAssignmentsPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentListAssignmentsPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentListAssignmentsPayload value)  $default,){
final _that = this;
switch (_that) {
case _StudentListAssignmentsPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentListAssignmentsPayload value)?  $default,){
final _that = this;
switch (_that) {
case _StudentListAssignmentsPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int limit,  String? courseId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentListAssignmentsPayload() when $default != null:
return $default(_that.limit,_that.courseId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int limit,  String? courseId)  $default,) {final _that = this;
switch (_that) {
case _StudentListAssignmentsPayload():
return $default(_that.limit,_that.courseId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int limit,  String? courseId)?  $default,) {final _that = this;
switch (_that) {
case _StudentListAssignmentsPayload() when $default != null:
return $default(_that.limit,_that.courseId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentListAssignmentsPayload implements StudentListAssignmentsPayload {
  const _StudentListAssignmentsPayload({this.limit = 20, this.courseId});
  factory _StudentListAssignmentsPayload.fromJson(Map<String, dynamic> json) => _$StudentListAssignmentsPayloadFromJson(json);

@override@JsonKey() final  int limit;
@override final  String? courseId;

/// Create a copy of StudentListAssignmentsPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentListAssignmentsPayloadCopyWith<_StudentListAssignmentsPayload> get copyWith => __$StudentListAssignmentsPayloadCopyWithImpl<_StudentListAssignmentsPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentListAssignmentsPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentListAssignmentsPayload&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.courseId, courseId) || other.courseId == courseId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,courseId);

@override
String toString() {
  return 'StudentListAssignmentsPayload(limit: $limit, courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class _$StudentListAssignmentsPayloadCopyWith<$Res> implements $StudentListAssignmentsPayloadCopyWith<$Res> {
  factory _$StudentListAssignmentsPayloadCopyWith(_StudentListAssignmentsPayload value, $Res Function(_StudentListAssignmentsPayload) _then) = __$StudentListAssignmentsPayloadCopyWithImpl;
@override @useResult
$Res call({
 int limit, String? courseId
});




}
/// @nodoc
class __$StudentListAssignmentsPayloadCopyWithImpl<$Res>
    implements _$StudentListAssignmentsPayloadCopyWith<$Res> {
  __$StudentListAssignmentsPayloadCopyWithImpl(this._self, this._then);

  final _StudentListAssignmentsPayload _self;
  final $Res Function(_StudentListAssignmentsPayload) _then;

/// Create a copy of StudentListAssignmentsPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? courseId = freezed,}) {
  return _then(_StudentListAssignmentsPayload(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StudentListAssignmentsResult {

 List<Map<String, dynamic>> get assignments;
/// Create a copy of StudentListAssignmentsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentListAssignmentsResultCopyWith<StudentListAssignmentsResult> get copyWith => _$StudentListAssignmentsResultCopyWithImpl<StudentListAssignmentsResult>(this as StudentListAssignmentsResult, _$identity);

  /// Serializes this StudentListAssignmentsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentListAssignmentsResult&&const DeepCollectionEquality().equals(other.assignments, assignments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(assignments));

@override
String toString() {
  return 'StudentListAssignmentsResult(assignments: $assignments)';
}


}

/// @nodoc
abstract mixin class $StudentListAssignmentsResultCopyWith<$Res>  {
  factory $StudentListAssignmentsResultCopyWith(StudentListAssignmentsResult value, $Res Function(StudentListAssignmentsResult) _then) = _$StudentListAssignmentsResultCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> assignments
});




}
/// @nodoc
class _$StudentListAssignmentsResultCopyWithImpl<$Res>
    implements $StudentListAssignmentsResultCopyWith<$Res> {
  _$StudentListAssignmentsResultCopyWithImpl(this._self, this._then);

  final StudentListAssignmentsResult _self;
  final $Res Function(StudentListAssignmentsResult) _then;

/// Create a copy of StudentListAssignmentsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assignments = null,}) {
  return _then(_self.copyWith(
assignments: null == assignments ? _self.assignments : assignments // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentListAssignmentsResult].
extension StudentListAssignmentsResultPatterns on StudentListAssignmentsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentListAssignmentsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentListAssignmentsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentListAssignmentsResult value)  $default,){
final _that = this;
switch (_that) {
case _StudentListAssignmentsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentListAssignmentsResult value)?  $default,){
final _that = this;
switch (_that) {
case _StudentListAssignmentsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> assignments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentListAssignmentsResult() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> assignments)  $default,) {final _that = this;
switch (_that) {
case _StudentListAssignmentsResult():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Map<String, dynamic>> assignments)?  $default,) {final _that = this;
switch (_that) {
case _StudentListAssignmentsResult() when $default != null:
return $default(_that.assignments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentListAssignmentsResult implements StudentListAssignmentsResult {
  const _StudentListAssignmentsResult({final  List<Map<String, dynamic>> assignments = const <Map<String, dynamic>>[]}): _assignments = assignments;
  factory _StudentListAssignmentsResult.fromJson(Map<String, dynamic> json) => _$StudentListAssignmentsResultFromJson(json);

 final  List<Map<String, dynamic>> _assignments;
@override@JsonKey() List<Map<String, dynamic>> get assignments {
  if (_assignments is EqualUnmodifiableListView) return _assignments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assignments);
}


/// Create a copy of StudentListAssignmentsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentListAssignmentsResultCopyWith<_StudentListAssignmentsResult> get copyWith => __$StudentListAssignmentsResultCopyWithImpl<_StudentListAssignmentsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentListAssignmentsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentListAssignmentsResult&&const DeepCollectionEquality().equals(other._assignments, _assignments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_assignments));

@override
String toString() {
  return 'StudentListAssignmentsResult(assignments: $assignments)';
}


}

/// @nodoc
abstract mixin class _$StudentListAssignmentsResultCopyWith<$Res> implements $StudentListAssignmentsResultCopyWith<$Res> {
  factory _$StudentListAssignmentsResultCopyWith(_StudentListAssignmentsResult value, $Res Function(_StudentListAssignmentsResult) _then) = __$StudentListAssignmentsResultCopyWithImpl;
@override @useResult
$Res call({
 List<Map<String, dynamic>> assignments
});




}
/// @nodoc
class __$StudentListAssignmentsResultCopyWithImpl<$Res>
    implements _$StudentListAssignmentsResultCopyWith<$Res> {
  __$StudentListAssignmentsResultCopyWithImpl(this._self, this._then);

  final _StudentListAssignmentsResult _self;
  final $Res Function(_StudentListAssignmentsResult) _then;

/// Create a copy of StudentListAssignmentsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assignments = null,}) {
  return _then(_StudentListAssignmentsResult(
assignments: null == assignments ? _self._assignments : assignments // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}


/// @nodoc
mixin _$StudentFetchNotesPayload {

 bool get includeDeleted; String get status;
/// Create a copy of StudentFetchNotesPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentFetchNotesPayloadCopyWith<StudentFetchNotesPayload> get copyWith => _$StudentFetchNotesPayloadCopyWithImpl<StudentFetchNotesPayload>(this as StudentFetchNotesPayload, _$identity);

  /// Serializes this StudentFetchNotesPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentFetchNotesPayload&&(identical(other.includeDeleted, includeDeleted) || other.includeDeleted == includeDeleted)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,includeDeleted,status);

@override
String toString() {
  return 'StudentFetchNotesPayload(includeDeleted: $includeDeleted, status: $status)';
}


}

/// @nodoc
abstract mixin class $StudentFetchNotesPayloadCopyWith<$Res>  {
  factory $StudentFetchNotesPayloadCopyWith(StudentFetchNotesPayload value, $Res Function(StudentFetchNotesPayload) _then) = _$StudentFetchNotesPayloadCopyWithImpl;
@useResult
$Res call({
 bool includeDeleted, String status
});




}
/// @nodoc
class _$StudentFetchNotesPayloadCopyWithImpl<$Res>
    implements $StudentFetchNotesPayloadCopyWith<$Res> {
  _$StudentFetchNotesPayloadCopyWithImpl(this._self, this._then);

  final StudentFetchNotesPayload _self;
  final $Res Function(StudentFetchNotesPayload) _then;

/// Create a copy of StudentFetchNotesPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? includeDeleted = null,Object? status = null,}) {
  return _then(_self.copyWith(
includeDeleted: null == includeDeleted ? _self.includeDeleted : includeDeleted // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentFetchNotesPayload].
extension StudentFetchNotesPayloadPatterns on StudentFetchNotesPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentFetchNotesPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentFetchNotesPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentFetchNotesPayload value)  $default,){
final _that = this;
switch (_that) {
case _StudentFetchNotesPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentFetchNotesPayload value)?  $default,){
final _that = this;
switch (_that) {
case _StudentFetchNotesPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool includeDeleted,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentFetchNotesPayload() when $default != null:
return $default(_that.includeDeleted,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool includeDeleted,  String status)  $default,) {final _that = this;
switch (_that) {
case _StudentFetchNotesPayload():
return $default(_that.includeDeleted,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool includeDeleted,  String status)?  $default,) {final _that = this;
switch (_that) {
case _StudentFetchNotesPayload() when $default != null:
return $default(_that.includeDeleted,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentFetchNotesPayload implements StudentFetchNotesPayload {
  const _StudentFetchNotesPayload({this.includeDeleted = false, this.status = 'all'});
  factory _StudentFetchNotesPayload.fromJson(Map<String, dynamic> json) => _$StudentFetchNotesPayloadFromJson(json);

@override@JsonKey() final  bool includeDeleted;
@override@JsonKey() final  String status;

/// Create a copy of StudentFetchNotesPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentFetchNotesPayloadCopyWith<_StudentFetchNotesPayload> get copyWith => __$StudentFetchNotesPayloadCopyWithImpl<_StudentFetchNotesPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentFetchNotesPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentFetchNotesPayload&&(identical(other.includeDeleted, includeDeleted) || other.includeDeleted == includeDeleted)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,includeDeleted,status);

@override
String toString() {
  return 'StudentFetchNotesPayload(includeDeleted: $includeDeleted, status: $status)';
}


}

/// @nodoc
abstract mixin class _$StudentFetchNotesPayloadCopyWith<$Res> implements $StudentFetchNotesPayloadCopyWith<$Res> {
  factory _$StudentFetchNotesPayloadCopyWith(_StudentFetchNotesPayload value, $Res Function(_StudentFetchNotesPayload) _then) = __$StudentFetchNotesPayloadCopyWithImpl;
@override @useResult
$Res call({
 bool includeDeleted, String status
});




}
/// @nodoc
class __$StudentFetchNotesPayloadCopyWithImpl<$Res>
    implements _$StudentFetchNotesPayloadCopyWith<$Res> {
  __$StudentFetchNotesPayloadCopyWithImpl(this._self, this._then);

  final _StudentFetchNotesPayload _self;
  final $Res Function(_StudentFetchNotesPayload) _then;

/// Create a copy of StudentFetchNotesPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? includeDeleted = null,Object? status = null,}) {
  return _then(_StudentFetchNotesPayload(
includeDeleted: null == includeDeleted ? _self.includeDeleted : includeDeleted // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$StudentFetchNotesResult {

 List<Map<String, dynamic>> get notes;
/// Create a copy of StudentFetchNotesResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentFetchNotesResultCopyWith<StudentFetchNotesResult> get copyWith => _$StudentFetchNotesResultCopyWithImpl<StudentFetchNotesResult>(this as StudentFetchNotesResult, _$identity);

  /// Serializes this StudentFetchNotesResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentFetchNotesResult&&const DeepCollectionEquality().equals(other.notes, notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(notes));

@override
String toString() {
  return 'StudentFetchNotesResult(notes: $notes)';
}


}

/// @nodoc
abstract mixin class $StudentFetchNotesResultCopyWith<$Res>  {
  factory $StudentFetchNotesResultCopyWith(StudentFetchNotesResult value, $Res Function(StudentFetchNotesResult) _then) = _$StudentFetchNotesResultCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> notes
});




}
/// @nodoc
class _$StudentFetchNotesResultCopyWithImpl<$Res>
    implements $StudentFetchNotesResultCopyWith<$Res> {
  _$StudentFetchNotesResultCopyWithImpl(this._self, this._then);

  final StudentFetchNotesResult _self;
  final $Res Function(StudentFetchNotesResult) _then;

/// Create a copy of StudentFetchNotesResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notes = null,}) {
  return _then(_self.copyWith(
notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentFetchNotesResult].
extension StudentFetchNotesResultPatterns on StudentFetchNotesResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentFetchNotesResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentFetchNotesResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentFetchNotesResult value)  $default,){
final _that = this;
switch (_that) {
case _StudentFetchNotesResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentFetchNotesResult value)?  $default,){
final _that = this;
switch (_that) {
case _StudentFetchNotesResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentFetchNotesResult() when $default != null:
return $default(_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> notes)  $default,) {final _that = this;
switch (_that) {
case _StudentFetchNotesResult():
return $default(_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Map<String, dynamic>> notes)?  $default,) {final _that = this;
switch (_that) {
case _StudentFetchNotesResult() when $default != null:
return $default(_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentFetchNotesResult implements StudentFetchNotesResult {
  const _StudentFetchNotesResult({final  List<Map<String, dynamic>> notes = const <Map<String, dynamic>>[]}): _notes = notes;
  factory _StudentFetchNotesResult.fromJson(Map<String, dynamic> json) => _$StudentFetchNotesResultFromJson(json);

 final  List<Map<String, dynamic>> _notes;
@override@JsonKey() List<Map<String, dynamic>> get notes {
  if (_notes is EqualUnmodifiableListView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notes);
}


/// Create a copy of StudentFetchNotesResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentFetchNotesResultCopyWith<_StudentFetchNotesResult> get copyWith => __$StudentFetchNotesResultCopyWithImpl<_StudentFetchNotesResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentFetchNotesResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentFetchNotesResult&&const DeepCollectionEquality().equals(other._notes, _notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notes));

@override
String toString() {
  return 'StudentFetchNotesResult(notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$StudentFetchNotesResultCopyWith<$Res> implements $StudentFetchNotesResultCopyWith<$Res> {
  factory _$StudentFetchNotesResultCopyWith(_StudentFetchNotesResult value, $Res Function(_StudentFetchNotesResult) _then) = __$StudentFetchNotesResultCopyWithImpl;
@override @useResult
$Res call({
 List<Map<String, dynamic>> notes
});




}
/// @nodoc
class __$StudentFetchNotesResultCopyWithImpl<$Res>
    implements _$StudentFetchNotesResultCopyWith<$Res> {
  __$StudentFetchNotesResultCopyWithImpl(this._self, this._then);

  final _StudentFetchNotesResult _self;
  final $Res Function(_StudentFetchNotesResult) _then;

/// Create a copy of StudentFetchNotesResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notes = null,}) {
  return _then(_StudentFetchNotesResult(
notes: null == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}


/// @nodoc
mixin _$StudentFetchMessagesResult {

 List<Map<String, dynamic>> get conversations;
/// Create a copy of StudentFetchMessagesResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentFetchMessagesResultCopyWith<StudentFetchMessagesResult> get copyWith => _$StudentFetchMessagesResultCopyWithImpl<StudentFetchMessagesResult>(this as StudentFetchMessagesResult, _$identity);

  /// Serializes this StudentFetchMessagesResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentFetchMessagesResult&&const DeepCollectionEquality().equals(other.conversations, conversations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(conversations));

@override
String toString() {
  return 'StudentFetchMessagesResult(conversations: $conversations)';
}


}

/// @nodoc
abstract mixin class $StudentFetchMessagesResultCopyWith<$Res>  {
  factory $StudentFetchMessagesResultCopyWith(StudentFetchMessagesResult value, $Res Function(StudentFetchMessagesResult) _then) = _$StudentFetchMessagesResultCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> conversations
});




}
/// @nodoc
class _$StudentFetchMessagesResultCopyWithImpl<$Res>
    implements $StudentFetchMessagesResultCopyWith<$Res> {
  _$StudentFetchMessagesResultCopyWithImpl(this._self, this._then);

  final StudentFetchMessagesResult _self;
  final $Res Function(StudentFetchMessagesResult) _then;

/// Create a copy of StudentFetchMessagesResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversations = null,}) {
  return _then(_self.copyWith(
conversations: null == conversations ? _self.conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentFetchMessagesResult].
extension StudentFetchMessagesResultPatterns on StudentFetchMessagesResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentFetchMessagesResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentFetchMessagesResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentFetchMessagesResult value)  $default,){
final _that = this;
switch (_that) {
case _StudentFetchMessagesResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentFetchMessagesResult value)?  $default,){
final _that = this;
switch (_that) {
case _StudentFetchMessagesResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> conversations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentFetchMessagesResult() when $default != null:
return $default(_that.conversations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> conversations)  $default,) {final _that = this;
switch (_that) {
case _StudentFetchMessagesResult():
return $default(_that.conversations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Map<String, dynamic>> conversations)?  $default,) {final _that = this;
switch (_that) {
case _StudentFetchMessagesResult() when $default != null:
return $default(_that.conversations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentFetchMessagesResult implements StudentFetchMessagesResult {
  const _StudentFetchMessagesResult({final  List<Map<String, dynamic>> conversations = const <Map<String, dynamic>>[]}): _conversations = conversations;
  factory _StudentFetchMessagesResult.fromJson(Map<String, dynamic> json) => _$StudentFetchMessagesResultFromJson(json);

 final  List<Map<String, dynamic>> _conversations;
@override@JsonKey() List<Map<String, dynamic>> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}


/// Create a copy of StudentFetchMessagesResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentFetchMessagesResultCopyWith<_StudentFetchMessagesResult> get copyWith => __$StudentFetchMessagesResultCopyWithImpl<_StudentFetchMessagesResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentFetchMessagesResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentFetchMessagesResult&&const DeepCollectionEquality().equals(other._conversations, _conversations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_conversations));

@override
String toString() {
  return 'StudentFetchMessagesResult(conversations: $conversations)';
}


}

/// @nodoc
abstract mixin class _$StudentFetchMessagesResultCopyWith<$Res> implements $StudentFetchMessagesResultCopyWith<$Res> {
  factory _$StudentFetchMessagesResultCopyWith(_StudentFetchMessagesResult value, $Res Function(_StudentFetchMessagesResult) _then) = __$StudentFetchMessagesResultCopyWithImpl;
@override @useResult
$Res call({
 List<Map<String, dynamic>> conversations
});




}
/// @nodoc
class __$StudentFetchMessagesResultCopyWithImpl<$Res>
    implements _$StudentFetchMessagesResultCopyWith<$Res> {
  __$StudentFetchMessagesResultCopyWithImpl(this._self, this._then);

  final _StudentFetchMessagesResult _self;
  final $Res Function(_StudentFetchMessagesResult) _then;

/// Create a copy of StudentFetchMessagesResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversations = null,}) {
  return _then(_StudentFetchMessagesResult(
conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}


/// @nodoc
mixin _$StudentFetchExamsPayload {

 int get limit;
/// Create a copy of StudentFetchExamsPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentFetchExamsPayloadCopyWith<StudentFetchExamsPayload> get copyWith => _$StudentFetchExamsPayloadCopyWithImpl<StudentFetchExamsPayload>(this as StudentFetchExamsPayload, _$identity);

  /// Serializes this StudentFetchExamsPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentFetchExamsPayload&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit);

@override
String toString() {
  return 'StudentFetchExamsPayload(limit: $limit)';
}


}

/// @nodoc
abstract mixin class $StudentFetchExamsPayloadCopyWith<$Res>  {
  factory $StudentFetchExamsPayloadCopyWith(StudentFetchExamsPayload value, $Res Function(StudentFetchExamsPayload) _then) = _$StudentFetchExamsPayloadCopyWithImpl;
@useResult
$Res call({
 int limit
});




}
/// @nodoc
class _$StudentFetchExamsPayloadCopyWithImpl<$Res>
    implements $StudentFetchExamsPayloadCopyWith<$Res> {
  _$StudentFetchExamsPayloadCopyWithImpl(this._self, this._then);

  final StudentFetchExamsPayload _self;
  final $Res Function(StudentFetchExamsPayload) _then;

/// Create a copy of StudentFetchExamsPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentFetchExamsPayload].
extension StudentFetchExamsPayloadPatterns on StudentFetchExamsPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentFetchExamsPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentFetchExamsPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentFetchExamsPayload value)  $default,){
final _that = this;
switch (_that) {
case _StudentFetchExamsPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentFetchExamsPayload value)?  $default,){
final _that = this;
switch (_that) {
case _StudentFetchExamsPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentFetchExamsPayload() when $default != null:
return $default(_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int limit)  $default,) {final _that = this;
switch (_that) {
case _StudentFetchExamsPayload():
return $default(_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int limit)?  $default,) {final _that = this;
switch (_that) {
case _StudentFetchExamsPayload() when $default != null:
return $default(_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentFetchExamsPayload implements StudentFetchExamsPayload {
  const _StudentFetchExamsPayload({this.limit = 10});
  factory _StudentFetchExamsPayload.fromJson(Map<String, dynamic> json) => _$StudentFetchExamsPayloadFromJson(json);

@override@JsonKey() final  int limit;

/// Create a copy of StudentFetchExamsPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentFetchExamsPayloadCopyWith<_StudentFetchExamsPayload> get copyWith => __$StudentFetchExamsPayloadCopyWithImpl<_StudentFetchExamsPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentFetchExamsPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentFetchExamsPayload&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit);

@override
String toString() {
  return 'StudentFetchExamsPayload(limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$StudentFetchExamsPayloadCopyWith<$Res> implements $StudentFetchExamsPayloadCopyWith<$Res> {
  factory _$StudentFetchExamsPayloadCopyWith(_StudentFetchExamsPayload value, $Res Function(_StudentFetchExamsPayload) _then) = __$StudentFetchExamsPayloadCopyWithImpl;
@override @useResult
$Res call({
 int limit
});




}
/// @nodoc
class __$StudentFetchExamsPayloadCopyWithImpl<$Res>
    implements _$StudentFetchExamsPayloadCopyWith<$Res> {
  __$StudentFetchExamsPayloadCopyWithImpl(this._self, this._then);

  final _StudentFetchExamsPayload _self;
  final $Res Function(_StudentFetchExamsPayload) _then;

/// Create a copy of StudentFetchExamsPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,}) {
  return _then(_StudentFetchExamsPayload(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$StudentFetchExamsResult {

 List<Map<String, dynamic>> get exams;
/// Create a copy of StudentFetchExamsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentFetchExamsResultCopyWith<StudentFetchExamsResult> get copyWith => _$StudentFetchExamsResultCopyWithImpl<StudentFetchExamsResult>(this as StudentFetchExamsResult, _$identity);

  /// Serializes this StudentFetchExamsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentFetchExamsResult&&const DeepCollectionEquality().equals(other.exams, exams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(exams));

@override
String toString() {
  return 'StudentFetchExamsResult(exams: $exams)';
}


}

/// @nodoc
abstract mixin class $StudentFetchExamsResultCopyWith<$Res>  {
  factory $StudentFetchExamsResultCopyWith(StudentFetchExamsResult value, $Res Function(StudentFetchExamsResult) _then) = _$StudentFetchExamsResultCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> exams
});




}
/// @nodoc
class _$StudentFetchExamsResultCopyWithImpl<$Res>
    implements $StudentFetchExamsResultCopyWith<$Res> {
  _$StudentFetchExamsResultCopyWithImpl(this._self, this._then);

  final StudentFetchExamsResult _self;
  final $Res Function(StudentFetchExamsResult) _then;

/// Create a copy of StudentFetchExamsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exams = null,}) {
  return _then(_self.copyWith(
exams: null == exams ? _self.exams : exams // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentFetchExamsResult].
extension StudentFetchExamsResultPatterns on StudentFetchExamsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentFetchExamsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentFetchExamsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentFetchExamsResult value)  $default,){
final _that = this;
switch (_that) {
case _StudentFetchExamsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentFetchExamsResult value)?  $default,){
final _that = this;
switch (_that) {
case _StudentFetchExamsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> exams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentFetchExamsResult() when $default != null:
return $default(_that.exams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> exams)  $default,) {final _that = this;
switch (_that) {
case _StudentFetchExamsResult():
return $default(_that.exams);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Map<String, dynamic>> exams)?  $default,) {final _that = this;
switch (_that) {
case _StudentFetchExamsResult() when $default != null:
return $default(_that.exams);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentFetchExamsResult implements StudentFetchExamsResult {
  const _StudentFetchExamsResult({final  List<Map<String, dynamic>> exams = const <Map<String, dynamic>>[]}): _exams = exams;
  factory _StudentFetchExamsResult.fromJson(Map<String, dynamic> json) => _$StudentFetchExamsResultFromJson(json);

 final  List<Map<String, dynamic>> _exams;
@override@JsonKey() List<Map<String, dynamic>> get exams {
  if (_exams is EqualUnmodifiableListView) return _exams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exams);
}


/// Create a copy of StudentFetchExamsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentFetchExamsResultCopyWith<_StudentFetchExamsResult> get copyWith => __$StudentFetchExamsResultCopyWithImpl<_StudentFetchExamsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentFetchExamsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentFetchExamsResult&&const DeepCollectionEquality().equals(other._exams, _exams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_exams));

@override
String toString() {
  return 'StudentFetchExamsResult(exams: $exams)';
}


}

/// @nodoc
abstract mixin class _$StudentFetchExamsResultCopyWith<$Res> implements $StudentFetchExamsResultCopyWith<$Res> {
  factory _$StudentFetchExamsResultCopyWith(_StudentFetchExamsResult value, $Res Function(_StudentFetchExamsResult) _then) = __$StudentFetchExamsResultCopyWithImpl;
@override @useResult
$Res call({
 List<Map<String, dynamic>> exams
});




}
/// @nodoc
class __$StudentFetchExamsResultCopyWithImpl<$Res>
    implements _$StudentFetchExamsResultCopyWith<$Res> {
  __$StudentFetchExamsResultCopyWithImpl(this._self, this._then);

  final _StudentFetchExamsResult _self;
  final $Res Function(_StudentFetchExamsResult) _then;

/// Create a copy of StudentFetchExamsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exams = null,}) {
  return _then(_StudentFetchExamsResult(
exams: null == exams ? _self._exams : exams // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}


/// @nodoc
mixin _$StudentFetchSchedulePayload {

 String get from; String get to;
/// Create a copy of StudentFetchSchedulePayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentFetchSchedulePayloadCopyWith<StudentFetchSchedulePayload> get copyWith => _$StudentFetchSchedulePayloadCopyWithImpl<StudentFetchSchedulePayload>(this as StudentFetchSchedulePayload, _$identity);

  /// Serializes this StudentFetchSchedulePayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentFetchSchedulePayload&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to);

@override
String toString() {
  return 'StudentFetchSchedulePayload(from: $from, to: $to)';
}


}

/// @nodoc
abstract mixin class $StudentFetchSchedulePayloadCopyWith<$Res>  {
  factory $StudentFetchSchedulePayloadCopyWith(StudentFetchSchedulePayload value, $Res Function(StudentFetchSchedulePayload) _then) = _$StudentFetchSchedulePayloadCopyWithImpl;
@useResult
$Res call({
 String from, String to
});




}
/// @nodoc
class _$StudentFetchSchedulePayloadCopyWithImpl<$Res>
    implements $StudentFetchSchedulePayloadCopyWith<$Res> {
  _$StudentFetchSchedulePayloadCopyWithImpl(this._self, this._then);

  final StudentFetchSchedulePayload _self;
  final $Res Function(StudentFetchSchedulePayload) _then;

/// Create a copy of StudentFetchSchedulePayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? from = null,Object? to = null,}) {
  return _then(_self.copyWith(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as String,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentFetchSchedulePayload].
extension StudentFetchSchedulePayloadPatterns on StudentFetchSchedulePayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentFetchSchedulePayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentFetchSchedulePayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentFetchSchedulePayload value)  $default,){
final _that = this;
switch (_that) {
case _StudentFetchSchedulePayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentFetchSchedulePayload value)?  $default,){
final _that = this;
switch (_that) {
case _StudentFetchSchedulePayload() when $default != null:
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
case _StudentFetchSchedulePayload() when $default != null:
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
case _StudentFetchSchedulePayload():
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
case _StudentFetchSchedulePayload() when $default != null:
return $default(_that.from,_that.to);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentFetchSchedulePayload implements StudentFetchSchedulePayload {
  const _StudentFetchSchedulePayload({required this.from, required this.to});
  factory _StudentFetchSchedulePayload.fromJson(Map<String, dynamic> json) => _$StudentFetchSchedulePayloadFromJson(json);

@override final  String from;
@override final  String to;

/// Create a copy of StudentFetchSchedulePayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentFetchSchedulePayloadCopyWith<_StudentFetchSchedulePayload> get copyWith => __$StudentFetchSchedulePayloadCopyWithImpl<_StudentFetchSchedulePayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentFetchSchedulePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentFetchSchedulePayload&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to);

@override
String toString() {
  return 'StudentFetchSchedulePayload(from: $from, to: $to)';
}


}

/// @nodoc
abstract mixin class _$StudentFetchSchedulePayloadCopyWith<$Res> implements $StudentFetchSchedulePayloadCopyWith<$Res> {
  factory _$StudentFetchSchedulePayloadCopyWith(_StudentFetchSchedulePayload value, $Res Function(_StudentFetchSchedulePayload) _then) = __$StudentFetchSchedulePayloadCopyWithImpl;
@override @useResult
$Res call({
 String from, String to
});




}
/// @nodoc
class __$StudentFetchSchedulePayloadCopyWithImpl<$Res>
    implements _$StudentFetchSchedulePayloadCopyWith<$Res> {
  __$StudentFetchSchedulePayloadCopyWithImpl(this._self, this._then);

  final _StudentFetchSchedulePayload _self;
  final $Res Function(_StudentFetchSchedulePayload) _then;

/// Create a copy of StudentFetchSchedulePayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,}) {
  return _then(_StudentFetchSchedulePayload(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as String,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$StudentFetchScheduleResult {

 List<Map<String, dynamic>> get sessions;
/// Create a copy of StudentFetchScheduleResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentFetchScheduleResultCopyWith<StudentFetchScheduleResult> get copyWith => _$StudentFetchScheduleResultCopyWithImpl<StudentFetchScheduleResult>(this as StudentFetchScheduleResult, _$identity);

  /// Serializes this StudentFetchScheduleResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentFetchScheduleResult&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'StudentFetchScheduleResult(sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $StudentFetchScheduleResultCopyWith<$Res>  {
  factory $StudentFetchScheduleResultCopyWith(StudentFetchScheduleResult value, $Res Function(StudentFetchScheduleResult) _then) = _$StudentFetchScheduleResultCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> sessions
});




}
/// @nodoc
class _$StudentFetchScheduleResultCopyWithImpl<$Res>
    implements $StudentFetchScheduleResultCopyWith<$Res> {
  _$StudentFetchScheduleResultCopyWithImpl(this._self, this._then);

  final StudentFetchScheduleResult _self;
  final $Res Function(StudentFetchScheduleResult) _then;

/// Create a copy of StudentFetchScheduleResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessions = null,}) {
  return _then(_self.copyWith(
sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentFetchScheduleResult].
extension StudentFetchScheduleResultPatterns on StudentFetchScheduleResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentFetchScheduleResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentFetchScheduleResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentFetchScheduleResult value)  $default,){
final _that = this;
switch (_that) {
case _StudentFetchScheduleResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentFetchScheduleResult value)?  $default,){
final _that = this;
switch (_that) {
case _StudentFetchScheduleResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentFetchScheduleResult() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> sessions)  $default,) {final _that = this;
switch (_that) {
case _StudentFetchScheduleResult():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Map<String, dynamic>> sessions)?  $default,) {final _that = this;
switch (_that) {
case _StudentFetchScheduleResult() when $default != null:
return $default(_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentFetchScheduleResult implements StudentFetchScheduleResult {
  const _StudentFetchScheduleResult({final  List<Map<String, dynamic>> sessions = const <Map<String, dynamic>>[]}): _sessions = sessions;
  factory _StudentFetchScheduleResult.fromJson(Map<String, dynamic> json) => _$StudentFetchScheduleResultFromJson(json);

 final  List<Map<String, dynamic>> _sessions;
@override@JsonKey() List<Map<String, dynamic>> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of StudentFetchScheduleResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentFetchScheduleResultCopyWith<_StudentFetchScheduleResult> get copyWith => __$StudentFetchScheduleResultCopyWithImpl<_StudentFetchScheduleResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentFetchScheduleResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentFetchScheduleResult&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'StudentFetchScheduleResult(sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$StudentFetchScheduleResultCopyWith<$Res> implements $StudentFetchScheduleResultCopyWith<$Res> {
  factory _$StudentFetchScheduleResultCopyWith(_StudentFetchScheduleResult value, $Res Function(_StudentFetchScheduleResult) _then) = __$StudentFetchScheduleResultCopyWithImpl;
@override @useResult
$Res call({
 List<Map<String, dynamic>> sessions
});




}
/// @nodoc
class __$StudentFetchScheduleResultCopyWithImpl<$Res>
    implements _$StudentFetchScheduleResultCopyWith<$Res> {
  __$StudentFetchScheduleResultCopyWithImpl(this._self, this._then);

  final _StudentFetchScheduleResult _self;
  final $Res Function(_StudentFetchScheduleResult) _then;

/// Create a copy of StudentFetchScheduleResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessions = null,}) {
  return _then(_StudentFetchScheduleResult(
sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}


/// @nodoc
mixin _$StudentFetchRemindersResult {

 List<Map<String, dynamic>> get reminders;
/// Create a copy of StudentFetchRemindersResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentFetchRemindersResultCopyWith<StudentFetchRemindersResult> get copyWith => _$StudentFetchRemindersResultCopyWithImpl<StudentFetchRemindersResult>(this as StudentFetchRemindersResult, _$identity);

  /// Serializes this StudentFetchRemindersResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentFetchRemindersResult&&const DeepCollectionEquality().equals(other.reminders, reminders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(reminders));

@override
String toString() {
  return 'StudentFetchRemindersResult(reminders: $reminders)';
}


}

/// @nodoc
abstract mixin class $StudentFetchRemindersResultCopyWith<$Res>  {
  factory $StudentFetchRemindersResultCopyWith(StudentFetchRemindersResult value, $Res Function(StudentFetchRemindersResult) _then) = _$StudentFetchRemindersResultCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> reminders
});




}
/// @nodoc
class _$StudentFetchRemindersResultCopyWithImpl<$Res>
    implements $StudentFetchRemindersResultCopyWith<$Res> {
  _$StudentFetchRemindersResultCopyWithImpl(this._self, this._then);

  final StudentFetchRemindersResult _self;
  final $Res Function(StudentFetchRemindersResult) _then;

/// Create a copy of StudentFetchRemindersResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reminders = null,}) {
  return _then(_self.copyWith(
reminders: null == reminders ? _self.reminders : reminders // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentFetchRemindersResult].
extension StudentFetchRemindersResultPatterns on StudentFetchRemindersResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentFetchRemindersResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentFetchRemindersResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentFetchRemindersResult value)  $default,){
final _that = this;
switch (_that) {
case _StudentFetchRemindersResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentFetchRemindersResult value)?  $default,){
final _that = this;
switch (_that) {
case _StudentFetchRemindersResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> reminders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentFetchRemindersResult() when $default != null:
return $default(_that.reminders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> reminders)  $default,) {final _that = this;
switch (_that) {
case _StudentFetchRemindersResult():
return $default(_that.reminders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Map<String, dynamic>> reminders)?  $default,) {final _that = this;
switch (_that) {
case _StudentFetchRemindersResult() when $default != null:
return $default(_that.reminders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentFetchRemindersResult implements StudentFetchRemindersResult {
  const _StudentFetchRemindersResult({final  List<Map<String, dynamic>> reminders = const <Map<String, dynamic>>[]}): _reminders = reminders;
  factory _StudentFetchRemindersResult.fromJson(Map<String, dynamic> json) => _$StudentFetchRemindersResultFromJson(json);

 final  List<Map<String, dynamic>> _reminders;
@override@JsonKey() List<Map<String, dynamic>> get reminders {
  if (_reminders is EqualUnmodifiableListView) return _reminders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reminders);
}


/// Create a copy of StudentFetchRemindersResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentFetchRemindersResultCopyWith<_StudentFetchRemindersResult> get copyWith => __$StudentFetchRemindersResultCopyWithImpl<_StudentFetchRemindersResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentFetchRemindersResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentFetchRemindersResult&&const DeepCollectionEquality().equals(other._reminders, _reminders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reminders));

@override
String toString() {
  return 'StudentFetchRemindersResult(reminders: $reminders)';
}


}

/// @nodoc
abstract mixin class _$StudentFetchRemindersResultCopyWith<$Res> implements $StudentFetchRemindersResultCopyWith<$Res> {
  factory _$StudentFetchRemindersResultCopyWith(_StudentFetchRemindersResult value, $Res Function(_StudentFetchRemindersResult) _then) = __$StudentFetchRemindersResultCopyWithImpl;
@override @useResult
$Res call({
 List<Map<String, dynamic>> reminders
});




}
/// @nodoc
class __$StudentFetchRemindersResultCopyWithImpl<$Res>
    implements _$StudentFetchRemindersResultCopyWith<$Res> {
  __$StudentFetchRemindersResultCopyWithImpl(this._self, this._then);

  final _StudentFetchRemindersResult _self;
  final $Res Function(_StudentFetchRemindersResult) _then;

/// Create a copy of StudentFetchRemindersResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reminders = null,}) {
  return _then(_StudentFetchRemindersResult(
reminders: null == reminders ? _self._reminders : reminders // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

// dart format on
