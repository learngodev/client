import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/base_request.dart';
import '../domain/assignment_models.dart';
import '../domain/course.dart';
import '../domain/course_chapter_models.dart';
import '../domain/time_slot.dart';

part 'student_api_requests.freezed.dart';
part 'student_api_requests.g.dart';

@freezed
abstract class StudentApiTimeSlotsResult with _$StudentApiTimeSlotsResult {
  const factory StudentApiTimeSlotsResult({required List<TimeSlot> timeSlots}) =
      _StudentApiTimeSlotsResult;

  factory StudentApiTimeSlotsResult.fromJson(Map<String, dynamic> json) =>
      _$StudentApiTimeSlotsResultFromJson(json);
}

class StudentListTimeSlotsRequest extends BaseRequest<void, List<TimeSlot>> {
  StudentListTimeSlotsRequest()
    : super(
        '/api/v1/student/time-slots',
        HttpMethod.get,
        fallbackMessage: '无法加载时间段',
        responseParser: (value) =>
            StudentApiTimeSlotsResult.fromJson(value).timeSlots,
      );
}

@freezed
abstract class StudentApiCoursesResult with _$StudentApiCoursesResult {
  const factory StudentApiCoursesResult({required List<Course> items}) =
      _StudentApiCoursesResult;

  factory StudentApiCoursesResult.fromJson(Map<String, dynamic> json) =>
      _$StudentApiCoursesResultFromJson(json);
}

class StudentListCoursesRequest extends BaseRequest<void, List<Course>> {
  StudentListCoursesRequest()
    : super(
        '/api/v1/student/courses',
        HttpMethod.get,
        fallbackMessage: '无法加载课程列表',
        responseParser: (value) =>
            StudentApiCoursesResult.fromJson(value).items,
      );
}

@freezed
abstract class StudentApiCourseChaptersResult
    with _$StudentApiCourseChaptersResult {
  const factory StudentApiCourseChaptersResult({
    required List<CourseChapterSummary> items,
  }) = _StudentApiCourseChaptersResult;

  factory StudentApiCourseChaptersResult.fromJson(Map<String, dynamic> json) =>
      _$StudentApiCourseChaptersResultFromJson(json);
}

class StudentListCourseChaptersRequest
    extends BaseRequest<void, List<CourseChapterSummary>> {
  StudentListCourseChaptersRequest({required String courseId})
    : super(
        '/api/v1/student/courses/$courseId/chapters',
        HttpMethod.get,
        fallbackMessage: '无法加载章节列表',
        responseParser: (value) =>
            StudentApiCourseChaptersResult.fromJson(value).items,
      );
}

class StudentGetCourseChapterRequest
    extends BaseRequest<void, CourseChapterDetail> {
  StudentGetCourseChapterRequest({
    required String courseId,
    required String chapterId,
  }) : super(
         '/api/v1/student/courses/$courseId/chapters/$chapterId',
         HttpMethod.get,
         fallbackMessage: '无法加载章节详情',
         responseParser: (value) => CourseChapterDetail.fromJson(value),
       );
}

@freezed
abstract class StudentApiAssignmentDetailResult
    with _$StudentApiAssignmentDetailResult {
  const factory StudentApiAssignmentDetailResult({
    required AssignmentDetail assignment,
  }) = _StudentApiAssignmentDetailResult;

  factory StudentApiAssignmentDetailResult.fromJson(
    Map<String, dynamic> json,
  ) => _$StudentApiAssignmentDetailResultFromJson(json);
}

class StudentGetAssignmentDetailRequest
    extends BaseRequest<void, AssignmentDetail> {
  StudentGetAssignmentDetailRequest({required String assignmentId})
    : super(
        '/api/v1/assignments/$assignmentId',
        HttpMethod.get,
        fallbackMessage: '无法加载作业详情',
        responseParser: (value) =>
            StudentApiAssignmentDetailResult.fromJson(value).assignment,
      );
}

@freezed
abstract class StudentSubmitAssignmentAnswer
    with _$StudentSubmitAssignmentAnswer {
  const factory StudentSubmitAssignmentAnswer({
    required String questionId,
    required String answer,
  }) = _StudentSubmitAssignmentAnswer;

  factory StudentSubmitAssignmentAnswer.fromJson(Map<String, dynamic> json) =>
      _$StudentSubmitAssignmentAnswerFromJson(json);
}

@freezed
abstract class StudentSubmitAssignmentPayload
    with _$StudentSubmitAssignmentPayload {
  const factory StudentSubmitAssignmentPayload({
    @Default('submitted') String status,
    required List<StudentSubmitAssignmentAnswer> answers,
  }) = _StudentSubmitAssignmentPayload;

  factory StudentSubmitAssignmentPayload.fromJson(Map<String, dynamic> json) =>
      _$StudentSubmitAssignmentPayloadFromJson(json);
}

