class Course {
  final String id;
  final String schoolId;
  final String name;
  final String description;

  Course({
    required this.id,
    required this.schoolId,
    required this.name,
    required this.description,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] ?? json['ID'] ?? json['course_id'] ?? '',
      schoolId: json['school_id'] ?? json['SchoolID'] ?? '',
      name: json['name'] ?? json['course_name'] ?? json['CourseName'] ?? '',
      description: json['description'] ?? json['Description'] ?? '',
    );
  }
}

class CourseAssignment {
  final String courseId;
  final String courseName;
  final String classId;
  final String className;
  final List<String> teacherNames;
  final int studentCount;

  CourseAssignment({
    required this.courseId,
    required this.courseName,
    required this.classId,
    required this.className,
    required this.teacherNames,
    required this.studentCount,
  });

  factory CourseAssignment.fromJson(Map<String, dynamic> json) {
    return CourseAssignment(
      courseId: json['course_id'] ?? '',
      courseName: json['course_name'] ?? '',
      classId: json['class_id'] ?? '',
      className: json['class_name'] ?? '',
      teacherNames: json['teacher_name'] != null
          ? [json['teacher_name'].toString()]
          : (json['teacher_names'] as List?)
                    ?.map((e) => e.toString())
                    .toList() ??
                [],
      studentCount: (json['student_count'] as num?)?.toInt() ?? 0,
    );
  }
}
