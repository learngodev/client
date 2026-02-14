// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeacherCourse _$TeacherCourseFromJson(Map<String, dynamic> json) =>
    _TeacherCourse(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imageUrl: json['image_url'] as String?,
      invitationCode: json['invitation_code'] as String?,
    );

Map<String, dynamic> _$TeacherCourseToJson(_TeacherCourse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'invitation_code': instance.invitationCode,
    };

_TeacherStudent _$TeacherStudentFromJson(Map<String, dynamic> json) =>
    _TeacherStudent(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? 'Unknown',
      number: json['number'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$TeacherStudentToJson(_TeacherStudent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'email': instance.email,
    };

_TeacherClass _$TeacherClassFromJson(Map<String, dynamic> json) =>
    _TeacherClass(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      courseId: json['course_id'] as String?,
      courseName: json['course_name'] as String?,
    );

Map<String, dynamic> _$TeacherClassToJson(_TeacherClass instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'course_id': instance.courseId,
      'course_name': instance.courseName,
    };

_TeacherAssignment _$TeacherAssignmentFromJson(Map<String, dynamic> json) =>
    _TeacherAssignment(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      courseName: json['course_name'] as String? ?? '',
      className: json['class_name'] as String? ?? '',
      submissionCount: (json['submission_count'] as num?)?.toInt() ?? 0,
      submittedCount: (json['submitted_count'] as num?)?.toInt() ?? 0,
      gradedCount: (json['graded_count'] as num?)?.toInt() ?? 0,
      pendingGradeCount: (json['pending_grade_count'] as num?)?.toInt() ?? 0,
      dueAt: _parseDateTimeNullable(json['due_at']),
      classStudentCount: (json['class_student_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TeacherAssignmentToJson(_TeacherAssignment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'course_name': instance.courseName,
      'class_name': instance.className,
      'submission_count': instance.submissionCount,
      'submitted_count': instance.submittedCount,
      'graded_count': instance.gradedCount,
      'pending_grade_count': instance.pendingGradeCount,
      'due_at': instance.dueAt?.toIso8601String(),
      'class_student_count': instance.classStudentCount,
    };

_SubmissionSummary _$SubmissionSummaryFromJson(Map<String, dynamic> json) =>
    _SubmissionSummary(
      id: json['id'] as String? ?? '',
      studentId: json['student_id'] as String? ?? '',
      studentName: json['student_name'] as String? ?? '学生',
      submittedAt: _parseDateTimeNullable(json['submitted_at']),
      status: json['status'] as String? ?? 'pending',
      score: (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SubmissionSummaryToJson(_SubmissionSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_id': instance.studentId,
      'student_name': instance.studentName,
      'submitted_at': instance.submittedAt?.toIso8601String(),
      'status': instance.status,
      'score': instance.score,
    };

_TeacherSubmissionDetail _$TeacherSubmissionDetailFromJson(
  Map<String, dynamic> json,
) => _TeacherSubmissionDetail(
  submission: _parseSubmissionResult(json['submission']),
  items:
      (_readSubmissionItems(json, 'items') as List<dynamic>?)
          ?.map((e) => SubmissionItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  comments:
      (json['comments'] as List<dynamic>?)
          ?.map((e) => SubmissionComment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$TeacherSubmissionDetailToJson(
  _TeacherSubmissionDetail instance,
) => <String, dynamic>{
  'submission': instance.submission,
  'items': instance.items,
  'comments': instance.comments,
};

_SubmissionComment _$SubmissionCommentFromJson(Map<String, dynamic> json) =>
    _SubmissionComment(
      id: json['id'] as String? ?? '',
      content: json['content'] as String? ?? '',
      authorId: json['author_id'] as String? ?? '',
      createdAt: _parseDateTimeOrNow(json['created_at']),
    );

Map<String, dynamic> _$SubmissionCommentToJson(_SubmissionComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'author_id': instance.authorId,
      'created_at': instance.createdAt.toIso8601String(),
    };

_GradeSubmissionRequest _$GradeSubmissionRequestFromJson(
  Map<String, dynamic> json,
) => _GradeSubmissionRequest(
  score: (json['score'] as num?)?.toDouble(),
  feedback: json['feedback'] as String?,
  itemScores: (json['item_scores'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  comment: json['comment'] as String?,
);

Map<String, dynamic> _$GradeSubmissionRequestToJson(
  _GradeSubmissionRequest instance,
) => <String, dynamic>{
  'score': ?instance.score,
  'feedback': ?instance.feedback,
  'item_scores': ?instance.itemScores,
  'comment': ?_commentToJson(instance.comment),
};

_CreateAssignmentRequest _$CreateAssignmentRequestFromJson(
  Map<String, dynamic> json,
) => _CreateAssignmentRequest(
  courseId: json['course_id'] as String,
  teacherId: json['teacher_id'] as String,
  classId: json['class_id'] as String,
  type: json['type'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  startAt: _parseDateTimeNullable(json['start_at']),
  dueAt: _parseDateTimeNullable(json['due_at']),
  maxScore: (json['max_score'] as num?)?.toDouble(),
  allowResubmit: json['allow_resubmit'] as bool? ?? false,
  questions: (json['questions'] as List<dynamic>)
      .map(
        (e) =>
            CreateAssignmentQuestionInput.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  attachments: (json['attachments'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$CreateAssignmentRequestToJson(
  _CreateAssignmentRequest instance,
) => <String, dynamic>{
  'course_id': instance.courseId,
  'teacher_id': instance.teacherId,
  'class_id': instance.classId,
  'type': instance.type,
  'title': instance.title,
  'description': ?instance.description,
  'start_at': ?_dateToUtcIso(instance.startAt),
  'due_at': ?_dateToUtcIso(instance.dueAt),
  'max_score': ?instance.maxScore,
  'allow_resubmit': instance.allowResubmit,
  'questions': instance.questions,
  'attachments': ?instance.attachments,
};

_UpdateAssignmentRequest _$UpdateAssignmentRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateAssignmentRequest(
  teacherId: json['teacher_id'] as String,
  title: json['title'] as String?,
  description: json['description'] as String?,
  startAt: _parseDateTimeNullable(json['start_at']),
  dueAt: _parseDateTimeNullable(json['due_at']),
  maxScore: (json['max_score'] as num?)?.toDouble(),
  allowResubmit: json['allow_resubmit'] as bool?,
);

Map<String, dynamic> _$UpdateAssignmentRequestToJson(
  _UpdateAssignmentRequest instance,
) => <String, dynamic>{
  'teacher_id': instance.teacherId,
  'title': ?instance.title,
  'description': ?instance.description,
  'start_at': ?_dateToUtcIso(instance.startAt),
  'due_at': ?_dateToUtcIso(instance.dueAt),
  'max_score': ?instance.maxScore,
  'allow_resubmit': ?instance.allowResubmit,
};

_CreateAssignmentQuestionInput _$CreateAssignmentQuestionInputFromJson(
  Map<String, dynamic> json,
) => _CreateAssignmentQuestionInput(
  type: json['type'] as String,
  prompt: json['prompt'] as String,
  options: _parseOptions(json['options']),
  answer: json['answer'] as String?,
  score: (json['score'] as num?)?.toDouble(),
  orderIndex: (json['order_index'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreateAssignmentQuestionInputToJson(
  _CreateAssignmentQuestionInput instance,
) => <String, dynamic>{
  'type': instance.type,
  'prompt': instance.prompt,
  'options': ?instance.options,
  'answer': ?instance.answer,
  'score': ?instance.score,
  'order_index': ?instance.orderIndex,
};
