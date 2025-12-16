// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimeSlot _$TimeSlotFromJson(Map<String, dynamic> json) => _TimeSlot(
  id: json['id'] as String,
  schoolId: json['school_id'] as String,
  name: json['name'] as String,
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String,
);

Map<String, dynamic> _$TimeSlotToJson(_TimeSlot instance) => <String, dynamic>{
  'id': instance.id,
  'school_id': instance.schoolId,
  'name': instance.name,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
};

_CourseSchedule _$CourseScheduleFromJson(Map<String, dynamic> json) =>
    _CourseSchedule(
      id: json['id'] as String,
      schoolId: json['school_id'] as String,
      courseId: json['course_id'] as String,
      classId: json['class_id'] as String,
      teacherId: json['teacher_id'] as String,
      slotId: json['slot_id'] as String,
      dayOfWeek: (json['day_of_week'] as num).toInt(),
      location: json['location'] as String?,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      courseName: json['course_name'] as String?,
      className: json['class_name'] as String?,
      teacherName: json['teacher_name'] as String?,
      slotName: json['slot_name'] as String?,
    );

Map<String, dynamic> _$CourseScheduleToJson(_CourseSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_id': instance.schoolId,
      'course_id': instance.courseId,
      'class_id': instance.classId,
      'teacher_id': instance.teacherId,
      'slot_id': instance.slotId,
      'day_of_week': instance.dayOfWeek,
      'location': instance.location,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'course_name': instance.courseName,
      'class_name': instance.className,
      'teacher_name': instance.teacherName,
      'slot_name': instance.slotName,
    };

_ScheduleStats _$ScheduleStatsFromJson(Map<String, dynamic> json) =>
    _ScheduleStats(
      totalRules: (json['total_rules'] as num).toInt(),
      totalCourses: (json['total_courses'] as num).toInt(),
      scheduledCoursesCount: (json['scheduled_courses_count'] as num).toInt(),
      unscheduledCoursesCount: (json['unscheduled_courses_count'] as num)
          .toInt(),
      rulesByDay: (json['rules_by_day'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), (e as num).toInt()),
      ),
    );

Map<String, dynamic> _$ScheduleStatsToJson(
  _ScheduleStats instance,
) => <String, dynamic>{
  'total_rules': instance.totalRules,
  'total_courses': instance.totalCourses,
  'scheduled_courses_count': instance.scheduledCoursesCount,
  'unscheduled_courses_count': instance.unscheduledCoursesCount,
  'rules_by_day': instance.rulesByDay.map((k, e) => MapEntry(k.toString(), e)),
};
