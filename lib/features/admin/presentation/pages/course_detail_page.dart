import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../application/admin_providers.dart';
import '../../data/admin_repository.dart';
import '../../domain/accounts.dart';
import '../../domain/course.dart';
import '../../domain/models.dart';
import '../../../auth/application/auth_controller.dart';

class CourseDetailPage extends ConsumerStatefulWidget {
  const CourseDetailPage({super.key, required this.course});

  final Course course;

  @override
  ConsumerState<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends ConsumerState<CourseDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('课程详情'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '学生列表'),
            Tab(text: '教师列表'),
            Tab(text: '班级分配'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _StudentListTab(course: widget.course),
          _TeacherListTab(course: widget.course),
          _ClassAssignmentTab(course: widget.course),
        ],
      ),
    );
  }
}

class _StudentListTab extends ConsumerWidget {
  const _StudentListTab({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schoolId = ref.watch(authStateProvider).account?.schoolId ?? '';
    final request = AdminAccountListRequest(
      schoolId: schoolId,
      role: AdminAccountRole.student,
      courseId: course.id,
      page: 1,
      pageSize: 100,
    );

    final studentsAsync = ref.watch(adminAccountListProvider(request));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () => _showAssignStudentDialog(context, ref, course),
                icon: const Icon(Icons.person_add),
                label: const Text('分配学生'),
              ),
            ],
          ),
        ),
        Expanded(
          child: studentsAsync.when(
            data: (page) {
              if (page.accounts.isEmpty) {
                return const Center(child: Text('暂无学生数据'));
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: page.accounts.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final student = page.accounts[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        student.name.isNotEmpty ? student.name[0] : '?',
                      ),
                    ),
                    title: Text(student.name),
                    subtitle: Text(
                      '${student.identifier} - ${student.className ?? "未分配班级"}',
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('加载失败: $err')),
          ),
        ),
      ],
    );
  }
}

class _TeacherListTab extends ConsumerWidget {
  const _TeacherListTab({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schoolId = ref.watch(authStateProvider).account?.schoolId ?? '';
    final request = AdminAccountListRequest(
      schoolId: schoolId,
      role: AdminAccountRole.teacher,
      courseId: course.id,
      page: 1,
      pageSize: 100,
    );

    final teachersAsync = ref.watch(adminAccountListProvider(request));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () => _showAssignTeacherDialog(context, ref, course),
                icon: const Icon(Icons.person_add),
                label: const Text('分配教师'),
              ),
            ],
          ),
        ),
        Expanded(
          child: teachersAsync.when(
            data: (page) {
              if (page.accounts.isEmpty) {
                return const Center(child: Text('暂无教师数据'));
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: page.accounts.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final teacher = page.accounts[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        teacher.name.isNotEmpty ? teacher.name[0] : '?',
                      ),
                    ),
                    title: Text(teacher.name),
                    subtitle: Text(
                      '${teacher.identifier} - ${teacher.department ?? "未分配院系"}',
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('加载失败: $err')),
          ),
        ),
      ],
    );
  }
}

class _ClassAssignmentTab extends ConsumerStatefulWidget {
  const _ClassAssignmentTab({required this.course});

  final Course course;

  @override
  ConsumerState<_ClassAssignmentTab> createState() =>
      _ClassAssignmentTabState();
}

