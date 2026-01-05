import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart' show IconData, Icons;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/network/dio_provider.dart';
import '../../auth/application/auth_controller.dart';
import '../../auth/domain/account.dart';
import '../domain/assignment_models.dart';
import '../domain/course_chapter_models.dart';
import '../domain/course.dart';
import '../domain/sample_data.dart' as sample;
import '../domain/student_repository.dart';
import '../domain/time_slot.dart';

class StudentApiRepository implements StudentRepository {
  StudentApiRepository({
    required Dio dio,
    Account? account,
    DateTime Function()? clock,
  }) : _dio = dio,
       _account = account,
       _clock = clock ?? DateTime.now;

  final Dio _dio;
  final Account? _account;
  final DateTime Function() _clock;

  @override
  Future<List<TimeSlot>> listTimeSlots() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/student/time-slots',
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
  Future<List<Course>> listCourses() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/student/courses',
      );
      final data = _extractData(response.data, '未能获取课程列表');
      final list = data['items'] as List?;
      return list
              ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载课程列表');
    }
  }

  @override
  Future<StudentDashboardData> fetchDashboard() async {
    final noteFuture = _fetchNotes();
    final messageFuture = _fetchMessages();
    final assignmentFuture = listAssignments(limit: 20);
    final examFuture = _fetchExams();
    final scheduleFuture = _fetchSchedule();
    final customReminderFuture = _fetchCustomReminders();

    final noteResult = await noteFuture;
    final messages = await messageFuture;
    final assignments = await assignmentFuture;
    final exams = await examFuture;
    final schedule = await scheduleFuture;
    final customReminders = await customReminderFuture;

    return StudentDashboardData(
      reminders: _buildReminders(
        assignments: assignments,
        exams: exams,
        customReminders: customReminders,
        drafts: noteResult.draftCount,
        unreadMessages: messages.where((item) => item.isUnread).length,
      ),
      schedule: schedule,
      assignments: assignments,
      exams: exams,
      notes: noteResult.items,
      messages: messages,
      quickLinks: sample.studentQuickLinks,
      insights: _buildInsights(
        drafts: noteResult.draftCount,
        assignments: assignments,
        exams: exams,
      ),
    );
  }

  @override
  Future<List<sample.StudentAssignmentItem>> listAssignments({
    String? courseId,
    int limit = 20,
  }) async {
    try {
      final query = <String, dynamic>{'limit': limit};
      final trimmed = courseId?.trim();
      if (trimmed != null && trimmed.isNotEmpty) {
        query['course_id'] = trimmed;
      }

      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/student/assignments',
        queryParameters: query,
      );
      final data = _extractData(response.data, '未能获取作业列表');
      final rawList = _extractMapList(data, 'assignments');
      final items = <sample.StudentAssignmentItem>[];

      for (final raw in rawList) {
        final id = raw['id']?.toString();
        if (id == null || id.isEmpty) {
          continue;
        }

        final dueAt = _parseDateTime(raw['due_at']);
        final startAt = _parseDateTime(raw['start_at']);
        final status = _parseAssignmentStatus(raw['status']);
        final isOverdue = raw['is_overdue'] == true;

        items.add(
          sample.StudentAssignmentItem(
            id: id,
            title: _sanitizeNonEmpty(raw['title']) ?? '未命名作业',
            course: _sanitizeNonEmpty(raw['course_name']) ?? '课程',
            teacher: _sanitizeNonEmpty(raw['teacher_name']) ?? '授课教师',
            dueLabel: _formatAssignmentDueLabel(
              dueAt: dueAt,
              status: status,
              isOverdue: isOverdue,
            ),
            status: status,
            progress: _guessAssignmentProgress(
              status: status,
              isOverdue: isOverdue,
            ),
            allowResubmit: raw['allow_resubmit'] == true,
            isOverdue: isOverdue,
            scoreLabel: _buildScoreLabel(raw['score']),
            feedback: _sanitizeString(raw['feedback']),
            dueAt: dueAt,
            startAt: startAt,
          ),
        );
      }

      return List.unmodifiable(items);
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载作业列表');
    }
  }

  @override
  Future<List<CourseChapterSummary>> listCourseChapters(String courseId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/student/courses/$courseId/chapters',
      );
      final data = _extractData(response.data, '未能获取章节列表');
      final rawList = _extractMapList(data, 'items');

      return List.unmodifiable(
        rawList
            .map((e) => CourseChapterSummary.fromJson(e))
            .where((e) => e.id.isNotEmpty)
            .toList(growable: false),
      );
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
        '/api/v1/student/courses/$courseId/chapters/$chapterId',
      );
      final data = _extractData(response.data, '未能获取章节详情');
      return CourseChapterDetail.fromJson(data);
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载章节详情');
    }
  }

  @override
  Future<AssignmentDetail> getAssignmentDetail(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/assignments/$id',
      );
      final data = _extractData(response.data, '未能获取作业详情');
      final assignmentData = data['assignment'] as Map<String, dynamic>?;
      if (assignmentData == null) {
        throw const AppException('响应数据格式错误：缺少 assignment 字段');
      }
      return AssignmentDetail.fromJson(assignmentData);
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载作业详情');
    }
  }

  @override
  Future<SubmissionResult> submitAssignment(
    String id,
    Map<String, dynamic> answers,
  ) async {
    try {
      final requestBody = {
        'status': 'submitted',
        'answers': answers.entries
            .map((e) => {'question_id': e.key, 'answer': e.value.toString()})
            .toList(),
      };

      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/assignments/$id/submissions',
        data: requestBody,
      );
      final data = _extractData(response.data, '提交失败');
      return SubmissionResult.fromJson(data);
    } on DioException catch (error) {
      throw _asAppException(error, '提交作业失败');
    }
  }

  @override
  Future<ExplainQuestionResult> explainQuestion({
    required String title,
    required String prompt,
    required String questionType,
    List<String> options = const [],
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/ai/explain_question',
        data: {
          'title': title,
          'prompt': prompt,
          'question_type': questionType,
          'options': options,
        },
      );
      final data = _extractData(response.data, 'AI 解析失败');
      return ExplainQuestionResult.fromJson(data);
    } on DioException catch (error) {
      throw _asAppException(error, 'AI 解析失败');
    }
  }

  @override
  Future<void> joinCourse(String code) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/student/courses/join',
        data: {'code': code},
      );
      _ensureSuccess(response.data, '加入课程失败');
    } on DioException catch (error) {
      throw _asAppException(error, '加入课程失败');
    }
  }

  void _ensureSuccess(Map<String, dynamic>? body, String fallbackMessage) {
    if (body == null) {
      throw AppException(fallbackMessage);
    }
    final success = body['success'] as bool? ?? false;
    if (success) {
      return;
    }
    final error = body['error'] as Map<String, dynamic>?;
    final message = error?['message']?.toString() ?? fallbackMessage;
    final details = error?['details']?.toString();
    throw AppException(message, details: details);
  }

  @override
  Future<StudentSubmissionDetail?> getSubmissionDetail(
    String assignmentId,
  ) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/assignments/$assignmentId/submissions/me',
      );
      final data = _extractData(response.data, '未能获取提交详情');

      final assignmentData = data['assignment'] as Map<String, dynamic>?;
      final submissionData = data['submission'] as Map<String, dynamic>;
      final itemsData = data['items'] as List?;

      AssignmentDetail assignment;
      if (assignmentData != null) {
        assignment = AssignmentDetail.fromJson(assignmentData);
      } else {
        assignment = await getAssignmentDetail(assignmentId);
      }
      final submission = SubmissionResult.fromJson(submissionData);
      final items =
          itemsData
              ?.map((e) => SubmissionItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

      return StudentSubmissionDetail(
        assignment: assignment,
        submission: submission,
        items: items,
      );
    } on DioException catch (error) {
      if (error.response?.statusCode == 404) {
        return null;
      }
      throw _asAppException(error, '无法加载提交详情');
    }
  }

  Future<_NoteFetchResult> _fetchNotes() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/notes',
        queryParameters: const {'include_deleted': false, 'status': 'all'},
      );
      final data = _extractData(response.data, '未能获取学习笔记');
      final rawNotes = _extractMapList(data, 'notes');
      final items = <sample.StudentNoteItem>[];
      var draftCount = 0;

      for (final raw in rawNotes) {
        final id = raw['id']?.toString() ?? '';
        if (id.isEmpty) {
          continue;
        }

        final title = raw['title']?.toString().trim();
        final content = raw['content']?.toString();
        final status = raw['status']?.toString().toLowerCase() ?? 'draft';
        if (status == 'draft') {
          draftCount++;
        }
        final visibility = raw['visibility']?.toString().toLowerCase();
        final updatedAt = _parseDateTime(raw['updated_at']);

        items.add(
          sample.StudentNoteItem(
            id: id,
            title: title?.isNotEmpty == true ? title! : '未命名笔记',
            updatedAtLabel: _formatUpdatedLabel(updatedAt),
            preview: _buildPreview(content),
            tags: _buildNoteTags(status: status, visibility: visibility),
            pinned: status != 'draft' && visibility != 'private',
          ),
        );
      }

      return _NoteFetchResult(
        items: List.unmodifiable(items),
        draftCount: draftCount,
      );
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载学习笔记');
    }
  }

  Future<List<sample.StudentMessageItem>> _fetchMessages() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/conversations',
      );
      final data = _extractData(response.data, '未能获取消息列表');
      final rawList = _extractMapList(data, 'conversations');
      final currentAccountId = _account?.id;
      final records = <_MessageRecord>[];

      for (final raw in rawList) {
        final lastMessage = _asMap(raw['last_message']);
        final timestamp =
            _parseDateTime(lastMessage?['created_at']) ??
            _parseDateTime(raw['updated_at']) ??
            _parseDateTime(raw['created_at']);
        final unread = (raw['unread_count'] as num?)?.toInt() ?? 0;

        final item = sample.StudentMessageItem(
          sender: _resolveConversationTitle(raw, currentAccountId),
          preview: _resolveMessagePreview(lastMessage),
          timeLabel: _formatMessageTime(timestamp),
          category: _resolveMessageCategory(raw, currentAccountId),
          unreadCount: unread.clamp(0, 999),
        );

        records.add(_MessageRecord(item: item, timestamp: timestamp));
      }

      records.sort((a, b) {
        final left = a.timestamp?.millisecondsSinceEpoch ?? 0;
        final right = b.timestamp?.millisecondsSinceEpoch ?? 0;
        return right.compareTo(left);
      });

      return List.unmodifiable(records.map((record) => record.item));
    } on DioException catch (error) {
      if (error.response?.statusCode == 401) {
        return [];
      }
      throw _asAppException(error, '无法获取消息列表');
    }
  }

  Future<List<sample.StudentExamItem>> _fetchExams() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/student/exams',
        queryParameters: const {'limit': 10},
      );
      final data = _extractData(response.data, '未能获取考试信息');
      final rawList = _extractMapList(data, 'exams');
      final items = <sample.StudentExamItem>[];
      final now = _clock();

      for (final raw in rawList) {
        final id = raw['id']?.toString();
        if (id == null || id.isEmpty) {
          continue;
        }

        final startAt =
            _parseDateTime(raw['start_at']) ?? _parseDateTime(raw['due_at']);
        final endAt = _parseDateTime(raw['due_at']) ?? startAt;
        final status = (endAt ?? startAt)?.isBefore(now) == true
            ? sample.StudentExamStatus.completed
            : sample.StudentExamStatus.upcoming;

        items.add(
          sample.StudentExamItem(
            id: id,
            course: _sanitizeNonEmpty(raw['course_name']) ?? '课程考试',
            dateLabel: _formatExamDateLabel(startAt),
            timeRange: _formatTimeRange(startAt, endAt),
            location: _sanitizeNonEmpty(raw['location']) ?? '待定',
            status: status,
            countdownLabel: _formatCountdownLabel(startAt, status),
            seat: _sanitizeString(raw['seat']),
            scoreLabel: _buildScoreLabel(raw['score']),
            startAt: startAt,
            endAt: endAt,
          ),
        );
      }

      return List.unmodifiable(items);
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载考试安排');
    }
  }

  Future<List<sample.StudentScheduleItem>> _fetchSchedule() async {
    try {
      final now = _clock();
      // Calculate the start of the current week (Monday)
      final start = DateTime(
        now.year,
        now.month,
        now.day,
      ).subtract(Duration(days: now.weekday - 1));
      // Fetch 7 days (Monday to Sunday)
      final end = start.add(const Duration(days: 7));
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/student/schedule',
        queryParameters: {
          'from': start.toUtc().toIso8601String(),
          'to': end.toUtc().toIso8601String(),
        },
      );
      final data = _extractData(response.data, '未能获取课表');
      final rawList = _extractMapList(data, 'sessions');
      final items = <sample.StudentScheduleItem>[];

      for (final raw in rawList) {
        final course = _sanitizeNonEmpty(raw['course_name']) ?? '课程安排';
        final startsAt = _parseDateTime(raw['starts_at']);
        if (startsAt == null) {
          continue;
        }
        final endsAt =
            _parseDateTime(raw['ends_at']) ??
            startsAt.add(const Duration(hours: 1));

        items.add(
          sample.StudentScheduleItem(
            course: course,
            teacher: _sanitizeNonEmpty(raw['teacher_name']) ?? '授课教师',
            dayLabel: _formatDayLabel(startsAt),
            timeRange: _formatTimeRange(startsAt, endsAt),
            startTime: DateFormat.Hm().format(startsAt),
            location: _sanitizeNonEmpty(raw['location']) ?? '地点待定',
            type: _resolveScheduleType(course, raw['source']?.toString()),
            isOnline: _isOnlineLocation(raw['location']),
            slotId: raw['slot_id']?.toString().trim(),
            slotName: raw['slot_name']?.toString(),
            weekDay: _parseDateTime(raw['day'])?.weekday,
          ),
        );
      }

      return List.unmodifiable(items);
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载课表');
    }
  }

  Future<List<sample.StudentReminderItem>> _fetchCustomReminders() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/student/reminders',
      );
      final data = _extractData(response.data, '未能获取提醒列表');
      final rawList = _extractMapList(data, 'reminders');
      final items = <sample.StudentReminderItem>[];

      for (final raw in rawList) {
        final id = raw['id']?.toString();
        if (id == null || id.isEmpty) {
          continue;
        }

        items.add(
          sample.StudentReminderItem(
            id: id,
            title: _sanitizeNonEmpty(raw['title']) ?? '提醒事项',
            description: _sanitizeString(raw['description']) ?? '',
            timeLabel: _sanitizeNonEmpty(raw['time_label']) ?? '时间待定',
            icon: _resolveReminderIcon(raw['icon']?.toString()),
            priority: _parseReminderPriority(raw['priority']),
            route: _sanitizeString(raw['route']),
            isCompleted: raw['is_completed'] == true,
            isCustom: true,
          ),
        );
      }

      return List.unmodifiable(items);
    } on DioException catch (error) {
      throw _asAppException(error, '无法加载提醒列表');
    }
  }

  List<sample.StudentReminderItem> _buildReminders({
    required List<sample.StudentAssignmentItem> assignments,
    required List<sample.StudentExamItem> exams,
    required List<sample.StudentReminderItem> customReminders,
    required int drafts,
    required int unreadMessages,
  }) {
    final now = _clock();
    final reminders = <sample.StudentReminderItem>[];
    final seen = <String>{};

    void addReminder(sample.StudentReminderItem item) {
      if (seen.add(item.id)) {
        reminders.add(item);
      }
    }

    for (final assignment in assignments) {
      final dueAt = assignment.dueAt;
      if (assignment.status != sample.StudentAssignmentStatus.pending) {
        continue;
      }

      if (assignment.isOverdue) {
        addReminder(
          sample.StudentReminderItem(
            id: 'assign-overdue-${assignment.id}',
            title: '逾期作业：${assignment.title}',
            description: '${assignment.course} · ${assignment.teacher}',
            timeLabel: assignment.dueLabel,
            icon: Icons.warning_amber_outlined,
            priority: sample.StudentReminderPriority.high,
            route: '/student/assignments',
          ),
        );
        continue;
      }

      if (dueAt != null) {
        final diff = dueAt.difference(now);
        if (diff.inHours >= 0 && diff.inHours <= 48) {
          addReminder(
            sample.StudentReminderItem(
              id: 'assign-soon-${assignment.id}',
              title: '即将截止：${assignment.title}',
              description: '${assignment.course} · ${assignment.teacher}',
              timeLabel: assignment.dueLabel,
              icon: Icons.task_alt_outlined,
              priority: sample.StudentReminderPriority.high,
              route: '/student/assignments',
            ),
          );
        }
      }
    }

    sample.StudentExamItem? upcomingExam;
    for (final exam in exams) {
      if (exam.status == sample.StudentExamStatus.upcoming) {
        upcomingExam = exam;
        break;
      }
    }

    if (upcomingExam != null) {
      addReminder(
        sample.StudentReminderItem(
          id: 'exam-${upcomingExam.id}',
          title: '考试临近：${upcomingExam.course}',
          description:
              '时间：${upcomingExam.dateLabel} · ${upcomingExam.timeRange}',
          timeLabel: upcomingExam.countdownLabel,
          icon: Icons.timer_outlined,
          priority: sample.StudentReminderPriority.normal,
          route: '/student/exams',
        ),
      );
    }

    if (drafts > 0) {
      addReminder(
        sample.StudentReminderItem(
          id: 'note-drafts',
          title: '有 $drafts 篇笔记仍为草稿',
          description: '整理草稿并发布可方便同学查阅。',
          timeLabel: '建议今日完成整理',
          icon: Icons.edit_note_outlined,
          priority: drafts > 2
              ? sample.StudentReminderPriority.high
              : sample.StudentReminderPriority.normal,
          route: '/student/notes',
        ),
      );
    }

    if (unreadMessages > 0) {
      addReminder(
        sample.StudentReminderItem(
          id: 'unread-messages',
          title: '$unreadMessages 条未读消息',
          description: '及时回复老师和同学，保持沟通顺畅。',
          timeLabel: '最新消息待处理',
          icon: Icons.mark_email_unread_outlined,
          route: '/student/messages',
        ),
      );
    }

    for (final reminder in customReminders) {
      addReminder(reminder);
    }

    return List.unmodifiable(reminders);
  }

  List<sample.StudentInsightItem> _buildInsights({
    required int drafts,
    required List<sample.StudentAssignmentItem> assignments,
    required List<sample.StudentExamItem> exams,
  }) {
    final items = <sample.StudentInsightItem>[];

    // 1. Assignment Completion
    if (assignments.isNotEmpty) {
      final completed = assignments.where((a) {
        return a.status == sample.StudentAssignmentStatus.submitted ||
            a.status == sample.StudentAssignmentStatus.graded ||
            a.status == sample.StudentAssignmentStatus.returned;
      }).length;
      final progress = completed / assignments.length;
      final pending = assignments.length - completed;

      items.add(
        sample.StudentInsightItem(
          label: '作业完成度',
          value: '${(progress * 100).toInt()}%',
          progress: progress,
          hint: pending > 0 ? '还有 $pending 项作业待提交。' : '作业已全部完成，继续保持。',
          isAlert: pending > 3,
        ),
      );
    }

    // 2. Exam Reminder
    final upcomingExams = exams
        .where((e) => e.status == sample.StudentExamStatus.upcoming)
        .toList();
    if (upcomingExams.isNotEmpty) {
      upcomingExams.sort(
        (a, b) => (a.startAt ?? DateTime.now()).compareTo(
          b.startAt ?? DateTime.now(),
        ),
      );
      final nextExam = upcomingExams.first;
      final now = _clock();
      final diff = nextExam.startAt?.difference(now).inDays ?? 0;

      items.add(
        sample.StudentInsightItem(
          label: '考试提醒',
          value: '${nextExam.course} ${diff <= 0 ? "今天" : "$diff 天后"}',
          progress: diff <= 3 ? 0.8 : 0.4,
          hint: '建议制定复习计划，从容应对考试。',
          isAlert: diff <= 3,
        ),
      );
    }

    // 3. Notes
    if (drafts > 0) {
      items.add(
        sample.StudentInsightItem(
          label: '笔记活跃度',
          value: '草稿 $drafts 篇',
          progress: 0.45,
          hint: '整理草稿即可提升活跃度。',
          isAlert: drafts > 3,
        ),
      );
    }

    return items;
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
    throw AppException('响应数据格式异常');
  }

  List<Map<String, dynamic>> _extractMapList(
    Map<String, dynamic> source,
    String key,
  ) {
    final value = source[key];
    if (value is List) {
      return value.whereType<Map<String, dynamic>>().toList(growable: false);
    }
    return const [];
  }

  sample.StudentMessageCategory _resolveMessageCategory(
    Map<String, dynamic> raw,
    String? currentAccountId,
  ) {
    final type = raw['type']?.toString().toLowerCase();
    if (type == 'group') {
      return sample.StudentMessageCategory.campus;
    }

    final roles = _otherMemberRoles(raw, currentAccountId);
    if (roles.contains(AccountRole.teacher)) {
      return sample.StudentMessageCategory.teacher;
    }
    if (roles.contains(AccountRole.student)) {
      return sample.StudentMessageCategory.classmate;
    }
    if (roles.contains(AccountRole.admin)) {
      return sample.StudentMessageCategory.system;
    }
    return sample.StudentMessageCategory.system;
  }

  Set<AccountRole> _otherMemberRoles(
    Map<String, dynamic> raw,
    String? currentAccountId,
  ) {
    final members = _extractMemberList(raw);
    final roles = <AccountRole>{};
    for (final member in members) {
      final accountId = member['account_id']?.toString();
      if (currentAccountId != null && accountId == currentAccountId) {
        continue;
      }
      roles.add(_parseRole(member['role']));
    }
    return roles;
  }

  List<Map<String, dynamic>> _extractMemberList(Map<String, dynamic> raw) {
    final members = raw['members'];
    if (members is List) {
      return members.whereType<Map<String, dynamic>>().toList(growable: false);
    }
    return const [];
  }

  AccountRole _parseRole(dynamic roleValue) {
    final roleString = roleValue?.toString() ?? 'student';
    return AccountRoleLabel.fromApiValue(roleString);
  }

  String _resolveConversationTitle(
    Map<String, dynamic> raw,
    String? currentAccountId,
  ) {
    final type = raw['type']?.toString().toLowerCase();
    final otherRoles = _otherMemberRoles(raw, currentAccountId);
    if (type == 'group') {
      if (otherRoles.contains(AccountRole.teacher) &&
          otherRoles.contains(AccountRole.student)) {
        return '班级群聊';
      }
      if (otherRoles.contains(AccountRole.teacher)) {
        return '教师群聊';
      }
      if (otherRoles.contains(AccountRole.admin)) {
        return '系统通知群';
      }
      return '讨论群聊';
    }

    if (otherRoles.contains(AccountRole.teacher)) {
      return '与教师沟通';
    }
    if (otherRoles.contains(AccountRole.student)) {
      return '同学私聊';
    }
    if (otherRoles.contains(AccountRole.admin)) {
      return '系统通知';
    }
    final id = raw['id']?.toString() ?? '';
    return '会话 ${_shortId(id)}';
  }

  String _resolveMessagePreview(Map<String, dynamic>? lastMessage) {
    if (lastMessage == null) {
      return '暂无消息，开启新的对话吧';
    }
    final kind = lastMessage['kind']?.toString().toLowerCase();
    final text = lastMessage['text']?.toString().trim() ?? '';
    if (kind == 'text' && text.isNotEmpty) {
      return text.length > 48 ? '${text.substring(0, 48)}…' : text;
    }
    return switch (kind) {
      'image' => '[图片消息]',
      'video' => '[视频消息]',
      'audio' => '[语音消息]',
      _ => '[富媒体消息]',
    };
  }

  String _formatUpdatedLabel(DateTime? timestamp) {
    if (timestamp == null) {
      return '更新时间未知';
    }
    final now = _clock();
    final diff = now.difference(timestamp);
    if (diff.inMinutes < 1) {
      return '刚刚更新';
    }
    if (diff.inHours < 1) {
      return '更新于 ${diff.inMinutes} 分钟前';
    }
    if (diff.inDays == 0) {
      return '更新于 今天 ${DateFormat.Hm().format(timestamp)}';
    }
    if (diff.inDays == 1) {
      return '更新于 昨天 ${DateFormat.Hm().format(timestamp)}';
    }
    return '更新于 ${DateFormat('MM 月 dd 日 HH:mm').format(timestamp)}';
  }

  String _formatMessageTime(DateTime? timestamp) {
    if (timestamp == null) {
      return '刚刚';
    }
    final now = _clock();
    final diff = now.difference(timestamp);
    if (diff.inDays == 0) {
      return DateFormat.Hm().format(timestamp);
    }
    if (diff.inDays == 1) {
      return '昨天';
    }
    if (diff.inDays < 7) {
      return '${diff.inDays} 天前';
    }
    return DateFormat('MM/dd').format(timestamp);
  }

  DateTime? _parseDateTime(dynamic value) {
    if (value is DateTime) {
      return value.toLocal();
    }
    if (value is String && value.isNotEmpty) {
      return DateTime.tryParse(value)?.toLocal();
    }
    return null;
  }

  String _buildPreview(String? content) {
    final normalized = content?.replaceAll(RegExp(r'\s+'), ' ').trim() ?? '';
    if (normalized.isEmpty) {
      return '暂无内容，点击进入查看详情';
    }
    return normalized.length > 80
        ? '${normalized.substring(0, 80)}…'
        : normalized;
  }

  List<String> _buildNoteTags({required String status, String? visibility}) {
    final tags = <String>[];
    final visibilityLabel = switch (visibility) {
      'private' => '仅自己可见',
      'class' => '班级共享',
      'school' => '校园共享',
      _ => null,
    };
    if (visibilityLabel != null) {
      tags.add(visibilityLabel);
    }
    final statusLabel = switch (status) {
      'draft' => '草稿',
      'published' => '已发布',
      _ => null,
    };
    if (statusLabel != null) {
      tags.add(statusLabel);
    }
    return tags;
  }

  String _shortId(String id) {
    if (id.length <= 6) {
      return id;
    }
    return '${id.substring(0, 4)}…';
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

  Map<String, dynamic>? _asMap(dynamic value) {
    if (value is Map<String, dynamic>) {
      return value;
    }
    return null;
  }

  sample.StudentAssignmentStatus _parseAssignmentStatus(dynamic value) {
    final normalized = value?.toString().toLowerCase();
    return switch (normalized) {
      'submitted' => sample.StudentAssignmentStatus.submitted,
      'graded' || 'reviewed' => sample.StudentAssignmentStatus.graded,
      'returned' => sample.StudentAssignmentStatus.returned,
      _ => sample.StudentAssignmentStatus.pending,
    };
  }

  String _formatAssignmentDueLabel({
    required DateTime? dueAt,
    required sample.StudentAssignmentStatus status,
    required bool isOverdue,
  }) {
    final labelTime = dueAt != null
        ? DateFormat('MM 月 dd 日 HH:mm').format(dueAt)
        : '截止时间待定';
    if (isOverdue) {
      return '已逾期 · $labelTime';
    }
    return switch (status) {
      sample.StudentAssignmentStatus.submitted => '已提交 · $labelTime',
      sample.StudentAssignmentStatus.graded => '已批改 · $labelTime',
      _ => '截止 · $labelTime',
    };
  }

  int _guessAssignmentProgress({
    required sample.StudentAssignmentStatus status,
    required bool isOverdue,
  }) {
    return switch (status) {
      sample.StudentAssignmentStatus.graded => 100,
      sample.StudentAssignmentStatus.submitted => isOverdue ? 85 : 80,
      _ => isOverdue ? 30 : 55,
    };
  }

  String? _buildScoreLabel(dynamic score) {
    if (score == null) {
      return null;
    }
    final parsed = num.tryParse(score.toString());
    if (parsed == null) {
      final text = score.toString().trim();
      return text.isEmpty ? null : text;
    }
    if (parsed == parsed.roundToDouble()) {
      return '${parsed.toInt()} 分';
    }
    return '${parsed.toStringAsFixed(1)} 分';
  }

  String? _sanitizeNonEmpty(dynamic value) {
    final text = _sanitizeString(value);
    if (text == null || text.isEmpty) {
      return null;
    }
    return text;
  }

  String? _sanitizeString(dynamic value) {
    if (value == null) {
      return null;
    }
    final text = value.toString().trim();
    return text.isEmpty ? null : text;
  }

  String _formatExamDateLabel(DateTime? date) {
    if (date == null) {
      return '日期待定';
    }
    final now = _clock();
    final startOfToday = DateTime(now.year, now.month, now.day);
    final startOfDate = DateTime(date.year, date.month, date.day);
    final diffDays = startOfDate.difference(startOfToday).inDays;
    if (diffDays == 0) {
      return '今天 ${DateFormat.Hm().format(date)}';
    }
    if (diffDays == 1) {
      return '明天 ${DateFormat.Hm().format(date)}';
    }
    return DateFormat('MM 月 dd 日').format(date);
  }

  String _formatTimeRange(DateTime? start, DateTime? end) {
    if (start == null && end == null) {
      return '时间待定';
    }
    final startLabel = start != null ? DateFormat.Hm().format(start) : '待定';
    final endLabel = end != null ? DateFormat.Hm().format(end) : '结束待定';
    return '$startLabel - $endLabel';
  }

  String _formatCountdownLabel(
    DateTime? startAt,
    sample.StudentExamStatus status,
  ) {
    if (status == sample.StudentExamStatus.completed) {
      return '已结束';
    }
    if (startAt == null) {
      return '待通知';
    }
    final now = _clock();
    if (!startAt.isAfter(now)) {
      return '进行中';
    }
    final diff = startAt.difference(now);
    if (diff.inDays >= 1) {
      return '还有 ${diff.inDays} 天';
    }
    if (diff.inHours >= 1) {
      return '还有 ${diff.inHours} 小时';
    }
    final minutes = max(diff.inMinutes, 1);
    return '还有 $minutes 分钟';
  }

  String _formatDayLabel(DateTime time) {
    final now = _clock();
    final startOfToday = DateTime(now.year, now.month, now.day);
    final startOfTime = DateTime(time.year, time.month, time.day);
    final diff = startOfTime.difference(startOfToday).inDays;
    if (diff == 0) {
      return '今天';
    }
    if (diff == 1) {
      return '明天';
    }
    if (diff == 2) {
      return '后天';
    }
    const weekdays = ['一', '二', '三', '四', '五', '六', '日'];
    final weekdayLabel = weekdays[(time.weekday - 1).clamp(0, 6)];
    return '周$weekdayLabel';
  }

  sample.StudentScheduleType _resolveScheduleType(
    String course,
    String? source,
  ) {
    final normalizedCourse = course.toLowerCase();
    final normalizedSource = source?.toLowerCase() ?? '';
    if (normalizedCourse.contains('实验') || normalizedSource.contains('lab')) {
      return sample.StudentScheduleType.lab;
    }
    if (normalizedSource.contains('activity') ||
        normalizedCourse.contains('讲座')) {
      return sample.StudentScheduleType.activity;
    }
    if (normalizedSource.contains('elective') ||
        normalizedCourse.contains('选修')) {
      return sample.StudentScheduleType.elective;
    }
    return sample.StudentScheduleType.mandatory;
  }

  bool _isOnlineLocation(dynamic location) {
    final text = location?.toString().toLowerCase() ?? '';
    if (text.isEmpty) {
      return false;
    }
    return text.contains('online') ||
        text.contains('zoom') ||
        text.contains('腾讯会议') ||
        text.contains('线上');
  }

  IconData _resolveReminderIcon(String? value) {
    final normalized = value?.toLowerCase();
    return switch (normalized) {
      'assignment' => Icons.task_alt_outlined,
      'exam' => Icons.timer_outlined,
      'note' => Icons.edit_note_outlined,
      'message' => Icons.mark_email_unread_outlined,
      _ => Icons.alarm_on_outlined,
    };
  }

  sample.StudentReminderPriority _parseReminderPriority(dynamic value) {
    final normalized = value?.toString().toLowerCase();
    return normalized == 'high' || normalized == 'critical'
        ? sample.StudentReminderPriority.high
        : sample.StudentReminderPriority.normal;
  }
}

