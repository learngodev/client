import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../application/admin_providers.dart';
import '../../domain/accounts.dart';
import '../../domain/course.dart';
import '../../../auth/application/auth_controller.dart';
import 'class_detail_page.dart';

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
    _tabController = TabController(length: 2, vsync: this);
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
            Tab(text: '教师列表'),
            Tab(text: '班级分配'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _TeacherListTab(course: widget.course),
          _ClassAssignmentTab(course: widget.course),
        ],
      ),
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
        Expanded(
          child: teachersAsync.when(
            data: (page) {
              if (page.accounts.isEmpty) {
                return const Center(child: Text('暂无教师数据'));
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
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
                    subtitle: Text(teacher.identifier),
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

class _ClassAssignmentTab extends ConsumerWidget {
  const _ClassAssignmentTab({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final schoolId = ref.watch(authStateProvider).account?.schoolId ?? '';
    final request = AdminCourseAssignmentsRequest(
      schoolId: schoolId,
      courseId: course.id,
    );
    final assignmentsAsync = ref.watch(adminCourseAssignmentsProvider(request));
    final departmentTreeAsync = ref.watch(adminDepartmentTreeProvider);

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
              const Text(
                '（请在排课管理中调整分配）',
                style: TextStyle(color: Colors.grey, fontSize: 12),
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
                    onTap: () {
                      final tree = departmentTreeAsync.valueOrNull;
                      if (tree != null) {
                        for (final node in tree) {
                          final classInfo = node.classes
                              .where((c) => c.id == assignment.classId)
                              .firstOrNull;
                          if (classInfo != null) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ClassDetailPage(
                                  department: node.department,
                                  classInfo: classInfo,
                                ),
                              ),
                            );
                            return;
                          }
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('未找到班级详细信息')),
                        );
                      } else {
                        ref
                            .read(adminDepartmentTreeProvider.notifier)
                            .refresh();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('正在加载班级信息，请稍后重试')),
                        );
                      }
                    },
                    leading: const Icon(Icons.class_),
                    title: Text(
                      assignment.className.isNotEmpty
                          ? assignment.className
                          : assignment.classId,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('学生: ${assignment.studentCount} 人'),
                        if (assignment.teacherNames.isNotEmpty)
                          Text('任课教师: ${assignment.teacherNames.join(", ")}'),
                      ],
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
