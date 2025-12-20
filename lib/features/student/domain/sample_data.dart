import 'package:flutter/material.dart';

enum StudentScheduleType { mandatory, elective, lab, activity }

extension StudentScheduleTypeX on StudentScheduleType {
  String get label {
    return switch (this) {
      StudentScheduleType.mandatory => '必修课',
      StudentScheduleType.elective => '选修课',
      StudentScheduleType.lab => '实验课',
      StudentScheduleType.activity => '活动',
    };
  }
}

class StudentScheduleItem {
  const StudentScheduleItem({
    required this.course,
    required this.teacher,
    required this.dayLabel,
    required this.timeRange,
    required this.startTime,
    required this.location,
    required this.type,
    this.isOnline = false,
    this.slotId,
    this.slotName,
    this.weekDay,
  });

  final String course;
  final String teacher;
  final String dayLabel;
  final String timeRange;
  final String startTime;
  final String location;
  final StudentScheduleType type;
  final bool isOnline;
  final String? slotId;
  final String? slotName;
  final int? weekDay;

  bool matchesQuery(String query) {
    final normalized = query.trim().toLowerCase();
    if (normalized.isEmpty) {
      return true;
    }
    return course.toLowerCase().contains(normalized) ||
        teacher.toLowerCase().contains(normalized) ||
        dayLabel.toLowerCase().contains(normalized) ||
        location.toLowerCase().contains(normalized);
  }

  Color accentColor(ThemeData theme) {
    return switch (type) {
      StudentScheduleType.mandatory => theme.colorScheme.primary,
      StudentScheduleType.elective => theme.colorScheme.secondary,
      StudentScheduleType.lab => theme.colorScheme.tertiary,
      StudentScheduleType.activity => theme.colorScheme.error,
    };
  }
}

enum StudentReminderPriority { normal, high }

extension StudentReminderPriorityX on StudentReminderPriority {
  String get label {
    return switch (this) {
      StudentReminderPriority.normal => '普通',
      StudentReminderPriority.high => '重要',
    };
  }
}

class StudentReminderItem {
  const StudentReminderItem({
    required this.id,
    required this.title,
    required this.description,
    required this.timeLabel,
    required this.icon,
    this.priority = StudentReminderPriority.normal,
    this.route,
    this.isCompleted = false,
    this.isCustom = false,
  });

  final String id;
  final String title;
  final String description;
  final String timeLabel;
  final IconData icon;
  final StudentReminderPriority priority;
  final String? route;
  final bool isCompleted;
  final bool isCustom;

  Color badgeColor(ThemeData theme) {
    return priority == StudentReminderPriority.high
        ? theme.colorScheme.error
        : theme.colorScheme.primary;
  }

  bool matches(String query) {
    final normalized = query.trim().toLowerCase();
    if (normalized.isEmpty) {
      return true;
    }
    return title.toLowerCase().contains(normalized) ||
        description.toLowerCase().contains(normalized) ||
        timeLabel.toLowerCase().contains(normalized);
  }

  StudentReminderItem copyWith({
    String? id,
    String? title,
    String? description,
    String? timeLabel,
    IconData? icon,
    StudentReminderPriority? priority,
    String? route,
    bool? isCompleted,
    bool? isCustom,
  }) {
    return StudentReminderItem(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      timeLabel: timeLabel ?? this.timeLabel,
      icon: icon ?? this.icon,
      priority: priority ?? this.priority,
      route: route ?? this.route,
      isCompleted: isCompleted ?? this.isCompleted,
      isCustom: isCustom ?? this.isCustom,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'timeLabel': timeLabel,
      'iconCodePoint': icon.codePoint,
      'iconFontFamily': icon.fontFamily,
      'iconFontPackage': icon.fontPackage,
      'priority': priority.name,
      'route': route,
      'isCompleted': isCompleted,
      'isCustom': isCustom,
    };
  }

  factory StudentReminderItem.fromJson(Map<String, dynamic> json) {
    final priorityName = json['priority'] as String?;
    final priority = StudentReminderPriority.values.firstWhere(
      (value) => value.name == priorityName,
      orElse: () => StudentReminderPriority.normal,
    );
    final codePoint = json['iconCodePoint'] as int?;
    final fontFamily = json['iconFontFamily'] as String?;
    final fontPackage = json['iconFontPackage'] as String?;
    final icon = codePoint == null
        ? Icons.alarm_on_outlined
        : IconData(codePoint, fontFamily: fontFamily, fontPackage: fontPackage);

    return StudentReminderItem(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      timeLabel: json['timeLabel'] as String? ?? '',
      icon: icon,
      priority: priority,
      route: json['route'] as String?,
      isCompleted: json['isCompleted'] as bool? ?? false,
      isCustom: json['isCustom'] as bool? ?? false,
    );
  }

