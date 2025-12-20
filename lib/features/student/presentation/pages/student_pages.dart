import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/student_dashboard_controller.dart';
import '../../domain/sample_data.dart' as student_data;
import '../../domain/student_repository.dart';
import '../../../im/presentation/pages/conversation_list_screen.dart';

typedef _DashboardBuilder = Widget Function(StudentDashboardData data);

mixin ReminderActionMixin<T extends ConsumerStatefulWidget>
    on ConsumerState<T> {
  bool _reminderActionInProgress = false;

  bool get reminderActionInProgress => _reminderActionInProgress;

  StudentDashboardController get dashboardController {
    return ref.read(studentDashboardProvider.notifier);
  }

  void showReminderSnack(String message, {bool error = false}) {
    if (!mounted) {
      return;
    }
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Theme.of(context).colorScheme.error : null,
      ),
    );
  }

  Future<bool> performReminderAction(Future<bool> Function() operation) async {
    if (!mounted || _reminderActionInProgress) {
      return false;
    }

    setState(() => _reminderActionInProgress = true);
    try {
      return await operation();
    } finally {
      if (mounted) {
        setState(() => _reminderActionInProgress = false);
      }
    }
  }
}

Widget _buildStudentDashboardPage(
  WidgetRef ref,
  AsyncValue<StudentDashboardData> dashboard,
  _DashboardBuilder builder,
) {
  final controller = ref.read(studentDashboardProvider.notifier);
  return dashboard.when(
    data: (data) {
      return RefreshIndicator(
        onRefresh: controller.refresh,
        child: ColoredBox(
          color: Theme.of(ref.context).scaffoldBackgroundColor,
          child: builder(data),
        ),
      );
    },
    loading: () => const Center(child: CircularProgressIndicator()),
    error: (error, stackTrace) =>
        _DashboardErrorView(onRetry: controller.refresh),
  );
}

class StudentOverviewPage extends ConsumerStatefulWidget {
  const StudentOverviewPage({super.key});

  @override
  ConsumerState<StudentOverviewPage> createState() =>
      _StudentOverviewPageState();
}

