import 'package:flutter/material.dart';

import '../../domain/sample_data.dart' as student_data;

class StudentOverviewPage extends StatelessWidget {
  const StudentOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final reminders = student_data.studentReminders;
    final schedule = student_data.studentTodaySchedule;
    final pendingAssignments = student_data.studentPendingAssignments;
    final upcomingExams = student_data.studentUpcomingExams;
    final insights = student_data.studentInsights;
    final quickLinks = student_data.studentQuickLinks;
    final messages = student_data.studentMessages.take(3).toList();

    final stats = [
      _OverviewStat(
        icon: Icons.assignment_outlined,
        label: '待提交作业',
        value: '${pendingAssignments.length}',
        color: theme.colorScheme.primary,
        route: '/student/assignments',
      ),
      _OverviewStat(
        icon: Icons.event_available_outlined,
        label: '今日课时',
        value: '${schedule.length}',
        color: theme.colorScheme.secondary,
        route: '/student/schedule',
      ),
      _OverviewStat(
        icon: Icons.timer_outlined,
        label: '最近考试',
        value: upcomingExams.isEmpty
            ? '暂无'
            : upcomingExams.first.countdownLabel,
        color: theme.colorScheme.tertiary,
        route: '/student/exams',
      ),
    ];

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('学习概览', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: stats
              .map((stat) => _OverviewStatCard(stat: stat))
              .toList(growable: false),
        ),
        const SizedBox(height: 24),
        _SectionHeader(
          icon: Icons.flash_on_outlined,
          title: '今日提醒',
          description: '抓住重点任务，按时完成学习计划。',
        ),
        const SizedBox(height: 12),
        if (reminders.isEmpty)
          const _IllustratedPlaceholder(
            icon: Icons.check_circle_outline,
            title: '暂无待办事项',
            description: '保持良好节奏，继续加油。',
          )
        else
          ...reminders.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Card(
                elevation: 0,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: item
                        .badgeColor(theme)
                        .withValues(alpha: 0.18),
                    child: Icon(item.icon, color: item.badgeColor(theme)),
                  ),
                  title: Text(item.title),
                  subtitle: Text('${item.description}\n${item.timeLabel}'),
                  isThreeLine: true,
                  trailing: item.route == null
                      ? null
                      : Icon(
                          Icons.chevron_right,
                          color: theme.colorScheme.primary,
                        ),
                  onTap: item.route == null
                      ? null
                      : () => Navigator.of(context).pushNamed(item.route!),
                ),
              ),
            ),
          ),
        const SizedBox(height: 12),
        _ViewMoreButton(label: '查看全部作业', route: '/student/assignments'),
        const SizedBox(height: 24),
        _SectionHeader(
          icon: Icons.class_outlined,
          title: '今日课表',
          description: '合理安排时间，留意线上课程进入方式。',
        ),
        const SizedBox(height: 12),
        if (schedule.isEmpty)
          const _IllustratedPlaceholder(
            icon: Icons.event_busy_outlined,
            title: '今天没有课程',
            description: '可以利用时间复习或提前完成作业。',
          )
        else
          ...schedule.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ScheduleTile(item: item),
            ),
          ),
        const SizedBox(height: 12),
        _ViewMoreButton(label: '查看本周课表', route: '/student/schedule'),
        const SizedBox(height: 24),
        _SectionHeader(
          icon: Icons.fact_check_outlined,
          title: '作业进度',
          description: '掌握作业完成情况，避免遗漏与逾期。',
        ),
        const SizedBox(height: 12),
        ...pendingAssignments
            .take(3)
            .map(
              (assignment) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _AssignmentCard(assignment: assignment),
              ),
            ),
        if (pendingAssignments.length > 3)
          _ViewMoreButton(label: '查看更多作业', route: '/student/assignments'),
        const SizedBox(height: 24),
        _SectionHeader(
          icon: Icons.lightbulb_outline,
          title: '学习洞察',
          description: '关注数据反馈，调整学习节奏。',
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: insights
                  .map(
                    (insight) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _InsightTile(insight: insight),
                    ),
                  )
                  .toList(growable: false),
            ),
          ),
        ),
        const SizedBox(height: 24),
        _SectionHeader(
          icon: Icons.rocket_launch_outlined,
          title: '快捷入口',
          description: '常用模块一键直达，提升办事效率。',
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: quickLinks
              .map((link) => _QuickLinkCard(link: link))
              .toList(growable: false),
        ),
        const SizedBox(height: 24),
        _SectionHeader(
          icon: Icons.chat_bubble_outline,
          title: '近期消息',
          description: '查看老师和同学的最新通知与沟通。',
        ),
        const SizedBox(height: 12),
        ...messages.map(
          (message) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _MessageTile(message: message),
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}

