import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learn_go/features/admin/data/admin_repository.dart';

import '../../application/schedule_providers.dart';
import '../../application/course_providers.dart';
import '../../application/admin_providers.dart';
import '../../application/classroom_providers.dart';
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

    useEffect(() {
      void listener() {
        if (tabController.index == 1 && !tabController.indexIsChanging) {
          ref.invalidate(timeSlotsProvider(schoolId));
        }
      }

      tabController.addListener(listener);
      return () => tabController.removeListener(listener);
    }, [tabController]);

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
    final coursesAsync = ref.watch(courseListProvider(schoolId));
    final deptTreeAsync = ref.watch(adminDepartmentTreeProvider);
    final filter = ref.watch(courseFilterProvider);
    final rulesAsync = ref.watch(scheduleRulesProvider(schoolId));
    final statsAsync = ref.watch(scheduleStatsProvider(schoolId));
    final timeSlotsAsync = ref.watch(timeSlotsProvider(schoolId));

    // Keep controller alive
    ref.watch(scheduleControllerProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateCourseDialog(context, ref, schoolId),
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

                final classes = (filter.departmentId == null)
                    ? nodes.expand((n) => n.classes).toList()
                    : nodes
                          .where((n) => n.department.id == filter.departmentId)
                          .expand((n) => n.classes)
                          .toList();

                return Column(
                  children: [
                    Row(
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
                                ref
                                    .read(courseFilterProvider.notifier)
                                    .state = CourseFilter(
                                  departmentId: val,
                                  classId: null,
                                  keyword: filter.keyword,
                                  slotId: filter.slotId,
                                );
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
                                  keyword: filter.keyword,
                                  slotId: filter.slotId,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: '搜索 (课程/教师/班级)',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 0,
                                ),
                                prefixIcon: Icon(Icons.search, size: 20),
                              ),
                              style: Theme.of(context).textTheme.bodyMedium,
                              onChanged: (val) {
                                ref
                                    .read(courseFilterProvider.notifier)
                                    .state = CourseFilter(
                                  departmentId: filter.departmentId,
                                  classId: filter.classId,
                                  keyword: val,
                                  slotId: filter.slotId,
                                );
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
                                labelText: '时间段',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 0,
                                ),
                              ),
                              style: Theme.of(context).textTheme.bodyMedium,
                              initialValue: filter.slotId,
                              isExpanded: true,
                              items: [
                                const DropdownMenuItem(
                                  value: null,
                                  child: Text('全部时间段'),
                                ),
                                ...(timeSlotsAsync.valueOrNull ?? []).map(
                                  (s) => DropdownMenuItem(
                                    value: s.id,
                                    child: Text(
                                      '${s.name} (${s.startTime}-${s.endTime})',
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
                                  classId: filter.classId,
                                  keyword: filter.keyword,
                                  slotId: val,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
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
              data: (rawCourses) {
                // If filtering by slot, ensure rules are loaded
                if (filter.slotId != null && !rulesAsync.hasValue) {
                  return const Center(child: CircularProgressIndicator());
                }

                final courses = rawCourses.where((course) {
                  // Keyword filter
                  if (filter.keyword != null && filter.keyword!.isNotEmpty) {
                    final k = filter.keyword!.toLowerCase();
                    final matchesName = course.name.toLowerCase().contains(k);

                    final courseRules =
                        rulesAsync.valueOrNull?.where(
                          (r) => r.courseId == course.id,
                        ) ??
                        [];

                    final matchesTeacher = courseRules.any(
                      (r) => (r.teacherName ?? '').toLowerCase().contains(k),
                    );
                    final matchesClass = courseRules.any(
                      (r) => (r.className ?? '').toLowerCase().contains(k),
                    );

                    if (!matchesName && !matchesTeacher && !matchesClass) {
                      return false;
                    }
                  }

                  // Slot filter
                  if (filter.slotId != null) {
                    final rules = rulesAsync.valueOrNull ?? [];
                    final hasSlot = rules.any(
                      (r) =>
                          r.courseId == course.id &&
                          r.slotId.trim() == filter.slotId!.trim(),
                    );
                    if (!hasSlot) {
                      return false;
                    }
                  }

                  return true;
                }).toList();

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
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.grey.shade200),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: DataTable(
                              dataRowMinHeight: 60,
                              dataRowMaxHeight: double.infinity,
                              headingRowColor: WidgetStateProperty.all(
                                Colors.grey.shade50,
                              ),
                              columns: const [
                                DataColumn(label: Text('序号')),
                                DataColumn(label: Text('课程名称')),
                                DataColumn(label: Text('教师')),
                                DataColumn(label: Text('班级')),
                                DataColumn(label: Text('排课状态')),
                                DataColumn(label: Text('操作')),
                              ],
                              rows: courses.asMap().entries.map((entry) {
                                final index = entry.key;
                                final course = entry.value;
                                final rules =
                                    rulesAsync.valueOrNull
                                        ?.where((r) => r.courseId == course.id)
                                        .toList() ??
                                    [];
                                return DataRow(
                                  cells: [
                                    DataCell(Text('${index + 1}')),
                                    DataCell(
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            course.name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          if (course.description.isNotEmpty)
                                            Text(
                                              course.description,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey.shade600,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                        ],
                                      ),
                                      onTap: () async {
                                        await Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CourseDetailPage(
                                                  course: course,
                                                ),
                                          ),
                                        );
                                        ref.invalidate(
                                          courseListProvider(schoolId),
                                        );
                                      },
                                    ),
                                    DataCell(
                                      Builder(
                                        builder: (context) {
                                          if (rules.isEmpty) {
                                            return const Text('-');
                                          }
                                          final teachers = rules
                                              .map((r) => r.teacherName)
                                              .where(
                                                (n) =>
                                                    n != null && n.isNotEmpty,
                                              )
                                              .toSet()
                                              .join(', ');
                                          return Text(
                                            teachers.isEmpty ? '-' : teachers,
                                          );
                                        },
                                      ),
                                    ),
                                    DataCell(
                                      Builder(
                                        builder: (context) {
                                          if (rules.isEmpty) {
                                            return const Text('-');
                                          }
                                          final classNames = rules
                                              .map((r) => r.className)
                                              .where(
                                                (n) =>
                                                    n != null && n.isNotEmpty,
                                              )
                                              .toSet()
                                              .join(', ');
                                          return Text(
                                            classNames.isEmpty
                                                ? '-'
                                                : classNames,
                                          );
                                        },
                                      ),
                                    ),
                                    DataCell(
                                      rules.isNotEmpty
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 8.0,
                                                  ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: rules.map((rule) {
                                                  final slot = timeSlotsAsync
                                                      .valueOrNull
                                                      ?.where(
                                                        (s) =>
                                                            s.id.trim() ==
                                                            rule.slotId.trim(),
                                                      )
                                                      .firstOrNull;
                                                  final weekDayIndex =
                                                      rule.dayOfWeek - 1;
                                                  final weekDay =
                                                      (weekDayIndex >= 0 &&
                                                          weekDayIndex < 7)
                                                      ? [
                                                          '一',
                                                          '二',
                                                          '三',
                                                          '四',
                                                          '五',
                                                          '六',
                                                          '日',
                                                        ][weekDayIndex]
                                                      : '?';
                                                  final slotText = slot != null
                                                      ? '星期$weekDay ${slot.name} (${slot.startTime}-${slot.endTime})'
                                                      : '星期$weekDay ${rule.slotName ?? "未知"} (${rule.slotId})';

                                                  return InkWell(
                                                    onTap: () async {
                                                      final confirm = await showDialog<bool>(
                                                        context: context,
                                                        builder: (context) => AlertDialog(
                                                          title: const Text(
                                                            '删除排课规则',
                                                          ),
                                                          content: const Text(
                                                            '确定要删除这个排课规则吗？',
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                    context,
                                                                    false,
                                                                  ),
                                                              child: const Text(
                                                                '取消',
                                                              ),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                    context,
                                                                    true,
                                                                  ),
                                                              child: const Text(
                                                                '删除',
                                                                style: TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );

                                                      if (confirm == true) {
                                                        try {
                                                          await ref
                                                              .read(
                                                                scheduleControllerProvider
                                                                    .notifier,
                                                              )
                                                              .deleteScheduleRule(
                                                                schoolId:
                                                                    schoolId,
                                                                ruleId: rule.id,
                                                              );

                                                          final state = ref.read(
                                                            scheduleControllerProvider,
                                                          );
                                                          if (state.hasError) {
                                                            throw state.error!;
                                                          }
                                                        } catch (e) {
                                                          if (context.mounted) {
                                                            ScaffoldMessenger.of(
                                                              context,
                                                            ).showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  '删除失败: $e',
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                        }
                                                      }
                                                    },
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                            bottom: 2,
                                                          ),
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 2,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .orange
                                                            .shade50,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              4,
                                                            ),
                                                        border: Border.all(
                                                          color: Colors
                                                              .orange
                                                              .shade200,
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            rule.classroomLocation !=
                                                                    null
                                                                ? '$slotText @ ${rule.classroomLocation}'
                                                                : slotText,
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .orange
                                                                  .shade700,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 4,
                                                          ),
                                                          Icon(
                                                            Icons.close,
                                                            size: 14,
                                                            color: Colors
                                                                .orange
                                                                .shade700,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            )
                                          : const Text('-'),
                                    ),
                                    DataCell(
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                              Icons.edit,
                                              size: 20,
                                            ),
                                            tooltip: '修改信息',
                                            onPressed: () =>
                                                _showModifyInfoDialog(
                                                  context,
                                                  ref,
                                                  schoolId,
                                                  course,
                                                ),
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.calendar_today,
                                              size: 20,
                                            ),
                                            tooltip: '排课',
                                            onPressed: () =>
                                                _showAddCourseTimeDialog(
                                                  context,
                                                  ref,
                                                  schoolId,
                                                  course,
                                                ),
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.delete,
                                              size: 20,
                                              color: Colors.red,
                                            ),
                                            tooltip: '删除',
                                            onPressed: () => _deleteCourse(
                                              context,
                                              ref,
                                              schoolId,
                                              course.id,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        ),
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

  void _showModifyInfoDialog(
    BuildContext context,
    WidgetRef ref,
    String schoolId,
    Course? course,
  ) {
    showDialog(
      context: context,
      builder: (context) => _ModifyScheduleInfoDialog(
        schoolId: schoolId,
        initialCourseId: course?.id,
      ),
    );
  }

  void _showAddCourseTimeDialog(
    BuildContext context,
    WidgetRef ref,
    String schoolId,
    Course course,
  ) {
    showDialog(
      context: context,
      builder: (context) =>
          _AddCourseTimeDialog(schoolId: schoolId, courseId: course.id),
    );
  }

  Future<void> _showCreateCourseDialog(
    BuildContext context,
    WidgetRef ref,
    String schoolId,
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
              try {
                await ref
                    .read(adminRepositoryProvider)
                    .createCourse(
                      schoolId: schoolId,
                      name: nameController.text,
                      description: descController.text,
                    );
                ref.invalidate(courseListProvider(schoolId));
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
    String schoolId,
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
        ref.invalidate(courseListProvider(schoolId));
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }
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
        onPressed: () => _showTimeSlotDialog(context, ref, schoolId),
        child: const Icon(Icons.add),
      ),
      body: timeSlotsAsync.when(
        data: (slots) {
          if (slots.isEmpty) {
            return const Center(child: Text('暂无时间段'));
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: SizedBox(
                width: double.infinity,
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(Colors.grey.shade50),
                  columns: const [
                    DataColumn(label: Text('名称')),
                    DataColumn(label: Text('开始时间')),
                    DataColumn(label: Text('结束时间')),
                    DataColumn(label: Text('操作')),
                  ],
                  rows: slots.map((slot) {
                    return DataRow(
                      cells: [
                        DataCell(Text(slot.name)),
                        DataCell(Text(slot.startTime)),
                        DataCell(Text(slot.endTime)),
                        DataCell(
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, size: 20),
                                tooltip: '编辑',
                                onPressed: () => _showTimeSlotDialog(
                                  context,
                                  ref,
                                  schoolId,
                                  slot: slot,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                tooltip: '删除',
                                onPressed: () => _deleteTimeSlot(
                                  context,
                                  ref,
                                  schoolId,
                                  slot.id,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  void _showTimeSlotDialog(
    BuildContext context,
    WidgetRef ref,
    String schoolId, {
    TimeSlot? slot,
  }) {
    showDialog(
      context: context,
      builder: (context) => _TimeSlotDialog(schoolId: schoolId, slot: slot),
    );
  }

  Future<void> _deleteTimeSlot(
    BuildContext context,
    WidgetRef ref,
    String schoolId,
    String id,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: const Text('确定要删除这个时间段吗？'),
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
        await ref
            .read(scheduleControllerProvider.notifier)
            .deleteTimeSlot(schoolId: schoolId, id: id);
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }
  }
}

class _TimeSlotDialog extends HookConsumerWidget {
  const _TimeSlotDialog({required this.schoolId, this.slot});

  final String schoolId;
  final TimeSlot? slot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController(text: slot?.name);
    final startTime = useState<String?>(slot?.startTime);
    final endTime = useState<String?>(slot?.endTime);

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
      title: Text(slot == null ? '添加时间段' : '编辑时间段'),
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

            try {
              if (slot == null) {
                await ref
                    .read(scheduleControllerProvider.notifier)
                    .createTimeSlot(
                      schoolId: schoolId,
                      name: nameController.text,
                      startTime: startTime.value!,
                      endTime: endTime.value!,
                    );
              } else {
                await ref
                    .read(scheduleControllerProvider.notifier)
                    .updateTimeSlot(
                      schoolId: schoolId,
                      id: slot!.id,
                      name: nameController.text,
                      startTime: startTime.value!,
                      endTime: endTime.value!,
                    );
              }

              final state = ref.read(scheduleControllerProvider);
              if (state.hasError) {
                throw state.error!;
              }

              if (context.mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(slot == null ? '时间段已添加' : '时间段已更新')),
                );
              }
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(e.toString())));
              }
            }
          },
          child: Text(slot == null ? '添加' : '保存'),
        ),
      ],
    );
  }
}

class _ModifyScheduleInfoDialog extends HookConsumerWidget {
  const _ModifyScheduleInfoDialog({
    required this.schoolId,
    this.initialCourseId,
  });

  final String schoolId;
  final String? initialCourseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCourseId = useState<String?>(initialCourseId);
    final nameController = useTextEditingController();
    final descController = useTextEditingController();

    final coursesAsync = ref.watch(courseListProvider(schoolId));
    final courses = coursesAsync.asData?.value ?? [];

    useEffect(() {
      if (initialCourseId != null && courses.isNotEmpty) {
        try {
          final course = courses.firstWhere((c) => c.id == initialCourseId);
          nameController.text = course.name;
          descController.text = course.description;
        } catch (_) {}
      }
      return null;
    }, [courses, initialCourseId]);

    return AlertDialog(
      title: const Text('修改课程信息'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: '课程名称'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descController,
              decoration: const InputDecoration(labelText: '课程描述'),
              maxLines: 3,
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
            if (selectedCourseId.value == null || nameController.text.isEmpty) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('请填写完整信息')));
              return;
            }

            try {
              await ref
                  .read(adminRepositoryProvider)
                  .updateCourse(
                    id: selectedCourseId.value!,
                    name: nameController.text,
                    description: descController.text,
                  );
              ref.invalidate(courseListProvider(schoolId));
              if (context.mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('修改成功')));
              }
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('修改失败: $e')));
              }
            }
          },
          child: const Text('保存'),
        ),
      ],
    );
  }
}

