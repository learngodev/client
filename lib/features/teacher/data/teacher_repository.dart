import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../../student/domain/assignment_models.dart';
import '../../student/domain/course_chapter_models.dart';
import '../domain/teacher_models.dart';
import '../domain/teacher_repository.dart';
import '../domain/teacher_schedule_model.dart';
import '../domain/time_slot.dart';

class TeacherApiRepository implements TeacherRepository {
  TeacherApiRepository({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<TimeSlot>> listTimeSlots() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/teacher/time-slots',
      );
      final data = _extractData(response.data, '未能获取时间段');
      final list = data['time_slots'] as List?;
      return list
              ?.map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载时间段');
    }
  }

  @override
  Future<List<TeacherScheduleItem>> listSchedule(
    DateTime from,
    DateTime to,
  ) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/teacher/schedule',
        queryParameters: {
          'from': from.toUtc().toIso8601String(),
          'to': to.toUtc().toIso8601String(),
        },
      );
      final data = _extractData(response.data, '未能获取课表');
      final list = data['sessions'] as List?;
      return list
              ?.map(
                (e) => TeacherScheduleItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [];
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载课表');
    }
  }

  @override
  Future<List<TeacherAssignment>> listTeacherAssignments() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/teacher/assignments',
      );
      final data = _extractData(response.data, '未能获取作业列表');
      final list = data['assignments'] as List?;
      return list
              ?.map(
                (e) => TeacherAssignment.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [];
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载作业列表');
    }
  }

  @override
  Future<List<SubmissionSummary>> listAssignmentSubmissions(
    String assignmentId,
  ) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/assignments/$assignmentId/submissions',
      );
      final data = _extractData(response.data, '未能获取提交列表');
      final list = data['submissions'] as List?;
      return list
              ?.map(
                (e) => SubmissionSummary.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [];
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载提交列表');
    }
  }

  @override
  Future<TeacherSubmissionDetail> getSubmission(
    String assignmentId,
    String submissionId,
  ) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/assignments/$assignmentId/submissions/$submissionId',
      );
      final data = _extractData(response.data, '未能获取提交详情');
      return TeacherSubmissionDetail.fromJson(data);
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载提交详情');
    }
  }

  @override
  Future<AssignmentDetail> getAssignmentDetail(String assignmentId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/teacher/assignments/$assignmentId',
      );
      final data = _extractData(response.data, '未能获取作业详情');
      return AssignmentDetail.fromJson(data);
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载作业详情');
    }
  }

  @override
  Future<void> gradeSubmission(
    String assignmentId,
    String submissionId,
    GradeSubmissionRequest request,
  ) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/v1/assignments/$assignmentId/submissions/$submissionId/grade',
        data: request.toJson(),
      );
      _extractData(response.data, '批改失败');
    } on DioException catch (error) {
      throw _asAppException(error, '批改作业失败');
    }
  }

  @override
  Future<void> createAssignment(CreateAssignmentRequest request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/assignments',
        data: request.toJson(),
      );
      _extractData(response.data, '发布失败');
    } on DioException catch (error) {
      throw _asAppException(error, '发布作业失败');
    }
  }

  @override
  Future<List<TeacherCourse>> listCourses() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/teacher/courses',
      );
      final data = _extractData(response.data, '未能获取课程列表');
      final list = data['courses'] as List?;
      return list
              ?.map((e) => TeacherCourse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载课程列表');
    }
  }

  @override
  Future<List<TeacherClass>> listCourseClasses(String courseId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/teacher/courses/$courseId/classes',
      );
      final data = _extractData(response.data, '未能获取班级列表');
      final list = data['classes'] as List?;
      return list
              ?.map((e) => TeacherClass.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载班级列表');
    }
  }

  @override
  Future<List<CourseChapterSummary>> listCourseChapters(String courseId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/teacher/courses/$courseId/chapters',
      );
      final data = _extractData(response.data, '未能获取章节列表');
      final list = data['items'] as List?;
      return list
              ?.map(
                (e) => CourseChapterSummary.fromJson(
                  (e as Map).cast<String, dynamic>(),
                ),
              )
              .toList() ??
          [];
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载章节列表');
    }
  }

  @override
  Future<CourseChapterDetail> getCourseChapter(
    String courseId,
    String chapterId,
  ) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/teacher/courses/$courseId/chapters/$chapterId',
      );
      final data = _extractData(response.data, '未能获取章节详情');
      return CourseChapterDetail.fromJson(data);
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载章节详情');
    }
  }

  @override
  Future<CourseChapterSummary> createCourseChapter(
    String courseId, {
    required String title,
    String content = '',
    int orderIndex = 0,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/teacher/courses/$courseId/chapters',
        data: {'title': title, 'content': content, 'order_index': orderIndex},
      );
      final data = _extractData(response.data, '未能创建章节');
      final chapter = (data['chapter'] as Map?)?.cast<String, dynamic>();
      if (chapter == null) {
        throw AppException('未能创建章节');
      }
      return CourseChapterSummary.fromJson(chapter);
    } on DioException catch (error) {
      throw _asAppException(error, '无法创建章节');
    }
  }

  @override
  Future<void> updateCourseChapter(
    String courseId,
    String chapterId, {
    String? title,
    String? content,
    int? orderIndex,
  }) async {
    try {
      final payload = <String, dynamic>{};
      if (title != null) payload['title'] = title;
      if (content != null) payload['content'] = content;
      if (orderIndex != null) payload['order_index'] = orderIndex;
      if (payload.isEmpty) return;

      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/v1/teacher/courses/$courseId/chapters/$chapterId',
        data: payload,
      );
      _extractData(response.data, '未能更新章节');
    } on DioException catch (error) {
      throw _asAppException(error, '无法更新章节');
    }
  }

  @override
  Future<void> deleteCourseChapter(String courseId, String chapterId) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        '/api/v1/teacher/courses/$courseId/chapters/$chapterId',
      );
      _extractData(response.data, '未能删除章节');
    } on DioException catch (error) {
      throw _asAppException(error, '无法删除章节');
    }
  }

  @override
  Future<void> attachCourseChapterFile(
    String courseId,
    String chapterId,
    String fileId,
  ) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/teacher/courses/$courseId/chapters/$chapterId/attachments',
        data: {'file_id': fileId},
      );
      _extractData(response.data, '未能绑定附件');
    } on DioException catch (error) {
      throw _asAppException(error, '无法绑定附件');
    }
  }

  @override
  Future<void> detachCourseChapterFile(
    String courseId,
    String chapterId,
    String fileId,
  ) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        '/api/v1/teacher/courses/$courseId/chapters/$chapterId/attachments/$fileId',
      );
      _extractData(response.data, '未能解绑附件');
    } on DioException catch (error) {
      throw _asAppException(error, '无法解绑附件');
    }
  }

  @override
  Future<List<TeacherStudent>> listClassStudents(String classId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/teacher/classes/$classId/students',
      );
      final data = _extractData(response.data, '未能获取学生列表');
      final list = data['students'] as List?;
      return list
              ?.map((e) => TeacherStudent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载学生列表');
    }
  }

  @override
  Future<List<TeacherClass>> listMyClasses() async {
    try {
      final now = DateTime.now();
      final from = now
          .subtract(const Duration(days: 90))
          .toUtc()
          .toIso8601String();
      final to = now.add(const Duration(days: 90)).toUtc().toIso8601String();

      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/teacher/schedule',
        queryParameters: {'from': from, 'to': to},
      );
      final data = _extractData(response.data, '未能获取班级列表');
      final sessions = data['sessions'] as List?;

      final classes = <String, TeacherClass>{};
      if (sessions != null) {
        for (final item in sessions) {
          final map = item as Map<String, dynamic>;
          final classId = map['class_id'] as String?;
          final className = map['class_name'] as String?;
          final courseId = map['course_id'] as String?;
          final courseName = map['course_name'] as String?;

          if (classId != null &&
              className != null &&
              courseId != null &&
              courseName != null) {
            final key = '${classId}_$courseId';
            classes[key] = TeacherClass(
              id: classId,
              name: className,
              courseId: courseId,
              courseName: courseName,
            );
          }
        }
      }

      return classes.values.toList();
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载班级列表');
    }
  }

  @override
  Future<GradeAssignmentResult> gradeAssignment({
    required String title,
    required String description,
    required String content,
    required String rubrics,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/teacher/grade_assignment',
        data: {
          'title': title,
          'description': description,
          'content': content,
          'rubrics': rubrics,
        },
      );
      final data = _extractData(response.data, 'AI 批改失败');
      return GradeAssignmentResult.fromJson(data);
    } on DioException catch (error) {
      throw _asAppException(error, 'AI 批改失败');
    }
  }

  @override
  Future<void> updateAssignment(
    String id,
    UpdateAssignmentRequest request,
  ) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/api/v1/assignments/$id',
        data: request.toJson(),
      );
      _extractData(response.data, '更新作业失败');
    } on DioException catch (error) {
      throw _asAppException(error, '更新作业失败');
    }
  }

  @override
  Future<void> returnSubmission(
    String assignmentId,
    String submissionId,
    String comment,
  ) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/assignments/$assignmentId/submissions/$submissionId/return',
        data: {'comment': comment},
      );
      _extractData(response.data, '打回作业失败');
    } on DioException catch (error) {
      throw _asAppException(error, '打回作业失败');
    }
  }

  @override
  Future<List<CreateAssignmentQuestionInput>> generateQuestions({
    required String topic,
    required int count,
    required String difficulty,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/teacher/generate_questions',
        data: {'topic': topic, 'count': count, 'difficulty': difficulty},
      );
      final data = _extractData(response.data, '生成题目失败');
      final list = data['questions'] as List?;
      return list
              ?.map(
                (e) => CreateAssignmentQuestionInput.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [];
    } on DioException catch (error) {
      throw _asAppException(error, '生成题目失败');
    }
  }

  @override
  Future<void> updateSession(
    String sessionId, {
    String? location,
    String? status,
  }) async {
    try {
      final data = <String, dynamic>{};
      if (location != null) data['location'] = location;
      if (status != null) data['status'] = status;

      if (data.isEmpty) return;

      final response = await _dio.put<Map<String, dynamic>>(
        '/api/v1/teacher/sessions/$sessionId',
        data: data,
      );
      _extractData(response.data, '更新课程失败');
    } on DioException catch (error) {
      throw _asAppException(error, '无法更新课程');
    }
  }

  @override
  Future<TeacherCourse> createCourse({
    required String name,
    required String description,
    String? imageUrl,
    List<String>? classIds,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/teacher/courses',
        data: {
          'name': name,
          'description': description,
          'image_url': imageUrl,
          'class_ids': classIds,
        },
      );
      final data = _extractData(response.data, '未能创建课程');
      return TeacherCourse.fromJson(data);
    } on DioException catch (error) {
      throw _asAppException(error, '无法创建课程');
    }
  }

  Map<String, dynamic> _extractData(
    Map<String, dynamic>? body,
    String fallbackMessage,
  ) {
    if (body == null) {
      throw AppException(fallbackMessage);
    }
    final success = body['success'] as bool? ?? false;
    if (!success) {
      final error = body['error'] as Map<String, dynamic>?;
      final message = error?['message']?.toString() ?? fallbackMessage;
      final details = error?['details']?.toString();
      throw AppException(message, details: details);
    }
    final data = body['data'];
    if (data is Map<String, dynamic>) {
      return data;
    }
    // For void returns or simple success checks, data might be null or empty
    return {};
  }

  AppException _asAppException(DioException error, String fallback) {
    final body = error.response?.data;
    if (body is Map<String, dynamic>) {
      final map = body['error'] as Map<String, dynamic>?;
      final message = map?['message']?.toString();
      final details = map?['details']?.toString();
      if (message != null && message.isNotEmpty) {
        return AppException(message, details: details);
      }
    }
    return AppException(
      error.message ?? fallback,
      details: error.error?.toString(),
    );
  }
}

final teacherRepositoryProvider = Provider<TeacherRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return TeacherApiRepository(dio: dio);
});
