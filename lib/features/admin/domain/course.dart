class Course {
  final String? assignmentId;
  final String id;
  final String schoolId;
  final String name;
  final String description;
  final String? teacherId;
  final String? teacherName;
  final String? classId;
  final String? className;
  final int studentCount;

  Course({
    this.assignmentId,
    required this.id,
    required this.schoolId,
    required this.name,
    required this.description,
    this.teacherId,
    this.teacherName,
    this.classId,
    this.className,
    this.studentCount = 0,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    // Handle both old (Go struct default JSON) and new (CourseAssignmentInfo) formats if necessary.
    // The new format uses snake_case keys: course_id, course_name, etc.
    // The old format used PascalCase keys: ID, Name, etc. (from Go struct fields).
    // We will prioritize the new format.

    return Course(
      assignmentId: json['assignment_id'],
      id: json['course_id'] ?? json['ID'] ?? '',
      schoolId: json['school_id'] ?? json['SchoolID'] ?? '',
      name: json['course_name'] ?? json['Name'] ?? '',
      description: json['description'] ?? json['Description'] ?? '',
      teacherId: json['teacher_id'],
      teacherName: json['teacher_name'],
      classId: json['class_id'],
      className: json['class_name'],
      studentCount: (json['student_count'] as num?)?.toInt() ?? 0,
    );
  }
}

class TeachingAssignment {
  final String id;
  final String? schoolId;
  final String? courseId;
  final String? teacherId;
  final String classId;
  final DateTime? createdAt;
  final String? className;
  final String? teacherName;
  final String? courseName;
  final int studentCount;
  final List<String> assignmentIds;

  TeachingAssignment({
    required this.id,
    this.schoolId,
    this.courseId,
    this.teacherId,
    required this.classId,
    this.createdAt,
    this.className,
    this.teacherName,
    this.courseName,
    this.studentCount = 0,
    this.assignmentIds = const [],
  });

  factory TeachingAssignment.fromJson(Map<String, dynamic> json) {
    return TeachingAssignment(
      id: json['ID'] ?? json['id'] ?? '',
      schoolId: json['SchoolID'] ?? json['school_id'],
      courseId: json['CourseID'] ?? json['course_id'],
      teacherId: json['TeacherID'] ?? json['teacher_id'],
      classId: json['ClassID'] ?? json['class_id'] ?? '',
      createdAt: json['created_at'] != null || json['CreatedAt'] != null
          ? DateTime.tryParse(json['created_at'] ?? json['CreatedAt'])
          : null,
      className: json['class_name'],
      teacherName: json['teacher_name'],
      courseName: json['course_name'],
      studentCount: json['student_count'] ?? 0,
      assignmentIds:
          (json['assignment_ids'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}