class _AddCourseTimeDialog extends HookConsumerWidget {
  const _AddCourseTimeDialog({required this.schoolId, required this.courseId});

  final String schoolId;
  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSlotId = useState<String?>(null);
    final selectedDayOfWeek = useState<int>(1);
    final selectedClassroomId = useState<String?>(null);
    final selectedTeacherId = useState<String?>(null);
    final selectedClassId = useState<String?>(null);
    final startDate = useState<DateTime>(DateTime.now());
    final endDate = useState<DateTime>(
      DateTime.now().add(const Duration(days: 365)),
    );

    final timeSlotsAsync = ref.watch(timeSlotsProvider(schoolId));
    final timeSlots = timeSlotsAsync.asData?.value ?? [];

    final classroomsAsync = ref.watch(classroomsProvider);
    final classrooms = classroomsAsync.asData?.value ?? [];

    final teachersAsync = ref.watch(teacherListProvider);
    final teachers = teachersAsync.asData?.value ?? [];

    final deptTreeAsync = ref.watch(adminDepartmentTreeProvider);
    final classes =
        deptTreeAsync.asData?.value.expand((n) => n.classes).toList() ?? [];

    // Watch the controller state to handle loading and errors
    final scheduleState = ref.watch(scheduleControllerProvider);

    return AlertDialog(
      title: const Text('新增排课信息'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              initialValue: classes.any((c) => c.id == selectedClassId.value)
                  ? selectedClassId.value
                  : null,
              decoration: const InputDecoration(labelText: '班级'),
              items: classes
                  .map(
                    (c) => DropdownMenuItem(value: c.id, child: Text(c.name)),
                  )
                  .toList(),
              onChanged: (v) => selectedClassId.value = v,
            ),
            DropdownButtonFormField<String>(
              initialValue: timeSlots.any((s) => s.id == selectedSlotId.value)
                  ? selectedSlotId.value
                  : null,
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
              initialValue: selectedDayOfWeek.value,
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
            DropdownButtonFormField<String>(
              initialValue:
                  classrooms.any((c) => c.id == selectedClassroomId.value)
                  ? selectedClassroomId.value
                  : null,
              decoration: const InputDecoration(labelText: '教室 (可选)'),
              items: [
                const DropdownMenuItem<String>(value: null, child: Text('无')),
                ...classrooms.map(
                  (c) => DropdownMenuItem(value: c.id, child: Text(c.location)),
                ),
              ],
              onChanged: (v) {
                selectedClassroomId.value = v;
              },
            ),
            DropdownButtonFormField<String>(
              initialValue: teachers.any((t) => t.id == selectedTeacherId.value)
                  ? selectedTeacherId.value
                  : null,
              decoration: const InputDecoration(labelText: '教师 (可选)'),
              items: [
                const DropdownMenuItem<String>(value: null, child: Text('无')),
                ...teachers.map(
                  (t) => DropdownMenuItem(value: t.id, child: Text(t.name)),
                ),
              ],
              onChanged: (v) {
                selectedTeacherId.value = v;
              },
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
          onPressed: scheduleState.isLoading
              ? null
              : () async {
                  if (selectedClassId.value == null) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('请选择班级')));
                    return;
                  }
                  if (selectedSlotId.value == null) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('请选择时间段')));
                    return;
                  }

                  try {
                    String location = '';
                    if (selectedClassroomId.value != null) {
                      final classroom = classrooms.firstWhere(
                        (c) => c.id == selectedClassroomId.value,
                      );
                      location = classroom.location;
                    }

                    await ref
                        .read(scheduleControllerProvider.notifier)
                        .createScheduleRule(
                          schoolId: schoolId,
                          courseId: courseId,
                          classId: selectedClassId.value!,
                          teacherId: selectedTeacherId.value,
                          slotId: selectedSlotId.value!,
                          dayOfWeek: selectedDayOfWeek.value,
                          location: location,
                          classroomId: selectedClassroomId.value,
                          startDate: startDate.value,
                          endDate: endDate.value,
                        );

                    // Check for error in the state
                    final currentState = ref.read(scheduleControllerProvider);
                    if (currentState.hasError) {
                      throw currentState.error!;
                    }

                    ref.invalidate(courseListProvider(schoolId));
                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('上课时间已添加')));
                    }
                  } catch (e) {
                    if (context.mounted) {
                      String message = e.toString();
                      if (message.contains('classroom is already booked')) {
                        message = '该教室在此时间段已被占用';
                      } else if (message.contains(
                        'teacher is already booked',
                      )) {
                        message = '该教师在此时间段已有课程';
                      } else if (message.contains('class is already booked')) {
                        message = '该班级在此时间段已有课程';
                      } else {
                        message = '添加失败: $message';
                      }
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(message)));
                    }
                  }
                },
          child: scheduleState.isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('添加'),
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
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.blue.shade100),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '排课概览',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  '覆盖率: ${(scheduledPercent * 100).toStringAsFixed(1)}%',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _StatItem(
                          label: '总课程',
                          value: stats.totalCourses.toString(),
                          color: Colors.blue,
                          compact: true,
                        ),
                      ),
                      Expanded(
                        child: _StatItem(
                          label: '已排',
                          value: stats.scheduledCoursesCount.toString(),
                          color: Colors.green,
                          compact: true,
                        ),
                      ),
                      Expanded(
                        child: _StatItem(
                          label: '未排',
                          value: stats.unscheduledCoursesCount.toString(),
                          color: Colors.orange,
                          compact: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: scheduledPercent,
                      backgroundColor: Colors.white,
                      color: Colors.blue,
                      minHeight: 6,
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
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.label,
    required this.value,
    required this.color,
    this.compact = false,
  });

  final String label;
  final String value;
  final Color color;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
        ],
      );
    }
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