class StudentSchedulePage extends StatelessWidget {
  const StudentSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final grouped = <String, List<student_data.StudentScheduleItem>>{};
    for (final item in student_data.studentScheduleItems) {
      grouped
          .putIfAbsent(
            item.dayLabel,
            () => <student_data.StudentScheduleItem>[],
          )
          .add(item);
    }

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('本周课表', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 12),
        ...grouped.entries.map(
          (entry) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.today_outlined,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(entry.key, style: theme.textTheme.titleMedium),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...entry.value.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _ScheduleTile(item: item),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '如需调整课程，请联系辅导员或教务老师。',
          style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(height: 36),
      ],
    );
  }
}

class StudentAssignmentsPage extends StatefulWidget {
  const StudentAssignmentsPage({super.key});

  @override
  State<StudentAssignmentsPage> createState() => _StudentAssignmentsPageState();
}

class _StudentAssignmentsPageState extends State<StudentAssignmentsPage> {
  student_data.StudentAssignmentStatus? _filter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final assignments = student_data.studentAssignments;
    final filtered = _filter == null
        ? assignments
        : assignments
              .where((item) => item.status == _filter)
              .toList(growable: false);

    final statusCounts = <student_data.StudentAssignmentStatus, int>{
      for (final status in student_data.StudentAssignmentStatus.values)
        status: assignments.where((item) => item.status == status).length,
    };

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('作业中心', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 12),
        Text(
          '掌握作业与实验进度，支持逾期补交和重新提交申请。',
          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 8,
          children: [
            ChoiceChip(
              label: const Text('全部'),
              selected: _filter == null,
              onSelected: (value) {
                if (value) {
                  setState(() => _filter = null);
                }
              },
            ),
            ...student_data.StudentAssignmentStatus.values.map(
              (status) => ChoiceChip(
                label: Text('${status.label} · ${statusCounts[status] ?? 0}'),
                selected: _filter == status,
                onSelected: (value) {
                  if (value) {
                    setState(() => _filter = status);
                  } else {
                    setState(() => _filter = null);
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (filtered.isEmpty)
          const _IllustratedPlaceholder(
            icon: Icons.inbox_outlined,
            title: '暂无匹配的作业',
            description: '可以切换筛选条件或查看历史记录。',
          )
        else
          ...filtered.map(
            (assignment) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _AssignmentCard(assignment: assignment),
            ),
          ),
        const SizedBox(height: 36),
      ],
    );
  }
}

class StudentExamsPage extends StatelessWidget {
  const StudentExamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final upcoming = student_data.studentUpcomingExams;
    final history = student_data.studentExamHistory;

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('考试安排', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 12),
        Text(
          '关注考试倒计时与考场安排，提前确认准考证与座位号。',
          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
        ),
        const SizedBox(height: 24),
        _SectionHeader(
          icon: Icons.alarm_on_outlined,
          title: '即将开始',
          description: '请在考前一日再次确认考试物品与行程。',
        ),
        const SizedBox(height: 12),
        if (upcoming.isEmpty)
          const _IllustratedPlaceholder(
            icon: Icons.sentiment_satisfied_alt_outlined,
            title: '暂无近期考试',
            description: '仍需保持复习节奏，巩固已学内容。',
          )
        else
          ...upcoming.map(
            (exam) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _ExamCard(exam: exam),
            ),
          ),
        const SizedBox(height: 24),
        _SectionHeader(
          icon: Icons.history_toggle_off,
          title: '历史记录',
          description: '查看已完成考试的成绩与通过情况。',
        ),
        const SizedBox(height: 12),
        if (history.isEmpty)
          const _IllustratedPlaceholder(
            icon: Icons.timelapse_outlined,
            title: '暂无历史考试',
            description: '完成首次考试后将自动记录成绩。',
          )
        else
          ...history.map(
            (exam) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ExamHistoryTile(exam: exam),
            ),
          ),
        const SizedBox(height: 36),
      ],
    );
  }
}

class StudentNotesPage extends StatefulWidget {
  const StudentNotesPage({super.key});

  @override
  State<StudentNotesPage> createState() => _StudentNotesPageState();
}