class _ClassAssignmentTabState extends ConsumerState<_ClassAssignmentTab> {
  bool _isSelectionMode = false;
  final Set<String> _selectedAssignmentIds = {};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final schoolId = ref.watch(authStateProvider).account?.schoolId ?? '';
    final request = AdminCourseAssignmentsRequest(
      schoolId: schoolId,
      courseId: widget.course.id,
    );
    final assignmentsAsync = ref.watch(adminCourseAssignmentsProvider(request));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '已分配班级',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_isSelectionMode) ...[
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isSelectionMode = false;
                            _selectedAssignmentIds.clear();
                          });
                        },
                        child: const Text('取消'),
                      ),
                      FilledButton.tonal(
                        onPressed: _selectedAssignmentIds.isEmpty
                            ? null
                            : () {
                                final list = assignmentsAsync.valueOrNull ?? [];
                                if (list.isNotEmpty) {
                                  _batchRemove(context, ref, list);
                                }
                              },
                        child: Text('移除(${_selectedAssignmentIds.length})'),
                      ),
                    ] else ...[
                      OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            _isSelectionMode = true;
                          });
                        },
                        icon: const Icon(Icons.checklist),
                        label: const Text('批量管理'),
                      ),
                      const SizedBox(width: 8),
                      FilledButton.icon(
                        onPressed: () => _showAssignDialog(context, ref),
                        icon: const Icon(Icons.add),
                        label: const Text('分配班级'),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: assignmentsAsync.when(
            data: (assignments) {
              if (assignments.isEmpty) {
                return const Center(child: Text('暂无班级分配'));
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: assignments.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final assignment = assignments[index];
                  return ListTile(
                    leading: _isSelectionMode
                        ? Checkbox(
                            value: _selectedAssignmentIds.contains(
                              assignment.id,
                            ),
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  _selectedAssignmentIds.add(assignment.id);
                                } else {
                                  _selectedAssignmentIds.remove(assignment.id);
                                }
                              });
                            },
                          )
                        : const Icon(Icons.class_),
                    title: Text(assignment.className ?? assignment.classId),
                    subtitle: Text(
                      '分配教师: ${assignment.teacherCount} 人, 学生: ${assignment.studentCount} 人',
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('加载失败: $err')),
          ),
        ),
      ],
    );
  }

  Future<void> _batchRemove(
    BuildContext context,
    WidgetRef ref,
    List<TeachingAssignment> assignments,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认移除'),
        content: Text('确定要移除选中的 ${_selectedAssignmentIds.length} 个班级分配吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('移除'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final idsToRemove = <String>[];
      for (final assignment in assignments) {
        if (_selectedAssignmentIds.contains(assignment.id)) {
          idsToRemove.addAll(assignment.assignmentIds);
        }
      }

      try {
        await ref
            .read(adminRepositoryProvider)
            .batchRemoveAssignments(assignmentIds: idsToRemove);
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('移除成功')));
          setState(() {
            _isSelectionMode = false;
            _selectedAssignmentIds.clear();
          });
          ref.invalidate(
            adminCourseAssignmentsProvider(
              AdminCourseAssignmentsRequest(
                schoolId: ref.read(authStateProvider).account?.schoolId ?? '',
                courseId: widget.course.id,
              ),
            ),
          );
          ref.invalidate(
            adminAccountListProvider(
              AdminAccountListRequest(
                schoolId: ref.read(authStateProvider).account?.schoolId ?? '',
                role: AdminAccountRole.student,
                courseId: widget.course.id,
                page: 1,
                pageSize: 100,
              ),
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('移除失败: $e')));
        }
      }
    }
  }

  void _showAssignDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => _AssignDialog(course: widget.course),
    );
  }
}

class _AssignDialog extends ConsumerStatefulWidget {
  const _AssignDialog({required this.course});

  final Course course;

  @override
  ConsumerState<_AssignDialog> createState() => _AssignDialogState();
}

class _AssignDialogState extends ConsumerState<_AssignDialog> {
  String? _selectedDepartmentId;
  final Set<String> _selectedClassIds = {};
  bool _assignToWholeDepartment = false;

