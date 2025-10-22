import 'package:flutter/material.dart';

class TeacherScheduleItem {
  const TeacherScheduleItem({
    required this.course,
    required this.className,
    required this.dayLabel,
    required this.timeRange,
    required this.startTime,
    required this.location,
    this.isOnline = false,
    this.isKeyCourse = false,
  });

  final String course;
  final String className;
  final String dayLabel;
  final String timeRange;
  final String startTime;
  final String location;
  final bool isOnline;
  final bool isKeyCourse;

  bool matchesQuery(String query) {
    final lower = query.trim().toLowerCase();
    if (lower.isEmpty) {
      return true;
    }
    return course.toLowerCase().contains(lower) ||
        className.toLowerCase().contains(lower) ||
        dayLabel.toLowerCase().contains(lower) ||
        location.toLowerCase().contains(lower);
  }
}

enum TeacherTaskCategory { grading, schedule, preparation }

enum TeacherTaskStatus { pending, inProgress, completed }

class TeacherTaskItem {
  const TeacherTaskItem({
    required this.title,
    required this.subtitle,
    required this.deadlineLabel,
    required this.icon,
    required this.category,
    this.route,
    this.status = TeacherTaskStatus.pending,
  });

  final String title;
  final String subtitle;
  final String deadlineLabel;
  final IconData icon;
  final TeacherTaskCategory category;
  final String? route;
  final TeacherTaskStatus status;

  bool get isGrading => category == TeacherTaskCategory.grading;

  Color iconColor(ThemeData theme) {
    return switch (category) {
      TeacherTaskCategory.grading => theme.colorScheme.secondary,
      TeacherTaskCategory.schedule => theme.colorScheme.primary,
      TeacherTaskCategory.preparation => theme.colorScheme.tertiary,
    };
  }

  String get statusLabel {
    return switch (status) {
      TeacherTaskStatus.pending => '待处理',
      TeacherTaskStatus.inProgress => '处理中',
      TeacherTaskStatus.completed => '已完成',
    };
  }
}

class TeacherMessageItem {
  const TeacherMessageItem({
    required this.sender,
    required this.preview,
    required this.timeLabel,
    this.unreadCount = 0,
    this.tag,
  });

  final String sender;
  final String preview;
  final String timeLabel;
  final int unreadCount;
  final String? tag;

  String get initials {
    final trimmed = sender.trim();
    if (trimmed.isEmpty) {
      return '?';
    }
    final runes = trimmed.runes.toList();
    if (runes.isEmpty) {
      return '?';
    }
    final first = String.fromCharCode(runes.first);
    if (runes.length == 1) {
      return first;
    }
    final last = String.fromCharCode(runes.last);
    return '$first$last';
  }
}

class TeacherInsightItem {
  const TeacherInsightItem({
    required this.label,
    required this.value,
    required this.progress,
    required this.hint,
    required this.icon,
    this.isAlert = false,
  });

  final String label;
  final String value;
  final double progress;
  final String hint;
  final IconData icon;
  final bool isAlert;

  Color barColor(ThemeData theme) {
    return isAlert ? theme.colorScheme.error : theme.colorScheme.primary;
  }
}

class TeacherNoteItem {
  const TeacherNoteItem({
    required this.title,
    required this.updatedAt,
    required this.visibility,
    required this.wordCount,
    this.tag,
  });

  final String title;
  final String updatedAt;
  final String visibility;
  final int wordCount;
  final String? tag;

  bool matchesQuery(String query) {
    final lower = query.trim().toLowerCase();
    if (lower.isEmpty) {
      return true;
    }
    return title.toLowerCase().contains(lower) ||
        (tag?.toLowerCase().contains(lower) ?? false);
  }
}