class _StudentNotesPageState extends State<StudentNotesPage> {
  final TextEditingController _queryController = TextEditingController();
  bool _onlyPinned = false;

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var notes = student_data.studentNotes.where(
      (note) => note.matches(_queryController.text),
    );
    if (_onlyPinned) {
      notes = notes.where((note) => note.pinned);
    }
    final filtered = notes.toList(growable: false)
      ..sort((a, b) {
        if (a.pinned == b.pinned) {
          return a.title.compareTo(b.title);
        }
        return a.pinned ? -1 : 1;
      });

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('随手笔记', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 12),
        Text(
          '整理课堂重点，支持快速检索与云端同步。',
          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _queryController,
          decoration: InputDecoration(
            labelText: '搜索笔记',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _queryController.text.isEmpty
                ? null
                : IconButton(
                    tooltip: '清除',
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() => _queryController.clear());
                    },
                  ),
          ),
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 12),
        SwitchListTile.adaptive(
          contentPadding: EdgeInsets.zero,
          title: const Text('仅查看置顶笔记'),
          value: _onlyPinned,
          onChanged: (value) => setState(() => _onlyPinned = value),
        ),
        const SizedBox(height: 12),
        if (filtered.isEmpty)
          const _IllustratedPlaceholder(
            icon: Icons.note_alt_outlined,
            title: '暂无符合条件的笔记',
            description: '可以尝试修改检索词或添加新笔记。',
          )
        else
          ...filtered.map(
            (note) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _NoteCard(note: note),
            ),
          ),
        const SizedBox(height: 36),
      ],
    );
  }
}

class StudentMessagesPage extends StatefulWidget {
  const StudentMessagesPage({super.key});

  @override
  State<StudentMessagesPage> createState() => _StudentMessagesPageState();
}

class _StudentMessagesPageState extends State<StudentMessagesPage> {
  student_data.StudentMessageCategory? _filter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final messages = student_data.studentMessages;
    final filtered = _filter == null
        ? messages
        : messages.where((item) => item.category == _filter).toList();

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('消息中心', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 12),
        Text(
          '关注老师通知与同学交流，及时处理系统提醒。',
          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          children: [
            ChoiceChip(
              label: const Text('全部'),
              selected: _filter == null,
              onSelected: (value) {
                if (value) {
                  setState(() => _filter = null);
                }
              },
            ),
            ...student_data.StudentMessageCategory.values.map(
              (category) => ChoiceChip(
                label: Text(category.label),
                avatar: Icon(category.icon, size: 18),
                selected: _filter == category,
                onSelected: (value) {
                  if (value) {
                    setState(() => _filter = category);
                  } else {
                    setState(() => _filter = null);
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (filtered.isEmpty)
          const _IllustratedPlaceholder(
            icon: Icons.mark_email_read_outlined,
            title: '暂无未读消息',
            description: '保持与老师和同学的沟通，学习更高效。',
          )
        else
          ...filtered.map(
            (message) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _MessageTile(message: message),
            ),
          ),
        const SizedBox(height: 36),
      ],
    );
  }
}

class _OverviewStat {
  const _OverviewStat({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.route,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final String route;
}

class _OverviewStatCard extends StatelessWidget {
  const _OverviewStatCard({required this.stat});

  final _OverviewStat stat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 220,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Navigator.of(context).pushNamed(stat.route),
        child: Ink(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: stat.color.withValues(alpha: 0.08),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(stat.icon, color: stat.color, size: 28),
              const SizedBox(height: 12),
              Text(
                stat.value,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: stat.color,
                ),
              ),
              const SizedBox(height: 8),
              Text(stat.label, style: theme.textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: theme.colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(
                description,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ScheduleTile extends StatelessWidget {
  const _ScheduleTile({required this.item});

  final student_data.StudentScheduleItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      tileColor: theme.colorScheme.surfaceContainerHighest.withValues(
        alpha: 0.2,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: CircleAvatar(
        backgroundColor: item.accentColor(theme).withValues(alpha: 0.18),
        child: Text(
          item.startTime,
          style: theme.textTheme.labelSmall?.copyWith(
            color: item.accentColor(theme),
          ),
        ),
      ),
      title: Text(item.course),
      subtitle: Text(
        '${item.timeRange} · ${item.location}\n${item.teacher} · ${item.type.label}${item.isOnline ? ' · 线上' : ''}',
      ),
      isThreeLine: true,
    );
  }
}

class _AssignmentCard extends StatelessWidget {
  const _AssignmentCard({required this.assignment});

  final student_data.StudentAssignmentItem assignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = assignment.statusColor(theme);

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: accent.withValues(alpha: 0.18),
                  child: Icon(assignment.statusIcon(), color: accent),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        assignment.title,
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${assignment.course} · ${assignment.teacher}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Chip(
                  label: Text(assignment.status.label),
                  backgroundColor: accent.withValues(alpha: 0.12),
                  labelStyle: TextStyle(color: accent),
                ),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: assignment.progressValue,
              backgroundColor: theme.colorScheme.surfaceContainerHighest
                  .withValues(alpha: 0.5),
              valueColor: AlwaysStoppedAnimation(accent),
              minHeight: 6,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  assignment.dueLabel,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: assignment.isOverdue
                        ? theme.colorScheme.error
                        : Colors.grey[600],
                  ),
                ),
                if (assignment.scoreLabel != null)
                  Text(
                    assignment.scoreLabel!,
                    style: theme.textTheme.bodyMedium?.copyWith(color: accent),
                  ),
              ],
            ),
            if (assignment.feedback != null) ...[
              const SizedBox(height: 8),
              Text(assignment.feedback!, style: theme.textTheme.bodySmall),
            ],
            if (assignment.allowResubmit) ...[
              const SizedBox(height: 8),
              Text(
                '允许重新提交',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _InsightTile extends StatelessWidget {
  const _InsightTile({required this.insight});

  final student_data.StudentInsightItem insight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(insight.label, style: theme.textTheme.titleSmall),
            Text(insight.value, style: theme.textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: insight.progress,
            backgroundColor: theme.colorScheme.surfaceContainerHighest
                .withValues(alpha: 0.5),
            valueColor: AlwaysStoppedAnimation(insight.barColor(theme)),
            minHeight: 8,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          insight.hint,
          style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
        ),
      ],
    );
  }
}

class _QuickLinkCard extends StatelessWidget {
  const _QuickLinkCard({required this.link});

  final student_data.StudentQuickLink link;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 280,
      child: Card(
        elevation: 0,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: theme.colorScheme.primaryContainer,
            child: Icon(link.icon, color: theme.colorScheme.onPrimaryContainer),
          ),
          title: Text(link.title),
          subtitle: Text(link.subtitle),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.of(context).pushNamed(link.route),
        ),
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  const _MessageTile({required this.message});

  final student_data.StudentMessageItem message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasUnread = message.unreadCount > 0;

    return Card(
      elevation: 0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.secondaryContainer,
          child: Text(
            message.initials,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSecondaryContainer,
            ),
          ),
        ),
        title: Text(message.sender),
        subtitle: Text(message.preview),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.timeLabel,
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            if (hasUnread)
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: theme.colorScheme.error,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  '${message.unreadCount}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onError,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ExamCard extends StatelessWidget {
  const _ExamCard({required this.exam});

