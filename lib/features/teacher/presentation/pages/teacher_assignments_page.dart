import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../auth/application/auth_controller.dart';
import '../../application/teacher_assignment_provider.dart';
import '../../data/teacher_repository.dart';
import '../../domain/teacher_models.dart';

class TeacherAssignmentsPage extends ConsumerWidget {
  const TeacherAssignmentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assignmentsAsync = ref.watch(teacherAssignmentsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('作业管理')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await context.push<bool>(
            '/teacher/assignments/create',
          );
          if (result == true) {
            ref.invalidate(teacherAssignmentsProvider);
          }
        },
        child: const Icon(Icons.add),
      ),
      body: assignmentsAsync.when(
        data: (assignments) {
          if (assignments.isEmpty) {
            return const Center(child: Text('暂无作业'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: assignments.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final assignment = assignments[index];
              return _AssignmentCard(assignment: assignment);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('加载失败: $error')),
      ),
    );
  }
}

class _AssignmentCard extends StatelessWidget {
  const _AssignmentCard({required this.assignment});

  final TeacherAssignment assignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isExpired =
        assignment.dueAt != null && assignment.dueAt!.isBefore(DateTime.now());

    String dueText;
    try {
      dueText = assignment.dueAt != null
          ? DateFormat('yyyy-MM-dd HH:mm').format(assignment.dueAt!)
          : '无截止时间';
    } catch (e) {
      dueText = assignment.dueAt?.toString() ?? '无截止时间';
    }

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.colorScheme.outlineVariant),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          context.push(
            '/teacher/assignments/${assignment.id}/submissions',
            extra: assignment,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          assignment.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${assignment.courseName} · ${assignment.className}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isExpired)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.errorContainer,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '已截止',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onErrorContainer,
                        ),
                      ),
                    ),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'edit') {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              _EditAssignmentDialog(assignment: assignment),
                        );
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(value: 'edit', child: Text('修改截止时间')),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 16,
                    color: isExpired
                        ? theme.colorScheme.error
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '截止时间: $dueText',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isExpired
                          ? theme.colorScheme.error
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(height: 1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _StatItem(
                    label: '总人数',
                    value: '${assignment.classStudentCount}',
                  ),
                  _StatItem(
                    label: '已提交',
                    value: '${assignment.submittedCount}',
                    color: Colors.green,
                  ),
                  _StatItem(
                    label: '待批改',
                    value: '${assignment.pendingGradeCount}',
                    color: Colors.orange,
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

class _StatItem extends StatelessWidget {
  const _StatItem({required this.label, required this.value, this.color});

  final String label;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _EditAssignmentDialog extends HookConsumerWidget {
  const _EditAssignmentDialog({required this.assignment});
  final TeacherAssignment assignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dueAt = useState<DateTime?>(assignment.dueAt);
    final isSubmitting = useState(false);
    final repository = ref.watch(teacherRepositoryProvider);
    final authState = ref.watch(authStateProvider);

    return AlertDialog(
      title: const Text('修改作业'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: dueAt.value ?? DateTime.now(),
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (date != null && context.mounted) {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(
                    dueAt.value ?? DateTime.now(),
                  ),
                );
                if (time != null) {
                  dueAt.value = DateTime(
                    date.year,
                    date.month,
                    date.day,
                    time.hour,
                    time.minute,
                  );
                }
              }
            },
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: '截止时间',
                border: OutlineInputBorder(),
              ),
              child: Text(
                dueAt.value != null
                    ? DateFormat('yyyy-MM-dd HH:mm').format(dueAt.value!)
                    : '无截止时间',
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
        FilledButton(
          onPressed: isSubmitting.value
              ? null
              : () async {
                  isSubmitting.value = true;
                  try {
                    await repository.updateAssignment(
                      assignment.id,
                      UpdateAssignmentRequest(
                        teacherId: authState.account?.id ?? '',
                        dueAt: dueAt.value,
                      ),
                    );
                    if (context.mounted) {
                      ref.invalidate(teacherAssignmentsProvider);
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
                  } finally {
                    isSubmitting.value = false;
                  }
                },
          child: isSubmitting.value
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('保存'),
        ),
      ],
    );
  }
}
