import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/teacher_repository.dart';
import '../../domain/teacher_models.dart';

final teacherAssignmentsProvider = FutureProvider<List<TeacherAssignment>>((
  ref,
) async {
  final repository = ref.watch(teacherRepositoryProvider);
  return repository.listTeacherAssignments();
});

class TeacherAssignmentsPage extends ConsumerWidget {
  const TeacherAssignmentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assignmentsAsync = ref.watch(teacherAssignmentsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('作业管理')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/teacher/assignments/create'),
        child: const Icon(Icons.add),
      ),
      body: assignmentsAsync.when(
        data: (assignments) {
          if (assignments.isEmpty) {
            return const Center(child: Text('暂无作业'));
          }
          return ListView.builder(
            itemCount: assignments.length,
            itemBuilder: (context, index) {
              final assignment = assignments[index];
              return ListTile(
                title: Text(assignment.title),
                subtitle: Text(
                  '${assignment.courseName} - ${assignment.className}\n'
                  '已提交: ${assignment.submittedCount} / ${assignment.submissionCount}',
                ),
                isThreeLine: true,
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  context.push(
                    '/teacher/assignments/${assignment.id}/submissions',
                    extra: assignment,
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
