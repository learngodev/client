// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Course _$CourseFromJson(Map<String, dynamic> json) => _Course(
  id: json['id'] as String? ?? '',
  schoolId: json['school_id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  teachers: json['teachers'] == null
      ? const []
      : _parseTeachers(json['teachers']),
);

Map<String, dynamic> _$CourseToJson(_Course instance) => <String, dynamic>{
  'id': instance.id,
  'school_id': instance.schoolId,
  'name': instance.name,
  'description': instance.description,
  'teachers': instance.teachers,
};

_Teacher _$TeacherFromJson(Map<String, dynamic> json) => _Teacher(
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
);

Map<String, dynamic> _$TeacherToJson(_Teacher instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

_CourseAssignment _$CourseAssignmentFromJson(Map<String, dynamic> json) =>
    _CourseAssignment(
      courseId: json['course_id'] as String? ?? '',
      courseName: json['course_name'] as String? ?? '',
      classId: json['class_id'] as String? ?? '',
      className: json['class_name'] as String? ?? '',
      teacherNames:
          (json['teacher_names'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      studentCount: (json['student_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CourseAssignmentToJson(_CourseAssignment instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'course_name': instance.courseName,
      'class_id': instance.classId,
      'class_name': instance.className,
      'teacher_names': instance.teacherNames,
      'student_count': instance.studentCount,
    };