class _StudentOverviewPageState extends ConsumerState<StudentOverviewPage>
    with ReminderActionMixin<StudentOverviewPage> {
  Future<void> _confirmDeleteReminder(
    student_data.StudentReminderItem reminder,
  ) async {
    if (reminderActionInProgress) {
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除提醒'),
        content: Text('确定删除“${reminder.title}”吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('删除'),
          ),
        ],
      ),
    );

    if (!mounted || confirmed != true) {
      return;
    }

    final success = await performReminderAction(
      () => dashboardController.deleteReminder(reminder.id),
    );

    if (!mounted) {
      return;
    }

    if (success) {
      showReminderSnack('已删除提醒 "${reminder.title}"');
    } else {
      showReminderSnack('删除提醒失败，请稍后再试', error: true);
    }
  }

  Future<void> _openEditReminder(
    student_data.StudentReminderItem reminder,
  ) async {
    if (!reminder.isCustom || reminderActionInProgress) {
      return;
    }

    final result = await showModalBottomSheet<_ReminderFormData>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => _ReminderEditorSheet(
        initialData: _ReminderFormData(
          title: reminder.title,
          description: reminder.description,
          timeLabel: reminder.timeLabel,
          priority: reminder.priority,
          icon: reminder.icon,
          route: reminder.route,
        ),
        isEditing: true,
      ),
    );

    if (!mounted || result == null) {
      return;
    }

    final success = await performReminderAction(
      () => dashboardController.editCustomReminder(
        reminder.id,
        title: result.title,
        description: result.description,
        timeLabel: result.timeLabel,
        icon: result.icon,
        priority: result.priority,
        route: result.route,
      ),
    );

    if (!mounted) {
      return;
    }

    if (success) {
      showReminderSnack('已更新提醒 "${result.title}"');
    } else {
      showReminderSnack('更新提醒失败，请稍后再试', error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dashboard = ref.watch(studentDashboardProvider);

    return _buildStudentDashboardPage(ref, dashboard, (data) {
      final theme = Theme.of(context);
      final controller = dashboardController;
      final pendingReminders = data.pendingReminders;
      final completedReminders = data.completedReminders;
      final schedule = data.todaySchedule;
      final pendingAssignments = data.pendingAssignments;
      final insights = data.insights;
      // final quickLinks = data.quickLinks;
      final messages = data.messages;

      final stats = <_OverviewStat>[
        _OverviewStat(
          icon: Icons.flash_on_outlined,
          label: '待办提醒',
          value: '${pendingReminders.length}',
          color: theme.colorScheme.primary,
          route: '/student/reminders',
        ),
        _OverviewStat(
          icon: Icons.class_outlined,
          label: '今日课程',
          value: '${schedule.length}',
          color: theme.colorScheme.secondary,
          route: '/student/schedule',
        ),
        _OverviewStat(
          icon: Icons.fact_check_outlined,
          label: '待完成作业',
          value: '${pendingAssignments.length}',
          color: theme.colorScheme.tertiary,
          route: '/student/assignments',
        ),
      ];

      return ListView(
        padding: const EdgeInsets.all(24),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Text('学习概览', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [for (final stat in stats) _OverviewStatCard(stat: stat)],
          ),
          const SizedBox(height: 24),
          _SectionHeader(
            icon: Icons.apps_outlined,
            title: '快捷访问',
            description: '常用功能快速入口。',
          ),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              // On smaller screens (mobile), use 2 columns.
              // On larger screens (tablet/desktop), use 4 columns.
              final crossAxisCount = width < 600 ? 2 : 4;
              // Adjust aspect ratio to prevent items from being too tall or too short
              final childAspectRatio = width < 600 ? 1.5 : 1.0;

              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: childAspectRatio,
                children: [
                  _QuickAccessItem(
                    icon: Icons.assignment_outlined,
                    label: '作业',
                    onTap: () => context.go('/student/assignments'),
                  ),

                  _QuickAccessItem(
                    icon: Icons.notifications_outlined,
                    label: '提醒',
                    onTap: () => context.go('/student/reminders'),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),
          _SectionHeader(
            icon: Icons.flash_on_outlined,
            title: '今日提醒',
            description: '抓住重点任务，按时完成学习计划。',
          ),
          const SizedBox(height: 12),
          if (pendingReminders.isNotEmpty)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: reminderActionInProgress
                    ? null
                    : () async {
                        final success = await performReminderAction(
                          () => controller.markAllRemindersCompleted(),
                        );
                        if (!mounted) {
                          return;
                        }
                        if (success) {
                          showReminderSnack('已将全部提醒标记为完成');
                        } else {
                          showReminderSnack('批量标记失败，请稍后再试', error: true);
                        }
                      },
                icon: const Icon(Icons.done_all_outlined),
                label: Text('全部标记完成 (${pendingReminders.length})'),
              ),
            ),
          if (reminderActionInProgress) ...[
            const SizedBox(height: 4),
            const LinearProgressIndicator(),
          ],
          if (pendingReminders.isEmpty)
            const _IllustratedPlaceholder(
              icon: Icons.check_circle_outline,
              title: '暂无待办事项',
              description: '保持良好节奏，继续加油。',
            )
          else
            for (final item in pendingReminders.take(3))
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _ReminderCard(
                  reminder: item,
                  onToggleCompleted: () =>
                      controller.toggleReminderCompleted(item.id),
                  onNavigate: item.route == null
                      ? null
                      : () => context.go(item.route!),
                  onDelete: item.isCustom && !reminderActionInProgress
                      ? () => _confirmDeleteReminder(item)
                      : null,
                  onEdit: item.isCustom && !reminderActionInProgress
                      ? () => _openEditReminder(item)
                      : null,
                ),
              ),
          if (completedReminders.isNotEmpty) ...[
            const SizedBox(height: 8),
            _CompletedRemindersSection(
              reminders: completedReminders,
              onToggleCompleted: controller.toggleReminderCompleted,
              onDelete: (reminder) {
                if (reminder.isCustom && !reminderActionInProgress) {
                  _confirmDeleteReminder(reminder);
                }
              },
              onEdit: (reminder) {
                if (reminder.isCustom && !reminderActionInProgress) {
                  _openEditReminder(reminder);
                }
              },
            ),
          ],
          const SizedBox(height: 12),
          const _ViewMoreButton(label: '查看提醒中心', route: '/student/reminders'),
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
            for (final item in schedule.take(3))
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _ScheduleTile(item: item),
              ),
          const SizedBox(height: 12),
          const _ViewMoreButton(label: '查看本周课表', route: '/student/schedule'),
          const SizedBox(height: 24),
          _SectionHeader(
            icon: Icons.fact_check_outlined,
            title: '作业进度',
            description: '掌握作业完成情况，避免遗漏与逾期。',
          ),
          const SizedBox(height: 12),
          for (final assignment in pendingAssignments.take(3))
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _AssignmentCard(
                assignment: assignment,
                onTap: () {
                  if (assignment.status ==
                          student_data.StudentAssignmentStatus.graded ||
                      assignment.status ==
                          student_data.StudentAssignmentStatus.submitted) {
                    context.push(
                      '/student/assignments/${assignment.id}/result',
                    );
                  } else {
                    context.push('/student/assignments/${assignment.id}');
                  }
                },
                onUpdateProgress: (value) =>
                    controller.updateAssignmentProgress(assignment.id, value),
                onSubmit: () => controller.submitAssignment(assignment.id),
                onRequestResubmit: assignment.allowResubmit
                    ? () => controller.requestAssignmentResubmission(
                        assignment.id,
                      )
                    : null,
              ),
            ),
          if (pendingAssignments.length > 3)
            const _ViewMoreButton(
              label: '查看更多作业',
              route: '/student/assignments',
            ),
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
                children: [
                  for (var index = 0; index < insights.length; index++)
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: index == insights.length - 1 ? 0 : 16,
                      ),
                      child: _InsightTile(insight: insights[index]),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _SectionHeader(
            icon: Icons.chat_bubble_outline,
            title: '近期消息',
            description: '查看老师和同学的最新通知与沟通。',
          ),
          const SizedBox(height: 12),
          for (final message in messages.take(3))
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _MessageTile(
                message: message,
                onMarkRead: message.unreadCount > 0
                    ? () => controller.markMessageAsRead(message)
                    : null,
              ),
            ),
          const SizedBox(height: 48),
        ],
      );
    });
  }
}

