import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learn_go/features/admin/data/admin_repository.dart';

import '../../application/schedule_providers.dart';
import '../../application/course_providers.dart';
import '../../application/admin_providers.dart';
import '../../domain/accounts.dart';
import '../../domain/models.dart';
import '../../domain/schedule.dart';
import '../../domain/course.dart';
import 'course_detail_page.dart';
import '../../../auth/application/auth_controller.dart';

class ScheduleManagementPage extends HookConsumerWidget {
  const ScheduleManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final schoolId = user?.schoolId;

    if (schoolId == null) {
      return const Center(child: Text('School ID not found'));
    }

    final tabController = useTabController(initialLength: 2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('教务管理'),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(text: '课程与排课'),
            Tab(text: '时间段管理'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month),
            tooltip: '生成课表',
            onPressed: () =>
                _showGenerateSessionsDialog(context, ref, schoolId),
          ),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          _CoursesTab(schoolId: schoolId),
          _TimeSlotsTab(schoolId: schoolId),
        ],
      ),
    );
  }

  void _showGenerateSessionsDialog(
    BuildContext context,
    WidgetRef ref,
    String schoolId,
  ) {
    showDialog(
      context: context,
      builder: (context) => _GenerateSessionsDialog(schoolId: schoolId),
    );
  }
}

class _CoursesTab extends ConsumerWidget {
  const _CoursesTab({required this.schoolId});

