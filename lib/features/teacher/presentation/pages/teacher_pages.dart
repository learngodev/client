import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_go/features/im/presentation/pages/conversation_list_screen.dart';
import 'package:learn_go/features/im/application/im_providers.dart';
import 'package:learn_go/features/auth/application/auth_controller.dart';
import 'package:intl/intl.dart';

import '../../domain/teacher_schedule_model.dart';
import '../../domain/teacher_models.dart';
import '../../application/teacher_schedule_provider.dart';
import '../../application/teacher_assignment_provider.dart';
import '../../application/teacher_classes_provider.dart';
import '../teacher_shell.dart';

class TeacherOverviewPage extends HookConsumerWidget {
  const TeacherOverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final scheduleAsync = ref.watch(teacherScheduleProvider);
    final assignmentsAsync = ref.watch(teacherAssignmentsProvider);
    final classesAsync = ref.watch(teacherClassesProvider);
    // final messages = teacherRecentMessages;
    // final quickLinks = teacherQuickLinks;

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
              _ScheduleStatCard(
                scheduleAsync: scheduleAsync,
                onTap: () => context.go(TeacherSection.schedule.path),
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
                error: (_, _) => _OverviewStatCard(
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
            icon: Icons.class_outlined,
            title: '我的班级与课程',
            child: classesAsync.when(
              data: (classes) {
                if (classes.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: Text('暂无班级信息')),
                  );
                }
                return Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: classes.map((c) {
                    return Chip(
                      avatar: CircleAvatar(
                        backgroundColor: theme.colorScheme.primaryContainer,
                        child: Text(
                          c.name.isNotEmpty ? c.name.substring(0, 1) : '?',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      label: Text('${c.name} - ${c.courseName}'),
                    );
                  }).toList(),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('加载失败: $err')),
            ),
          ),
          const SizedBox(height: 24),
          _SectionCard(
            icon: Icons.schedule_outlined,
            title: '今日课表',
            child: scheduleAsync.when(
              data: (schedule) {
                final now = DateTime.now();
                final today = now.weekday;
                final todayClasses = schedule
                    .where((item) => item.weekDay == today)
                    .toList();
                todayClasses.sort((a, b) => a.startsAt.compareTo(b.startsAt));

                if (todayClasses.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: Text('今日无课')),
                  );
                }

                return Column(
                  children: [
                    for (
                      var index = 0;
                      index < todayClasses.length;
                      index++
                    ) ...[
                      ListTile(
                        isThreeLine: false,
                        leading: CircleAvatar(
                          backgroundColor: theme.colorScheme.primaryContainer,
                          child: Text(
                            todayClasses[index].startTimeStr,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                        title: Text(todayClasses[index].courseName),
                        subtitle: Text(
                          '${todayClasses[index].timeRange} · ${todayClasses[index].className}',
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              constraints: const BoxConstraints(maxWidth: 100),
                              child: Text(
                                todayClasses[index].location,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (index < todayClasses.length - 1)
                        const Divider(height: 12),
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
            icon: Icons.assignment_outlined,
            title: '作业情况',
            trailing: TextButton(
              onPressed: () => context.go(TeacherSection.assignments.path),
              child: const Text('全部作业'),
            ),
            child: assignmentsAsync.when(
              data: (assignments) {
                if (assignments.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: Text('暂无作业')),
                  );
                }
                final recent = assignments.take(3).toList();
                return Column(
                  children: [
                    for (var index = 0; index < recent.length; index++) ...[
                      _AssignmentItem(assignment: recent[index]),
                      if (index < recent.length - 1) const Divider(height: 24),
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
        ],
      ),
    );
  }
}

class TeacherSchedulePage extends HookConsumerWidget {
  const TeacherSchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final scheduleAsync = ref.watch(teacherScheduleProvider);
    final timeSlotsAsync = ref.watch(teacherTimeSlotsProvider);

    final weekDays = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];

    return ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('课程与课表', style: theme.textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              '查看本周教学安排。',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 24),
            scheduleAsync.when(
              data: (scheduleItems) => timeSlotsAsync.when(
                data: (timeSlots) {
                  final sortedSlots = List.of(timeSlots)
                    ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

                  return Card(
                    elevation: 0,
                    clipBehavior: Clip.antiAlias,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: WidgetStateProperty.all(
                          theme.colorScheme.surfaceContainerHighest.withValues(
                            alpha: 0.5,
                          ),
                        ),
                        dataRowMinHeight: 100,
                        dataRowMaxHeight: 140,
                        columnSpacing: 24,
                        columns: [
                          const DataColumn(label: Text('时间 / 节次')),
                          ...weekDays.map(
                            (day) => DataColumn(label: Text(day)),
                          ),
                        ],
                        rows: sortedSlots.map((slot) {
                          return DataRow(
                            cells: [
                              DataCell(
                                SizedBox(
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        slot.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        slot.timeRange,
                                        style: theme.textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ...List.generate(7, (index) {
                                final day = index + 1;
                                final item = scheduleItems
                                    .where(
                                      (item) =>
                                          item.weekDay == day &&
                                          item.slotId == slot.id,
                                    )
                                    .firstOrNull;

                                if (item == null) {
                                  return const DataCell(SizedBox(width: 140));
                                }

                                return DataCell(
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            _EditSessionDialog(session: item),
                                      );
                                    },
                                    child: Container(
                                      width: 140,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            item.courseName,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            '${item.className}\n${item.location}',
                                            style: theme.textTheme.bodySmall,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          if (item.isOnline)
                                            Container(
                                              margin: const EdgeInsets.only(
                                                top: 4,
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 6,
                                                    vertical: 2,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: theme
                                                    .colorScheme
                                                    .primaryContainer,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                '线上',
                                                style: theme
                                                    .textTheme
                                                    .labelSmall
                                                    ?.copyWith(
                                                      color: theme
                                                          .colorScheme
                                                          .onPrimaryContainer,
                                                      fontSize: 10,
                                                    ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, s) => Center(child: Text('加载时间表失败: $e')),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('加载失败: $err')),
            ),
          ],
        ),
      ),
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

class _ScheduleStatCard extends StatelessWidget {
  const _ScheduleStatCard({required this.scheduleAsync, required this.onTap});

  final AsyncValue<List<TeacherScheduleItem>> scheduleAsync;
  final VoidCallback onTap;

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
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.event_available_outlined,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(height: 16),
              scheduleAsync.when(
                data: (schedule) {
                  final now = DateTime.now();
                  final today = now.weekday;
                  final todayClasses = schedule
                      .where((item) => item.weekDay == today)
                      .toList();
                  todayClasses.sort((a, b) => a.startsAt.compareTo(b.startsAt));

                  final nextClass = todayClasses
                      .where((item) => item.endsAt.isAfter(now))
                      .firstOrNull;

                  if (todayClasses.isEmpty) {
                    return _buildContent(theme, '今日无课', '好好休息');
                  }

                  if (nextClass == null) {
                    return _buildContent(theme, '今日课程', '已全部结束');
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nextClass.courseName,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${nextClass.slotName} ${nextClass.timeRange}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  );
                },
                loading: () => _buildContent(theme, '加载中...', ''),
                error: (err, stack) => _buildContent(theme, '加载失败', ''),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(ThemeData theme, String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (subtitle.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}

class _AssignmentItem extends StatelessWidget {
  const _AssignmentItem({required this.assignment});
  final TeacherAssignment assignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pending = assignment.submissionCount - assignment.submittedCount;
    final dueText = assignment.dueAt != null
        ? DateFormat('MM-dd HH:mm').format(assignment.dueAt!)
        : '无截止时间';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                assignment.title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              dueText,
              style: theme.textTheme.bodySmall?.copyWith(
                color:
                    assignment.dueAt != null &&
                        assignment.dueAt!.isBefore(DateTime.now())
                    ? theme.colorScheme.error
                    : theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          '${assignment.courseName} · ${assignment.className}',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _StatBadge(label: '总人数', value: '${assignment.submissionCount}'),
            _StatBadge(
              label: '已交',
              value: '${assignment.submittedCount}',
              color: Colors.green,
            ),
            _StatBadge(label: '待交', value: '$pending', color: Colors.orange),
          ],
        ),
      ],
    );
  }
}

class _StatBadge extends StatelessWidget {
  const _StatBadge({required this.label, required this.value, this.color});

  final String label;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          '$label: ',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _EditSessionDialog extends HookConsumerWidget {
  const _EditSessionDialog({required this.session});

  final TeacherScheduleItem session;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationController = useTextEditingController(text: session.location);

    return AlertDialog(
      title: const Text('调整课程'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('课程: ${session.courseName}'),
          const SizedBox(height: 8),
          Text('班级: ${session.className}'),
          const SizedBox(height: 16),
          TextField(
            controller: locationController,
            decoration: const InputDecoration(labelText: '地点'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
        TextButton(
          onPressed: () async {
            await ref
                .read(teacherScheduleControllerProvider.notifier)
                .updateSession(
                  session.sessionId,
                  location: locationController.text,
                );
            if (context.mounted) Navigator.pop(context);
          },
          child: const Text('保存'),
        ),
      ],
    );
  }
}
