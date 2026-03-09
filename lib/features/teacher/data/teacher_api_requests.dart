import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/base_request.dart';
import '../../student/domain/assignment_models.dart';
import '../../student/domain/course_chapter_models.dart';
import '../domain/teacher_models.dart';
import '../domain/teacher_schedule_model.dart';
import '../domain/time_slot.dart';

part 'teacher_api_requests.freezed.dart';
part 'teacher_api_requests.g.dart';

@freezed
abstract class TeacherApiTimeSlotsResult with _$TeacherApiTimeSlotsResult {
  const factory TeacherApiTimeSlotsResult({required List<TimeSlot> timeSlots}) =
      _TeacherApiTimeSlotsResult;

  factory TeacherApiTimeSlotsResult.fromJson(Map<String, dynamic> json) =>
      _$TeacherApiTimeSlotsResultFromJson(json);
}

class TeacherListTimeSlotsRequest extends BaseRequest<void, List<TimeSlot>> {
  TeacherListTimeSlotsRequest()
    : super(
        '/api/v1/teacher/time-slots',
        HttpMethod.get,
        fallbackMessage: '无法加载时间段',
        responseParser: (value) =>
            TeacherApiTimeSlotsResult.fromJson(value).timeSlots,
      );
}

@freezed
abstract class TeacherApiCoursesResult with _$TeacherApiCoursesResult {
  const factory TeacherApiCoursesResult({
    required List<TeacherCourse> courses,
  }) = _TeacherApiCoursesResult;

  factory TeacherApiCoursesResult.fromJson(Map<String, dynamic> json) =>
      _$TeacherApiCoursesResultFromJson(json);
}

class TeacherListCoursesRequest extends BaseRequest<void, List<TeacherCourse>> {
  TeacherListCoursesRequest()
    : super(
        '/api/v1/teacher/courses',
        HttpMethod.get,
        fallbackMessage: '无法加载课程列表',
        responseParser: (value) =>
            TeacherApiCoursesResult.fromJson(value).courses,
      );
}

@freezed
abstract class TeacherApiCourseClassesResult
    with _$TeacherApiCourseClassesResult {
  const factory TeacherApiCourseClassesResult({
    required List<TeacherClass> classes,
  }) = _TeacherApiCourseClassesResult;

  factory TeacherApiCourseClassesResult.fromJson(Map<String, dynamic> json) =>
      _$TeacherApiCourseClassesResultFromJson(json);
}

class TeacherListCourseClassesRequest
    extends BaseRequest<void, List<TeacherClass>> {
  TeacherListCourseClassesRequest({required String courseId})
    : super(
        '/api/v1/teacher/courses/$courseId/classes',
        HttpMethod.get,
        fallbackMessage: '无法加载班级列表',
        responseParser: (value) =>
            TeacherApiCourseClassesResult.fromJson(value).classes,
      );
}

@freezed
abstract class TeacherApiCourseChaptersResult
    with _$TeacherApiCourseChaptersResult {
  const factory TeacherApiCourseChaptersResult({
    required List<CourseChapterSummary> items,
  }) = _TeacherApiCourseChaptersResult;

  factory TeacherApiCourseChaptersResult.fromJson(Map<String, dynamic> json) =>
      _$TeacherApiCourseChaptersResultFromJson(json);
}

class TeacherListCourseChaptersRequest
    extends BaseRequest<void, List<CourseChapterSummary>> {
  TeacherListCourseChaptersRequest({required String courseId})
    : super(
        '/api/v1/teacher/courses/$courseId/chapters',
        HttpMethod.get,
        fallbackMessage: '无法加载章节列表',
        responseParser: (value) =>
            TeacherApiCourseChaptersResult.fromJson(value).items,
      );
}

class TeacherGetCourseChapterRequest
    extends BaseRequest<void, CourseChapterDetail> {
  TeacherGetCourseChapterRequest({
    required String courseId,
    required String chapterId,
  }) : super(
         '/api/v1/teacher/courses/$courseId/chapters/$chapterId',
         HttpMethod.get,
         fallbackMessage: '无法加载章节详情',
         responseParser: (value) => _parseCourseChapterDetail(value),
       );
}

class TeacherGradeSubmissionRequest
    extends BaseRequest<GradeSubmissionRequest, void> {
  TeacherGradeSubmissionRequest({
    required String assignmentId,
    required String submissionId,
  }) : super(
         '/api/v1/assignments/$assignmentId/submissions/$submissionId/grade',
         HttpMethod.patch,
         fallbackMessage: '批改作业失败',
         requestEncoder: (value) => value.toJson(),
       );
}