class TeacherQuickLink {
  const TeacherQuickLink({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.route,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String route;
}

const List<TeacherScheduleItem> teacherScheduleItems = [
  TeacherScheduleItem(
    course: '线性代数（复习课）',
    className: '2023 级计科 1 班',
    dayLabel: '今天',
    timeRange: '08:00 - 09:30',
    startTime: '08:00',
    location: '教学楼 A-305',
    isKeyCourse: true,
  ),
  TeacherScheduleItem(
    course: '高等数学（习题课）',
    className: '2023 级计科 2 班',
    dayLabel: '今天',
    timeRange: '10:00 - 11:30',
    startTime: '10:00',
    location: '教学楼 A-402',
  ),
  TeacherScheduleItem(
    course: '学业辅导（答疑）',
    className: '线上会议',
    dayLabel: '今天',
    timeRange: '15:00 - 15:45',
    startTime: '15:00',
    location: '腾讯会议 839-xxxx-321',
    isOnline: true,
  ),
  TeacherScheduleItem(
    course: '线性代数（课堂讲授）',
    className: '2023 级计科 3 班',
    dayLabel: '明天',
    timeRange: '09:50 - 11:20',
    startTime: '09:50',
    location: '教学楼 B-210',
  ),
  TeacherScheduleItem(
    course: '课程组集体备课',
    className: '教研室',
    dayLabel: '周五',
    timeRange: '14:00 - 16:00',
    startTime: '14:00',
    location: '办公室 5 楼会议室',
  ),
  TeacherScheduleItem(
    course: '线上家长沟通会',
    className: '家校沟通',
    dayLabel: '周六',
    timeRange: '19:30 - 20:30',
    startTime: '19:30',
    location: '腾讯会议 889-xxxx-210',
    isOnline: true,
  ),
];

final List<TeacherScheduleItem> teacherTodaySchedule = teacherScheduleItems
    .where((item) => item.dayLabel == '今天')
    .toList(growable: false);

const List<TeacherTaskItem> teacherPendingTasks = [
  TeacherTaskItem(
    title: '批改离散数学课堂测验',
    subtitle: '32 份提交待批改',
    deadlineLabel: '截止：今日 18:00',
    icon: Icons.fact_check_outlined,
    category: TeacherTaskCategory.grading,
    route: '/teacher/assignments',
  ),
  TeacherTaskItem(
    title: '确认课表调课申请',
    subtitle: '教务处已发起申请，需要在今日确认',
    deadlineLabel: '截止：今日 20:00',
    icon: Icons.calendar_month_outlined,
    category: TeacherTaskCategory.schedule,
    route: '/teacher/schedule',
    status: TeacherTaskStatus.inProgress,
  ),
  TeacherTaskItem(
    title: '准备周五课程资料',
    subtitle: '更新课堂案例与 PPT，提前发送给学生',
    deadlineLabel: '截止：周四 18:00',
    icon: Icons.upload_file_outlined,
    category: TeacherTaskCategory.preparation,
  ),
  TeacherTaskItem(
    title: '统计课堂反馈结果',
    subtitle: '完成课堂教学反馈表的统计与汇总',
    deadlineLabel: '截止：周五 12:00',
    icon: Icons.analytics_outlined,
    category: TeacherTaskCategory.preparation,
  ),
];

const List<TeacherMessageItem> teacherRecentMessages = [
  TeacherMessageItem(
    sender: '李同学',
    preview: '老师，离散数学的作业提交后能看到批改意见吗？',
    timeLabel: '12:30',
    unreadCount: 2,
    tag: '学生',
  ),
  TeacherMessageItem(
    sender: '王家长',
    preview: '想了解一下这周的课堂表现，方便电话沟通吗？',
    timeLabel: '09:15',
    unreadCount: 1,
    tag: '家长',
  ),
  TeacherMessageItem(
    sender: '教务处',
    preview: '新的课程资源模板已发布，请在周三前完成更新。',
    timeLabel: '昨天',
    tag: '校务',
  ),
  TeacherMessageItem(
    sender: '教学秘书',
    preview: '请在本周完成课程小结，系统已开放填报。',
    timeLabel: '昨天',
    tag: '校务',
  ),
];

const List<TeacherInsightItem> teacherInsights = [
  TeacherInsightItem(
    label: '作业批改完成率',
    value: '68%',
    progress: 0.68,
    hint: '还有 12 份作业待批改，建议优先处理。',
    icon: Icons.fact_check_outlined,
  ),
  TeacherInsightItem(
    label: '课堂反馈回复',
    value: '15 条',
    progress: 0.45,
    hint: '本周收到 15 条课堂反馈，建议安排时间逐条回应。',
    icon: Icons.record_voice_over_outlined,
    isAlert: true,
  ),
  TeacherInsightItem(
    label: '学生出勤预警',
    value: '2 人',
    progress: 0.8,
    hint: '两位学生连续缺勤 2 次，建议与辅导员沟通。',
    icon: Icons.warning_amber_outlined,
    isAlert: true,
  ),
];

const List<TeacherNoteItem> teacherNotes = [
  TeacherNoteItem(
    title: '第 6 章 线性方程组教学设计',
    updatedAt: '更新于 昨日 21:30',
    visibility: '仅自己可见',
    wordCount: 1240,
    tag: '教案',
  ),
  TeacherNoteItem(
    title: '课堂案例：线性相关判定',
    updatedAt: '更新于 今日 09:10',
    visibility: '对学生公开',
    wordCount: 860,
    tag: '课堂资料',
  ),
  TeacherNoteItem(
    title: '课堂反馈汇总（第 8 周）',
    updatedAt: '更新于 本周一',
    visibility: '校内共享',
    wordCount: 540,
    tag: '反馈',
  ),
];

const List<TeacherQuickLink> teacherQuickLinks = [
  TeacherQuickLink(
    icon: Icons.assignment_outlined,
    title: '布置作业',
    subtitle: '选择班级并发布新的作业或考试',
    route: '/teacher/assignments',
  ),
  TeacherQuickLink(
    icon: Icons.playlist_add_check_outlined,
    title: '批改提交',
    subtitle: '查看学生提交记录并完成批改反馈',
    route: '/teacher/assignments',
  ),
  TeacherQuickLink(
    icon: Icons.event_available_outlined,
    title: '管理课程表',
    subtitle: '调整课程节次、审批调课请求',
    route: '/teacher/schedule',
  ),
  TeacherQuickLink(
    icon: Icons.chat_bubble_outline,
    title: '消息中心',
    subtitle: '快速回复学生与家长的咨询消息',
    route: '/teacher/conversations',
  ),
];
