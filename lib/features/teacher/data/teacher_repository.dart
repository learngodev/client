import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../../student/domain/assignment_models.dart';
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
