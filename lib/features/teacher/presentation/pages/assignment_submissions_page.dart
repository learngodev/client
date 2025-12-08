import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
          return ListView.builder(
            itemCount: submissions.length,
            itemBuilder: (context, index) {
              final submission = submissions[index];
              return ListTile(
                title: Text(submission.studentName),
                subtitle: Text(
                  '状态: ${submission.status}\n'
                  '提交时间: ${submission.submittedAt?.toString() ?? '未知'}',
                ),
                trailing: submission.score != null
                    ? Text('${submission.score}分')
                    : const Icon(Icons.chevron_right),
                onTap: () {
                  context.push(
                    '/teacher/grading/$assignmentId/${submission.id}',
                  );
                },
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
