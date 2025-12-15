import 'package:flutter/foundation.dart';

class Department {
  const Department({
    required this.id,
    required this.schoolId,
    required this.name,
    this.teacherCount = 0,
    this.studentCount = 0,
  });

  final String id;
  final String schoolId;
  final String name;
  final int teacherCount;
  final int studentCount;

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id']?.toString() ?? '',
      schoolId: json['school_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      teacherCount: json['teacher_count'] as int? ?? 0,
      studentCount: json['student_count'] as int? ?? 0,
    );
  }

  Department copyWith({
    String? id,
    String? schoolId,
    String? name,
    int? teacherCount,
    int? studentCount,
  }) {
    return Department(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      name: name ?? this.name,
      teacherCount: teacherCount ?? this.teacherCount,
      studentCount: studentCount ?? this.studentCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'school_id': schoolId,
      'name': name,
      'teacher_count': teacherCount,
      'student_count': studentCount,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Department &&
        other.id == id &&
        other.schoolId == schoolId &&
        other.name == name &&
        other.teacherCount == teacherCount &&
        other.studentCount == studentCount;
  }

  @override
  int get hashCode =>
      Object.hash(id, schoolId, name, teacherCount, studentCount);
}

class ClassInfo {
  const ClassInfo({
    required this.id,
    required this.departmentId,
    required this.name,
    this.grade,
    this.description,
    this.studentCount = 0,
  });

  final String id;
  final String departmentId;
  final String name;
  final String? grade;
  final String? description;
  final int studentCount;

  factory ClassInfo.fromJson(Map<String, dynamic> json) {
    return ClassInfo(
      id: json['id']?.toString() ?? '',
      departmentId: json['department_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      grade: json['grade']?.toString(),
      description: json['description']?.toString(),
      studentCount: json['student_count'] as int? ?? 0,
    );
  }

  ClassInfo copyWith({
    String? id,
    String? departmentId,
    String? name,
    String? grade,
    String? description,
    int? studentCount,
  }) {
    return ClassInfo(
      id: id ?? this.id,
      departmentId: departmentId ?? this.departmentId,
      name: name ?? this.name,
      grade: grade ?? this.grade,
      description: description ?? this.description,
      studentCount: studentCount ?? this.studentCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'department_id': departmentId,
      'name': name,
      if (grade != null) 'grade': grade,
      if (description != null) 'description': description,
      'student_count': studentCount,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ClassInfo &&
        other.id == id &&
        other.departmentId == departmentId &&
        other.name == name &&
        other.grade == grade &&
        other.description == description &&
        other.studentCount == studentCount;
  }

  @override
  int get hashCode =>
      Object.hash(id, departmentId, name, grade, description, studentCount);
}

class DepartmentNode {
  const DepartmentNode({required this.department, required this.classes});

  final Department department;
  final List<ClassInfo> classes;

  DepartmentNode copyWith({Department? department, List<ClassInfo>? classes}) {
    return DepartmentNode(
      department: department ?? this.department,
      classes: classes ?? this.classes,
    );
  }

  bool get isEmpty => classes.isEmpty;

  bool get isNotEmpty => classes.isNotEmpty;

  DepartmentNode sortedByClassName() {
    final sorted = [...classes]..sort((a, b) => a.name.compareTo(b.name));
    return copyWith(classes: sorted);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DepartmentNode &&
        other.department == department &&
        listEquals(other.classes, classes);
  }

  @override
  int get hashCode => Object.hash(department, Object.hashAll(classes));
}

class AdminDepartmentMetrics {
  const AdminDepartmentMetrics({
    required this.departmentCount,
    required this.classCount,
    required this.emptyDepartmentCount,
  });

  final int departmentCount;
  final int classCount;
  final int emptyDepartmentCount;

  factory AdminDepartmentMetrics.fromNodes(List<DepartmentNode> nodes) {
    final departmentCount = nodes.length;
    final classCount = nodes.fold<int>(
      0,
      (sum, node) => sum + node.classes.length,
    );
    final emptyDepartmentCount = nodes
        .where((node) => node.classes.isEmpty)
        .length;
    return AdminDepartmentMetrics(
      departmentCount: departmentCount,
      classCount: classCount,
      emptyDepartmentCount: emptyDepartmentCount,
    );
  }

  AdminDepartmentMetrics copyWith({
    int? departmentCount,
    int? classCount,
    int? emptyDepartmentCount,
  }) {
    return AdminDepartmentMetrics(
      departmentCount: departmentCount ?? this.departmentCount,
      classCount: classCount ?? this.classCount,
      emptyDepartmentCount: emptyDepartmentCount ?? this.emptyDepartmentCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'department_count': departmentCount,
      'class_count': classCount,
      'empty_department_count': emptyDepartmentCount,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AdminDepartmentMetrics &&
        other.departmentCount == departmentCount &&
        other.classCount == classCount &&
        other.emptyDepartmentCount == emptyDepartmentCount;
  }

  @override
  int get hashCode =>
      Object.hash(departmentCount, classCount, emptyDepartmentCount);
}
