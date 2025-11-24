import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_go/features/im/presentation/pages/conversation_list_screen.dart';
import 'package:learn_go/features/im/application/im_providers.dart';
import 'package:learn_go/features/auth/application/auth_controller.dart';
import 'package:intl/intl.dart';

import '../../domain/sample_data.dart';
import '../teacher_shell.dart';

class TeacherOverviewPage extends HookConsumerWidget {
  const TeacherOverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final schedule = teacherTodaySchedule;
    final tasks = teacherPendingTasks;
    // final messages = teacherRecentMessages;
    final insights = teacherInsights;
    final quickLinks = teacherQuickLinks;

    final conversationsAsync = ref.watch(conversationsProvider);
    final currentUserId = ref.watch(authStateProvider).account?.id ?? '';

    return ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('教学概览', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            '快速掌握今日教学安排与关键提醒。',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[700],
            ),
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
                onTap: () => context.go('/teacher/assignments'),
              ),
              conversationsAsync.when(
                data: (conversations) => _OverviewStatCard(
                  icon: Icons.mark_chat_unread_outlined,
                  label: '新消息',
                  value:
                      '${conversations.where((c) => c.unreadCount > 0).length} 会话',
                  color: theme.colorScheme.tertiary,
                  onTap: () => context.go(TeacherSection.conversations.path),
                ),
                loading: () => _OverviewStatCard(
                  icon: Icons.mark_chat_unread_outlined,
                  label: '新消息',
                  value: '...',
                  color: theme.colorScheme.tertiary,
                  onTap: () => context.go(TeacherSection.conversations.path),
                ),
                error: (_, __) => _OverviewStatCard(
                  icon: Icons.mark_chat_unread_outlined,
                  label: '新消息',
                  value: '-',
                  color: theme.colorScheme.tertiary,
                  onTap: () => context.go(TeacherSection.conversations.path),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _SectionCard(
            icon: Icons.apps_outlined,
            title: '快捷访问',
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                _QuickAccessItem(
                  icon: Icons.assignment_turned_in_outlined,
                  label: '作业考试',
                  onTap: () => context.go('/teacher/assignments'),
                ),
                _QuickAccessItem(
                  icon: Icons.note_alt_outlined,
                  label: '笔记',
                  onTap: () => context.go('/teacher/notes'),
                ),
              ],
            ),
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
                          backgroundColor: theme
                              .colorScheme
                              .surfaceContainerHighest
                              .withValues(alpha: 0.5),
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
                    isThreeLine: schedule[index].isOnline,
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
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          constraints: const BoxConstraints(maxWidth: 100),
                          child: Text(
                            schedule[index].location,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                          ),
                        ),
                        if (schedule[index].isOnline)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '线上',
                              style: theme.textTheme.labelSmall,
                            ),
                          ),
                      ],
                    ),
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
              onPressed: () => context.go('/teacher/assignments'),
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
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            tasks[index].statusLabel,
                            style: theme.textTheme.labelSmall,
                          ),
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
            child: conversationsAsync.when(
              data: (conversations) {
                if (conversations.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: Text('暂无新消息')),
                  );
                }
                final recent = conversations.take(3).toList();
                return Column(
                  children: [
                    for (var index = 0; index < recent.length; index++) ...[
                      ListTile(
                        onTap: () =>
                            context.push('/conversations/${recent[index].id}'),
                        leading: CircleAvatar(
                          backgroundColor: theme.colorScheme.secondaryContainer,
                          child: Text(
                            recent[index]
                                    .getDisplayName(currentUserId)
                                    .characters
                                    .firstOrNull ??
                                '?',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.onSecondaryContainer,
                            ),
                          ),
                        ),
                        title: Text(
                          recent[index].getDisplayName(currentUserId),
                        ),
                        subtitle: Text(recent[index].lastMessage?.text ?? ''),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              recent[index].lastMessage != null
                                  ? DateFormat('HH:mm').format(
                                      recent[index].lastMessage!.createdAt
                                          .toLocal(),
                                    )
                                  : '',
                              style: theme.textTheme.bodySmall,
                            ),
                            if (recent[index].unreadCount > 0)
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
                                  '${recent[index].unreadCount} 条未读',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: theme.colorScheme.onErrorContainer,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (index < recent.length - 1) const Divider(height: 12),
                    ],
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => const Center(child: Text('加载失败')),
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
      ),
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

    return ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('课程与课表', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            '查看本周教学安排，可快速筛选线上课程与重点课堂。',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[700],
            ),
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
                                    label: Text(
                                      '线上',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelSmall,
                                    ),
                                    backgroundColor: theme
                                        .colorScheme
                                        .surfaceContainerHighest,
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
      ),
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
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (task.route != null)
                      TextButton(
                        onPressed: () => context.go(task.route!),
                        child: const Text('前往处理'),
                      ),
                    Chip(
                      label: Text(
                        task.statusLabel,
                        style: theme.textTheme.labelSmall,
                      ),
                      backgroundColor:
                          theme.colorScheme.surfaceContainerHighest,
                      side: BorderSide.none,
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

class TeacherConversationsPage extends StatelessWidget {
  const TeacherConversationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConversationListWidget();
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
                          backgroundColor:
                              theme.colorScheme.surfaceContainerHighest,
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
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 220,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(height: 16),
              Text(
                value,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
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

class _QuickAccessItem extends StatelessWidget {
  const _QuickAccessItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: theme.colorScheme.primary),
          ),
          const SizedBox(height: 8),
          Text(label, style: theme.textTheme.labelMedium),
        ],
      ),
    );
  }
}

class TeacherGradingPage extends StatelessWidget {
  const TeacherGradingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('批改作业')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('离散数学课堂测验', style: theme.textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(
                    '截止时间：2025-11-23 18:00',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  const LinearProgressIndicator(value: 0.3),
                  const SizedBox(height: 8),
                  const Text('已批改 10 / 32'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('待批改列表', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          for (var i = 1; i <= 5; i++)
            Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(child: Text('S$i')),
                title: Text('学生 $i'),
                subtitle: const Text('提交时间：10:00'),
                trailing: FilledButton.tonal(
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('进入批改详情...')));
                  },
                  child: const Text('批改'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