  bool get isHighPriority => priority == StudentReminderPriority.high;
}

enum StudentAssignmentStatus { pending, submitted, graded }

extension StudentAssignmentStatusX on StudentAssignmentStatus {
  String get label {
    return switch (this) {
      StudentAssignmentStatus.pending => '待提交',
      StudentAssignmentStatus.submitted => '已提交',
      StudentAssignmentStatus.graded => '已批改',
    };
  }
}

class StudentAssignmentItem {
  const StudentAssignmentItem({
    required this.id,
    required this.title,
    required this.course,
    required this.teacher,
    required this.dueLabel,
    required this.status,
    this.progress = 0,
    this.allowResubmit = false,
    this.isOverdue = false,
    this.scoreLabel,
    this.feedback,
    this.dueAt,
    this.startAt,
  });

  final String id;
  final String title;
  final String course;
  final String teacher;
  final String dueLabel;
  final StudentAssignmentStatus status;
  final int progress;
  final bool allowResubmit;
  final bool isOverdue;
  final String? scoreLabel;
  final String? feedback;
  final DateTime? dueAt;
  final DateTime? startAt;

  double get progressValue => (progress.clamp(0, 100)) / 100;

  Color statusColor(ThemeData theme) {
    if (isOverdue && status == StudentAssignmentStatus.pending) {
      return theme.colorScheme.error;
    }
    return switch (status) {
      StudentAssignmentStatus.pending => theme.colorScheme.primary,
      StudentAssignmentStatus.submitted => theme.colorScheme.secondary,
      StudentAssignmentStatus.graded => theme.colorScheme.tertiary,
    };
  }

  IconData statusIcon() {
    return switch (status) {
      StudentAssignmentStatus.pending => Icons.pending_actions_outlined,
      StudentAssignmentStatus.submitted => Icons.task_alt_outlined,
      StudentAssignmentStatus.graded => Icons.verified_outlined,
    };
  }

  StudentAssignmentItem copyWith({
    String? id,
    String? title,
    String? course,
    String? teacher,
    String? dueLabel,
    StudentAssignmentStatus? status,
    int? progress,
    bool? allowResubmit,
    bool? isOverdue,
    String? scoreLabel,
    String? feedback,
    DateTime? dueAt,
    DateTime? startAt,
  }) {
    return StudentAssignmentItem(
      id: id ?? this.id,
      title: title ?? this.title,
      course: course ?? this.course,
      teacher: teacher ?? this.teacher,
      dueLabel: dueLabel ?? this.dueLabel,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      allowResubmit: allowResubmit ?? this.allowResubmit,
      isOverdue: isOverdue ?? this.isOverdue,
      scoreLabel: scoreLabel ?? this.scoreLabel,
      feedback: feedback ?? this.feedback,
      dueAt: dueAt ?? this.dueAt,
      startAt: startAt ?? this.startAt,
    );
  }
}

enum StudentExamStatus { upcoming, completed }

extension StudentExamStatusX on StudentExamStatus {
  String get label {
    return switch (this) {
      StudentExamStatus.upcoming => '进行中',
      StudentExamStatus.completed => '已结束',
    };
  }
}

class StudentExamItem {
  const StudentExamItem({
    required this.id,
    required this.course,
    required this.dateLabel,
    required this.timeRange,
    required this.location,
    required this.status,
    required this.countdownLabel,
    this.seat,
    this.scoreLabel,
    this.startAt,
    this.endAt,
  });

  final String id;
  final String course;
  final String dateLabel;
  final String timeRange;
  final String location;
  final StudentExamStatus status;
  final String countdownLabel;
  final String? seat;
  final String? scoreLabel;
  final DateTime? startAt;
  final DateTime? endAt;

  bool get isUpcoming => status == StudentExamStatus.upcoming;
}

class StudentNoteItem {
  const StudentNoteItem({
    required this.id,
    required this.title,
    required this.updatedAtLabel,
    required this.preview,
    this.tags = const [],
    this.pinned = false,
  });

  final String id;
  final String title;
  final String updatedAtLabel;
  final String preview;
  final List<String> tags;
  final bool pinned;

  StudentNoteItem copyWith({
    String? id,
    String? title,
    String? updatedAtLabel,
    String? preview,
    List<String>? tags,
    bool? pinned,
  }) {
    return StudentNoteItem(
      id: id ?? this.id,
      title: title ?? this.title,
      updatedAtLabel: updatedAtLabel ?? this.updatedAtLabel,
      preview: preview ?? this.preview,
      tags: tags ?? this.tags,
      pinned: pinned ?? this.pinned,
    );
  }