class StudentSubmitAssignmentRequest
    extends BaseRequest<StudentSubmitAssignmentPayload, SubmissionResult> {
  StudentSubmitAssignmentRequest({required String assignmentId})
    : super(
        '/api/v1/assignments/$assignmentId/submissions',
        HttpMethod.post,
        fallbackMessage: '提交作业失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) => SubmissionResult.fromJson(value),
      );
}

@freezed
abstract class StudentExplainQuestionPayload
    with _$StudentExplainQuestionPayload {
  const factory StudentExplainQuestionPayload({
    required String title,
    required String prompt,
    required String questionType,
    @Default(<String>[]) List<String> options,
  }) = _StudentExplainQuestionPayload;

  factory StudentExplainQuestionPayload.fromJson(Map<String, dynamic> json) =>
      _$StudentExplainQuestionPayloadFromJson(json);
}

class StudentExplainQuestionRequest
    extends BaseRequest<StudentExplainQuestionPayload, ExplainQuestionResult> {
  StudentExplainQuestionRequest()
    : super(
        '/api/v1/ai/explain_question',
        HttpMethod.post,
        fallbackMessage: 'AI 解析失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) => ExplainQuestionResult.fromJson(value),
      );
}

@freezed
abstract class StudentJoinCoursePayload with _$StudentJoinCoursePayload {
  const factory StudentJoinCoursePayload({required String code}) =
      _StudentJoinCoursePayload;

  factory StudentJoinCoursePayload.fromJson(Map<String, dynamic> json) =>
      _$StudentJoinCoursePayloadFromJson(json);
}

class StudentJoinCourseRequest
    extends BaseRequest<StudentJoinCoursePayload, void> {
  StudentJoinCourseRequest()
    : super(
        '/api/v1/student/courses/join',
        HttpMethod.post,
        fallbackMessage: '加入课程失败',
        requestEncoder: (value) => value.toJson(),
      );
}

@freezed
abstract class StudentApiSubmissionDetailResult
    with _$StudentApiSubmissionDetailResult {
  const factory StudentApiSubmissionDetailResult({
    AssignmentDetail? assignment,
    required SubmissionResult submission,
    @Default(<SubmissionItem>[]) List<SubmissionItem> items,
  }) = _StudentApiSubmissionDetailResult;

  factory StudentApiSubmissionDetailResult.fromJson(
    Map<String, dynamic> json,
  ) => _$StudentApiSubmissionDetailResultFromJson(json);
}

class StudentGetSubmissionDetailRequest
    extends BaseRequest<void, StudentApiSubmissionDetailResult> {
  StudentGetSubmissionDetailRequest({required String assignmentId})
    : super(
        '/api/v1/assignments/$assignmentId/submissions/me',
        HttpMethod.get,
        fallbackMessage: '无法加载提交详情',
        responseParser: (value) =>
            StudentApiSubmissionDetailResult.fromJson(value),
      );
}

@freezed
abstract class StudentListAssignmentsPayload
    with _$StudentListAssignmentsPayload {
  const factory StudentListAssignmentsPayload({
    @Default(20) int limit,
    String? courseId,
  }) = _StudentListAssignmentsPayload;

  factory StudentListAssignmentsPayload.fromJson(Map<String, dynamic> json) =>
      _$StudentListAssignmentsPayloadFromJson(json);
}

@freezed
abstract class StudentListAssignmentsResult
    with _$StudentListAssignmentsResult {
  const factory StudentListAssignmentsResult({
    @Default(<Map<String, dynamic>>[]) List<Map<String, dynamic>> assignments,
  }) = _StudentListAssignmentsResult;

  factory StudentListAssignmentsResult.fromJson(Map<String, dynamic> json) =>
      _$StudentListAssignmentsResultFromJson(json);
}

class StudentListAssignmentsRequest
    extends
        BaseRequest<StudentListAssignmentsPayload, List<Map<String, dynamic>>> {
  StudentListAssignmentsRequest()
    : super(
        '/api/v1/student/assignments',
        HttpMethod.get,
        fallbackMessage: '无法加载作业列表',
        queryParameters: (value) {
          final query = value.toJson();
          query.removeWhere((_, fieldValue) => fieldValue == null);
          return query;
        },
        responseParser: (value) =>
            StudentListAssignmentsResult.fromJson(value).assignments,
      );
}

@freezed
abstract class StudentFetchNotesPayload with _$StudentFetchNotesPayload {
  const factory StudentFetchNotesPayload({
    @Default(false) bool includeDeleted,
    @Default('all') String status,
  }) = _StudentFetchNotesPayload;

  factory StudentFetchNotesPayload.fromJson(Map<String, dynamic> json) =>
      _$StudentFetchNotesPayloadFromJson(json);
}

