import 'dart:convert';

import '../../student/domain/assignment_models.dart';

class TeacherCourse {
  const TeacherCourse({
    required this.id,
    required this.name,
    required this.description,
  });

  final String id;
  final String name;
  final String description;

  factory TeacherCourse.fromJson(Map<String, dynamic> json) {
    return TeacherCourse(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );
  }
}

class TeacherStudent {
  const TeacherStudent({
    required this.id,
    required this.name, // This might need to be fetched from account or joined
    required this.number,
    required this.email,
  });

  final String id;
  final String name;
  final String number;
  final String email;

  factory TeacherStudent.fromJson(Map<String, dynamic> json) {
    return TeacherStudent(
      id: json['id'] as String? ?? '',
      name:
          json['name'] as String? ??
          'Unknown', // Backend might not return name directly in Student struct, need to check
      number: json['number'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );
  }
}

class TeacherClass {
  const TeacherClass({
    required this.id,
    required this.name,
    this.courseId,
    this.courseName,
  });
  final String id;
  final String name;
  final String? courseId;
  final String? courseName;

  factory TeacherClass.fromJson(Map<String, dynamic> json) {
    return TeacherClass(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      courseId: json['course_id'] as String?,
      courseName: json['course_name'] as String?,
    );
  }
}

class TeacherAssignment {
  const TeacherAssignment({
    required this.id,
    required this.title,
    required this.courseName,
    required this.className,
    required this.submissionCount,
    required this.submittedCount,
    required this.gradedCount,
    required this.pendingGradeCount,
    this.dueAt,
    this.classStudentCount = 0,
  });

  final String id;
  final String title;
  final String courseName;
  final String className;
  final int submissionCount;
  final int submittedCount;
  final int gradedCount;
  final int pendingGradeCount;
  final DateTime? dueAt;
  final int classStudentCount;

  factory TeacherAssignment.fromJson(Map<String, dynamic> json) {
    return TeacherAssignment(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      courseName: json['course_name'] as String? ?? '',
      className: json['class_name'] as String? ?? '',
      submissionCount: json['submission_count'] as int? ?? 0,
      submittedCount: json['submitted_count'] as int? ?? 0,
      gradedCount: json['graded_count'] as int? ?? 0,
      pendingGradeCount: json['pending_grade_count'] as int? ?? 0,
      dueAt: DateTime.tryParse(json['due_at'] as String? ?? '')?.toLocal(),
      classStudentCount: json['class_student_count'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'course_name': courseName,
      'class_name': className,
      'submission_count': submissionCount,
      'submitted_count': submittedCount,
      'graded_count': gradedCount,
      'pending_grade_count': pendingGradeCount,
      'due_at': dueAt?.toIso8601String(),
      'class_student_count': classStudentCount,
    };
  }
}

class SubmissionSummary {
  const SubmissionSummary({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.submittedAt,
    required this.status,
    this.score,
  });

  final String id;
  final String studentId;
  final String studentName;
  final DateTime? submittedAt;
  final String status;
  final double? score;

  factory SubmissionSummary.fromJson(Map<String, dynamic> json) {
    return SubmissionSummary(
      id: json['id'] as String? ?? '',
      studentId: json['student_id'] as String? ?? '',
      studentName: '学生', // Placeholder
      submittedAt: DateTime.tryParse(
        json['submitted_at'] as String? ?? '',
      )?.toLocal(),
      status: json['status'] as String? ?? 'pending',
      score: (json['score'] as num?)?.toDouble(),
    );
  }
}

class TeacherSubmissionDetail {
  const TeacherSubmissionDetail({
    required this.submission,
    required this.items,
    required this.comments,
  });

  final SubmissionResult submission;
  final List<SubmissionItem> items;
  final List<SubmissionComment> comments;

