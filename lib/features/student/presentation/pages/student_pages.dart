// ignore_for_file: unused_element, unused_element_parameter, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:learn_go/features/file/application/file_service.dart';

import '../../application/student_dashboard_controller.dart';
import '../../../auth/application/auth_controller.dart';
import '../../domain/course.dart';
import '../../domain/sample_data.dart' as student_data;
import '../../domain/student_repository.dart';
import '../../../im/presentation/pages/conversation_list_screen.dart';
import 'join_course_dialog.dart';

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
  return RefreshIndicator(
    onRefresh: () async {
      await ref.read(studentDashboardProvider.notifier).refresh();
    },
    child: dashboard.when(
      data: builder,
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => ListView(
        children: const [
          SizedBox(height: 120),
          Center(child: Text('加载失败，请下拉重试')),
        ],
      ),
    ),
  );
}

class StudentOverviewPage extends ConsumerStatefulWidget {
  const StudentOverviewPage({super.key});

  @override
  ConsumerState<StudentOverviewPage> createState() =>
      _StudentOverviewPageState();
}

class _StudentOverviewPageState extends ConsumerState<StudentOverviewPage> {
  @override
  Widget build(BuildContext context) {
    final dashboard = ref.watch(studentDashboardProvider);
    final account = ref.watch(authStateProvider).account;
    final theme = Theme.of(context);

    return _buildStudentDashboardPage(ref, dashboard, (data) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(theme, account?.displayName ?? '同学'),
          const SizedBox(height: 16),
          _buildQuickActions(context),
          const SizedBox(height: 16),
          _buildSectionTitle(theme, '今日课程'),
          const SizedBox(height: 12),
          _buildScheduleList(theme, data.todaySchedule),
          const SizedBox(height: 16),
          _buildSectionTitle(theme, '待办作业'),
          const SizedBox(height: 12),
          _buildAssignmentList(context, theme, data.pendingAssignments),
        ],
      );
    });
  }

  Widget _buildHeader(ThemeData theme, String name) {
    final now = DateTime.now();
    final dateStr = DateFormat('M月d日 EEEE', 'zh_CN').format(now);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primaryContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateStr,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onPrimary.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '你好，\n$name',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onPrimary,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 26,
              backgroundColor: theme.colorScheme.surface,
              child: Text(
                name.isNotEmpty ? name[0] : 'S',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    ThemeData theme,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      shadowColor: color.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 16),
            Text(
              value,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildActionItem(
              context,
              Icons.school_outlined,
              '我的课程',
              '/student/courses',
              Colors.blue,
            ),
            _buildActionItem(
              context,
              Icons.assignment_outlined,
              '作业',
              '/student/assignments',
              Colors.orange,
            ),
            _buildActionItem(
              context,
              Icons.calendar_today_outlined,
              '课表',
              '/student/schedule',
              Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem(
    BuildContext context,
    IconData icon,
    String label,
    String route,
    Color color,
  ) {
    return InkWell(
      onTap: () => context.go(route),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    return Text(
      title,
      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildScheduleList(
    ThemeData theme,
    List<student_data.StudentScheduleItem> schedule,
  ) {
    if (schedule.isEmpty) {
      return _buildEmptyState(theme, '今天没有课程安排');
    }
    return Column(
      children: schedule
          .map((item) => _buildScheduleItem(theme, item))
          .toList(),
    );
  }

  Widget _buildScheduleItem(
    ThemeData theme,
    student_data.StudentScheduleItem item,
  ) {
    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerLow,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  item.startTime,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                Text(
                  item.timeRange.split('-').last,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Container(
              width: 4,
              height: 40,
              decoration: BoxDecoration(
                color: item.accentColor(theme),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.course,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${item.location} · ${item.teacher}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssignmentList(
    BuildContext context,
    ThemeData theme,
    List<student_data.StudentAssignmentItem> assignments,
  ) {
    if (assignments.isEmpty) {
      return _buildEmptyState(theme, '没有待办作业');
    }
    final displayList = assignments.take(3).toList();
    return Column(
      children: displayList
          .map((item) => _buildAssignmentItem(context, theme, item))
          .toList(),
    );
  }

  Widget _buildAssignmentItem(
    BuildContext context,
    ThemeData theme,
    student_data.StudentAssignmentItem item,
  ) {
    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerLow,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: () => context.push('/student/assignments/${item.id}'),
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.tertiaryContainer,
          child: Icon(
            Icons.assignment,
            color: theme.colorScheme.onTertiaryContainer,
          ),
        ),
        title: Text(
          item.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text('${item.course} · ${item.dueLabel}'),
        trailing: item.isOverdue
            ? const Icon(Icons.warning, color: Colors.red)
            : const Icon(Icons.chevron_right),
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme, String message) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 48,
            color: theme.colorScheme.outline.withOpacity(0.5),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class StudentCoursesPage extends ConsumerWidget {
  const StudentCoursesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final coursesAsync = ref.watch(studentCoursesProvider);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('课程'),
            centerTitle: true,
            pinned: true,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const JoinCourseDialog(),
                  );
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '搜索',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: theme.colorScheme.surfaceContainerHighest
                      .withValues(alpha: 0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
          ),
          coursesAsync.when(
            data: (courses) {
              if (courses.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(child: Text('暂无课程')),
                );
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final course = courses[index];
                  return _CourseCard(course: course);
                }, childCount: courses.length),
              );
            },
            loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) =>
                SliverFillRemaining(child: Center(child: Text('加载失败'))),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
        ],
      ),
    );
  }
}

class StudentSchedulePage extends ConsumerWidget {
  const StudentSchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final dashboardAsync = ref.watch(studentDashboardProvider);
    final timeSlotsAsync = ref.watch(studentTimeSlotsProvider);

    final weekDays = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];

    Color getCourseColor(String courseName) {
      final colors = [
        theme.colorScheme.primary,
        theme.colorScheme.secondary,
        theme.colorScheme.tertiary,
        theme.colorScheme.error,
      ];
      return colors[courseName.hashCode.abs() % colors.length];
    }

    return ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('我的课表', style: theme.textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              '查看本周学习安排。',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 24),
            dashboardAsync.when(
              data: (data) => timeSlotsAsync.when(
                data: (timeSlots) {
                  final sortedSlots = List.of(timeSlots)
                    ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

                  final scheduleItems = data.schedule;

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
                        dataRowMinHeight: 80,
                        dataRowMaxHeight: 120,
                        columnSpacing: 12,
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
                                  width: 80,
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
                                final item = scheduleItems
                                    .where(
                                      (item) =>
                                          item.weekDay == day &&
                                          item.slotId == slot.id,
                                    )
                                    .firstOrNull;

                                if (item == null) {
                                  return const DataCell(SizedBox(width: 120));
                                }

                                return DataCell(
                                  Container(
                                    width: 120,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    child: Card(
                                      elevation: 0,
                                      color: getCourseColor(
                                        item.course,
                                      ).withValues(alpha: 0.1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                          color: getCourseColor(
                                            item.course,
                                          ).withValues(alpha: 0.2),
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
                                            children: [
                                              Text(
                                                item.course,
                                                style: theme
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: getCourseColor(
                                                        item.course,
                                                      ),
                                                    ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 2),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.person_outline,
                                                    size: 12,
                                                    color: theme
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                                  ),
                                                  const SizedBox(width: 2),
                                                  Expanded(
                                                    child: Text(
                                                      item.teacher,
                                                      style: theme
                                                          .textTheme
                                                          .labelSmall
                                                          ?.copyWith(
                                                            color: theme
                                                                .colorScheme
                                                                .onSurfaceVariant,
                                                            fontSize: 10,
                                                          ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    size: 12,
                                                    color: theme
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                                  ),
                                                  const SizedBox(width: 2),
                                                  Expanded(
                                                    child: Text(
                                                      item.location,
                                                      style: theme
                                                          .textTheme
                                                          .labelSmall
                                                          ?.copyWith(
                                                            color: theme
                                                                .colorScheme
                                                                .onSurfaceVariant,
                                                          ),
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
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, s) => const Center(child: Text('加载时间表失败')),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => const Center(child: Text('加载课表失败')),
            ),
          ],
        ),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final Course course;

  const _CourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    bool looksLikeFileId(String? value) {
      if (value == null) return false;
      final v = value.trim();
      if (v.isEmpty) return false;
      if (v.startsWith('http://') || v.startsWith('https://')) return false;
      return RegExp(r'^[0-9a-fA-F-]{36}$').hasMatch(v);
    }

    // Generate random color based on course name
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
    ];
    final color = colors[course.name.hashCode.abs() % colors.length];
    final imageColor = color.withValues(alpha: 0.2);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            context.push('/student/courses/${course.id}');
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child:
                        (course.imageUrl != null &&
                            course.imageUrl!.trim().isNotEmpty)
                        ? (looksLikeFileId(course.imageUrl)
                              ? Consumer(
                                  builder: (context, ref, _) {
                                    final urlAsync = ref.watch(
                                      downloadUrlProvider(
                                        course.imageUrl!.trim(),
                                      ),
                                    );
                                    return urlAsync.when(
                                      data: (url) =>
                                          Image.network(url, fit: BoxFit.cover),
                                      loading: () => Container(
                                        color: isDark
                                            ? color.withValues(alpha: 0.2)
                                            : imageColor,
                                        alignment: Alignment.center,
                                        child: const SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      ),
                                      error: (e, _) => Container(
                                        color: isDark
                                            ? color.withValues(alpha: 0.2)
                                            : imageColor,
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.broken_image_outlined,
                                          color: color,
                                          size: 24,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Image.network(
                                  course.imageUrl!.trim(),
                                  fit: BoxFit.cover,
                                ))
                        : Container(
                            color: isDark
                                ? color.withValues(alpha: 0.2)
                                : imageColor,
                            alignment: Alignment.center,
                            child: Icon(Icons.book, color: color, size: 24),
                          ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (course.description != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          course.description!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
            '查看作业和实测进度，支持申请延期或重新提交。',
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
              description: '可以调整筛选条件或查看历史记录。',
            )
          else
            for (final assignment in filtered)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _AssignmentCard(
                  assignment: assignment,
                  onTap: () {
                    if ((assignment.status ==
                                student_data.StudentAssignmentStatus.graded ||
                            assignment.status ==
                                student_data
                                    .StudentAssignmentStatus
                                    .submitted) &&
                        !assignment.allowResubmit) {
                      context.push(
                        '/student/assignments/${assignment.id}/result',
                      );
                    } else {
                      context.push('/student/assignments/${assignment.id}');
                    }
                  },
                  onSubmit:
                      assignment.status ==
                          student_data.StudentAssignmentStatus.pending
                      ? () => controller.submitAssignment(assignment.id)
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
    this.subtitle,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final String route;
  final String? subtitle;
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
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: stat.value.length > 4 ? 18 : null,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                stat.label,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              if (stat.subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  stat.subtitle!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
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
          title: Text('宸插畬鎴愭彁閱?(${reminders.length})'),
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
  _ReminderIconOption(Icons.alarm_on_outlined, '榛樿'),
  _ReminderIconOption(Icons.task_alt_outlined, '作业'),
  _ReminderIconOption(Icons.menu_book_outlined, '澶嶄範'),
  _ReminderIconOption(Icons.lightbulb_outline, '鎯虫硶'),
  _ReminderIconOption(Icons.event_available_outlined, '鏃ョ▼'),
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
                hintText: '例如：提交实测报告',
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
                hintText: '例如：本周五 18:00',
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
            Text('鍥炬爣', style: Theme.of(context).textTheme.titleSmall),
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
                  child: const Text('鍙栨秷'),
                ),
                const SizedBox(width: 12),
                FilledButton(
                  onPressed: _handleSubmit,
                  child: Text(widget.isEditing ? '鏇存柊' : '淇濆瓨'),
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
  const _AssignmentCard({required this.assignment, this.onSubmit, this.onTap});

  final student_data.StudentAssignmentItem assignment;
  final VoidCallback? onSubmit;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = assignment.statusColor(theme);
    final isPending =
        assignment.status == student_data.StudentAssignmentStatus.pending;
    final showSubmit = onSubmit != null && isPending;

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
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: accent.withValues(alpha: 0.2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.rate_review_outlined,
                            size: 16,
                            color: accent,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '教师评语',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: accent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        assignment.feedback!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
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
              if (showSubmit) ...[
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    FilledButton.icon(
                      onPressed: onSubmit,
                      icon: const Icon(Icons.cloud_upload_outlined),
                      label: const Text('提交作业'),
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
                child: const Text('鏍囪宸茶'),
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
            '关注倒计时与考场安排，请提前准备好准考证与座位号。',
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
              description: '近期没有即将开始的考试。',
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
              description: '完成第一次考试后会自动记录成绩。',
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
                label: const Text('只看置顶'),
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
              description: '记录学习要点，构建自己的知识体系。',
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