  @override
  Widget build(BuildContext context) {
    final departmentsAsync = ref.watch(adminDepartmentTreeProvider);

    return AlertDialog(
      title: const Text('分配班级'),
      content: SizedBox(
        width: double.maxFinite,
        child: departmentsAsync.when(
          data: (nodes) {
            final departments = nodes.map((n) => n.department).toList();
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: '选择院系'),
                  items: departments.map((dept) {
                    return DropdownMenuItem(
                      value: dept.id,
                      child: Text(dept.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedDepartmentId = value;
                      _selectedClassIds.clear();
                      _assignToWholeDepartment = false;
                    });
                  },
                ),
                const SizedBox(height: 16),
                if (_selectedDepartmentId != null) ...[
                  CheckboxListTile(
                    title: const Text('分配给该院系所有班级'),
                    value: _assignToWholeDepartment,
                    onChanged: (value) {
                      setState(() {
                        _assignToWholeDepartment = value ?? false;
                        if (_assignToWholeDepartment) {
                          _selectedClassIds.clear();
                        }
                      });
                    },
                  ),
                  if (!_assignToWholeDepartment) ...[
                    const SizedBox(height: 8),
                    const Text('选择班级:'),
                    const SizedBox(height: 8),
                    SizedBox(height: 200, child: _buildClassList(nodes)),
                  ],
                ],
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Text('加载失败: $err'),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
        FilledButton(
          onPressed:
              (_selectedDepartmentId == null ||
                  (!_assignToWholeDepartment && _selectedClassIds.isEmpty))
              ? null
              : () => _submit(context, ref),
          child: const Text('确定'),
        ),
      ],
    );
  }

  Widget _buildClassList(List<DepartmentNode> nodes) {
    final node = nodes.firstWhere(
      (n) => n.department.id == _selectedDepartmentId,
      orElse: () => nodes.first,
    );

    if (node.classes.isEmpty) {
      return const Text('该院系暂无班级');
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: node.classes.length,
      itemBuilder: (context, index) {
        final cls = node.classes[index];
        return CheckboxListTile(
          title: Text(cls.name),
          value: _selectedClassIds.contains(cls.id),
          onChanged: (value) {
            setState(() {
              if (value == true) {
                _selectedClassIds.add(cls.id);
              } else {
                _selectedClassIds.remove(cls.id);
              }
            });
          },
        );
      },
    );
  }

  Future<void> _submit(BuildContext context, WidgetRef ref) async {
    try {
      final schoolId = ref.read(authStateProvider).account?.schoolId ?? '';
      await ref
          .read(adminRepositoryProvider)
          .batchAssignCourse(
            schoolId: schoolId,
            courseId: widget.course.id,
            teacherId: widget.course.teacherId ?? '',
            departmentId: _assignToWholeDepartment
                ? _selectedDepartmentId
                : null,
            classIds: _assignToWholeDepartment
                ? null
                : _selectedClassIds.toList(),
          );
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('分配成功')));
        ref.invalidate(
          adminCourseAssignmentsProvider(
            AdminCourseAssignmentsRequest(
              schoolId: schoolId,
              courseId: widget.course.id,
            ),
          ),
        );
        ref.invalidate(
          adminAccountListProvider(
            AdminAccountListRequest(
              schoolId: schoolId,
              role: AdminAccountRole.student,
              courseId: widget.course.id,
              page: 1,
              pageSize: 100,
            ),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('分配失败: $e')));
      }
    }
  }
}

void _showAssignStudentDialog(
  BuildContext context,
  WidgetRef ref,
  Course course,
) {
  showDialog(
    context: context,
    builder: (context) => _AssignStudentDialog(course: course),
  );
}

void _showAssignTeacherDialog(
  BuildContext context,
  WidgetRef ref,
  Course course,
) {
  showDialog(
    context: context,
    builder: (context) => _AssignTeacherDialog(course: course),
  );
}

class _AssignStudentDialog extends ConsumerStatefulWidget {
  const _AssignStudentDialog({required this.course});
  final Course course;

  @override
  ConsumerState<_AssignStudentDialog> createState() =>
      _AssignStudentDialogState();
}