class StudentRemindersPage extends ConsumerStatefulWidget {
  const StudentRemindersPage({super.key});

  @override
  ConsumerState<StudentRemindersPage> createState() =>
      _StudentRemindersPageState();
}

class _StudentRemindersPageState extends ConsumerState<StudentRemindersPage>
    with ReminderActionMixin<StudentRemindersPage> {
  final TextEditingController _queryController = TextEditingController();
  student_data.StudentReminderPriority? _priorityFilter;
  bool _showCompleted = true;

  Future<void> _openCreateReminderSheet(BuildContext context) async {
    if (reminderActionInProgress) {
      return;
    }
    final result = await showModalBottomSheet<_ReminderFormData>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => const _ReminderEditorSheet(),
    );

    if (!mounted || result == null) {
      return;
    }

    final notifier = ref.read(studentDashboardProvider.notifier);
    final success = await performReminderAction(
      () => notifier.createCustomReminder(
        title: result.title,
        description: result.description,
        timeLabel: result.timeLabel,
        icon: result.icon,
        priority: result.priority,
        route: result.route,
      ),
    );

    if (!mounted) {
      return;
    }

    if (success) {
      showReminderSnack('已添加提醒 "${result.title}"');
    } else {
      showReminderSnack('保存提醒失败，请稍后再试', error: true);
    }
  }

  Future<void> _openEditReminderSheet(
    BuildContext context,
    student_data.StudentReminderItem reminder,
  ) async {
    if (!reminder.isCustom) {
      return;
    }
    if (reminderActionInProgress) {
      return;
    }

    final result = await showModalBottomSheet<_ReminderFormData>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => _ReminderEditorSheet(
        initialData: _ReminderFormData(
          title: reminder.title,
          description: reminder.description,
          timeLabel: reminder.timeLabel,
          priority: reminder.priority,
          icon: reminder.icon,
          route: reminder.route,
        ),
        isEditing: true,
      ),
    );

    if (!mounted || result == null) {
      return;
    }

    final notifier = ref.read(studentDashboardProvider.notifier);
    final success = await performReminderAction(
      () => notifier.editCustomReminder(
        reminder.id,
        title: result.title,
        description: result.description,
        timeLabel: result.timeLabel,
        icon: result.icon,
        priority: result.priority,
        route: result.route,
      ),
    );

    if (!mounted) {
      return;
    }

    if (success) {
      showReminderSnack('已更新提醒 "${result.title}"');
    } else {
      showReminderSnack('更新提醒失败，请稍后再试', error: true);
    }
  }

  Future<void> _confirmDeleteReminder(
    BuildContext context,
    student_data.StudentReminderItem reminder,
  ) async {
    final controller = ref.read(studentDashboardProvider.notifier);
    if (reminderActionInProgress) {
      return;
    }
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除提醒'),
        content: Text('确定删除“${reminder.title}”吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('删除'),
          ),
        ],
      ),
    );

    if (!mounted) {
      return;
    }

    if (confirmed == true) {
      final success = await performReminderAction(
        () => controller.deleteReminder(reminder.id),
      );
      if (!mounted) {
        return;
      }
      if (success) {
        showReminderSnack('已删除提醒 "${reminder.title}"');
      } else {
        showReminderSnack('删除提醒失败，请稍后再试', error: true);
      }
    }
  }

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dashboard = ref.watch(studentDashboardProvider);

    return _buildStudentDashboardPage(ref, dashboard, (data) {
      final theme = Theme.of(context);
      final controller = ref.read(studentDashboardProvider.notifier);
      final query = _queryController.text;

      Iterable<student_data.StudentReminderItem> reminders = data.reminders;
      if (query.isNotEmpty) {
        reminders = reminders.where((item) => item.matches(query));
      }
      if (_priorityFilter != null) {
        reminders = reminders.where((item) => item.priority == _priorityFilter);
      }

      final pending = reminders
          .where((item) => !item.isCompleted)
          .toList(growable: false);
      final completed = reminders
          .where((item) => item.isCompleted)
          .toList(growable: false);

      final totalReminders = data.reminders.length;
      final totalPending = data.pendingReminders.length;
      final totalCompleted = data.completedReminders.length;
      final totalHighPriorityPending = data.pendingHighPriorityReminders.length;

      return ListView(
        padding: const EdgeInsets.all(24),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Text('提醒中心', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text(
            '集中管理学习待办与提醒，支持关键字筛选与批量标记完成。',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _queryController,
            decoration: InputDecoration(
              labelText: '搜索提醒',
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
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: [
              ChoiceChip(
                label: const Text('全部优先级'),
                selected: _priorityFilter == null,
                onSelected: (value) {
                  if (value) {
                    setState(() => _priorityFilter = null);
                  }
                },
              ),
              for (final priority
                  in student_data.StudentReminderPriority.values)
                ChoiceChip(
                  label: Text('${priority.label}优先'),
                  selected: _priorityFilter == priority,
                  onSelected: (value) {
                    setState(() {
                      _priorityFilter = value ? priority : null;
                    });
                  },
                ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(
                avatar: const Icon(Icons.list_alt_outlined, size: 18),
                label: Text('全部 $totalReminders'),
              ),
              Chip(
                avatar: const Icon(Icons.pending_actions_outlined, size: 18),
                label: Text('未完成 $totalPending'),
              ),
              Chip(
                avatar: const Icon(Icons.check_circle_outline, size: 18),
                label: Text('已完成 $totalCompleted'),
              ),
              Chip(
                avatar: const Icon(Icons.priority_high_outlined, size: 18),
                label: Text('重要待办 $totalHighPriorityPending'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            title: const Text('显示已完成提醒'),
            value: _showCompleted,
            onChanged: (value) => setState(() => _showCompleted = value),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton.icon(
              onPressed: reminderActionInProgress
                  ? null
                  : () => _openCreateReminderSheet(context),
              icon: const Icon(Icons.add),
              label: const Text('新建自定义提醒'),
            ),
          ),
          if (reminderActionInProgress) ...[
            const SizedBox(height: 4),
            const LinearProgressIndicator(),
          ],
          if (totalPending > 0) ...[
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: reminderActionInProgress
                    ? null
                    : () async {
                        final success = await performReminderAction(
                          () => controller.markAllRemindersCompleted(),
                        );
                        if (!mounted) {
                          return;
                        }
                        if (success) {
                          showReminderSnack('已将全部提醒标记为完成');
                        } else {
                          showReminderSnack('批量标记失败，请稍后再试', error: true);
                        }
                      },
                icon: const Icon(Icons.done_all_outlined),
                label: Text('全部标记完成 ($totalPending)'),
              ),
            ),
          ],
          const SizedBox(height: 16),
          if (pending.isEmpty)
            const _IllustratedPlaceholder(
              icon: Icons.alarm_off_outlined,
              title: '暂无符合条件的待办提醒',
              description: '可以尝试调整筛选条件或添加新的学习计划。',
            )
          else
            for (final reminder in pending)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _ReminderCard(
                  reminder: reminder,
                  onToggleCompleted: () =>
                      controller.toggleReminderCompleted(reminder.id),
                  onNavigate: reminder.route == null
                      ? null
                      : () => context.go(reminder.route!),
                  onDelete: reminder.isCustom && !reminderActionInProgress
                      ? () => _confirmDeleteReminder(context, reminder)
                      : null,
                  onEdit: reminder.isCustom && !reminderActionInProgress
                      ? () => _openEditReminderSheet(context, reminder)
                      : null,
                ),
              ),
          if (_showCompleted && completed.isNotEmpty) ...[
            const SizedBox(height: 12),
            _CompletedRemindersSection(
              reminders: completed,
              onToggleCompleted: controller.toggleReminderCompleted,
              onDelete: (reminder) {
                if (reminder.isCustom && !reminderActionInProgress) {
                  _confirmDeleteReminder(context, reminder);
                }
              },
              onEdit: (reminder) {
                if (reminder.isCustom && !reminderActionInProgress) {
                  _openEditReminderSheet(context, reminder);
                }
              },
            ),
          ],
          const SizedBox(height: 36),
        ],
      );
    });
  }
}

