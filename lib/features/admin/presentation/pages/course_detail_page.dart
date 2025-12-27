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
    final schoolId = ref.watch(authStateProvider).account?.schoolId ?? '';

    final teacherRequest = AdminAccountListRequest(
      schoolId: schoolId,
      role: AdminAccountRole.teacher,
      courseId: widget.course.id,
      page: 1,
      pageSize: 100,
    );

    final assignmentRequest = AdminCourseAssignmentsRequest(
      schoolId: schoolId,
      courseId: widget.course.id,
    );

    final teachersAsync = ref.watch(adminAccountListProvider(teacherRequest));
    final assignmentsAsync = ref.watch(
      adminCourseAssignmentsProvider(assignmentRequest),
    );

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: _CourseOverviewCard(
              course: widget.course,
              teachersAsync: teachersAsync,
              assignmentsAsync: assignmentsAsync,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _TeacherListTab(
                  course: widget.course,
                  teacherRequest: teacherRequest,
                  teachersAsync: teachersAsync,
                ),
                _ClassAssignmentTab(
                  course: widget.course,
                  assignmentRequest: assignmentRequest,
                  assignmentsAsync: assignmentsAsync,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CourseOverviewCard extends StatelessWidget {
  const _CourseOverviewCard({
    required this.course,
    required this.teachersAsync,
    required this.assignmentsAsync,
  });

  final Course course;
  final AsyncValue<AdminAccountPage> teachersAsync;
  final AsyncValue<List<CourseAssignment>> assignmentsAsync;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final teacherCount =
        teachersAsync.asData?.value.accounts.length ??
        (teachersAsync.isLoading ? null : 0);
    final classes = assignmentsAsync.asData?.value;
    final classCount =
        classes?.length ?? (assignmentsAsync.isLoading ? null : 0);
    final studentTotal =
        classes?.fold<int>(0, (sum, item) => sum + item.studentCount) ??
        (assignmentsAsync.isLoading ? null : 0);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primaryContainer,
            theme.colorScheme.secondaryContainer,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.menu_book_outlined,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.name,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        course.description.isNotEmpty
                            ? course.description
                            : '暂无课程描述',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer
                              .withValues(alpha: 0.8),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(
                  avatar: const Icon(Icons.tag, size: 16),
                  label: Text('课程 ID: ${course.id}'),
                  backgroundColor: theme.colorScheme.surface,
                ),
                Chip(
                  avatar: const Icon(Icons.apartment_outlined, size: 16),
                  label: Text('学校 ID: ${course.schoolId}'),
                  backgroundColor: theme.colorScheme.surface,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _StatTile(
                  label: '教师数',
                  value: _formatStat(teacherCount),
                  icon: Icons.person_outline,
                ),
                _StatTile(
                  label: '班级数',
                  value: _formatStat(classCount),
                  icon: Icons.class_outlined,
                ),
                _StatTile(
                  label: '学生数',
                  value: _formatStat(studentTotal),
                  icon: Icons.groups_2_outlined,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatStat(int? value) {
    if (value == null) {
      return '…';
    }
    if (value <= 0) {
      return '0';
    }
    return value.toString();
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: theme.colorScheme.onPrimaryContainer),
              const SizedBox(width: 6),
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _TeacherListTab extends ConsumerWidget {
  const _TeacherListTab({
    required this.course,
    required this.teacherRequest,
    required this.teachersAsync,
  });

  final Course course;
  final AdminAccountListRequest teacherRequest;
  final AsyncValue<AdminAccountPage> teachersAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return teachersAsync.when(
      data: (page) {
        if (page.accounts.isEmpty) {
          return const Center(child: Text('暂无教师数据'));
        }

        return RefreshIndicator(
          onRefresh: () async =>
              ref.invalidate(adminAccountListProvider(teacherRequest)),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: page.accounts.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final teacher = page.accounts[index];
              return Card(
                elevation: 0,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: theme.colorScheme.primaryContainer,
                    foregroundColor: theme.colorScheme.onPrimaryContainer,
                    child: Text(
                      teacher.name.isNotEmpty ? teacher.name[0] : '?',
                    ),
                  ),
                  title: Text(teacher.name),
                  subtitle: Text('工号/账号：${teacher.identifier}'),
                  trailing: const Icon(Icons.chevron_right),
                ),
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('加载失败: $err'),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () =>
                ref.invalidate(adminAccountListProvider(teacherRequest)),
            child: const Text('重试'),
          ),
        ],
      ),
    );
  }
}

class _ClassAssignmentTab extends ConsumerWidget {
  const _ClassAssignmentTab({
    required this.course,
    required this.assignmentRequest,
    required this.assignmentsAsync,
  });

  final Course course;
  final AdminCourseAssignmentsRequest assignmentRequest;
  final AsyncValue<List<CourseAssignment>> assignmentsAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
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
                '排课调整请前往教务管理',
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
              return RefreshIndicator(
                onRefresh: () async => ref.invalidate(
                  adminCourseAssignmentsProvider(assignmentRequest),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: assignments.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final assignment = assignments[index];
                    return Card(
                      elevation: 0,
                      child: ListTile(
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
                              Text(
                                '任课教师: ${assignment.teacherNames.join(", ")}',
                              ),
                          ],
                        ),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    );
                  },
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('加载失败: $err'),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () => ref.invalidate(
                    adminCourseAssignmentsProvider(assignmentRequest),
                  ),
                  child: const Text('重试'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
