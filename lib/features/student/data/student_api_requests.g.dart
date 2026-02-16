// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_api_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StudentApiTimeSlotsResult _$StudentApiTimeSlotsResultFromJson(
  Map<String, dynamic> json,
) => _StudentApiTimeSlotsResult(
  timeSlots: (json['time_slots'] as List<dynamic>)
      .map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StudentApiTimeSlotsResultToJson(
  _StudentApiTimeSlotsResult instance,
) => <String, dynamic>{'time_slots': instance.timeSlots};

_StudentApiCoursesResult _$StudentApiCoursesResultFromJson(
  Map<String, dynamic> json,
) => _StudentApiCoursesResult(
  items: (json['items'] as List<dynamic>)
      .map((e) => Course.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StudentApiCoursesResultToJson(
  _StudentApiCoursesResult instance,
) => <String, dynamic>{'items': instance.items};

_StudentApiCourseChaptersResult _$StudentApiCourseChaptersResultFromJson(
  Map<String, dynamic> json,
) => _StudentApiCourseChaptersResult(
  items: (json['items'] as List<dynamic>)
      .map((e) => CourseChapterSummary.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StudentApiCourseChaptersResultToJson(
  _StudentApiCourseChaptersResult instance,
) => <String, dynamic>{'items': instance.items};

_StudentApiAssignmentDetailResult _$StudentApiAssignmentDetailResultFromJson(
  Map<String, dynamic> json,
) => _StudentApiAssignmentDetailResult(
  assignment: AssignmentDetail.fromJson(
    json['assignment'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$StudentApiAssignmentDetailResultToJson(
  _StudentApiAssignmentDetailResult instance,
) => <String, dynamic>{'assignment': instance.assignment};

_StudentSubmitAssignmentAnswer _$StudentSubmitAssignmentAnswerFromJson(
  Map<String, dynamic> json,
) => _StudentSubmitAssignmentAnswer(
  questionId: json['question_id'] as String,
  answer: json['answer'] as String,
);

Map<String, dynamic> _$StudentSubmitAssignmentAnswerToJson(
  _StudentSubmitAssignmentAnswer instance,
) => <String, dynamic>{
  'question_id': instance.questionId,
  'answer': instance.answer,
};

_StudentSubmitAssignmentPayload _$StudentSubmitAssignmentPayloadFromJson(
  Map<String, dynamic> json,
) => _StudentSubmitAssignmentPayload(
  status: json['status'] as String? ?? 'submitted',
  answers: (json['answers'] as List<dynamic>)
      .map(
        (e) =>
            StudentSubmitAssignmentAnswer.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$StudentSubmitAssignmentPayloadToJson(
  _StudentSubmitAssignmentPayload instance,
) => <String, dynamic>{'status': instance.status, 'answers': instance.answers};

_StudentExplainQuestionPayload _$StudentExplainQuestionPayloadFromJson(
  Map<String, dynamic> json,
) => _StudentExplainQuestionPayload(
  title: json['title'] as String,
  prompt: json['prompt'] as String,
  questionType: json['question_type'] as String,
  options:
      (json['options'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$StudentExplainQuestionPayloadToJson(
  _StudentExplainQuestionPayload instance,
) => <String, dynamic>{
  'title': instance.title,
  'prompt': instance.prompt,
  'question_type': instance.questionType,
  'options': instance.options,
};

_StudentJoinCoursePayload _$StudentJoinCoursePayloadFromJson(
  Map<String, dynamic> json,
) => _StudentJoinCoursePayload(code: json['code'] as String);

Map<String, dynamic> _$StudentJoinCoursePayloadToJson(
  _StudentJoinCoursePayload instance,
) => <String, dynamic>{'code': instance.code};

_StudentApiSubmissionDetailResult _$StudentApiSubmissionDetailResultFromJson(
  Map<String, dynamic> json,
) => _StudentApiSubmissionDetailResult(
  assignment: json['assignment'] == null
      ? null
      : AssignmentDetail.fromJson(json['assignment'] as Map<String, dynamic>),
  submission: SubmissionResult.fromJson(
    json['submission'] as Map<String, dynamic>,
  ),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => SubmissionItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SubmissionItem>[],
);

Map<String, dynamic> _$StudentApiSubmissionDetailResultToJson(
  _StudentApiSubmissionDetailResult instance,
) => <String, dynamic>{
  'assignment': instance.assignment,
  'submission': instance.submission,
  'items': instance.items,
};

_StudentListAssignmentsPayload _$StudentListAssignmentsPayloadFromJson(
  Map<String, dynamic> json,
) => _StudentListAssignmentsPayload(
  limit: (json['limit'] as num?)?.toInt() ?? 20,
  courseId: json['course_id'] as String?,
);

Map<String, dynamic> _$StudentListAssignmentsPayloadToJson(
  _StudentListAssignmentsPayload instance,
) => <String, dynamic>{'limit': instance.limit, 'course_id': instance.courseId};

_StudentListAssignmentsResult _$StudentListAssignmentsResultFromJson(
  Map<String, dynamic> json,
) => _StudentListAssignmentsResult(
  assignments:
      (json['assignments'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const <Map<String, dynamic>>[],
);

Map<String, dynamic> _$StudentListAssignmentsResultToJson(
  _StudentListAssignmentsResult instance,
) => <String, dynamic>{'assignments': instance.assignments};

_StudentFetchNotesPayload _$StudentFetchNotesPayloadFromJson(
  Map<String, dynamic> json,
) => _StudentFetchNotesPayload(
  includeDeleted: json['include_deleted'] as bool? ?? false,
  status: json['status'] as String? ?? 'all',
);

Map<String, dynamic> _$StudentFetchNotesPayloadToJson(
  _StudentFetchNotesPayload instance,
) => <String, dynamic>{
  'include_deleted': instance.includeDeleted,
  'status': instance.status,
};

_StudentFetchNotesResult _$StudentFetchNotesResultFromJson(
  Map<String, dynamic> json,
) => _StudentFetchNotesResult(
  notes:
      (json['notes'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const <Map<String, dynamic>>[],
);

Map<String, dynamic> _$StudentFetchNotesResultToJson(
  _StudentFetchNotesResult instance,
) => <String, dynamic>{'notes': instance.notes};

_StudentFetchMessagesResult _$StudentFetchMessagesResultFromJson(
  Map<String, dynamic> json,
) => _StudentFetchMessagesResult(
  conversations:
      (json['conversations'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const <Map<String, dynamic>>[],
);

Map<String, dynamic> _$StudentFetchMessagesResultToJson(
  _StudentFetchMessagesResult instance,
) => <String, dynamic>{'conversations': instance.conversations};

_StudentFetchExamsPayload _$StudentFetchExamsPayloadFromJson(
  Map<String, dynamic> json,
) => _StudentFetchExamsPayload(limit: (json['limit'] as num?)?.toInt() ?? 10);

Map<String, dynamic> _$StudentFetchExamsPayloadToJson(
  _StudentFetchExamsPayload instance,
) => <String, dynamic>{'limit': instance.limit};

_StudentFetchExamsResult _$StudentFetchExamsResultFromJson(
  Map<String, dynamic> json,
) => _StudentFetchExamsResult(
  exams:
      (json['exams'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const <Map<String, dynamic>>[],
);

Map<String, dynamic> _$StudentFetchExamsResultToJson(
  _StudentFetchExamsResult instance,
) => <String, dynamic>{'exams': instance.exams};

_StudentFetchSchedulePayload _$StudentFetchSchedulePayloadFromJson(
  Map<String, dynamic> json,
) => _StudentFetchSchedulePayload(
  from: json['from'] as String,
  to: json['to'] as String,
);

Map<String, dynamic> _$StudentFetchSchedulePayloadToJson(
  _StudentFetchSchedulePayload instance,
) => <String, dynamic>{'from': instance.from, 'to': instance.to};

_StudentFetchScheduleResult _$StudentFetchScheduleResultFromJson(
  Map<String, dynamic> json,
) => _StudentFetchScheduleResult(
  sessions:
      (json['sessions'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const <Map<String, dynamic>>[],
);

Map<String, dynamic> _$StudentFetchScheduleResultToJson(
  _StudentFetchScheduleResult instance,
) => <String, dynamic>{'sessions': instance.sessions};

_StudentFetchRemindersResult _$StudentFetchRemindersResultFromJson(
  Map<String, dynamic> json,
) => _StudentFetchRemindersResult(
  reminders:
      (json['reminders'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const <Map<String, dynamic>>[],
);

Map<String, dynamic> _$StudentFetchRemindersResultToJson(
  _StudentFetchRemindersResult instance,
) => <String, dynamic>{'reminders': instance.reminders};