  bool matches(String query) {
    final normalized = query.trim().toLowerCase();
    if (normalized.isEmpty) {
      return true;
    }
    final titleHit = title.toLowerCase().contains(normalized);
    final previewHit = preview.toLowerCase().contains(normalized);
    final tagHit = tags.any((tag) => tag.toLowerCase().contains(normalized));
    return titleHit || previewHit || tagHit;
  }
}

enum StudentMessageCategory { teacher, classmate, system, campus }

extension StudentMessageCategoryX on StudentMessageCategory {
  String get label {
    return switch (this) {
      StudentMessageCategory.teacher => '课程',
      StudentMessageCategory.classmate => '同学',
      StudentMessageCategory.system => '系统',
      StudentMessageCategory.campus => '校园',
    };
  }

  IconData get icon {
    return switch (this) {
      StudentMessageCategory.teacher => Icons.school_outlined,
      StudentMessageCategory.classmate => Icons.groups_outlined,
      StudentMessageCategory.system => Icons.notifications_active_outlined,
      StudentMessageCategory.campus => Icons.account_balance_outlined,
    };
  }
}

class StudentMessageItem {
  const StudentMessageItem({
    required this.sender,
    required this.preview,
    required this.timeLabel,
    required this.category,
    this.unreadCount = 0,
  });

  final String sender;
  final String preview;
  final String timeLabel;
  final StudentMessageCategory category;
  final int unreadCount;

  bool get isUnread => unreadCount > 0;

  StudentMessageItem copyWith({
    String? sender,
    String? preview,
    String? timeLabel,
    StudentMessageCategory? category,
    int? unreadCount,
  }) {
    return StudentMessageItem(
      sender: sender ?? this.sender,
      preview: preview ?? this.preview,
      timeLabel: timeLabel ?? this.timeLabel,
      category: category ?? this.category,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }

  String get initials {
    final trimmed = sender.trim();
    if (trimmed.isEmpty) {
      return '?';
    }

    // Check if it contains Chinese characters
    final isChinese = RegExp(r'[\u4e00-\u9fa5]').hasMatch(trimmed);

    if (isChinese) {
      if (trimmed.length <= 2) {
        return trimmed;
      }
      return trimmed.substring(trimmed.length - 2);
    }

    final parts = trimmed.split(RegExp(r'\s+'));
    if (parts.length == 1) {
      final name = parts[0];
      if (name.length <= 2) return name;
      return name.substring(0, 2).toUpperCase();
    }

    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }
}

class StudentInsightItem {
  const StudentInsightItem({
    required this.label,
    required this.value,
    required this.progress,
    required this.hint,
    this.isAlert = false,
  });

  final String label;
  final String value;
  final double progress;
  final String hint;
  final bool isAlert;