  final student_data.StudentExamItem exam;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Icon(
                    Icons.timer_outlined,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(exam.course, style: theme.textTheme.titleMedium),
                      const SizedBox(height: 4),
                      Text(
                        '${exam.dateLabel} · ${exam.timeRange}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Chip(
                  label: Text(exam.countdownLabel),
                  backgroundColor: theme.colorScheme.primary.withValues(
                    alpha: 0.12,
                  ),
                  labelStyle: TextStyle(color: theme.colorScheme.primary),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text('考场：${exam.location}'),
            if (exam.seat != null) ...[
              const SizedBox(height: 4),
              Text('座位：${exam.seat}'),
            ],
            const SizedBox(height: 8),
            Text(
              '建议提前 30 分钟到场，携带学生证与考试用品。',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExamHistoryTile extends StatelessWidget {
  const _ExamHistoryTile({required this.exam});

  final student_data.StudentExamItem exam;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      child: ListTile(
        leading: const Icon(Icons.history_outlined),
        title: Text(exam.course),
        subtitle: Text('${exam.dateLabel} · ${exam.timeRange}'),
        trailing: exam.scoreLabel == null
            ? const Text('待公布')
            : Text(
                exam.scoreLabel!,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
      ),
    );
  }
}

class _NoteCard extends StatelessWidget {
  const _NoteCard({required this.note});

  final student_data.StudentNoteItem note;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(note.title, style: theme.textTheme.titleMedium),
                ),
                if (note.pinned)
                  Icon(
                    Icons.push_pin_outlined,
                    color: theme.colorScheme.tertiary,
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(note.preview, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(
                  label: Text(note.updatedAtLabel),
                  avatar: const Icon(Icons.update, size: 16),
                ),
                ...note.tags.map(
                  (tag) => Chip(
                    label: Text(tag),
                    backgroundColor: theme.colorScheme.secondary.withValues(
                      alpha: 0.12,
                    ),
                    labelStyle: TextStyle(color: theme.colorScheme.secondary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ViewMoreButton extends StatelessWidget {
  const _ViewMoreButton({required this.label, required this.route});

  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: () => Navigator.of(context).pushNamed(route),
        icon: const Icon(Icons.arrow_forward_outlined),
        label: Text(label),
      ),
    );
  }
}

class _IllustratedPlaceholder extends StatelessWidget {
  const _IllustratedPlaceholder({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 36, color: theme.colorScheme.primary),
          const SizedBox(height: 12),
          Text(title, style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            description,
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