class FakeStudentRepository implements StudentRepository {
  const FakeStudentRepository();

  @override
  Future<StudentDashboardData> fetchDashboard() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return StudentDashboardData(
      reminders: sample.studentReminders,
      schedule: sample.studentScheduleItems,
      assignments: sample.studentAssignments,
      exams: sample.studentExams,
      notes: sample.studentNotes,
      messages: sample.studentMessages,
      quickLinks: sample.studentQuickLinks,
      insights: sample.studentInsights,
    );
  }

  @override
  Future<List<TimeSlot>> listTimeSlots() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return [];
  }

  @override
  Future<List<sample.StudentAssignmentItem>> listAssignments({
    String? courseId,
    int limit = 20,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return sample.studentAssignments.take(limit).toList(growable: false);
  }

  @override
  Future<List<CourseChapterSummary>> listCourseChapters(String courseId) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const [];
  }

  @override
  Future<CourseChapterDetail> getCourseChapter(
    String courseId,
    String chapterId,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const CourseChapterDetail(
      id: '',
      courseId: '',
      teacherId: '',
      title: '',
      content: '',
      orderIndex: 0,
      attachments: [],
    );
  }

  @override
  Future<List<Course>> listCourses() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return [];
  }

  @override
  Future<AssignmentDetail> getAssignmentDetail(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return AssignmentDetail(
      id: id,
      title: '模拟作业详情',
      description: '这是一个模拟的作业详情描述。',
      maxScore: 100.0,
      questions: [
        const AssignmentQuestion(
          id: 'q1',
          prompt: '1 + 1 = ?',
          type: QuestionType.singleChoice,
          score: 10.0,
          options: ['1', '2', '3', '4'],
          orderIndex: 0,
        ),
        const AssignmentQuestion(
          id: 'q2',
          prompt: '请简述 Flutter 的优势。',
          type: QuestionType.essay,
          score: 20.0,
          orderIndex: 1,
        ),
      ],
      dueAt: DateTime.now().add(const Duration(days: 1)),
    );
  }

  @override
  Future<SubmissionResult> submitAssignment(
    String id,
    Map<String, dynamic> answers,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return SubmissionResult(
      id: 'sub-mock',
      score: null,
      status: 'submitted',
      submittedAt: DateTime.now(),
    );
  }

  @override
  Future<ExplainQuestionResult> explainQuestion({
    required String title,
    required String prompt,
    required String questionType,
    List<String> options = const [],
  }) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return ExplainQuestionResult(
      analysis: '模拟题意解析：这道题主要考察你对题干信息的理解。',
      steps: ['模拟思路步骤 1', '模拟思路步骤 2'],
      keyPoints: ['模拟关键知识点 1', '模拟关键知识点 2'],
      pitfalls: ['模拟易错点 1', '模拟易错点 2'],
      checklist: ['模拟自查项 1', '模拟自查项 2'],
    );
  }

  @override
  Future<void> joinCourse(String code) async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }

  @override
  Future<StudentSubmissionDetail> getSubmissionDetail(
    String assignmentId,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    final assignment = await getAssignmentDetail(assignmentId);
    return StudentSubmissionDetail(
      assignment: assignment,
      submission: SubmissionResult(
        id: 'sub-mock',
        score: 85.0,
        status: 'graded',
        submittedAt: DateTime.now().subtract(const Duration(days: 1)),
        feedback: '做得不错，继续加油！',
      ),
      items: [
        const SubmissionItem(
          id: 'item1',
          questionId: 'q1',
          answer: '2',
          score: 10.0,
        ),
        const SubmissionItem(
          id: 'item2',
          questionId: 'q2',
          answer: 'Flutter 是 Google 开源的 UI 工具包...',
          score: 15.0,
        ),
      ],
    );
  }
}

final studentRepositoryProvider = Provider<StudentRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final auth = ref.watch(authStateProvider);
  return StudentApiRepository(dio: dio, account: auth.account);
});

class _NoteFetchResult {
  const _NoteFetchResult({required this.items, required this.draftCount});

  final List<sample.StudentNoteItem> items;
  final int draftCount;
}

class _MessageRecord {
  const _MessageRecord({required this.item, required this.timestamp});

  final sample.StudentMessageItem item;
  final DateTime? timestamp;
}
