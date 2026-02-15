// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeacherScheduleItem _$TeacherScheduleItemFromJson(Map<String, dynamic> json) =>
    _TeacherScheduleItem(
      sessionId: json['session_id'] as String? ?? '',
      courseId: json['course_id'] as String? ?? '',
      courseName: json['course_name'] as String? ?? '',
      classId: json['class_id'] as String? ?? '',
      className: json['class_name'] as String? ?? '',
      startsAt: DateTime.parse(json['starts_at'] as String),
      endsAt: DateTime.parse(json['ends_at'] as String),
      day: json['day'] as String? ?? '',
      slotId: json['slot_id'] as String? ?? '',
      slotName: json['slot_name'] as String? ?? '',
      location: json['location'] as String? ?? '',
      source: json['source'] as String? ?? '',
    );

Map<String, dynamic> _$TeacherScheduleItemToJson(
  _TeacherScheduleItem instance,
) => <String, dynamic>{
  'session_id': instance.sessionId,
  'course_id': instance.courseId,
  'course_name': instance.courseName,
  'class_id': instance.classId,
  'class_name': instance.className,
  'starts_at': instance.startsAt.toIso8601String(),
  'ends_at': instance.endsAt.toIso8601String(),
  'day': instance.day,
  'slot_id': instance.slotId,
  'slot_name': instance.slotName,
  'location': instance.location,
  'source': instance.source,
};
