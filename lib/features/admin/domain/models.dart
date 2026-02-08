import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
abstract class Department with _$Department {
  const Department._();

  const factory Department({
    @Default('') String id,
    @Default('') String schoolId,
    @Default('') String name,
    @Default(0) int teacherCount,
    @Default(0) int studentCount,
  }) = _Department;

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
}

@freezed
abstract class ClassInfo with _$ClassInfo {
  const ClassInfo._();

  const factory ClassInfo({
    @Default('') String id,
    @Default('') String departmentId,
    @Default('') String name,
    String? grade,
    String? description,
    @Default(0) int studentCount,
    @Default(0) int teacherCount,
  }) = _ClassInfo;

  factory ClassInfo.fromJson(Map<String, dynamic> json) =>
      _$ClassInfoFromJson(json);
}

@freezed
abstract class DepartmentNode with _$DepartmentNode {
  const DepartmentNode._();

  const factory DepartmentNode({
    required Department department,
    required List<ClassInfo> classes,
  }) = _DepartmentNode;

  bool get isEmpty => classes.isEmpty;

  bool get isNotEmpty => classes.isNotEmpty;

  DepartmentNode sortedByClassName() {
    final sorted = [...classes]..sort((a, b) => a.name.compareTo(b.name));
    return copyWith(classes: sorted);
  }
}

@freezed
abstract class AdminDepartmentMetrics with _$AdminDepartmentMetrics {
  const AdminDepartmentMetrics._();

  const factory AdminDepartmentMetrics({
    required int departmentCount,
    required int classCount,
    required int emptyDepartmentCount,
  }) = _AdminDepartmentMetrics;

  factory AdminDepartmentMetrics.fromJson(Map<String, dynamic> json) =>
      _$AdminDepartmentMetricsFromJson(json);

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
}
