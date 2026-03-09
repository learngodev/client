import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/dio_provider.dart';
import '../../student/domain/assignment_models.dart';
import '../../student/domain/course_chapter_models.dart';
import 'teacher_api_requests.dart';
import '../domain/teacher_models.dart';
import '../domain/teacher_repository.dart';
import '../domain/teacher_schedule_model.dart';
import '../domain/time_slot.dart';

class TeacherApiRepository implements TeacherRepository {
  TeacherApiRepository({required Dio dio}) : _apiClient = ApiClient(dio);

  final ApiClient _apiClient;

  @override
  Future<List<TimeSlot>> listTimeSlots() {
    return _apiClient.execute(TeacherListTimeSlotsRequest());
  }

  @override
  Future<List<TeacherScheduleItem>> listSchedule(DateTime from, DateTime to) {
    return _apiClient.execute(
      TeacherListScheduleRequest(),
      payload: TeacherListSchedulePayload(
        from: from.toUtc().toIso8601String(),
        to: to.toUtc().toIso8601String(),
      ),
    );
  }

  @override
  Future<List<TeacherAssignment>> listTeacherAssignments() {
    return _apiClient.execute(TeacherListAssignmentsRequest());
  }

  @override
  Future<List<SubmissionSummary>> listAssignmentSubmissions(
    String assignmentId,
  ) {
    return _apiClient.execute(
      TeacherListAssignmentSubmissionsRequest(assignmentId: assignmentId),
    );
  }

  @override
  Future<TeacherSubmissionDetail> getSubmission(
    String assignmentId,
    String submissionId,
  ) {
    return _apiClient.execute(
      TeacherGetSubmissionRequest(
        assignmentId: assignmentId,
        submissionId: submissionId,
      ),
    );
  }

  @override
  Future<AssignmentDetail> getAssignmentDetail(String assignmentId) {
    return _apiClient.execute(
      TeacherGetAssignmentDetailRequest(assignmentId: assignmentId),
    );
  }

  @override
  Future<void> gradeSubmission(
    String assignmentId,
    String submissionId,
    GradeSubmissionRequest request,
  ) {
    return _apiClient.execute(
      TeacherGradeSubmissionRequest(
        assignmentId: assignmentId,
        submissionId: submissionId,
      ),
      payload: request,
    );
  }

  @override
  Future<void> createAssignment(CreateAssignmentRequest request) {
    return _apiClient.execute(
      TeacherCreateAssignmentRequest(),
      payload: request,
    );
  }

  @override
  Future<List<TeacherCourse>> listCourses() {
    return _apiClient.execute(TeacherListCoursesRequest());
  }

  @override
  Future<List<TeacherClass>> listCourseClasses(String courseId) {
    return _apiClient.execute(
      TeacherListCourseClassesRequest(courseId: courseId),
    );
  }

  @override
  Future<List<CourseChapterSummary>> listCourseChapters(String courseId) {
    return _apiClient.execute(
      TeacherListCourseChaptersRequest(courseId: courseId),
    );
  }

  @override
  Future<CourseChapterDetail> getCourseChapter(
    String courseId,
    String chapterId,
  ) {
    return _apiClient.execute(
      TeacherGetCourseChapterRequest(courseId: courseId, chapterId: chapterId),
    );
  }

  @override
  Future<CourseChapterSummary> createCourseChapter(
    String courseId, {
    required String title,
    String content = '',
    int orderIndex = 0,
  }) {
    return _apiClient.execute(
      TeacherCreateCourseChapterRequest(courseId: courseId),
      payload: TeacherCreateCourseChapterPayload(
        title: title,
        content: content,
        orderIndex: orderIndex,
      ),
    );
  }

  @override
  Future<void> updateCourseChapter(
    String courseId,
    String chapterId, {
    String? title,
    String? content,
    int? orderIndex,
  }) {
    if (title == null && content == null && orderIndex == null) {
      return Future.value();
    }
    return _apiClient.execute(
      TeacherUpdateCourseChapterRequest(
        courseId: courseId,
        chapterId: chapterId,
      ),
      payload: TeacherUpdateCourseChapterPayload(
        title: title,
        content: content,
        orderIndex: orderIndex,
      ),
    );
  }

  @override
  Future<void> deleteCourseChapter(String courseId, String chapterId) {
    return _apiClient.execute(
      TeacherDeleteCourseChapterRequest(
        courseId: courseId,
        chapterId: chapterId,
      ),
    );
  }

  @override
  Future<void> attachCourseChapterFile(
    String courseId,
    String chapterId,
    String fileId,
  ) {
    return _apiClient.execute(
      TeacherAttachCourseChapterFileRequest(
        courseId: courseId,
        chapterId: chapterId,
      ),
      payload: TeacherAttachCourseChapterFilePayload(fileId: fileId),
    );
  }

  @override
  Future<void> detachCourseChapterFile(
    String courseId,
    String chapterId,
    String fileId,
  ) {
    return _apiClient.execute(
      TeacherDetachCourseChapterFileRequest(
        courseId: courseId,
        chapterId: chapterId,
        fileId: fileId,
      ),
    );
  }

  @override
  Future<List<TeacherStudent>> listClassStudents(String classId) {
    return _apiClient.execute(
      TeacherListClassStudentsRequest(classId: classId),
    );
  }

  @override
  Future<List<TeacherClass>> listMyClasses() {
    final now = DateTime.now();
    final from = now
        .subtract(const Duration(days: 90))
        .toUtc()
        .toIso8601String();
    final to = now.add(const Duration(days: 90)).toUtc().toIso8601String();
    return _apiClient.execute(
      TeacherListMyClassesRequest(),
      payload: TeacherListMyClassesPayload(from: from, to: to),
    );
  }

  @override
  Future<GradeAssignmentResult> gradeAssignment({
    required String title,
    required String description,
    required String content,
    required String rubrics,
  }) {
    return _apiClient.execute(
      TeacherGradeAssignmentRequest(),
      payload: TeacherGradeAssignmentPayload(
        title: title,
        description: description,
        content: content,
        rubrics: rubrics,
      ),
    );
  }

  @override
  Future<void> updateAssignment(String id, UpdateAssignmentRequest request) {
    return _apiClient.execute(
      TeacherUpdateAssignmentRequest(assignmentId: id),
      payload: request,
    );
  }

  @override
  Future<void> returnSubmission(
    String assignmentId,
    String submissionId,
    String comment,
  ) {
    return _apiClient.execute(
      TeacherReturnSubmissionRequest(
        assignmentId: assignmentId,
        submissionId: submissionId,
      ),
      payload: TeacherReturnSubmissionPayload(comment: comment),
    );
  }

  @override
  Future<List<CreateAssignmentQuestionInput>> generateQuestions({
    required String topic,
    required int count,
    required String difficulty,
  }) {
    return _apiClient.execute(
      TeacherGenerateQuestionsRequest(),
      payload: TeacherGenerateQuestionsPayload(
        topic: topic,
        count: count,
        difficulty: difficulty,
      ),
    );
  }

  @override
  Future<void> updateSession(
    String sessionId, {
    String? location,
    String? status,
  }) {
    if (location == null && status == null) {
      return Future.value();
    }
    return _apiClient.execute(
      TeacherUpdateSessionRequest(sessionId: sessionId),
      payload: TeacherUpdateSessionPayload(location: location, status: status),
    );
  }
}

final teacherRepositoryProvider = Provider<TeacherRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return TeacherApiRepository(dio: dio);
});
