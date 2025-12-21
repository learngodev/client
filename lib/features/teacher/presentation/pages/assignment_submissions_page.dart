import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/teacher_repository.dart';
import '../../domain/teacher_models.dart';

final assignmentSubmissionsProvider =
    FutureProvider.family<List<SubmissionSummary>, String>((
      ref,
      assignmentId,
    ) async {
      final repository = ref.watch(teacherRepositoryProvider);
      return repository.listAssignmentSubmissions(assignmentId);
    });

class AssignmentSubmissionsPage extends ConsumerWidget {
  const AssignmentSubmissionsPage({
    super.key,
    required this.assignmentId,
    this.assignmentTitle,
  });

  final String assignmentId;
  final String? assignmentTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final submissionsAsync = ref.watch(
      assignmentSubmissionsProvider(assignmentId),
    );

    return Scaffold(
      appBar: AppBar(title: Text(assignmentTitle ?? '提交列表')),
      body: submissionsAsync.when(
        data: (submissions) {
          if (submissions.isEmpty) {
            return const Center(child: Text('暂无提交'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: submissions.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final submission = submissions[index];
              return _SubmissionCard(
                submission: submission,
                assignmentId: assignmentId,
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('加载失败: $error')),
      ),
    );
  }
}

class _SubmissionCard extends ConsumerWidget {
  const _SubmissionCard({required this.submission, required this.assignmentId});

  final SubmissionSummary submission;
  final String assignmentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    String submittedAtText;
    try {
      submittedAtText = submission.submittedAt != null
          ? DateFormat('MM-dd HH:mm').format(submission.submittedAt!)
          : '未提交';
    } catch (e) {
      submittedAtText = submission.submittedAt?.toString() ?? '未提交';
    }

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.colorScheme.outlineVariant),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () async {
          await context.push('/teacher/grading/$assignmentId/${submission.id}');
          ref.invalidate(assignmentSubmissionsProvider(assignmentId));
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Text(
                  submission.studentName.isNotEmpty
                      ? submission.studentName[0]
                      : '?',
                  style: TextStyle(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      submission.studentName,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '提交时间: $submittedAtText',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _StatusBadge(status: submission.status),
                  if (submission.score != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      '${submission.score}分',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color color;
    String label;
    Color containerColor;

    switch (status) {
      case 'graded':
        color = Colors.green;
        containerColor = Colors.green.withValues(alpha: 0.1);
        label = '已批改';
        break;
      case 'submitted':
        color = Colors.blue;
        containerColor = Colors.blue.withValues(alpha: 0.1);
        label = '待批改';
        break;
      case 'returned':
        color = Colors.orange;
        containerColor = Colors.orange.withValues(alpha: 0.1);
        label = '已打回';
        break;
      default:
        color = Colors.grey;
        containerColor = Colors.grey.withValues(alpha: 0.1);
        label = '未提交';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