class TeacherCreateAssignmentRequest
    extends BaseRequest<CreateAssignmentRequest, void> {
  TeacherCreateAssignmentRequest()
    : super(
        '/api/v1/assignments',
        HttpMethod.post,
        fallbackMessage: '发布作业失败',
        requestEncoder: (value) => value.toJson(),
      );
}

class TeacherUpdateAssignmentRequest
    extends BaseRequest<UpdateAssignmentRequest, void> {
  TeacherUpdateAssignmentRequest({required String assignmentId})
    : super(
        '/api/v1/assignments/$assignmentId',
        HttpMethod.patch,
        fallbackMessage: '更新作业失败',
        requestEncoder: (value) => value.toJson(),
      );
}

@freezed
abstract class TeacherReturnSubmissionPayload
    with _$TeacherReturnSubmissionPayload {
  const factory TeacherReturnSubmissionPayload({required String comment}) =
      _TeacherReturnSubmissionPayload;

  factory TeacherReturnSubmissionPayload.fromJson(Map<String, dynamic> json) =>
      _$TeacherReturnSubmissionPayloadFromJson(json);
}

class TeacherReturnSubmissionRequest
    extends BaseRequest<TeacherReturnSubmissionPayload, void> {
  TeacherReturnSubmissionRequest({
    required String assignmentId,
    required String submissionId,
  }) : super(
         '/api/v1/assignments/$assignmentId/submissions/$submissionId/return',
         HttpMethod.post,
         fallbackMessage: '打回作业失败',
         requestEncoder: (value) => value.toJson(),
       );
}

@freezed
abstract class TeacherGenerateQuestionsPayload
    with _$TeacherGenerateQuestionsPayload {
  const factory TeacherGenerateQuestionsPayload({
    required String topic,
    required int count,
    required String difficulty,
  }) = _TeacherGenerateQuestionsPayload;

  factory TeacherGenerateQuestionsPayload.fromJson(Map<String, dynamic> json) =>
      _$TeacherGenerateQuestionsPayloadFromJson(json);
}

@freezed
abstract class TeacherGenerateQuestionsResult
    with _$TeacherGenerateQuestionsResult {
  const factory TeacherGenerateQuestionsResult({
    required List<CreateAssignmentQuestionInput> questions,
  }) = _TeacherGenerateQuestionsResult;

  factory TeacherGenerateQuestionsResult.fromJson(Map<String, dynamic> json) =>
      _$TeacherGenerateQuestionsResultFromJson(json);
}

class TeacherGenerateQuestionsRequest
    extends
        BaseRequest<
          TeacherGenerateQuestionsPayload,
          List<CreateAssignmentQuestionInput>
        > {
  TeacherGenerateQuestionsRequest()
    : super(
        '/api/v1/teacher/generate_questions',
        HttpMethod.post,
        fallbackMessage: '生成题目失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) =>
            TeacherGenerateQuestionsResult.fromJson(value).questions,
      );
}

@freezed
abstract class TeacherUpdateSessionPayload with _$TeacherUpdateSessionPayload {
  const factory TeacherUpdateSessionPayload({
    String? location,
    String? status,
  }) = _TeacherUpdateSessionPayload;

  factory TeacherUpdateSessionPayload.fromJson(Map<String, dynamic> json) =>
      _$TeacherUpdateSessionPayloadFromJson(json);
}

class TeacherUpdateSessionRequest
    extends BaseRequest<TeacherUpdateSessionPayload, void> {
  TeacherUpdateSessionRequest({required String sessionId})
    : super(
        '/api/v1/teacher/sessions/$sessionId',
        HttpMethod.put,
        fallbackMessage: '无法更新课程',
        requestEncoder: (value) {
          final json = value.toJson();
          json.removeWhere((_, fieldValue) => fieldValue == null);
          return json;
        },
      );
}

@freezed
abstract class TeacherUpdateCoursePayload with _$TeacherUpdateCoursePayload {
  const factory TeacherUpdateCoursePayload({
    required String schoolId,
    String? name,
    String? description,
    String? imageUrl,
  }) = _TeacherUpdateCoursePayload;

  factory TeacherUpdateCoursePayload.fromJson(Map<String, dynamic> json) =>
      _$TeacherUpdateCoursePayloadFromJson(json);
}

@freezed
abstract class TeacherUpdateCourseResult with _$TeacherUpdateCourseResult {
  const factory TeacherUpdateCourseResult({required TeacherCourse course}) =
      _TeacherUpdateCourseResult;

