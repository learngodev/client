import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/assignment_controller.dart';
import '../../domain/assignment_models.dart';

class SubmissionDetailPage extends ConsumerWidget {
  const SubmissionDetailPage({super.key, required this.assignmentId});

  final String assignmentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(
      submissionDetailControllerProvider(assignmentId),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('作业结果')),
      body: asyncValue.when(
        data: (detail) {
          if (detail == null) {
            return const Center(child: Text('未找到提交记录'));
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _Header(detail: detail),
              const Divider(height: 32),
              ...detail.assignment.questions.map((q) {
                final item = detail.items.firstWhere(
                  (i) => i.questionId == q.id,
                  orElse: () =>
                      SubmissionItem(id: '', questionId: q.id, answer: ''),
                );
                return _QuestionResultCard(question: q, item: item);
              }),
            ],
          );
        },
        error: (err, stack) => Center(child: Text('Error: $err')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.detail});

  final StudentSubmissionDetail detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final score = detail.submission.score;
    final maxScore = detail.assignment.maxScore;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(detail.assignment.title, style: theme.textTheme.headlineSmall),
        const SizedBox(height: 8),
        Row(
          children: [
            if (score != null) ...[
              Text(
                '得分: $score / $maxScore',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 16),
            ],
            Chip(
              label: Text(detail.submission.status),
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
            ),
          ],
        ),
        if (detail.submission.feedback != null) ...[
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '老师评语',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(detail.submission.feedback!),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _QuestionResultCard extends StatelessWidget {
  const _QuestionResultCard({required this.question, required this.item});

  final AssignmentQuestion question;
  final SubmissionItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${question.prompt.startsWith("请") ? "2" : question.orderIndex + 1}. ${question.prompt}',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                if (item.score != null)
                  Chip(
                    label: Text('${item.score} / ${question.score}'),
                    backgroundColor: item.score == question.score
                        ? Colors.green.withValues(alpha: 0.1)
                        : Colors.red.withValues(alpha: 0.1),
                    labelStyle: TextStyle(
                      color: item.score == question.score
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            const Text('你的回答:', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 4),
            Text(
              item.answer.isEmpty ? '未作答' : item.answer,
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