  final String schoolId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(courseListProvider);
    final deptTreeAsync = ref.watch(adminDepartmentTreeProvider);
    final filter = ref.watch(courseFilterProvider);
    final rulesAsync = ref.watch(scheduleRulesProvider(schoolId));
    final statsAsync = ref.watch(scheduleStatsProvider(schoolId));

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateCourseDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('创建课程'),
      ),
      body: Column(
        children: [
          if (statsAsync.hasValue)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _ScheduleStatsCard(stats: statsAsync.value!),
            ),
          // Filter Bar
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor.withAlpha(25),
                ),
              ),
            ),
            child: deptTreeAsync.when(
              data: (nodes) {
                final departments = nodes.map((n) => n.department).toList();

                final classes = nodes
                    .where((n) => n.department.id == filter.departmentId)
                    .expand((n) => n.classes)
                    .toList();

                return Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: '院系',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 0,
                            ),
                          ),
                          style: Theme.of(context).textTheme.bodyMedium,
                          initialValue: filter.departmentId,
                          isExpanded: true,
                          items: [
                            const DropdownMenuItem(
                              value: null,
                              child: Text('全部院系'),
                            ),
                            ...departments.map(
                              (d) => DropdownMenuItem(
                                value: d.id,
                                child: Text(
                                  d.name,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (val) {
                            ref.read(courseFilterProvider.notifier).state =
                                CourseFilter(departmentId: val, classId: null);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: '班级',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 0,
                            ),
                          ),
                          style: Theme.of(context).textTheme.bodyMedium,
                          initialValue: filter.classId,
                          isExpanded: true,
                          items: [
                            const DropdownMenuItem(
                              value: null,
                              child: Text('全部班级'),
                            ),
                            ...classes.map(
                              (c) => DropdownMenuItem(
                                value: c.id,
                                child: Text(
                                  c.name,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (val) {
                            ref
                                .read(courseFilterProvider.notifier)
                                .state = CourseFilter(
                              departmentId: filter.departmentId,
                              classId: val,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
              loading: () => const LinearProgressIndicator(),
              error: (e, s) => const SizedBox(),
            ),
          ),

          // Course List
          Expanded(
            child: coursesAsync.when(
              data: (courses) {
                if (courses.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.class_outlined,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '暂无课程数据',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        '共找到 ${courses.length} 门课程',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(
                          bottom: 80,
                        ), // Space for FAB
                        itemCount: courses.length,
                        itemBuilder: (context, index) {
                          final course = courses[index];
                          final rules =
                              rulesAsync.valueOrNull
                                  ?.where((r) => r.courseId == course.id)
                                  .toList() ??
                              [];
                          return _buildCourseCard(
                            context,
                            ref,
                            course,
                            rules,
                            schoolId,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(
    BuildContext context,
    WidgetRef ref,
    Course course,
    List<CourseSchedule> rules,
    String schoolId,
  ) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CourseDetailPage(course: course),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      course.name,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert),
                    onSelected: (value) {
                      if (value == 'assign') {
                        _showAssignDialog(context, ref, course);
                      } else if (value == 'schedule') {
                        _showAddRuleDialog(context, ref, schoolId, course);
                      } else if (value == 'delete') {
                        _deleteCourse(context, ref, course.id);
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'assign',
                        child: Row(
                          children: [
                            Icon(Icons.assignment_ind, size: 20),
                            SizedBox(width: 8),
                            Text('分配课程'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'schedule',
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today, size: 20),
                            SizedBox(width: 8),
                            Text('添加排课'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete, color: Colors.red, size: 20),
                            SizedBox(width: 8),
                            Text('删除课程', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (course.description.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  course.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (rules.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.orange.shade200),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.schedule,
                            size: 16,
                            color: Colors.orange.shade700,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '已排 ${rules.length} 节',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.orange.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (course.teacherName != null &&
                      course.teacherName!.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: theme.colorScheme.primary.withValues(
                            alpha: 0.2,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.person,
                            size: 16,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            course.teacherName!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest
                            .withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.person_off_outlined,
                            size: 16,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '未分配教师',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (course.className != null && course.className!.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.tertiary.withValues(
                          alpha: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: theme.colorScheme.tertiary.withValues(
                            alpha: 0.2,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.class_outlined,
                            size: 16,
                            color: theme.colorScheme.tertiary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${course.className} (${course.studentCount}人)',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.tertiary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest
                            .withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.meeting_room_outlined,
                            size: 16,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '未分配班级',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
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

  void _showAddRuleDialog(
    BuildContext context,
    WidgetRef ref,
    String schoolId,
    Course? course,
  ) {
    showDialog(
      context: context,
      builder: (context) => _AddScheduleRuleDialog(
        schoolId: schoolId,
        initialCourseId: course?.id,
      ),
    );
  }

  Future<void> _showCreateCourseDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final nameController = TextEditingController();
    final descController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('创建课程'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: '课程名称'),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: '描述'),
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
              final user = ref.read(currentUserProvider);
              if (user == null) return;
              try {
                await ref
                    .read(adminRepositoryProvider)
                    .createCourse(
                      schoolId: user.schoolId,
                      name: nameController.text,
                      description: descController.text,
                    );
                ref.invalidate(courseListProvider);
                if (context.mounted) Navigator.pop(context);
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              }
            },
            child: const Text('创建'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteCourse(
    BuildContext context,
    WidgetRef ref,
    String id,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: const Text('确定要删除这个课程吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('删除'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await ref.read(adminRepositoryProvider).deleteCourse(id: id);
        ref.invalidate(courseListProvider);
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }
  }

  Future<void> _showAssignDialog(
    BuildContext context,
    WidgetRef ref,
    Course course,
  ) async {
    String? selectedTeacherId;
    String? selectedClassId;

    await showDialog(
      context: context,
      builder: (context) => Consumer(
        builder: (context, ref, child) {
          final teachersAsync = ref.watch(teacherListProvider);
          final deptTreeAsync = ref.watch(adminDepartmentTreeProvider);

          return AlertDialog(
            title: Text('分配课程: ${course.name}'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                teachersAsync.when(
                  data: (teachers) => DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: '选择教师'),
                    items: teachers
                        .map(
                          (t) => DropdownMenuItem(
                            value: t.id,
                            child: Text(t.name),
                          ),
                        )
                        .toList(),
                    onChanged: (v) => selectedTeacherId = v,
                  ),
                  loading: () => const CircularProgressIndicator(),
                  error: (e, s) => Text('加载教师失败: $e'),
                ),
                const SizedBox(height: 16),
                deptTreeAsync.when(
                  data: (nodes) {
                    final items = <DropdownMenuItem<String>>[];
                    for (final node in nodes) {
                      for (final cls in node.classes) {
                        items.add(
                          DropdownMenuItem(
                            value: cls.id,
                            child: Text(
                              '${node.department.name} - ${cls.name}',
                            ),
                          ),
                        );
                      }
                    }
                    return DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: '选择班级'),
                      items: items,
                      onChanged: (v) => selectedClassId = v,
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (e, s) => Text('加载班级失败: $e'),
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
                  if (selectedTeacherId == null || selectedClassId == null) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('请选择教师和班级')));
                    return;
                  }

                  final user = ref.read(currentUserProvider);
                  if (user == null) return;
                  try {
                    await ref
                        .read(adminRepositoryProvider)
                        .assignCourse(
                          schoolId: user.schoolId,
                          courseId: course.id,
                          teacherId: selectedTeacherId!,
                          classId: selectedClassId!,
                        );
                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('分配成功')));
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  }
                },
                child: const Text('分配'),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TimeSlotsTab extends ConsumerWidget {
  const _TimeSlotsTab({required this.schoolId});

  final String schoolId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeSlotsAsync = ref.watch(timeSlotsProvider(schoolId));

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTimeSlotDialog(context, ref, schoolId),
        child: const Icon(Icons.add),
      ),
      body: timeSlotsAsync.when(
        data: (slots) {
          if (slots.isEmpty) {
            return const Center(child: Text('暂无时间段'));
          }
          return ListView.builder(
            itemCount: slots.length,
            itemBuilder: (context, index) {
              final slot = slots[index];
              return ListTile(
                title: Text(slot.name),
                subtitle: Text('${slot.startTime} - ${slot.endTime}'),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  void _showAddTimeSlotDialog(
    BuildContext context,
    WidgetRef ref,
    String schoolId,
  ) {
    showDialog(
      context: context,
      builder: (context) => _AddTimeSlotDialog(schoolId: schoolId),
    );
  }
}

class _AddTimeSlotDialog extends HookConsumerWidget {
  const _AddTimeSlotDialog({required this.schoolId});

  final String schoolId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final startTime = useState<String?>(null);
    final endTime = useState<String?>(null);

    Future<void> selectTime(ValueNotifier<String?> state) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        },
      );
      if (picked != null) {
        final hour = picked.hour.toString().padLeft(2, '0');
        final minute = picked.minute.toString().padLeft(2, '0');
        state.value = '$hour:$minute';
      }
    }

    return AlertDialog(
      title: const Text('添加时间段'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: '名称 (如: 第一节)'),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: const Text('开始时间'),
            subtitle: Text(startTime.value ?? '点击选择'),
            trailing: const Icon(Icons.access_time),
            onTap: () => selectTime(startTime),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            title: const Text('结束时间'),
            subtitle: Text(endTime.value ?? '点击选择'),
            trailing: const Icon(Icons.access_time),
            onTap: () => selectTime(endTime),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
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
            if (startTime.value == null || endTime.value == null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('请选择开始和结束时间')));
              return;
            }
            await ref
                .read(scheduleControllerProvider.notifier)
                .createTimeSlot(
                  schoolId: schoolId,
                  name: nameController.text,
                  startTime: startTime.value!,
                  endTime: endTime.value!,
                );
            if (context.mounted) Navigator.pop(context);
          },
          child: const Text('添加'),
        ),
      ],
    );
  }
}

class _AddScheduleRuleDialog extends HookConsumerWidget {
  const _AddScheduleRuleDialog({required this.schoolId, this.initialCourseId});

  final String schoolId;
  final String? initialCourseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCourseId = useState<String?>(initialCourseId);
    final selectedClassId = useState<String?>(null);
    final selectedTeacherId = useState<String?>(null);
    final selectedSlotId = useState<String?>(null);
    final selectedDayOfWeek = useState<int>(1);
    final locationController = useTextEditingController();
    final startDate = useState<DateTime>(DateTime.now());
    final endDate = useState<DateTime>(
      DateTime.now().add(const Duration(days: 365)),
    );

    final coursesAsync = ref.watch(courseListProvider);
    final deptTreeAsync = ref.watch(adminDepartmentTreeProvider);
    final timeSlotsAsync = ref.watch(timeSlotsProvider(schoolId));

    final teachersAsync = ref.watch(
      adminAccountListProvider(
        AdminAccountListRequest(
          schoolId: schoolId,
          role: AdminAccountRole.teacher,
          page: 1,
          pageSize: 1000,
        ),
      ),
    );

    final courses = coursesAsync.asData?.value ?? [];
    final departmentNodes = deptTreeAsync.asData?.value ?? [];
    final allClasses = <ClassInfo>[];
    for (final node in departmentNodes) {
      allClasses.addAll(node.classes);
    }
    final teachers = teachersAsync.asData?.value.accounts ?? [];
    final timeSlots = timeSlotsAsync.asData?.value ?? [];

    return AlertDialog(
      title: const Text('添加排课规则'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              value: selectedCourseId.value,
              decoration: const InputDecoration(labelText: '课程'),
              items: courses
                  .map(
                    (c) => DropdownMenuItem(value: c.id, child: Text(c.name)),
                  )
                  .toList(),
              onChanged: (v) => selectedCourseId.value = v,
            ),
            DropdownButtonFormField<String>(
              value: selectedClassId.value,
              decoration: const InputDecoration(labelText: '班级'),
              items: allClasses
                  .map(
                    (c) => DropdownMenuItem(value: c.id, child: Text(c.name)),
                  )
                  .toList(),
              onChanged: (v) => selectedClassId.value = v,
            ),
            DropdownButtonFormField<String>(
              value: selectedTeacherId.value,
              decoration: const InputDecoration(labelText: '教师'),
              items: teachers
                  .map(
                    (t) => DropdownMenuItem(value: t.id, child: Text(t.name)),
                  )
                  .toList(),
              onChanged: (v) => selectedTeacherId.value = v,
            ),
            DropdownButtonFormField<String>(
              value: selectedSlotId.value,
              decoration: const InputDecoration(labelText: '时间段'),
              items: timeSlots
                  .map(
                    (s) => DropdownMenuItem(
                      value: s.id,
                      child: Text('${s.name} (${s.startTime}-${s.endTime})'),
                    ),
                  )
                  .toList(),
              onChanged: (v) => selectedSlotId.value = v,
            ),
            DropdownButtonFormField<int>(
              value: selectedDayOfWeek.value,
              decoration: const InputDecoration(labelText: '星期'),
              items: List.generate(7, (index) {
                final day = index + 1;
                return DropdownMenuItem(
                  value: day,
                  child: Text('星期${_numberToChinese(day)}'),
                );
              }),
              onChanged: (v) => selectedDayOfWeek.value = v!,
            ),
            TextField(
              controller: locationController,
              decoration: const InputDecoration(labelText: '地点'),
            ),
            ListTile(
              title: const Text('开始日期'),
              subtitle: Text(startDate.value.toIso8601String().split('T')[0]),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: startDate.value,
                  firstDate: DateTime.now().subtract(const Duration(days: 365)),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
                );
                if (picked != null) startDate.value = picked;
              },
            ),
            ListTile(
              title: const Text('结束日期'),
              subtitle: Text(endDate.value.toIso8601String().split('T')[0]),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: endDate.value,
                  firstDate: DateTime.now().subtract(const Duration(days: 365)),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
                );
                if (picked != null) endDate.value = picked;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
        TextButton(
          onPressed: () async {
            if (selectedCourseId.value == null ||
                selectedClassId.value == null ||
                selectedTeacherId.value == null ||
                selectedSlotId.value == null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('请填写完整信息')));
              return;
            }

            await ref
                .read(scheduleControllerProvider.notifier)
                .createScheduleRule(
                  schoolId: schoolId,
                  courseId: selectedCourseId.value!,
                  classId: selectedClassId.value!,
                  teacherId: selectedTeacherId.value!,
                  slotId: selectedSlotId.value!,
                  dayOfWeek: selectedDayOfWeek.value,
                  location: locationController.text,
                  startDate: startDate.value,
                  endDate: endDate.value,
                );
            if (context.mounted) Navigator.pop(context);
          },
          child: const Text('添加'),
        ),
      ],
    );
  }

  String _numberToChinese(int number) {
    const chinese = ['一', '二', '三', '四', '五', '六', '日'];
    return chinese[number - 1];
  }
}

class _GenerateSessionsDialog extends HookConsumerWidget {
  const _GenerateSessionsDialog({required this.schoolId});

  final String schoolId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startDate = useState<DateTime>(DateTime.now());
    final endDate = useState<DateTime>(
      DateTime.now().add(const Duration(days: 7)),
    );

    return AlertDialog(
      title: const Text('生成课表'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('开始日期'),
            subtitle: Text(startDate.value.toIso8601String().split('T')[0]),
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: startDate.value,
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (picked != null) startDate.value = picked;
            },
          ),
          ListTile(
            title: const Text('结束日期'),
            subtitle: Text(endDate.value.toIso8601String().split('T')[0]),
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: endDate.value,
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (picked != null) endDate.value = picked;
            },
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
                .read(scheduleControllerProvider.notifier)
                .generateSessions(
                  schoolId: schoolId,
                  start: startDate.value,
                  end: endDate.value,
                );
            if (context.mounted) {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('课表生成任务已提交')));
            }
          },
          child: const Text('生成'),
        ),
      ],
    );
  }
}

class _ScheduleStatsCard extends StatelessWidget {
  const _ScheduleStatsCard({required this.stats});

  final ScheduleStats stats;

  @override
  Widget build(BuildContext context) {
    final scheduledPercent = stats.totalCourses > 0
        ? stats.scheduledCoursesCount / stats.totalCourses
        : 0.0;

    return Card(
      elevation: 0,
      color: Colors.blue.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.blue.shade100),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '排课概览',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _StatItem(
                    label: '总课程数',
                    value: stats.totalCourses.toString(),
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: _StatItem(
                    label: '已排课程',
                    value: stats.scheduledCoursesCount.toString(),
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: _StatItem(
                    label: '未排课程',
                    value: stats.unscheduledCoursesCount.toString(),
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: scheduledPercent,
                backgroundColor: Colors.white,
                color: Colors.blue,
                minHeight: 8,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '排课覆盖率: ${(scheduledPercent * 100).toStringAsFixed(1)}%',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
        ),
      ],
    );
  }
}
