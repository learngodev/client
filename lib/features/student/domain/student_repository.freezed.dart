// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StudentDashboardData {

 List<StudentReminderItem> get reminders; List<StudentScheduleItem> get schedule; List<StudentAssignmentItem> get assignments; List<StudentExamItem> get exams; List<StudentNoteItem> get notes; List<StudentMessageItem> get messages; List<StudentQuickLink> get quickLinks; List<StudentInsightItem> get insights;
/// Create a copy of StudentDashboardData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentDashboardDataCopyWith<StudentDashboardData> get copyWith => _$StudentDashboardDataCopyWithImpl<StudentDashboardData>(this as StudentDashboardData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentDashboardData&&const DeepCollectionEquality().equals(other.reminders, reminders)&&const DeepCollectionEquality().equals(other.schedule, schedule)&&const DeepCollectionEquality().equals(other.assignments, assignments)&&const DeepCollectionEquality().equals(other.exams, exams)&&const DeepCollectionEquality().equals(other.notes, notes)&&const DeepCollectionEquality().equals(other.messages, messages)&&const DeepCollectionEquality().equals(other.quickLinks, quickLinks)&&const DeepCollectionEquality().equals(other.insights, insights));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(reminders),const DeepCollectionEquality().hash(schedule),const DeepCollectionEquality().hash(assignments),const DeepCollectionEquality().hash(exams),const DeepCollectionEquality().hash(notes),const DeepCollectionEquality().hash(messages),const DeepCollectionEquality().hash(quickLinks),const DeepCollectionEquality().hash(insights));

@override
String toString() {
  return 'StudentDashboardData(reminders: $reminders, schedule: $schedule, assignments: $assignments, exams: $exams, notes: $notes, messages: $messages, quickLinks: $quickLinks, insights: $insights)';
}


}

/// @nodoc
abstract mixin class $StudentDashboardDataCopyWith<$Res>  {
  factory $StudentDashboardDataCopyWith(StudentDashboardData value, $Res Function(StudentDashboardData) _then) = _$StudentDashboardDataCopyWithImpl;
@useResult
$Res call({
 List<StudentReminderItem> reminders, List<StudentScheduleItem> schedule, List<StudentAssignmentItem> assignments, List<StudentExamItem> exams, List<StudentNoteItem> notes, List<StudentMessageItem> messages, List<StudentQuickLink> quickLinks, List<StudentInsightItem> insights
});




}
/// @nodoc
class _$StudentDashboardDataCopyWithImpl<$Res>
    implements $StudentDashboardDataCopyWith<$Res> {
  _$StudentDashboardDataCopyWithImpl(this._self, this._then);

  final StudentDashboardData _self;
  final $Res Function(StudentDashboardData) _then;

/// Create a copy of StudentDashboardData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reminders = null,Object? schedule = null,Object? assignments = null,Object? exams = null,Object? notes = null,Object? messages = null,Object? quickLinks = null,Object? insights = null,}) {
  return _then(_self.copyWith(
reminders: null == reminders ? _self.reminders : reminders // ignore: cast_nullable_to_non_nullable
as List<StudentReminderItem>,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as List<StudentScheduleItem>,assignments: null == assignments ? _self.assignments : assignments // ignore: cast_nullable_to_non_nullable
as List<StudentAssignmentItem>,exams: null == exams ? _self.exams : exams // ignore: cast_nullable_to_non_nullable
as List<StudentExamItem>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as List<StudentNoteItem>,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<StudentMessageItem>,quickLinks: null == quickLinks ? _self.quickLinks : quickLinks // ignore: cast_nullable_to_non_nullable
as List<StudentQuickLink>,insights: null == insights ? _self.insights : insights // ignore: cast_nullable_to_non_nullable
as List<StudentInsightItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentDashboardData].
extension StudentDashboardDataPatterns on StudentDashboardData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentDashboardData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentDashboardData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentDashboardData value)  $default,){
final _that = this;
switch (_that) {
case _StudentDashboardData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentDashboardData value)?  $default,){
final _that = this;
switch (_that) {
case _StudentDashboardData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<StudentReminderItem> reminders,  List<StudentScheduleItem> schedule,  List<StudentAssignmentItem> assignments,  List<StudentExamItem> exams,  List<StudentNoteItem> notes,  List<StudentMessageItem> messages,  List<StudentQuickLink> quickLinks,  List<StudentInsightItem> insights)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentDashboardData() when $default != null:
return $default(_that.reminders,_that.schedule,_that.assignments,_that.exams,_that.notes,_that.messages,_that.quickLinks,_that.insights);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<StudentReminderItem> reminders,  List<StudentScheduleItem> schedule,  List<StudentAssignmentItem> assignments,  List<StudentExamItem> exams,  List<StudentNoteItem> notes,  List<StudentMessageItem> messages,  List<StudentQuickLink> quickLinks,  List<StudentInsightItem> insights)  $default,) {final _that = this;
switch (_that) {
case _StudentDashboardData():
return $default(_that.reminders,_that.schedule,_that.assignments,_that.exams,_that.notes,_that.messages,_that.quickLinks,_that.insights);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<StudentReminderItem> reminders,  List<StudentScheduleItem> schedule,  List<StudentAssignmentItem> assignments,  List<StudentExamItem> exams,  List<StudentNoteItem> notes,  List<StudentMessageItem> messages,  List<StudentQuickLink> quickLinks,  List<StudentInsightItem> insights)?  $default,) {final _that = this;
switch (_that) {
case _StudentDashboardData() when $default != null:
return $default(_that.reminders,_that.schedule,_that.assignments,_that.exams,_that.notes,_that.messages,_that.quickLinks,_that.insights);case _:
  return null;

}
}

}