class _AssignStudentDialogState extends ConsumerState<_AssignStudentDialog>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();
  String _searchQuery = '';
  final Set<AdminAccount> _selectedStudents = {};
  String? _selectedDepartmentId;
  String? _selectedClassId;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deptTreeAsync = ref.watch(adminDepartmentTreeProvider);

    return AlertDialog(
      title: const Text('分配学生'),
      content: SizedBox(
        width: 600,
        height: 500,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              labelColor: Theme.of(context).primaryColor,
              tabs: const [
                Tab(text: '选择学生'),
                Tab(text: '按班级'),
                Tab(text: '按院系'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Select Students
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            labelText: '搜索学生 (姓名/学号)',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (val) {
                            setState(() {
                              _searchQuery = val;
                            });
                          },
                        ),
                      ),
                      if (_selectedStudents.isNotEmpty)
                        Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: _selectedStudents.map((s) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Chip(
                                  label: Text(s.name),
                                  onDeleted: () {
                                    setState(() {
                                      _selectedStudents.remove(s);
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      Expanded(child: _buildStudentList()),
                    ],
                  ),
                  // By Class
                  deptTreeAsync.when(
                    data: (nodes) {
                      final departments = nodes
                          .map((n) => n.department)
                          .toList();
                      final classes = nodes
                          .where(
                            (n) => n.department.id == _selectedDepartmentId,
                          )
                          .expand((n) => n.classes)
                          .toList();
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: '选择院系',
                              ),
                              items: departments
                                  .map(
                                    (d) => DropdownMenuItem(
                                      value: d.id,
                                      child: Text(d.name),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) => setState(() {
                                _selectedDepartmentId = val;
                                _selectedClassId = null;
                              }),
                              initialValue: _selectedDepartmentId,
                            ),
                            const SizedBox(height: 16),
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: '选择班级',
                              ),
                              items: classes
                                  .map(
                                    (c) => DropdownMenuItem(
                                      value: c.id,
                                      child: Text(c.name),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => _selectedClassId = val),
                              initialValue: _selectedClassId,
                            ),
                          ],
                        ),
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, s) => Text('Error: $e'),
                  ),
                  // By Department
                  deptTreeAsync.when(
                    data: (nodes) {
                      final departments = nodes
                          .map((n) => n.department)
                          .toList();
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: '选择院系',
                              ),
                              items: departments
                                  .map(
                                    (d) => DropdownMenuItem(
                                      value: d.id,
                                      child: Text(d.name),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => _selectedDepartmentId = val),
                              initialValue: _selectedDepartmentId,
                            ),
                          ],
                        ),
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, s) => Text('Error: $e'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
        FilledButton(
          onPressed: () async {
            try {
              final repo = ref.read(adminRepositoryProvider);
              if (_tabController.index == 0) {
                final ids = _selectedStudents.map((e) => e.id).toList();
                if (ids.isEmpty) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('请选择学生')));
                  return;
                }
                await repo.assignStudents(
                  courseId: widget.course.id,
                  studentIds: ids,
                );
              } else if (_tabController.index == 1) {
                if (_selectedClassId == null) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('请选择班级')));
                  return;
                }
                await repo.assignStudents(
                  courseId: widget.course.id,
                  classId: _selectedClassId,
                );
              } else {
                if (_selectedDepartmentId == null) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('请选择院系')));
                  return;
                }
                await repo.assignStudents(
                  courseId: widget.course.id,
                  departmentId: _selectedDepartmentId,
                );
              }
              if (context.mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('分配成功')));
                final schoolId =
                    ref.read(authStateProvider).account?.schoolId ?? '';
                ref.invalidate(
                  adminAccountListProvider(
                    AdminAccountListRequest(
                      schoolId: schoolId,
                      role: AdminAccountRole.student,
                      courseId: widget.course.id,
                      page: 1,
                      pageSize: 100,
                    ),
                  ),
                );
              }
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('分配失败: $e')));
              }
            }
          },
          child: const Text('确定'),
        ),
      ],
    );
  }

  Widget _buildStudentList() {
    final schoolId = ref.watch(authStateProvider).account?.schoolId ?? '';
    final request = AdminAccountListRequest(
      schoolId: schoolId,
      role: AdminAccountRole.student,
      page: 1,
      pageSize: 20,
      query: _searchQuery,
    );

    final accountsAsync = ref.watch(adminAccountListProvider(request));

    return accountsAsync.when(
      data: (page) {
        if (page.accounts.isEmpty) {
          return const Center(child: Text('未找到学生'));
        }
        return ListView.builder(
          itemCount: page.accounts.length,
          itemBuilder: (context, index) {
            final student = page.accounts[index];
            final isSelected = _selectedStudents.any((s) => s.id == student.id);
            return ListTile(
              leading: CircleAvatar(
                child: Text(student.name.isNotEmpty ? student.name[0] : '?'),
              ),
              title: Text(student.name),
              subtitle: Text(
                '${student.identifier} - ${student.className ?? "未分配班级"}',
              ),
              trailing: isSelected
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : const Icon(Icons.circle_outlined),
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedStudents.removeWhere((s) => s.id == student.id);
                  } else {
                    _selectedStudents.add(student);
                  }
                });
              },
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('加载失败: $err')),
    );
  }
}

class _AssignTeacherDialog extends ConsumerStatefulWidget {
  const _AssignTeacherDialog({required this.course});
  final Course course;