  factory TeacherUpdateCourseResult.fromJson(Map<String, dynamic> json) =>
      _$TeacherUpdateCourseResultFromJson(json);
}

class TeacherUpdateCourseRequest
    extends BaseRequest<TeacherUpdateCoursePayload, TeacherCourse> {
  TeacherUpdateCourseRequest({required String courseId})
    : super(
        '/api/v1/teacher/courses/$courseId',
        HttpMethod.patch,
        fallbackMessage: '无法更新课程',
        queryParameters: (value) => {'school_id': value.schoolId},
        requestEncoder: (value) {
          final json = value.toJson();
          json.remove('school_id');
          json.removeWhere((_, fieldValue) => fieldValue == null);
          return json;
        },
        responseParser: (value) =>
            TeacherUpdateCourseResult.fromJson(value).course,
      );
}

@freezed
abstract class TeacherListClassStudentsResult
    with _$TeacherListClassStudentsResult {
  const factory TeacherListClassStudentsResult({
    required List<TeacherStudent> students,
  }) = _TeacherListClassStudentsResult;

  factory TeacherListClassStudentsResult.fromJson(Map<String, dynamic> json) =>
      _$TeacherListClassStudentsResultFromJson(json);
}

class TeacherListClassStudentsRequest
    extends BaseRequest<void, List<TeacherStudent>> {
  TeacherListClassStudentsRequest({required String classId})
    : super(
        '/api/v1/teacher/classes/$classId/students',
        HttpMethod.get,
        fallbackMessage: '无法加载学生列表',
        responseParser: (value) =>
            TeacherListClassStudentsResult.fromJson(value).students,
      );
}

@freezed
abstract class TeacherListMyClassesPayload with _$TeacherListMyClassesPayload {
  const factory TeacherListMyClassesPayload({
    required String from,
    required String to,
  }) = _TeacherListMyClassesPayload;

  factory TeacherListMyClassesPayload.fromJson(Map<String, dynamic> json) =>
      _$TeacherListMyClassesPayloadFromJson(json);
}

@freezed
abstract class TeacherListMyClassesSession with _$TeacherListMyClassesSession {
  const factory TeacherListMyClassesSession({
    String? classId,
    String? className,
    String? courseId,
    String? courseName,
  }) = _TeacherListMyClassesSession;

  factory TeacherListMyClassesSession.fromJson(Map<String, dynamic> json) =>
      _$TeacherListMyClassesSessionFromJson(json);
}

@freezed
abstract class TeacherListMyClassesResult with _$TeacherListMyClassesResult {
  const factory TeacherListMyClassesResult({
    required List<TeacherListMyClassesSession> sessions,
  }) = _TeacherListMyClassesResult;

  factory TeacherListMyClassesResult.fromJson(Map<String, dynamic> json) =>
      _$TeacherListMyClassesResultFromJson(json);
}

class TeacherListMyClassesRequest
    extends BaseRequest<TeacherListMyClassesPayload, List<TeacherClass>> {
  TeacherListMyClassesRequest()
    : super(
        '/api/v1/teacher/schedule',
        HttpMethod.get,
        fallbackMessage: '无法加载班级列表',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) {
          final sessions = TeacherListMyClassesResult.fromJson(value).sessions;
          final classes = <String, TeacherClass>{};
          for (final item in sessions) {
            final classId = item.classId;
            final className = item.className;
            final courseId = item.courseId;
            final courseName = item.courseName;
            if (classId == null ||
                className == null ||
                courseId == null ||
                courseName == null) {
              continue;
            }
            classes['${classId}_$courseId'] = TeacherClass(
              id: classId,
              name: className,
              courseId: courseId,
              courseName: courseName,
            );
          }
          return classes.values.toList(growable: false);
        },
      );
}

@freezed
abstract class TeacherListSchedulePayload with _$TeacherListSchedulePayload {
  const factory TeacherListSchedulePayload({
    required String from,
    required String to,
  }) = _TeacherListSchedulePayload;

  factory TeacherListSchedulePayload.fromJson(Map<String, dynamic> json) =>
      _$TeacherListSchedulePayloadFromJson(json);
}

@freezed
abstract class TeacherListScheduleResult with _$TeacherListScheduleResult {
  const factory TeacherListScheduleResult({
    required List<TeacherScheduleItem> sessions,
  }) = _TeacherListScheduleResult;

  factory TeacherListScheduleResult.fromJson(Map<String, dynamic> json) =>
      _$TeacherListScheduleResultFromJson(json);
}