class StudentSchedulePage extends ConsumerWidget {
  const StudentSchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(studentDashboardProvider);
    final timeSlotsAsync = ref.watch(studentTimeSlotsProvider);

    return _buildStudentDashboardPage(ref, dashboard, (data) {
      final theme = Theme.of(context);
      final weekDays = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];

      return timeSlotsAsync.when(
        data: (timeSlots) {
          final sortedSlots = List.of(timeSlots)
            ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

          return ColoredBox(
            color: theme.scaffoldBackgroundColor,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('本周课表', style: theme.textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  Text(
                    '如需调整课程，请联系辅导员或教务老师。',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Card(
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
                                        '${slot.startTime} - ${slot.endTime}',
                                        style: theme.textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ...List.generate(7, (index) {
                                final day = index + 1;
                                final item = data.schedule
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
                                  Container(
                                    width: 140,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    child: Card(
                                      elevation: 0,
                                      color: item
                                          .accentColor(theme)
                                          .withValues(alpha: 0.1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                          color: item
                                              .accentColor(theme)
                                              .withValues(alpha: 0.2),
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          // TODO: Show details
                                        },
                                        borderRadius: BorderRadius.circular(8),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                item.course,
                                                style: theme
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: item.accentColor(
                                                        theme,
                                                      ),
                                                    ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.person_outline,
                                                    size: 14,
                                                    color: theme
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Expanded(
                                                    child: Text(
                                                      item.teacher,
                                                      style: theme
                                                          .textTheme
                                                          .bodySmall,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 2),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    size: 14,
                                                    color: theme
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Expanded(
                                                    child: Text(
                                                      item.location,
                                                      style: theme
                                                          .textTheme
                                                          .bodySmall,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
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
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('无法加载课表: $error')),
      );
    });
  }
}

class StudentAssignmentsPage extends ConsumerStatefulWidget {
  const StudentAssignmentsPage({super.key});

  @override
  ConsumerState<StudentAssignmentsPage> createState() =>
      _StudentAssignmentsPageState();
}

class _StudentAssignmentsPageState
    extends ConsumerState<StudentAssignmentsPage> {
  student_data.StudentAssignmentStatus? _filter;

  @override
  Widget build(BuildContext context) {
    final dashboard = ref.watch(studentDashboardProvider);
    final controller = ref.read(studentDashboardProvider.notifier);

    return _buildStudentDashboardPage(ref, dashboard, (data) {
      final theme = Theme.of(context);
      final assignments = data.assignments;
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
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Text('作业中心', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text(
            '掌握作业与实验进度，支持逾期补交和重新提交申请。',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[700],
            ),
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
              for (final status in student_data.StudentAssignmentStatus.values)
                ChoiceChip(
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
            for (final assignment in filtered)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _AssignmentCard(
                  assignment: assignment,
                  onTap: () {
                    if (assignment.status ==
                            student_data.StudentAssignmentStatus.graded ||
                        assignment.status ==
                            student_data.StudentAssignmentStatus.submitted) {
                      context.push(
                        '/student/assignments/${assignment.id}/result',
                      );
                    } else {
                      context.push('/student/assignments/${assignment.id}');
                    }
                  },
                  onUpdateProgress:
                      assignment.status ==
                          student_data.StudentAssignmentStatus.pending
                      ? (value) => controller.updateAssignmentProgress(
                          assignment.id,
                          value,
                        )
                      : null,
                  onSubmit:
                      assignment.status ==
                          student_data.StudentAssignmentStatus.pending
                      ? () => controller.submitAssignment(assignment.id)
                      : null,
                  onRequestResubmit:
                      assignment.allowResubmit &&
                          assignment.status !=
                              student_data.StudentAssignmentStatus.pending
                      ? () => controller.requestAssignmentResubmission(
                          assignment.id,
                        )
                      : null,
                ),
              ),
          const SizedBox(height: 36),
        ],
      );
    });
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
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go(stat.route),
        child: Container(
          width: 220,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: stat.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(stat.icon, color: stat.color, size: 24),
              ),
              const SizedBox(height: 16),
              Text(
                stat.value,
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                stat.label,
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

class _ReminderCard extends StatelessWidget {
  const _ReminderCard({
    required this.reminder,
    required this.onToggleCompleted,
    this.onNavigate,
    this.onDelete,
    this.onEdit,
  });

  final student_data.StudentReminderItem reminder;
  final VoidCallback onToggleCompleted;
  final VoidCallback? onNavigate;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final completed = reminder.isCompleted;
    final accent = reminder.badgeColor(theme);
    final description = reminder.description.trim();
    final subtitleText = description.isEmpty
        ? reminder.timeLabel
        : '$description\n${reminder.timeLabel}';
    final titleStyle = completed
        ? theme.textTheme.titleMedium?.copyWith(
            decoration: TextDecoration.lineThrough,
            color: Colors.grey[600],
          )
        : theme.textTheme.titleMedium;
    final subtitleStyle = theme.textTheme.bodySmall?.copyWith(
      color: completed ? Colors.grey[500] : Colors.grey[600],
      decoration: completed ? TextDecoration.lineThrough : null,
    );

    return Card(
      elevation: 0,
      color: completed
          ? theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3)
          : null,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: accent.withValues(alpha: 0.18),
          child: Icon(reminder.icon, color: accent),
        ),
        title: Text(reminder.title, style: titleStyle),
        subtitle: Text(subtitleText, style: subtitleStyle),
        isThreeLine: description.isNotEmpty,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox.adaptive(
              value: reminder.isCompleted,
              onChanged: (_) => onToggleCompleted(),
            ),
            if (reminder.isCustom && (onEdit != null || onDelete != null)) ...[
              const SizedBox(width: 4),
              if (onEdit != null)
                IconButton(
                  tooltip: '编辑提醒',
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: onEdit,
                ),
              if (onDelete != null)
                IconButton(
                  tooltip: '删除提醒',
                  icon: const Icon(Icons.delete_outline),
                  onPressed: onDelete,
                ),
            ],
          ],
        ),
        onTap: reminder.route != null ? onNavigate : () => onToggleCompleted(),
        onLongPress: onToggleCompleted,
      ),
    );
  }
}

class _CompletedRemindersSection extends StatelessWidget {
  const _CompletedRemindersSection({
    required this.reminders,
    required this.onToggleCompleted,
    this.onDelete,
    this.onEdit,
  });

  final List<student_data.StudentReminderItem> reminders;
  final void Function(String reminderId) onToggleCompleted;
  final void Function(student_data.StudentReminderItem reminder)? onDelete;
  final void Function(student_data.StudentReminderItem reminder)? onEdit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (reminders.isEmpty) {
      return const SizedBox.shrink();
    }

    return Card(
      elevation: 0,
      child: Theme(
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Icon(
            Icons.check_circle_outline,
            color: theme.colorScheme.primary,
          ),
          title: Text('已完成提醒 (${reminders.length})'),
          children: [
            for (final reminder in reminders)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: _ReminderCard(
                  reminder: reminder,
                  onToggleCompleted: () => onToggleCompleted(reminder.id),
                  onNavigate: reminder.route == null
                      ? null
                      : () => context.go(reminder.route!),
                  onDelete: onDelete == null ? null : () => onDelete!(reminder),
                  onEdit: onEdit == null ? null : () => onEdit!(reminder),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ReminderFormData {
  const _ReminderFormData({
    required this.title,
    required this.description,
    required this.timeLabel,
    required this.priority,
    required this.icon,
    this.route,
  });

  final String title;
  final String description;
  final String timeLabel;
  final student_data.StudentReminderPriority priority;
  final IconData icon;
  final String? route;
}

class _ReminderIconOption {
  const _ReminderIconOption(this.icon, this.label);

  final IconData icon;
  final String label;
}

const List<_ReminderIconOption> _reminderIconOptions = <_ReminderIconOption>[
  _ReminderIconOption(Icons.alarm_on_outlined, '默认'),
  _ReminderIconOption(Icons.task_alt_outlined, '作业'),
  _ReminderIconOption(Icons.menu_book_outlined, '复习'),
  _ReminderIconOption(Icons.lightbulb_outline, '想法'),
  _ReminderIconOption(Icons.event_available_outlined, '日程'),
  _ReminderIconOption(Icons.school_outlined, '课程'),
];

class _ReminderEditorSheet extends StatefulWidget {
  const _ReminderEditorSheet({this.initialData, this.isEditing = false});

  final _ReminderFormData? initialData;
  final bool isEditing;

  @override
  State<_ReminderEditorSheet> createState() => _ReminderEditorSheetState();
}

class _ReminderEditorSheetState extends State<_ReminderEditorSheet> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _timeLabelController = TextEditingController();
  final _routeController = TextEditingController();
  student_data.StudentReminderPriority _priority =
      student_data.StudentReminderPriority.normal;
  IconData _selectedIcon = _reminderIconOptions.first.icon;

  @override
  void initState() {
    super.initState();
    final initial = widget.initialData;
    if (initial != null) {
      _titleController.text = initial.title;
      _descriptionController.text = initial.description;
      _timeLabelController.text = initial.timeLabel;
      _routeController.text = initial.route ?? '';
      _priority = initial.priority;
      _selectedIcon = initial.icon;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _timeLabelController.dispose();
    _routeController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final trimmedRoute = _routeController.text.trim();

    Navigator.of(context).pop(
      _ReminderFormData(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        timeLabel: _timeLabelController.text.trim(),
        priority: _priority,
        icon: _selectedIcon,
        route: trimmedRoute.isEmpty ? null : trimmedRoute,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(24, 24, 24, 24 + bottomInset),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.isEditing ? '编辑提醒' : '新建自定义提醒',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  tooltip: '关闭',
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: '标题',
                hintText: '例如：提交实验报告',
              ),
              autofocus: true,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '请输入标题';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: '描述',
                hintText: '补充说明或提醒内容（可选）',
              ),
              minLines: 2,
              maxLines: 4,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _timeLabelController,
              decoration: const InputDecoration(
                labelText: '时间说明',
                hintText: '例如：截止 周五 18:00',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '请填写时间说明';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _routeController,
              decoration: const InputDecoration(
                labelText: '跳转路由（可选）',
                hintText: '例如：/student/assignments',
              ),
            ),
            const SizedBox(height: 16),
            Text('优先级', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                for (final priority
                    in student_data.StudentReminderPriority.values)
                  ChoiceChip(
                    label: Text(priority.label),
                    selected: _priority == priority,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _priority = priority);
                      }
                    },
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text('图标', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                for (final option in _reminderIconOptions)
                  ChoiceChip(
                    avatar: Icon(option.icon, size: 18),
                    label: Text(option.label),
                    selected: _selectedIcon == option.icon,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _selectedIcon = option.icon);
                      }
                    },
                  ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('取消'),
                ),
                const SizedBox(width: 12),
                FilledButton(
                  onPressed: _handleSubmit,
                  child: Text(widget.isEditing ? '更新' : '保存'),
                ),
              ],
            ),
          ],
        ),
      ),
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
  const _AssignmentCard({
    required this.assignment,
    this.onUpdateProgress,
    this.onSubmit,
    this.onRequestResubmit,
    this.onTap,
  });

  final student_data.StudentAssignmentItem assignment;
  final ValueChanged<int>? onUpdateProgress;
  final VoidCallback? onSubmit;
  final VoidCallback? onRequestResubmit;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = assignment.statusColor(theme);
    final isPending =
        assignment.status == student_data.StudentAssignmentStatus.pending;
    final showProgressSlider = onUpdateProgress != null && isPending;
    final showSubmit = onSubmit != null && isPending;
    final showResubmit =
        onRequestResubmit != null &&
        assignment.allowResubmit &&
        assignment.status != student_data.StudentAssignmentStatus.pending;

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
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
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: accent,
                      ),
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
              if (showProgressSlider) ...[
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Slider.adaptive(
                        value: assignment.progress.toDouble(),
                        min: 0,
                        max: 100,
                        divisions: 20,
                        label: '${assignment.progress}%',
                        onChanged: (value) => onUpdateProgress!(value.round()),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text('${assignment.progress}%'),
                  ],
                ),
              ],
              if (showSubmit || showResubmit) ...[
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    if (showSubmit)
                      FilledButton.icon(
                        onPressed: onSubmit,
                        icon: const Icon(Icons.cloud_upload_outlined),
                        label: const Text('提交作业'),
                      ),
                    if (showResubmit)
                      OutlinedButton.icon(
                        onPressed: onRequestResubmit,
                        icon: const Icon(Icons.refresh_outlined),
                        label: const Text('重新提交申请'),
                      ),
                  ],
                ),
              ],
            ],
          ),
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

