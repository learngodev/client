import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../domain/sample_data.dart';
import '../teacher_shell.dart';

class TeacherOverviewPage extends StatelessWidget {
  const TeacherOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final schedule = teacherTodaySchedule;
    final tasks = teacherPendingTasks;
    final messages = teacherRecentMessages;
    final insights = teacherInsights;
    final quickLinks = teacherQuickLinks;

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('教学概览', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          '快速掌握今日教学安排与关键提醒。',
          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _OverviewStatCard(
              icon: Icons.event_available_outlined,
              label: '今日课程',
              value: '${schedule.length} 节',
              color: theme.colorScheme.primary,
              onTap: () => context.go(TeacherSection.schedule.path),
            ),
            _OverviewStatCard(
              icon: Icons.assignment_turned_in_outlined,
              label: '待处理任务',
              value: '${tasks.length} 项',
              color: theme.colorScheme.secondary,
              onTap: () => context.go(TeacherSection.assignments.path),
            ),
            _OverviewStatCard(
              icon: Icons.mark_chat_unread_outlined,
              label: '新消息',
              value: '${messages.where((m) => m.unreadCount > 0).length} 会话',
              color: theme.colorScheme.tertiary,
              onTap: () => context.go(TeacherSection.conversations.path),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _SectionCard(
          icon: Icons.insights_outlined,
          title: '教学洞察',
          child: Column(
            children: [
              for (var index = 0; index < insights.length; index++) ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          insights[index].icon,
                          color: insights[index].barColor(theme),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                insights[index].label,
                                style: theme.textTheme.titleSmall,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                insights[index].hint,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          insights[index].value,
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: insights[index].progress,
                        backgroundColor: theme.colorScheme.surfaceVariant
                            .withOpacity(0.5),
                        valueColor: AlwaysStoppedAnimation(
                          insights[index].barColor(theme),
                        ),
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
                if (index < insights.length - 1) const Divider(height: 24),
              ],
            ],
          ),
        ),
        const SizedBox(height: 16),
        _SectionCard(
          icon: Icons.schedule_outlined,
          title: '今日课表',
          child: Column(
            children: [
              for (var index = 0; index < schedule.length; index++) ...[
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: theme.colorScheme.primaryContainer,
                    child: Text(
                      schedule[index].startTime,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  title: Text(schedule[index].course),
                  subtitle: Text(
                    '${schedule[index].timeRange} · ${schedule[index].className}',
                  ),
                  trailing: Text(schedule[index].location),
                ),
                if (index < schedule.length - 1) const Divider(height: 12),
              ],
            ],
          ),
        ),
        const SizedBox(height: 16),
        _SectionCard(
          icon: Icons.task_alt_outlined,
          title: '待处理事项',
          trailing: TextButton(
            onPressed: () => context.go(TeacherSection.assignments.path),
            child: const Text('查看全部'),
          ),
          child: Column(
            children: [
              for (var index = 0; index < tasks.length; index++) ...[
                ListTile(
                  leading: Icon(
                    tasks[index].icon,
                    color: tasks[index].iconColor(theme),
                  ),
                  title: Text(tasks[index].title),
                  subtitle: Text(tasks[index].subtitle),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        tasks[index].deadlineLabel,
                        style: theme.textTheme.labelMedium,
                      ),
                      const SizedBox(height: 4),
                      Chip(
                        label: Text(tasks[index].statusLabel),
                        backgroundColor: theme.colorScheme.surfaceVariant,
                        side: BorderSide.none,
                      ),
                    ],
                  ),
                ),
                if (index < tasks.length - 1) const Divider(height: 12),
              ],
            ],
          ),
        ),
        const SizedBox(height: 16),
        _SectionCard(
          icon: Icons.mark_chat_unread_outlined,
          title: '沟通提醒',
          trailing: TextButton(
            onPressed: () => context.go(TeacherSection.conversations.path),
            child: const Text('进入消息'),
          ),
          child: Column(
            children: [
              for (var index = 0; index < messages.length; index++) ...[
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: theme.colorScheme.secondaryContainer,
                    child: Text(
                      messages[index].initials,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                  title: Text(messages[index].sender),
                  subtitle: Text(messages[index].preview),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        messages[index].timeLabel,
                        style: theme.textTheme.bodySmall,
                      ),
                      if (messages[index].unreadCount > 0)
                        Container(
                          margin: const EdgeInsets.only(top: 6),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.errorContainer,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            '${messages[index].unreadCount} 条未读',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onErrorContainer,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                if (index < messages.length - 1) const Divider(height: 12),
              ],
            ],
          ),
        ),
        const SizedBox(height: 16),
        _SectionCard(
          icon: Icons.flash_on_outlined,
          title: '快捷入口',
          child: Column(
            children: [
              for (final link in quickLinks) ...[
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: theme.colorScheme.primaryContainer,
                    child: Icon(
                      link.icon,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  title: Text(link.title),
                  subtitle: Text(link.subtitle),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.go(link.route),
                ),
                if (quickLinks.last != link) const Divider(height: 12),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

enum _ScheduleFilter { all, keyCourse, online, offline }

enum _ScheduleSort { startTimeAscending, startTimeDescending }

class TeacherSchedulePage extends HookWidget {
  const TeacherSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filter = useState(_ScheduleFilter.all);
    final sort = useState(_ScheduleSort.startTimeAscending);
    final query = useState('');
    final controller = useTextEditingController();

    useEffect(() {
      controller.value = TextEditingValue(
        text: query.value,
        selection: TextSelection.collapsed(offset: query.value.length),
      );
      return null;
    }, [query.value]);

    final filtered = teacherScheduleItems.where((item) {
      final filterMatch = switch (filter.value) {
        _ScheduleFilter.all => true,
        _ScheduleFilter.keyCourse => item.isKeyCourse,
        _ScheduleFilter.online => item.isOnline,
        _ScheduleFilter.offline => !item.isOnline,
      };
      return filterMatch && item.matchesQuery(query.value);
    }).toList();

    filtered.sort((a, b) {
      final compare = a.startTime.compareTo(b.startTime);
      return sort.value == _ScheduleSort.startTimeAscending
          ? compare
          : -compare;
    });

    final grouped = <String, List<TeacherScheduleItem>>{};
    for (final item in filtered) {
      grouped.putIfAbsent(item.dayLabel, () => []).add(item);
    }

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('课程与课表', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          '查看本周教学安排，可快速筛选线上课程与重点课堂。',
          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: '搜索课程、班级或地点…',
              suffixIcon: query.value.isEmpty
                  ? null
                  : IconButton(
                      tooltip: '清除',
                      onPressed: () => query.value = '',
                      icon: const Icon(Icons.close),
                    ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            onChanged: (value) => query.value = value,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _ScheduleFilter.values
              .map(
                (value) => ChoiceChip(
                  label: Text(_scheduleFilterLabel(value)),
                  selected: filter.value == value,
                  onSelected: (selected) {
                    if (selected) {
                      filter.value = value;
                    }
                  },
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 12),
        DropdownButton<_ScheduleSort>(
          value: sort.value,
          items: _ScheduleSort.values
              .map(
                (value) => DropdownMenuItem(
                  value: value,
                  child: Text(_scheduleSortLabel(value)),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              sort.value = value;
            }
          },
        ),
        const SizedBox(height: 16),
        if (filtered.isEmpty)
          const _EmptyPlaceholder(
            icon: Icons.event_busy,
            title: '未找到匹配的课程',
            description: '调整筛选条件或清空搜索关键词后再试试。',
          )
        else
          ...grouped.entries.expand(
            (entry) => [
              _SectionCard(
                icon: Icons.calendar_today_outlined,
                title: entry.key,
                child: Column(
                  children: [
                    for (
                      var index = 0;
                      index < entry.value.length;
                      index++
                    ) ...[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: theme.colorScheme.primaryContainer,
                          child: Text(
                            entry.value[index].startTime,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                        title: Text(entry.value[index].course),
                        subtitle: Text(
                          '${entry.value[index].timeRange} · ${entry.value[index].className}',
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              entry.value[index].location,
                              style: theme.textTheme.labelMedium,
                            ),
                            if (entry.value[index].isOnline)
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Chip(
                                  label: const Text('线上'),
                                  backgroundColor:
                                      theme.colorScheme.surfaceVariant,
                                  side: BorderSide.none,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (index < entry.value.length - 1)
                        const Divider(height: 12),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
      ],
    );
  }
}

enum _TaskFilter { all, grading, schedule, preparation }

enum _TaskStatusFilter { all, pendingOnly }

class TeacherAssignmentsPage extends HookWidget {
  const TeacherAssignmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filter = useState(_TaskFilter.all);
    final statusFilter = useState(_TaskStatusFilter.pendingOnly);

    final filtered = teacherPendingTasks.where((task) {
      final typeMatch = switch (filter.value) {
        _TaskFilter.all => true,
        _TaskFilter.grading => task.category == TeacherTaskCategory.grading,
        _TaskFilter.schedule => task.category == TeacherTaskCategory.schedule,
        _TaskFilter.preparation =>
          task.category == TeacherTaskCategory.preparation,
      };
      final statusMatch = switch (statusFilter.value) {
        _TaskStatusFilter.all => true,
        _TaskStatusFilter.pendingOnly =>
          task.status != TeacherTaskStatus.completed,
      };
      return typeMatch && statusMatch;
    }).toList();

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('作业与考试', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          '集中处理布置、批改与调课任务，保持课堂节奏。',
          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _TaskFilter.values
              .map(
                (value) => ChoiceChip(
                  label: Text(_taskFilterLabel(value)),
                  selected: filter.value == value,
                  onSelected: (selected) {
                    if (selected) {
                      filter.value = value;
                    }
                  },
                ),
              )
              .toList(),
        ),
        SwitchListTile.adaptive(
          contentPadding: EdgeInsets.zero,
          title: const Text('仅显示待处理任务'),
          value: statusFilter.value == _TaskStatusFilter.pendingOnly,
          onChanged: (value) {
            statusFilter.value = value
                ? _TaskStatusFilter.pendingOnly
                : _TaskStatusFilter.all;
          },
        ),
        const SizedBox(height: 12),
        if (filtered.isEmpty)
          const _EmptyPlaceholder(
            icon: Icons.fact_check_outlined,
            title: '暂无待处理任务',
            description: '当前筛选条件下没有任务，稍后再来看看。',
          )
        else
          ...filtered.map(
            (task) => Card(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: Icon(
                  task.icon,
                  color: task.iconColor(theme),
                  size: 32,
                ),
                title: Text(task.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.subtitle),
                    const SizedBox(height: 4),
                    Text(
                      task.deadlineLabel,
                      style: theme.textTheme.labelMedium,
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Chip(
                      label: Text(task.statusLabel),
                      backgroundColor: theme.colorScheme.surfaceVariant,
                      side: BorderSide.none,
                    ),
                    if (task.route != null)
                      TextButton(
                        onPressed: () => context.go(task.route!),
                        child: const Text('前往处理'),
                      ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class TeacherConversationsPage extends HookWidget {
  const TeacherConversationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final query = useState('');
    final onlyUnread = useState(true);

    final filtered = teacherRecentMessages.where((message) {
      final matchesQuery =
          message.sender.toLowerCase().contains(query.value.toLowerCase()) ||
          message.preview.toLowerCase().contains(query.value.toLowerCase()) ||
          (message.tag?.toLowerCase().contains(query.value.toLowerCase()) ??
              false);
      final matchesUnread = !onlyUnread.value || message.unreadCount > 0;
      return matchesQuery && matchesUnread;
    }).toList();

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('消息与沟通', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          '及时回应学生和家长的反馈，保持沟通顺畅。',
          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: '搜索联系人、标签或内容…',
            border: const OutlineInputBorder(),
          ),
          onChanged: (value) => query.value = value,
        ),
        SwitchListTile.adaptive(
          contentPadding: EdgeInsets.zero,
          title: const Text('仅显示未读'),
          value: onlyUnread.value,
          onChanged: (value) => onlyUnread.value = value,
        ),
        const SizedBox(height: 12),
        if (filtered.isEmpty)
          const _EmptyPlaceholder(
            icon: Icons.chat_outlined,
            title: '暂无消息',
            description: '暂无符合条件的会话，稍后再来查看。',
          )
        else
          ...filtered.map(
            (message) => Card(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 12),
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
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(message.preview),
                    if (message.tag != null) ...[
                      const SizedBox(height: 4),
                      Chip(
                        label: Text(message.tag!),
                        backgroundColor: theme.colorScheme.surfaceVariant,
                        side: BorderSide.none,
                      ),
                    ],
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(message.timeLabel, style: theme.textTheme.labelSmall),
                    if (message.unreadCount > 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: theme.colorScheme.error,
                          child: Text(
                            message.unreadCount.toString(),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onError,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                onTap: () => context.go(TeacherSection.conversations.path),
              ),
            ),
          ),
      ],
    );
  }
}

enum _NoteVisibilityFilter { all, personal, public }

class TeacherNotesPage extends HookWidget {
  const TeacherNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final query = useState('');
    final filter = useState(_NoteVisibilityFilter.all);

    final filtered = teacherNotes.where((note) {
      final matchesQuery = note.matchesQuery(query.value);
      final matchesFilter = switch (filter.value) {
        _NoteVisibilityFilter.all => true,
        _NoteVisibilityFilter.personal => note.visibility.contains('自己'),
        _NoteVisibilityFilter.public => !note.visibility.contains('自己'),
      };
      return matchesQuery && matchesFilter;
    }).toList();

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('教学笔记', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          '整理授课大纲、课堂资料与反馈总结，随时回顾。',
          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: '搜索笔记标题或标签…',
            border: const OutlineInputBorder(),
          ),
          onChanged: (value) => query.value = value,
        ),
        const SizedBox(height: 12),
        DropdownButton<_NoteVisibilityFilter>(
          value: filter.value,
          items: _NoteVisibilityFilter.values
              .map(
                (value) => DropdownMenuItem(
                  value: value,
                  child: Text(_noteFilterLabel(value)),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              filter.value = value;
            }
          },
        ),
        const SizedBox(height: 12),
        if (filtered.isEmpty)
          const _EmptyPlaceholder(
            icon: Icons.sticky_note_2_outlined,
            title: '暂无笔记',
            description: '可以从课堂笔记或教学总结开始记录。',
          )
        else
          ...filtered.map(
            (note) => Card(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Icon(
                    Icons.description_outlined,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                title: Text(note.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(note.updatedAt),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Chip(
                          label: Text(note.visibility),
                          backgroundColor: theme.colorScheme.surfaceVariant,
                          side: BorderSide.none,
                        ),
                        const SizedBox(width: 8),
                        if (note.tag != null)
                          Chip(
                            label: Text(note.tag!),
                            backgroundColor:
                                theme.colorScheme.secondaryContainer,
                            side: BorderSide.none,
                          ),
                        const SizedBox(width: 8),
                        Text(
                          '${note.wordCount} 字',
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: IconButton(
                  tooltip: '编辑笔记',
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: () {},
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.icon,
    required this.title,
    required this.child,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final Widget child;
  final Widget? trailing;

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
                Icon(icon, color: theme.colorScheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(title, style: theme.textTheme.titleMedium),
                ),
                if (trailing != null) trailing!,
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class _OverviewStatCard extends StatelessWidget {
  const _OverviewStatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        width: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: theme.colorScheme.surfaceVariant.withOpacity(0.45),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 12),
            Text(
              value,
              style: theme.textTheme.headlineSmall?.copyWith(color: color),
            ),
            const SizedBox(height: 6),
            Text(label, style: theme.textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}

class _EmptyPlaceholder extends StatelessWidget {
  const _EmptyPlaceholder({
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            Icon(icon, size: 48, color: theme.colorScheme.outline),
            const SizedBox(height: 12),
            Text(title, style: theme.textTheme.titleMedium),
            const SizedBox(height: 6),
            Text(
              description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

String _scheduleFilterLabel(_ScheduleFilter value) {
  return switch (value) {
    _ScheduleFilter.all => '全部',
    _ScheduleFilter.keyCourse => '重点课程',
    _ScheduleFilter.online => '线上课程',
    _ScheduleFilter.offline => '线下课程',
  };
}

String _scheduleSortLabel(_ScheduleSort value) {
  return switch (value) {
    _ScheduleSort.startTimeAscending => '按开始时间升序',
    _ScheduleSort.startTimeDescending => '按开始时间降序',
  };
}

String _taskFilterLabel(_TaskFilter value) {
  return switch (value) {
    _TaskFilter.all => '全部',
    _TaskFilter.grading => '批改任务',
    _TaskFilter.schedule => '课表调度',
    _TaskFilter.preparation => '备课事项',
  };
}

String _noteFilterLabel(_NoteVisibilityFilter value) {
  return switch (value) {
    _NoteVisibilityFilter.all => '全部可见性',
    _NoteVisibilityFilter.personal => '仅自己可见',
    _NoteVisibilityFilter.public => '对外公开/共享',
  };
}