class TeacherListScheduleRequest
    extends BaseRequest<TeacherListSchedulePayload, List<TeacherScheduleItem>> {
  TeacherListScheduleRequest()
    : super(
        '/api/v1/teacher/schedule',
        HttpMethod.get,
        fallbackMessage: '无法加载课表',
        queryParameters: (value) => value.toJson(),
        responseParser: (value) =>
            TeacherListScheduleResult.fromJson(value).sessions,
      );
}

@freezed
abstract class TeacherListAssignmentsResult
    with _$TeacherListAssignmentsResult {
  const factory TeacherListAssignmentsResult({
    required List<TeacherAssignment> assignments,
  }) = _TeacherListAssignmentsResult;

  factory TeacherListAssignmentsResult.fromJson(Map<String, dynamic> json) =>
      _$TeacherListAssignmentsResultFromJson(json);
}

class TeacherListAssignmentsRequest
    extends BaseRequest<void, List<TeacherAssignment>> {
  TeacherListAssignmentsRequest()
    : super(
        '/api/v1/teacher/assignments',
        HttpMethod.get,
        fallbackMessage: '无法加载作业列表',
        responseParser: (value) =>
            TeacherListAssignmentsResult.fromJson(value).assignments,
      );
}

@freezed
abstract class TeacherListSubmissionsResult
    with _$TeacherListSubmissionsResult {
  const factory TeacherListSubmissionsResult({
    required List<SubmissionSummary> submissions,
  }) = _TeacherListSubmissionsResult;

  factory TeacherListSubmissionsResult.fromJson(Map<String, dynamic> json) =>
      _$TeacherListSubmissionsResultFromJson(json);
}

class TeacherListAssignmentSubmissionsRequest
    extends BaseRequest<void, List<SubmissionSummary>> {
  TeacherListAssignmentSubmissionsRequest({required String assignmentId})
    : super(
        '/api/v1/assignments/$assignmentId/submissions',
        HttpMethod.get,
        fallbackMessage: '无法加载提交列表',
        responseParser: (value) =>
            TeacherListSubmissionsResult.fromJson(value).submissions,
      );
}

class TeacherGetSubmissionRequest
    extends BaseRequest<void, TeacherSubmissionDetail> {
  TeacherGetSubmissionRequest({
    required String assignmentId,
    required String submissionId,
  }) : super(
         '/api/v1/assignments/$assignmentId/submissions/$submissionId',
         HttpMethod.get,
         fallbackMessage: '无法加载提交详情',
         responseParser: (value) => TeacherSubmissionDetail.fromJson(value),
       );
}

class TeacherGetAssignmentDetailRequest
    extends BaseRequest<void, AssignmentDetail> {
  TeacherGetAssignmentDetailRequest({required String assignmentId})
    : super(
        '/api/v1/teacher/assignments/$assignmentId',
        HttpMethod.get,
        fallbackMessage: '无法加载作业详情',
        responseParser: (value) => _parseTeacherAssignmentDetail(value),
      );
}

CourseChapterDetail _parseCourseChapterDetail(dynamic value) {
  if (value is! Map) {
    return const CourseChapterDetail();
  }

  final payload = value.cast<String, dynamic>();
  final chapterRaw = payload['chapter'];
  final chapter = chapterRaw is Map
      ? chapterRaw.cast<String, dynamic>()
      : const <String, dynamic>{};

  return CourseChapterDetail.fromJson(<String, dynamic>{
    ...chapter,
    'attachments': payload['attachments'],
  });
}

AssignmentDetail _parseTeacherAssignmentDetail(dynamic value) {
  if (value is! Map) {
    return const AssignmentDetail();
  }

  final payload = value.cast<String, dynamic>();
  final assignmentRaw = payload['assignment'];
  final assignment = assignmentRaw is Map
      ? assignmentRaw.cast<String, dynamic>()
      : const <String, dynamic>{};

  return AssignmentDetail.fromJson(<String, dynamic>{
    ...assignment,
    'questions': payload['questions'],
  });
}

@freezed
abstract class TeacherCreateCourseChapterPayload
    with _$TeacherCreateCourseChapterPayload {
  const factory TeacherCreateCourseChapterPayload({
    required String title,
    @Default('') String content,
    @Default(0) int orderIndex,
  }) = _TeacherCreateCourseChapterPayload;

  factory TeacherCreateCourseChapterPayload.fromJson(
    Map<String, dynamic> json,
  ) => _$TeacherCreateCourseChapterPayloadFromJson(json);
}