class _MessageTile extends StatelessWidget {
  const _MessageTile({required this.message, this.onMarkRead});

  final student_data.StudentMessageItem message;
  final VoidCallback? onMarkRead;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasUnread = message.unreadCount > 0;

    return Card(
      elevation: 0,
      child: ListTile(
        onTap: hasUnread ? onMarkRead : null,
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
            if (hasUnread && onMarkRead != null) ...[
              const SizedBox(height: 4),
              TextButton(
                onPressed: onMarkRead,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text('标记已读'),
              ),
            ],
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

class _ViewMoreButton extends StatelessWidget {
  const _ViewMoreButton({required this.label, required this.route});

  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: () => context.go(route),
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
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withValues(
                  alpha: 0.3,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: theme.colorScheme.primary, size: 32),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentExamsPage extends ConsumerWidget {
  const StudentExamsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(studentDashboardProvider);

    return _buildStudentDashboardPage(ref, dashboard, (data) {
      final theme = Theme.of(context);
      final upcoming = data.upcomingExams;
      final history = data.examHistory;

      return ListView(
        padding: const EdgeInsets.all(24),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Text('考试安排', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text(
            '关注考试倒计时与考场安排，提前确认准考证与座位号。',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 24),
          _SectionHeader(
            icon: Icons.alarm_on_outlined,
            title: '即将开始',
            description: '请按时参加以下考试。',
          ),
          const SizedBox(height: 12),
          if (upcoming.isEmpty)
            const _IllustratedPlaceholder(
              icon: Icons.event_available_outlined,
              title: '暂无考试',
              description: '近期没有即将开始的考试安排。',
            )
          else
            for (final exam in upcoming)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _ExamCard(exam: exam),
              ),
          const SizedBox(height: 32),
          _SectionHeader(
            icon: Icons.history_outlined,
            title: '历史考试',
            description: '查看过往考试记录与成绩。',
          ),
          const SizedBox(height: 12),
          if (history.isEmpty)
            const _IllustratedPlaceholder(
              icon: Icons.history_toggle_off_outlined,
              title: '暂无记录',
              description: '完成首次考试后将自动记录成绩。',
            )
          else
            for (final exam in history)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _ExamHistoryTile(exam: exam),
              ),
          const SizedBox(height: 36),
        ],
      );
    });
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
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
          child: Icon(
            Icons.assignment_turned_in_outlined,
            color: Colors.grey[700],
          ),
        ),
        title: Text(exam.course),
        subtitle: Text(
          '${exam.dateLabel} ${exam.timeRange} · ${exam.location}',
        ),
        trailing: exam.scoreLabel != null
            ? Text(
                exam.scoreLabel!,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const Text('未出分'),
      ),
    );
  }
}

