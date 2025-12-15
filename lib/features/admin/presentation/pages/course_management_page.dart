import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/features/admin/application/course_providers.dart';
import 'package:learn_go/features/admin/application/admin_providers.dart';
import 'package:learn_go/features/admin/data/admin_repository.dart';
import 'package:learn_go/features/auth/application/auth_controller.dart';
import 'package:learn_go/features/admin/domain/course.dart';
import 'course_detail_page.dart';

class CourseManagementPage extends ConsumerWidget {
  const CourseManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(courseListProvider);
    final deptTreeAsync = ref.watch(adminDepartmentTreeProvider);
    final filter = ref.watch(courseFilterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('课程管理'), centerTitle: true),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateCourseDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('创建课程'),
      ),
      body: Column(
        children: [
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
                          value: filter.departmentId,
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
                          value: filter.classId,
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
                          return _buildCourseCard(context, ref, course);
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

  Widget _buildCourseCard(BuildContext context, WidgetRef ref, Course course) {
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
                  if (course.teacherName != null &&
                      course.teacherName!.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: theme.colorScheme.primary.withOpacity(0.2),
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
                            .withOpacity(0.5),
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
                        color: theme.colorScheme.tertiary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: theme.colorScheme.tertiary.withOpacity(0.2),
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
                            .withOpacity(0.5),
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
