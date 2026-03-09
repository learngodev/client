// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_api_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeacherApiTimeSlotsResult _$TeacherApiTimeSlotsResultFromJson(
  Map<String, dynamic> json,
) => _TeacherApiTimeSlotsResult(
  timeSlots: (json['time_slots'] as List<dynamic>)
      .map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TeacherApiTimeSlotsResultToJson(
  _TeacherApiTimeSlotsResult instance,
) => <String, dynamic>{'time_slots': instance.timeSlots};

_TeacherApiCoursesResult _$TeacherApiCoursesResultFromJson(
  Map<String, dynamic> json,
) => _TeacherApiCoursesResult(
  courses: (json['courses'] as List<dynamic>)
      .map((e) => TeacherCourse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TeacherApiCoursesResultToJson(
  _TeacherApiCoursesResult instance,
) => <String, dynamic>{'courses': instance.courses};

_TeacherApiCourseClassesResult _$TeacherApiCourseClassesResultFromJson(
  Map<String, dynamic> json,
) => _TeacherApiCourseClassesResult(
  classes: (json['classes'] as List<dynamic>)
      .map((e) => TeacherClass.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TeacherApiCourseClassesResultToJson(
  _TeacherApiCourseClassesResult instance,
) => <String, dynamic>{'classes': instance.classes};

_TeacherApiCourseChaptersResult _$TeacherApiCourseChaptersResultFromJson(
  Map<String, dynamic> json,
) => _TeacherApiCourseChaptersResult(
  items: (json['items'] as List<dynamic>)
      .map((e) => CourseChapterSummary.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TeacherApiCourseChaptersResultToJson(
  _TeacherApiCourseChaptersResult instance,
) => <String, dynamic>{'items': instance.items};

_TeacherReturnSubmissionPayload _$TeacherReturnSubmissionPayloadFromJson(
  Map<String, dynamic> json,
) => _TeacherReturnSubmissionPayload(comment: json['comment'] as String);

Map<String, dynamic> _$TeacherReturnSubmissionPayloadToJson(
  _TeacherReturnSubmissionPayload instance,
) => <String, dynamic>{'comment': instance.comment};

_TeacherGenerateQuestionsPayload _$TeacherGenerateQuestionsPayloadFromJson(
  Map<String, dynamic> json,
) => _TeacherGenerateQuestionsPayload(
  topic: json['topic'] as String,
  count: (json['count'] as num).toInt(),
  difficulty: json['difficulty'] as String,
);

Map<String, dynamic> _$TeacherGenerateQuestionsPayloadToJson(
  _TeacherGenerateQuestionsPayload instance,
) => <String, dynamic>{
  'topic': instance.topic,
  'count': instance.count,
  'difficulty': instance.difficulty,
};

_TeacherGenerateQuestionsResult _$TeacherGenerateQuestionsResultFromJson(
  Map<String, dynamic> json,
) => _TeacherGenerateQuestionsResult(
  questions: (json['questions'] as List<dynamic>)
      .map(
        (e) =>
            CreateAssignmentQuestionInput.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$TeacherGenerateQuestionsResultToJson(
  _TeacherGenerateQuestionsResult instance,
) => <String, dynamic>{'questions': instance.questions};

_TeacherUpdateSessionPayload _$TeacherUpdateSessionPayloadFromJson(
  Map<String, dynamic> json,
) => _TeacherUpdateSessionPayload(
  location: json['location'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$TeacherUpdateSessionPayloadToJson(
  _TeacherUpdateSessionPayload instance,
) => <String, dynamic>{
  'location': instance.location,
  'status': instance.status,
};

_TeacherUpdateCoursePayload _$TeacherUpdateCoursePayloadFromJson(
  Map<String, dynamic> json,
) => _TeacherUpdateCoursePayload(
  schoolId: json['school_id'] as String,
  name: json['name'] as String?,
  description: json['description'] as String?,
  imageUrl: json['image_url'] as String?,
);

Map<String, dynamic> _$TeacherUpdateCoursePayloadToJson(
  _TeacherUpdateCoursePayload instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'name': instance.name,
  'description': instance.description,
  'image_url': instance.imageUrl,
};

_TeacherUpdateCourseResult _$TeacherUpdateCourseResultFromJson(
  Map<String, dynamic> json,
) => _TeacherUpdateCourseResult(
  course: TeacherCourse.fromJson(json['course'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TeacherUpdateCourseResultToJson(
  _TeacherUpdateCourseResult instance,
) => <String, dynamic>{'course': instance.course};

_TeacherListClassStudentsResult _$TeacherListClassStudentsResultFromJson(
  Map<String, dynamic> json,
) => _TeacherListClassStudentsResult(
  students: (json['students'] as List<dynamic>)
      .map((e) => TeacherStudent.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TeacherListClassStudentsResultToJson(
  _TeacherListClassStudentsResult instance,
) => <String, dynamic>{'students': instance.students};

_TeacherListMyClassesPayload _$TeacherListMyClassesPayloadFromJson(
  Map<String, dynamic> json,
) => _TeacherListMyClassesPayload(
  from: json['from'] as String,
  to: json['to'] as String,
);

Map<String, dynamic> _$TeacherListMyClassesPayloadToJson(
  _TeacherListMyClassesPayload instance,
) => <String, dynamic>{'from': instance.from, 'to': instance.to};

_TeacherListMyClassesSession _$TeacherListMyClassesSessionFromJson(
  Map<String, dynamic> json,
) => _TeacherListMyClassesSession(
  classId: json['class_id'] as String?,
  className: json['class_name'] as String?,
  courseId: json['course_id'] as String?,
  courseName: json['course_name'] as String?,
);

Map<String, dynamic> _$TeacherListMyClassesSessionToJson(
  _TeacherListMyClassesSession instance,
) => <String, dynamic>{
  'class_id': instance.classId,
  'class_name': instance.className,
  'course_id': instance.courseId,
  'course_name': instance.courseName,
};

_TeacherListMyClassesResult _$TeacherListMyClassesResultFromJson(
  Map<String, dynamic> json,
) => _TeacherListMyClassesResult(
  sessions: (json['sessions'] as List<dynamic>)
      .map(
        (e) => TeacherListMyClassesSession.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$TeacherListMyClassesResultToJson(
  _TeacherListMyClassesResult instance,
) => <String, dynamic>{'sessions': instance.sessions};

_TeacherListSchedulePayload _$TeacherListSchedulePayloadFromJson(
  Map<String, dynamic> json,
) => _TeacherListSchedulePayload(
  from: json['from'] as String,
  to: json['to'] as String,
);

Map<String, dynamic> _$TeacherListSchedulePayloadToJson(
  _TeacherListSchedulePayload instance,
) => <String, dynamic>{'from': instance.from, 'to': instance.to};

_TeacherListScheduleResult _$TeacherListScheduleResultFromJson(
  Map<String, dynamic> json,
) => _TeacherListScheduleResult(
  sessions: (json['sessions'] as List<dynamic>)
      .map((e) => TeacherScheduleItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TeacherListScheduleResultToJson(
  _TeacherListScheduleResult instance,
) => <String, dynamic>{'sessions': instance.sessions};

_TeacherListAssignmentsResult _$TeacherListAssignmentsResultFromJson(
  Map<String, dynamic> json,
) => _TeacherListAssignmentsResult(
  assignments: (json['assignments'] as List<dynamic>)
      .map((e) => TeacherAssignment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TeacherListAssignmentsResultToJson(
  _TeacherListAssignmentsResult instance,
) => <String, dynamic>{'assignments': instance.assignments};

_TeacherListSubmissionsResult _$TeacherListSubmissionsResultFromJson(
  Map<String, dynamic> json,
) => _TeacherListSubmissionsResult(
  submissions: (json['submissions'] as List<dynamic>)
      .map((e) => SubmissionSummary.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TeacherListSubmissionsResultToJson(
  _TeacherListSubmissionsResult instance,
) => <String, dynamic>{'submissions': instance.submissions};

_TeacherCreateCourseChapterPayload _$TeacherCreateCourseChapterPayloadFromJson(
  Map<String, dynamic> json,
) => _TeacherCreateCourseChapterPayload(
  title: json['title'] as String,
  content: json['content'] as String? ?? '',
  orderIndex: (json['order_index'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$TeacherCreateCourseChapterPayloadToJson(
  _TeacherCreateCourseChapterPayload instance,
) => <String, dynamic>{
  'title': instance.title,
  'content': instance.content,
  'order_index': instance.orderIndex,
};

_TeacherCreateCourseChapterResult _$TeacherCreateCourseChapterResultFromJson(
  Map<String, dynamic> json,
) => _TeacherCreateCourseChapterResult(
  chapter: CourseChapterSummary.fromJson(
    json['chapter'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$TeacherCreateCourseChapterResultToJson(
  _TeacherCreateCourseChapterResult instance,
) => <String, dynamic>{'chapter': instance.chapter};

_TeacherUpdateCourseChapterPayload _$TeacherUpdateCourseChapterPayloadFromJson(
  Map<String, dynamic> json,
) => _TeacherUpdateCourseChapterPayload(
  title: json['title'] as String?,
  content: json['content'] as String?,
  orderIndex: (json['order_index'] as num?)?.toInt(),
);

Map<String, dynamic> _$TeacherUpdateCourseChapterPayloadToJson(
  _TeacherUpdateCourseChapterPayload instance,
) => <String, dynamic>{
  'title': instance.title,
  'content': instance.content,
  'order_index': instance.orderIndex,
};

_TeacherAttachCourseChapterFilePayload
_$TeacherAttachCourseChapterFilePayloadFromJson(Map<String, dynamic> json) =>
    _TeacherAttachCourseChapterFilePayload(fileId: json['file_id'] as String);

Map<String, dynamic> _$TeacherAttachCourseChapterFilePayloadToJson(
  _TeacherAttachCourseChapterFilePayload instance,
) => <String, dynamic>{'file_id': instance.fileId};

_TeacherGradeAssignmentPayload _$TeacherGradeAssignmentPayloadFromJson(
  Map<String, dynamic> json,
) => _TeacherGradeAssignmentPayload(
  title: json['title'] as String,
  description: json['description'] as String,
  content: json['content'] as String,
  rubrics: json['rubrics'] as String,
);

Map<String, dynamic> _$TeacherGradeAssignmentPayloadToJson(
  _TeacherGradeAssignmentPayload instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'content': instance.content,
  'rubrics': instance.rubrics,
};