@freezed
abstract class TeacherCreateCourseChapterResult
    with _$TeacherCreateCourseChapterResult {
  const factory TeacherCreateCourseChapterResult({
    required CourseChapterSummary chapter,
  }) = _TeacherCreateCourseChapterResult;

  factory TeacherCreateCourseChapterResult.fromJson(
    Map<String, dynamic> json,
  ) => _$TeacherCreateCourseChapterResultFromJson(json);
}

class TeacherCreateCourseChapterRequest
    extends
        BaseRequest<TeacherCreateCourseChapterPayload, CourseChapterSummary> {
  TeacherCreateCourseChapterRequest({required String courseId})
    : super(
        '/api/v1/teacher/courses/$courseId/chapters',
        HttpMethod.post,
        fallbackMessage: '无法创建章节',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) =>
            TeacherCreateCourseChapterResult.fromJson(value).chapter,
      );
}

@freezed
abstract class TeacherUpdateCourseChapterPayload
    with _$TeacherUpdateCourseChapterPayload {
  const factory TeacherUpdateCourseChapterPayload({
    String? title,
    String? content,
    int? orderIndex,
  }) = _TeacherUpdateCourseChapterPayload;

  factory TeacherUpdateCourseChapterPayload.fromJson(
    Map<String, dynamic> json,
  ) => _$TeacherUpdateCourseChapterPayloadFromJson(json);
}

class TeacherUpdateCourseChapterRequest
    extends BaseRequest<TeacherUpdateCourseChapterPayload, void> {
  TeacherUpdateCourseChapterRequest({
    required String courseId,
    required String chapterId,
  }) : super(
         '/api/v1/teacher/courses/$courseId/chapters/$chapterId',
         HttpMethod.patch,
         fallbackMessage: '无法更新章节',
         requestEncoder: (value) {
           final json = value.toJson();
           json.removeWhere((_, fieldValue) => fieldValue == null);
           return json;
         },
       );
}

class TeacherDeleteCourseChapterRequest extends BaseRequest<void, void> {
  TeacherDeleteCourseChapterRequest({
    required String courseId,
    required String chapterId,
  }) : super(
         '/api/v1/teacher/courses/$courseId/chapters/$chapterId',
         HttpMethod.delete,
         fallbackMessage: '无法删除章节',
       );
}

@freezed
abstract class TeacherAttachCourseChapterFilePayload
    with _$TeacherAttachCourseChapterFilePayload {
  const factory TeacherAttachCourseChapterFilePayload({
    required String fileId,
  }) = _TeacherAttachCourseChapterFilePayload;

  factory TeacherAttachCourseChapterFilePayload.fromJson(
    Map<String, dynamic> json,
  ) => _$TeacherAttachCourseChapterFilePayloadFromJson(json);
}

class TeacherAttachCourseChapterFileRequest
    extends BaseRequest<TeacherAttachCourseChapterFilePayload, void> {
  TeacherAttachCourseChapterFileRequest({
    required String courseId,
    required String chapterId,
  }) : super(
         '/api/v1/teacher/courses/$courseId/chapters/$chapterId/attachments',
         HttpMethod.post,
         fallbackMessage: '无法绑定附件',
         requestEncoder: (value) => value.toJson(),
       );
}

class TeacherDetachCourseChapterFileRequest extends BaseRequest<void, void> {
  TeacherDetachCourseChapterFileRequest({
    required String courseId,
    required String chapterId,
    required String fileId,
  }) : super(
         '/api/v1/teacher/courses/$courseId/chapters/$chapterId/attachments/$fileId',
         HttpMethod.delete,
         fallbackMessage: '无法解绑附件',
       );
}

@freezed
abstract class TeacherGradeAssignmentPayload
    with _$TeacherGradeAssignmentPayload {
  const factory TeacherGradeAssignmentPayload({
    required String title,
    required String description,
    required String content,
    required String rubrics,
  }) = _TeacherGradeAssignmentPayload;

  factory TeacherGradeAssignmentPayload.fromJson(Map<String, dynamic> json) =>
      _$TeacherGradeAssignmentPayloadFromJson(json);
}

class TeacherGradeAssignmentRequest
    extends BaseRequest<TeacherGradeAssignmentPayload, GradeAssignmentResult> {
  TeacherGradeAssignmentRequest()
    : super(
        '/api/v1/teacher/grade_assignment',
        HttpMethod.post,
        fallbackMessage: 'AI 批改失败',
        requestEncoder: (value) => value.toJson(),
        responseParser: (value) => GradeAssignmentResult.fromJson(value),
      );
}
