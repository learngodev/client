// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Department _$DepartmentFromJson(Map<String, dynamic> json) => _Department(
  id: json['id'] as String? ?? '',
  schoolId: json['school_id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  teacherCount: (json['teacher_count'] as num?)?.toInt() ?? 0,
  studentCount: (json['student_count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$DepartmentToJson(_Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_id': instance.schoolId,
      'name': instance.name,
      'teacher_count': instance.teacherCount,
      'student_count': instance.studentCount,
    };

_ClassInfo _$ClassInfoFromJson(Map<String, dynamic> json) => _ClassInfo(
  id: json['id'] as String? ?? '',
  departmentId: json['department_id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  grade: json['grade'] as String?,
  description: json['description'] as String?,
  studentCount: (json['student_count'] as num?)?.toInt() ?? 0,
  teacherCount: (json['teacher_count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ClassInfoToJson(_ClassInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'department_id': instance.departmentId,
      'name': instance.name,
      'grade': instance.grade,
      'description': instance.description,
      'student_count': instance.studentCount,
      'teacher_count': instance.teacherCount,
    };

_AdminDepartmentMetrics _$AdminDepartmentMetricsFromJson(
  Map<String, dynamic> json,
) => _AdminDepartmentMetrics(
  departmentCount: (json['department_count'] as num).toInt(),
  classCount: (json['class_count'] as num).toInt(),
  emptyDepartmentCount: (json['empty_department_count'] as num).toInt(),
);

Map<String, dynamic> _$AdminDepartmentMetricsToJson(
  _AdminDepartmentMetrics instance,
) => <String, dynamic>{
  'department_count': instance.departmentCount,
  'class_count': instance.classCount,
  'empty_department_count': instance.emptyDepartmentCount,
};