  Color barColor(ThemeData theme) {
    return isAlert ? theme.colorScheme.error : theme.colorScheme.primary;
  }
}

class StudentQuickLink {
  const StudentQuickLink({
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

const List<StudentScheduleItem> studentScheduleItems = [
  StudentScheduleItem(
    course: '高等数学（Ⅱ）',
    teacher: '李老师',
    dayLabel: '今天',
    timeRange: '08:00 - 09:40',
    startTime: '08:00',
    location: '教学楼 A-203',
    type: StudentScheduleType.mandatory,
  ),
  StudentScheduleItem(
    course: '大学英语讨论课',
    teacher: '外教 Emma',
    dayLabel: '今天',
    timeRange: '10:10 - 11:40',
    startTime: '10:10',
    location: '教学楼 C-108',
    type: StudentScheduleType.elective,
  ),
  StudentScheduleItem(
    course: '程序设计实践',
    teacher: '王老师',
    dayLabel: '今天',
    timeRange: '14:00 - 16:30',
    startTime: '14:00',
    location: '实验中心 3 楼 · 机房 302',
    type: StudentScheduleType.lab,
  ),
  StudentScheduleItem(
    course: '线性代数辅导',
    teacher: '助教 郑同学',
    dayLabel: '明天',
    timeRange: '09:00 - 10:30',
    startTime: '09:00',
    location: '腾讯会议 888-xxxx-233',
    type: StudentScheduleType.activity,
    isOnline: true,
  ),
  StudentScheduleItem(
    course: '大学物理实验',
    teacher: '陈老师',
    dayLabel: '周四',
    timeRange: '13:30 - 15:30',
    startTime: '13:30',
    location: '物理实验楼 B-205',
    type: StudentScheduleType.lab,
  ),
  StudentScheduleItem(
    course: '新生班会',
    teacher: '辅导员 王老师',
    dayLabel: '周五',
    timeRange: '19:00 - 20:00',
    startTime: '19:00',
    location: '学生活动中心 101',
    type: StudentScheduleType.activity,
  ),
];

final List<StudentScheduleItem> studentTodaySchedule = studentScheduleItems
    .where((item) => item.dayLabel == '今天')
    .toList(growable: false);

const List<StudentReminderItem> studentReminders = [
  StudentReminderItem(
    id: 'reminder-001',
    title: '提交《程序设计》实验报告',
    description: '完成调试日志与截图说明，需上传 PDF 文件。',
    timeLabel: '截止 今日 23:00',
    icon: Icons.code_off_outlined,
    priority: StudentReminderPriority.high,
    route: '/student/assignments',
  ),
  StudentReminderItem(
    id: 'reminder-002',
    title: '参加英语口语打卡',
    description: '完成本周第 3 次打卡，累计 5 次可获得额外加分。',
    timeLabel: '截止 明日 20:00',
    icon: Icons.record_voice_over_outlined,
    route: '/student/assignments',
  ),
  StudentReminderItem(
    id: 'reminder-003',
    title: '复习线性代数章节 4-5',
    description: '考试重点包含特征值与特征向量，建议整理笔记。',
    timeLabel: '建议 今日 完成',
    icon: Icons.menu_book_outlined,
  ),
];

const List<StudentAssignmentItem> studentAssignments = [
  StudentAssignmentItem(
    id: 'assign-001',
    title: '程序设计实践 · Lab 4',
    course: '程序设计基础',
    teacher: '王老师',
    dueLabel: '截止 今日 23:00',
    status: StudentAssignmentStatus.pending,
    progress: 40,
    allowResubmit: true,
  ),
  StudentAssignmentItem(
    id: 'assign-002',
    title: '英语演讲稿准备',
    course: '大学英语讨论课',
    teacher: '外教 Emma',
    dueLabel: '截止 明日 18:00',
    status: StudentAssignmentStatus.pending,
    progress: 20,
    allowResubmit: false,
  ),
  StudentAssignmentItem(
    id: 'assign-003',
    title: '线性代数作业（第 6 次）',
    course: '线性代数',
    teacher: '李老师',
    dueLabel: '已过期 · 昨日 18:00',
    status: StudentAssignmentStatus.pending,
    progress: 10,
    allowResubmit: true,
    isOverdue: true,
  ),
  StudentAssignmentItem(
    id: 'assign-004',
    title: '高等数学课后练习',
    course: '高等数学（Ⅱ）',
    teacher: '李老师',
    dueLabel: '已提交 · 待批改',
    status: StudentAssignmentStatus.submitted,
    progress: 100,
  ),
  StudentAssignmentItem(
    id: 'assign-005',
    title: '大学物理实验报告',
    course: '大学物理实验',
    teacher: '陈老师',
    dueLabel: '已批改 · 评分 92',
    status: StudentAssignmentStatus.graded,
    progress: 100,
    scoreLabel: '92 分',
    feedback: '实验记录完整，计算过程清晰，继续保持。',
  ),
];

final List<StudentAssignmentItem> studentPendingAssignments = studentAssignments
    .where((item) => item.status == StudentAssignmentStatus.pending)
    .toList(growable: false);

final List<StudentAssignmentItem> studentSubmittedAssignments =
    studentAssignments
        .where((item) => item.status == StudentAssignmentStatus.submitted)
        .toList(growable: false);

final List<StudentAssignmentItem> studentGradedAssignments = studentAssignments
    .where((item) => item.status == StudentAssignmentStatus.graded)
    .toList(growable: false);

const List<StudentExamItem> studentExams = [
  StudentExamItem(
    id: 'exam-001',
    course: '线性代数阶段测验',
    dateLabel: '11 月 10 日（周日）',
    timeRange: '09:00 - 10:30',
    location: '教学楼 B-301',
    status: StudentExamStatus.upcoming,
    countdownLabel: '4 天后',
    seat: '考场 12 · 座位 21',
  ),
  StudentExamItem(
    id: 'exam-002',
    course: '大学英语口语考核',
    dateLabel: '11 月 15 日（周五）',
    timeRange: '13:30 - 15:00',
    location: '语音室 2F',
    status: StudentExamStatus.upcoming,
    countdownLabel: '9 天后',
  ),
  StudentExamItem(
    id: 'exam-003',
    course: '大学物理实验考查',
    dateLabel: '10 月 30 日',
    timeRange: '09:30 - 11:00',
    location: '物理实验楼 B-205',
    status: StudentExamStatus.completed,
    countdownLabel: '已结束',
    scoreLabel: '通过',
  ),
  StudentExamItem(
    id: 'exam-004',
    course: '高等数学期中考试',
    dateLabel: '10 月 25 日',
    timeRange: '08:30 - 10:00',
    location: '教学楼 A-203',
    status: StudentExamStatus.completed,
    countdownLabel: '已结束',
    scoreLabel: '88 分',
  ),
];

final List<StudentExamItem> studentUpcomingExams = studentExams
    .where((item) => item.status == StudentExamStatus.upcoming)
    .toList(growable: false);

final List<StudentExamItem> studentExamHistory = studentExams
    .where((item) => item.status == StudentExamStatus.completed)
    .toList(growable: false);

const List<StudentNoteItem> studentNotes = [
  StudentNoteItem(
    id: 'note-001',
    title: '线性代数：特征值与特征向量',
    updatedAtLabel: '更新于 昨日 22:10',
    preview: '整理了重要定义与推导步骤，附带例题和常见陷阱。',
    tags: ['数学', '考试重点'],
    pinned: true,
  ),
  StudentNoteItem(
    id: 'note-002',
    title: '英语讨论课演讲提纲',
    updatedAtLabel: '更新于 今日 11:20',
    preview: '结合个人经历，准备 3 分钟的自我介绍与观点陈述。',
    tags: ['英语', '演讲'],
  ),
  StudentNoteItem(
    id: 'note-003',
    title: '程序设计实验踩坑记录',
    updatedAtLabel: '更新于 本周一',
    preview: '记录 Lab4 中遇到的编译错误及解决方法，便于复盘。',
    tags: ['编程', '实验'],
  ),
  StudentNoteItem(
    id: 'note-004',
    title: '大学物理实验安全要点',
    updatedAtLabel: '更新于 上周五',
    preview: '实验前准备、注意事项、实验后整理流程梳理。',
    tags: ['物理', '实验'],
  ),
];

const List<StudentMessageItem> studentMessages = [
  StudentMessageItem(
    sender: '王老师',
    preview: '记得本周五完成 Lab4 报告，如需延时请提前说明。',
    timeLabel: '13:05',
    category: StudentMessageCategory.teacher,
    unreadCount: 1,
  ),
  StudentMessageItem(
    sender: '班委 研习群',
    preview: '今晚 19:30 班会准时开始，请提前完成签到。',
    timeLabel: '11:42',
    category: StudentMessageCategory.campus,
  ),
  StudentMessageItem(
    sender: '李同学',
    preview: '线性代数作业第 3 题有点难，一起讨论下吗？',
    timeLabel: '昨天',
    category: StudentMessageCategory.classmate,
    unreadCount: 2,
  ),
  StudentMessageItem(
    sender: '学习中心助手',
    preview: '你有新的学习计划提醒：周四 20:00 线上答疑。',
    timeLabel: '昨天',
    category: StudentMessageCategory.system,
  ),
];

const List<StudentQuickLink> studentQuickLinks = [
  StudentQuickLink(
    icon: Icons.alarm_on_outlined,
    title: '今日提醒',
    subtitle: '查看高优先级任务与待办事项',
    route: '/student/reminders',
  ),
  StudentQuickLink(
    icon: Icons.task_alt_outlined,
    title: '查看作业进度',
    subtitle: '快速了解待提交与批改进度',
    route: '/student/assignments',
  ),
  StudentQuickLink(
    icon: Icons.event_available_outlined,
    title: '本周课表',
    subtitle: '按天查看课程安排与教室信息',
    route: '/student/schedule',
  ),
  StudentQuickLink(
    icon: Icons.timer_outlined,
    title: '考试倒计时',
    subtitle: '关注近期考试与准考证信息',
    route: '/student/exams',
  ),
  StudentQuickLink(
    icon: Icons.notes_outlined,
    title: '同步课堂笔记',
    subtitle: '整理课堂重点，随时查阅',
    route: '/student/notes',
  ),
];

const List<StudentInsightItem> studentInsights = [
  StudentInsightItem(
    label: '作业完成度',
    value: '72%',
    progress: 0.72,
    hint: '还有 2 项作业待提交，建议今天完成。',
  ),
  StudentInsightItem(
    label: '课程出勤率',
    value: '96%',
    progress: 0.96,
    hint: '保持良好出勤，继续加油。',
  ),
  StudentInsightItem(
    label: '考试复习提醒',
    value: '线代 4 天后',
    progress: 0.35,
    hint: '建议每天复习 1 小时，覆盖近两章内容。',
    isAlert: true,
  ),
];
