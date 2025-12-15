class Course {
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
  final String schoolId;
  final String courseId;
  final String teacherId;
  final String classId;
  final DateTime createdAt;

  TeachingAssignment({
    required this.id,
    required this.schoolId,
    required this.courseId,
    required this.teacherId,
    required this.classId,
    required this.createdAt,
  });

  factory TeachingAssignment.fromJson(Map<String, dynamic> json) {
    return TeachingAssignment(
      id: json['ID'] ?? json['id'],
      schoolId: json['SchoolID'] ?? json['school_id'],
      courseId: json['CourseID'] ?? json['course_id'],
      teacherId: json['TeacherID'] ?? json['teacher_id'],
      classId: json['ClassID'] ?? json['class_id'],
      createdAt: DateTime.parse(json['CreatedAt'] ?? json['created_at']),
    );
  }
}
