import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

Object? _readId(Map map, String key) {
  return map['id'] ?? map['ID'] ?? map['course_id'];
}

Object? _readSchoolId(Map map, String key) {
  return map['school_id'] ?? map['SchoolID'];
}

Object? _readName(Map map, String key) {
  return map['name'] ?? map['course_name'] ?? map['CourseName'];
}

Object? _readDescription(Map map, String key) {
  return map['description'] ?? map['Description'];
}

List<Teacher> _parseTeachers(dynamic value) {
  if (value is List) {
    return value
        .whereType<Map<String, dynamic>>()
        .map((e) => Teacher.fromJson(e))
        .toList();
  }
  return [];
}

@freezed
abstract class Course with _$Course {
  const Course._();

  const factory Course({
    @JsonKey(readValue: _readId) @Default('') String id,
    @JsonKey(readValue: _readSchoolId) @Default('') String schoolId,
    @JsonKey(readValue: _readName) @Default('') String name,
    @JsonKey(readValue: _readDescription) @Default('') String description,
    @JsonKey(fromJson: _parseTeachers) @Default([]) List<Teacher> teachers,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}

@freezed
abstract class Teacher with _$Teacher {
  const factory Teacher({
    @Default('') String id,
    @JsonKey(readValue: _readTeacherName) @Default('') String name,
  }) = _Teacher;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
}

Object? _readTeacherName(Map map, String key) {
  return map['display_name'] ?? map['name'];
}

@freezed
abstract class CourseAssignment with _$CourseAssignment {
  const factory CourseAssignment({
    @Default('') String courseId,
    @Default('') String courseName,
    @Default('') String classId,
    @Default('') String className,
    @JsonKey(readValue: _readTeacherNames)
    @Default([])
    List<String> teacherNames,
    @Default(0) int studentCount,
  }) = _CourseAssignment;

  factory CourseAssignment.fromJson(Map<String, dynamic> json) =>
      _$CourseAssignmentFromJson(json);
}

Object? _readTeacherNames(Map map, String key) {
  if (map.containsKey('teacher_name') && map['teacher_name'] != null) {
    return [map['teacher_name'].toString()];
  }
  final val = map['teacher_names'];
  if (val is List) return val.map((e) => e.toString()).toList();
  return [];
}