class StudentNotesPage extends ConsumerStatefulWidget {
  const StudentNotesPage({super.key});

  @override
  ConsumerState<StudentNotesPage> createState() => _StudentNotesPageState();
}

class _StudentNotesPageState extends ConsumerState<StudentNotesPage> {
  final TextEditingController _queryController = TextEditingController();
  bool _onlyPinned = false;

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dashboard = ref.watch(studentDashboardProvider);

    return _buildStudentDashboardPage(ref, dashboard, (data) {
      final theme = Theme.of(context);
      final controller = ref.read(studentDashboardProvider.notifier);
      var notes = data.notes.where((n) => n.matches(_queryController.text));
      if (_onlyPinned) {
        notes = notes.where((n) => n.pinned);
      }
      final noteList = notes.toList();

      return ListView(
        padding: const EdgeInsets.all(24),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Text('学习笔记', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _queryController,
                  decoration: InputDecoration(
                    hintText: '搜索笔记...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
              ),
              const SizedBox(width: 12),
              FilterChip(
                label: const Text('仅看置顶'),
                selected: _onlyPinned,
                onSelected: (v) => setState(() => _onlyPinned = v),
              ),
            ],
          ),
          const SizedBox(height: 24),
          if (noteList.isEmpty)
            const _IllustratedPlaceholder(
              icon: Icons.note_alt_outlined,
              title: '暂无笔记',
              description: '记录学习心得，构建知识体系。',
            )
          else
            for (final note in noteList)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _NoteCard(
                  note: note,
                  onTogglePinned: () => controller.toggleNotePinned(note),
                ),
              ),
          const SizedBox(height: 36),
        ],
      );
    });
  }
}

class _NoteCard extends StatelessWidget {
  const _NoteCard({required this.note, required this.onTogglePinned});

  final student_data.StudentNoteItem note;
  final VoidCallback onTogglePinned;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {}, // TODO: Open note detail
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      note.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      note.pinned ? Icons.push_pin : Icons.push_pin_outlined,
                      color: note.pinned ? theme.colorScheme.primary : null,
                    ),
                    onPressed: onTogglePinned,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                note.preview,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[700],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    note.updatedAtLabel,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[500],
                    ),
                  ),
                  const Spacer(),
                  for (final tag in note.tags)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Chip(
                        label: Text(tag),
                        labelStyle: theme.textTheme.labelSmall,
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        backgroundColor: theme
                            .colorScheme
                            .surfaceContainerHighest
                            .withValues(alpha: 0.5),
                        side: BorderSide.none,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentMessagesPage extends StatelessWidget {
  const StudentMessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConversationListWidget();
  }
}

class _DashboardErrorView extends StatelessWidget {
  const _DashboardErrorView({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.wifi_off_outlined,
              size: 48,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text('数据加载失败', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              '请检查网络连接后重试',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('重试'),
            ),
          ],
        ),
      ),
    );
  }
}