  factory TeacherSubmissionDetail.fromJson(Map<String, dynamic> json) {
    final submissionJson = json['submission'] as Map<String, dynamic>? ?? {};
    final itemsList = submissionJson['items'] as List?;

    return TeacherSubmissionDetail(
      submission: SubmissionResult.fromJson(submissionJson),
      items:
          itemsList
              ?.map((e) => SubmissionItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      comments:
          (json['comments'] as List?)
              ?.map(
                (e) => SubmissionComment.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );
  }
}

class SubmissionComment {
  const SubmissionComment({
    required this.id,
    required this.content,
    required this.authorId,
    required this.createdAt,
  });

  final String id;
  final String content;
  final String authorId;
  final DateTime createdAt;

  factory SubmissionComment.fromJson(Map<String, dynamic> json) {
    return SubmissionComment(
      id: json['id'] as String? ?? '',
      content: json['content'] as String? ?? '',
      authorId: json['author_id'] as String? ?? '',
      createdAt:
          DateTime.tryParse(json['created_at'] as String? ?? '')?.toLocal() ??
          DateTime.now(),
    );
  }
}

class GradeSubmissionRequest {
  const GradeSubmissionRequest({
    this.score,
    this.feedback,
    this.itemScores,
    this.comment,
  });

  final double? score;
  final String? feedback;
  final Map<String, double>? itemScores;
  final String? comment;

  Map<String, dynamic> toJson() {
    return {
      if (score != null) 'score': score,
      if (feedback != null) 'feedback': feedback,
      if (itemScores != null) 'item_scores': itemScores,
      if (comment != null) 'comment': {'content': comment},
    };
  }
}

class CreateAssignmentRequest {
  const CreateAssignmentRequest({
    required this.courseId,
    required this.teacherId,
    required this.classId,
    required this.type,
    required this.title,
    this.description,
    this.startAt,
    this.dueAt,
    this.maxScore,
    this.allowResubmit = false,
    required this.questions,
  });

  final String courseId;
  final String teacherId;
  final String classId;
  final String type;
  final String title;
  final String? description;
  final DateTime? startAt;
  final DateTime? dueAt;
  final double? maxScore;
  final bool allowResubmit;
  final List<CreateAssignmentQuestionInput> questions;

  Map<String, dynamic> toJson() {
    return {
      'course_id': courseId,
      'teacher_id': teacherId,
      'class_id': classId,
      'type': type,
      'title': title,
      if (description != null) 'description': description,
      if (startAt != null) 'start_at': startAt!.toUtc().toIso8601String(),
      if (dueAt != null) 'due_at': dueAt!.toUtc().toIso8601String(),
      if (maxScore != null) 'max_score': maxScore,
      'allow_resubmit': allowResubmit,
      'questions': questions.map((e) => e.toJson()).toList(),
    };
  }
}

class UpdateAssignmentRequest {
  const UpdateAssignmentRequest({
    required this.teacherId,
    this.title,
    this.description,
    this.startAt,
    this.dueAt,
    this.maxScore,
    this.allowResubmit,
  });

  final String teacherId;
  final String? title;
  final String? description;
  final DateTime? startAt;
  final DateTime? dueAt;
  final double? maxScore;
  final bool? allowResubmit;

  Map<String, dynamic> toJson() {
    return {
      'teacher_id': teacherId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (startAt != null) 'start_at': startAt!.toUtc().toIso8601String(),
      if (dueAt != null) 'due_at': dueAt!.toUtc().toIso8601String(),
      if (maxScore != null) 'max_score': maxScore,
      if (allowResubmit != null) 'allow_resubmit': allowResubmit,
    };
  }
}

class CreateAssignmentQuestionInput {
  const CreateAssignmentQuestionInput({
    required this.type,
    required this.prompt,
    this.options,
    this.answer,
    this.score,
    this.orderIndex,
  });

  final String type;
  final String prompt;
  final String? options;
  final String? answer;
  final double? score;
  final int? orderIndex;

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'prompt': prompt,
      if (options != null) 'options': options,
      if (answer != null) 'answer': answer,
      if (score != null) 'score': score,
      if (orderIndex != null) 'order_index': orderIndex,
    };
  }

  factory CreateAssignmentQuestionInput.fromJson(Map<String, dynamic> json) {
    String? optionsStr;
    if (json['options'] is List) {
      optionsStr = jsonEncode(json['options']);
    } else if (json['options'] is String) {
      optionsStr = json['options'] as String;
    }

    return CreateAssignmentQuestionInput(
      type: json['type'] as String? ?? 'essay',
      prompt: json['prompt'] as String? ?? '',
      options: optionsStr,
      answer: json['answer'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      orderIndex: json['order_index'] as int?,
    );
  }
}