@freezed
abstract class StudentFetchNotesResult with _$StudentFetchNotesResult {
  const factory StudentFetchNotesResult({
    @Default(<Map<String, dynamic>>[]) List<Map<String, dynamic>> notes,
  }) = _StudentFetchNotesResult;

  factory StudentFetchNotesResult.fromJson(Map<String, dynamic> json) =>
      _$StudentFetchNotesResultFromJson(json);
}

class StudentFetchNotesRequest
    extends BaseRequest<StudentFetchNotesPayload, List<Map<String, dynamic>>> {
  StudentFetchNotesRequest()
    : super(
        '/api/v1/notes',
        HttpMethod.get,
        fallbackMessage: '无法加载学习笔记',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) =>
            StudentFetchNotesResult.fromJson(value).notes,
      );
}

@freezed
abstract class StudentFetchMessagesResult with _$StudentFetchMessagesResult {
  const factory StudentFetchMessagesResult({
    @Default(<Map<String, dynamic>>[]) List<Map<String, dynamic>> conversations,
  }) = _StudentFetchMessagesResult;

  factory StudentFetchMessagesResult.fromJson(Map<String, dynamic> json) =>
      _$StudentFetchMessagesResultFromJson(json);
}

class StudentFetchMessagesRequest
    extends BaseRequest<void, List<Map<String, dynamic>>> {
  StudentFetchMessagesRequest()
    : super(
        '/api/v1/conversations',
        HttpMethod.get,
        fallbackMessage: '无法获取消息列表',
        responseParser: (value) =>
            StudentFetchMessagesResult.fromJson(value).conversations,
      );
}

@freezed
abstract class StudentFetchExamsPayload with _$StudentFetchExamsPayload {
  const factory StudentFetchExamsPayload({@Default(10) int limit}) =
      _StudentFetchExamsPayload;

  factory StudentFetchExamsPayload.fromJson(Map<String, dynamic> json) =>
      _$StudentFetchExamsPayloadFromJson(json);
}

@freezed
abstract class StudentFetchExamsResult with _$StudentFetchExamsResult {
  const factory StudentFetchExamsResult({
    @Default(<Map<String, dynamic>>[]) List<Map<String, dynamic>> exams,
  }) = _StudentFetchExamsResult;

  factory StudentFetchExamsResult.fromJson(Map<String, dynamic> json) =>
      _$StudentFetchExamsResultFromJson(json);
}

class StudentFetchExamsRequest
    extends BaseRequest<StudentFetchExamsPayload, List<Map<String, dynamic>>> {
  StudentFetchExamsRequest()
    : super(
        '/api/v1/student/exams',
        HttpMethod.get,
        fallbackMessage: '无法加载考试安排',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) =>
            StudentFetchExamsResult.fromJson(value).exams,
      );
}

@freezed
abstract class StudentFetchSchedulePayload with _$StudentFetchSchedulePayload {
  const factory StudentFetchSchedulePayload({
    required String from,
    required String to,
  }) = _StudentFetchSchedulePayload;

  factory StudentFetchSchedulePayload.fromJson(Map<String, dynamic> json) =>
      _$StudentFetchSchedulePayloadFromJson(json);
}

@freezed
abstract class StudentFetchScheduleResult with _$StudentFetchScheduleResult {
  const factory StudentFetchScheduleResult({
    @Default(<Map<String, dynamic>>[]) List<Map<String, dynamic>> sessions,
  }) = _StudentFetchScheduleResult;

  factory StudentFetchScheduleResult.fromJson(Map<String, dynamic> json) =>
      _$StudentFetchScheduleResultFromJson(json);
}

class StudentFetchScheduleRequest
    extends
        BaseRequest<StudentFetchSchedulePayload, List<Map<String, dynamic>>> {
  StudentFetchScheduleRequest()
    : super(
        '/api/v1/student/schedule',
        HttpMethod.get,
        fallbackMessage: '无法加载课表',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) =>
            StudentFetchScheduleResult.fromJson(value).sessions,
      );
}

@freezed
abstract class StudentFetchRemindersResult with _$StudentFetchRemindersResult {
  const factory StudentFetchRemindersResult({
    @Default(<Map<String, dynamic>>[]) List<Map<String, dynamic>> reminders,
  }) = _StudentFetchRemindersResult;

  factory StudentFetchRemindersResult.fromJson(Map<String, dynamic> json) =>
      _$StudentFetchRemindersResultFromJson(json);
}

class StudentFetchRemindersRequest
    extends BaseRequest<void, List<Map<String, dynamic>>> {
  StudentFetchRemindersRequest()
    : super(
        '/api/v1/student/reminders',
        HttpMethod.get,
        fallbackMessage: '无法加载提醒列表',
        responseParser: (value) =>
            StudentFetchRemindersResult.fromJson(value).reminders,
      );
}