/// @nodoc


class _StudentDashboardData extends StudentDashboardData {
  const _StudentDashboardData({required final  List<StudentReminderItem> reminders, required final  List<StudentScheduleItem> schedule, required final  List<StudentAssignmentItem> assignments, required final  List<StudentExamItem> exams, required final  List<StudentNoteItem> notes, required final  List<StudentMessageItem> messages, required final  List<StudentQuickLink> quickLinks, required final  List<StudentInsightItem> insights}): _reminders = reminders,_schedule = schedule,_assignments = assignments,_exams = exams,_notes = notes,_messages = messages,_quickLinks = quickLinks,_insights = insights,super._();
  

 final  List<StudentReminderItem> _reminders;
@override List<StudentReminderItem> get reminders {
  if (_reminders is EqualUnmodifiableListView) return _reminders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reminders);
}

 final  List<StudentScheduleItem> _schedule;
@override List<StudentScheduleItem> get schedule {
  if (_schedule is EqualUnmodifiableListView) return _schedule;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_schedule);
}

 final  List<StudentAssignmentItem> _assignments;
@override List<StudentAssignmentItem> get assignments {
  if (_assignments is EqualUnmodifiableListView) return _assignments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assignments);
}

 final  List<StudentExamItem> _exams;
@override List<StudentExamItem> get exams {
  if (_exams is EqualUnmodifiableListView) return _exams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exams);
}

 final  List<StudentNoteItem> _notes;
@override List<StudentNoteItem> get notes {
  if (_notes is EqualUnmodifiableListView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notes);
}

 final  List<StudentMessageItem> _messages;
@override List<StudentMessageItem> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

 final  List<StudentQuickLink> _quickLinks;
@override List<StudentQuickLink> get quickLinks {
  if (_quickLinks is EqualUnmodifiableListView) return _quickLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quickLinks);
}

 final  List<StudentInsightItem> _insights;
@override List<StudentInsightItem> get insights {
  if (_insights is EqualUnmodifiableListView) return _insights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_insights);
}


/// Create a copy of StudentDashboardData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentDashboardDataCopyWith<_StudentDashboardData> get copyWith => __$StudentDashboardDataCopyWithImpl<_StudentDashboardData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentDashboardData&&const DeepCollectionEquality().equals(other._reminders, _reminders)&&const DeepCollectionEquality().equals(other._schedule, _schedule)&&const DeepCollectionEquality().equals(other._assignments, _assignments)&&const DeepCollectionEquality().equals(other._exams, _exams)&&const DeepCollectionEquality().equals(other._notes, _notes)&&const DeepCollectionEquality().equals(other._messages, _messages)&&const DeepCollectionEquality().equals(other._quickLinks, _quickLinks)&&const DeepCollectionEquality().equals(other._insights, _insights));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reminders),const DeepCollectionEquality().hash(_schedule),const DeepCollectionEquality().hash(_assignments),const DeepCollectionEquality().hash(_exams),const DeepCollectionEquality().hash(_notes),const DeepCollectionEquality().hash(_messages),const DeepCollectionEquality().hash(_quickLinks),const DeepCollectionEquality().hash(_insights));

@override
String toString() {
  return 'StudentDashboardData(reminders: $reminders, schedule: $schedule, assignments: $assignments, exams: $exams, notes: $notes, messages: $messages, quickLinks: $quickLinks, insights: $insights)';
}


}

/// @nodoc
abstract mixin class _$StudentDashboardDataCopyWith<$Res> implements $StudentDashboardDataCopyWith<$Res> {
  factory _$StudentDashboardDataCopyWith(_StudentDashboardData value, $Res Function(_StudentDashboardData) _then) = __$StudentDashboardDataCopyWithImpl;
@override @useResult
$Res call({
 List<StudentReminderItem> reminders, List<StudentScheduleItem> schedule, List<StudentAssignmentItem> assignments, List<StudentExamItem> exams, List<StudentNoteItem> notes, List<StudentMessageItem> messages, List<StudentQuickLink> quickLinks, List<StudentInsightItem> insights
});




}
/// @nodoc
class __$StudentDashboardDataCopyWithImpl<$Res>
    implements _$StudentDashboardDataCopyWith<$Res> {
  __$StudentDashboardDataCopyWithImpl(this._self, this._then);

  final _StudentDashboardData _self;
  final $Res Function(_StudentDashboardData) _then;

/// Create a copy of StudentDashboardData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reminders = null,Object? schedule = null,Object? assignments = null,Object? exams = null,Object? notes = null,Object? messages = null,Object? quickLinks = null,Object? insights = null,}) {
  return _then(_StudentDashboardData(
reminders: null == reminders ? _self._reminders : reminders // ignore: cast_nullable_to_non_nullable
as List<StudentReminderItem>,schedule: null == schedule ? _self._schedule : schedule // ignore: cast_nullable_to_non_nullable
as List<StudentScheduleItem>,assignments: null == assignments ? _self._assignments : assignments // ignore: cast_nullable_to_non_nullable
as List<StudentAssignmentItem>,exams: null == exams ? _self._exams : exams // ignore: cast_nullable_to_non_nullable
as List<StudentExamItem>,notes: null == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as List<StudentNoteItem>,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<StudentMessageItem>,quickLinks: null == quickLinks ? _self._quickLinks : quickLinks // ignore: cast_nullable_to_non_nullable
as List<StudentQuickLink>,insights: null == insights ? _self._insights : insights // ignore: cast_nullable_to_non_nullable
as List<StudentInsightItem>,
  ));
}


}

// dart format on