  @override
  ConsumerState<_AssignTeacherDialog> createState() =>
      _AssignTeacherDialogState();
}

class _AssignTeacherDialogState extends ConsumerState<_AssignTeacherDialog>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();
  String _searchQuery = '';
  final Set<AdminAccount> _selectedTeachers = {};
  String? _selectedDepartmentId;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deptTreeAsync = ref.watch(adminDepartmentTreeProvider);

    return AlertDialog(
      title: const Text('分配教师'),
      content: SizedBox(
        width: 600,
        height: 500,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              labelColor: Theme.of(context).primaryColor,
              tabs: const [
                Tab(text: '选择教师'),
                Tab(text: '按院系'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Select Teachers
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            labelText: '搜索教师 (姓名/工号)',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (val) {
                            setState(() {
                              _searchQuery = val;
                            });
                          },
                        ),
                      ),
                      if (_selectedTeachers.isNotEmpty)
                        Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: _selectedTeachers.map((t) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Chip(
                                  label: Text(t.name),
                                  onDeleted: () {
                                    setState(() {
                                      _selectedTeachers.remove(t);
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      Expanded(child: _buildTeacherList()),
                    ],
                  ),
                  // By Department
                  deptTreeAsync.when(
                    data: (nodes) {
                      final departments = nodes
                          .map((n) => n.department)
                          .toList();
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: '选择院系',
                              ),
                              items: departments
                                  .map(
                                    (d) => DropdownMenuItem(
                                      value: d.id,
                                      child: Text(d.name),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => _selectedDepartmentId = val),
                              initialValue: _selectedDepartmentId,
                            ),
                          ],
                        ),
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, s) => Text('Error: $e'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
        FilledButton(
          onPressed: () async {
            try {
              final repo = ref.read(adminRepositoryProvider);
              if (_tabController.index == 0) {
                final ids = _selectedTeachers.map((e) => e.id).toList();
                if (ids.isEmpty) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('请选择教师')));
                  return;
                }
                await repo.assignTeachers(
                  courseId: widget.course.id,
                  teacherIds: ids,
                );
              } else {
                if (_selectedDepartmentId == null) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('请选择院系')));
                  return;
                }
                await repo.assignTeachers(
                  courseId: widget.course.id,
                  departmentId: _selectedDepartmentId,
                );
              }
              if (context.mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('分配成功')));
                final schoolId =
                    ref.read(authStateProvider).account?.schoolId ?? '';
                ref.invalidate(
                  adminAccountListProvider(
                    AdminAccountListRequest(
                      schoolId: schoolId,
                      role: AdminAccountRole.teacher,
                      courseId: widget.course.id,
                      page: 1,
                      pageSize: 100,
                    ),
                  ),
                );
              }
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('分配失败: $e')));
              }
            }
          },
          child: const Text('确定'),
        ),
      ],
    );
  }

  Widget _buildTeacherList() {
    final schoolId = ref.watch(authStateProvider).account?.schoolId ?? '';
    final request = AdminAccountListRequest(
      schoolId: schoolId,
      role: AdminAccountRole.teacher,
      page: 1,
      pageSize: 20,
      query: _searchQuery,
    );

    final accountsAsync = ref.watch(adminAccountListProvider(request));

    return accountsAsync.when(
      data: (page) {
        if (page.accounts.isEmpty) {
          return const Center(child: Text('未找到教师'));
        }
        return ListView.builder(
          itemCount: page.accounts.length,
          itemBuilder: (context, index) {
            final teacher = page.accounts[index];
            final isSelected = _selectedTeachers.any((t) => t.id == teacher.id);
            return ListTile(
              leading: CircleAvatar(
                child: Text(teacher.name.isNotEmpty ? teacher.name[0] : '?'),
              ),
              title: Text(teacher.name),
              subtitle: Text(
                '${teacher.identifier} - ${teacher.department ?? "未分配院系"}',
              ),
              trailing: isSelected
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : const Icon(Icons.circle_outlined),
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedTeachers.removeWhere((t) => t.id == teacher.id);
                  } else {
                    _selectedTeachers.add(teacher);
                  }
                });
              },
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('加载失败: $err')),
    );
  }
}
