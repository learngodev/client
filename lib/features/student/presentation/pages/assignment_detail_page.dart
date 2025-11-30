import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/assignment_controller.dart';
import '../../domain/assignment_models.dart';

class AssignmentDetailPage extends HookConsumerWidget {
  const AssignmentDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(assignmentDetailControllerProvider(id));
    final answers = useState<Map<String, dynamic>>({});

    return Scaffold(
      appBar: AppBar(title: const Text('作业详情')),
      body: asyncValue.when(
        data: (detail) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text(
                      detail.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      detail.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Divider(height: 32),
                    ...detail.questions.map((q) {
                      return _QuestionCard(
                        question: q,
                        onAnswerChanged: (value) {
                          answers.value = {...answers.value, q.id: value};
                        },
                        currentAnswer: answers.value[q.id],
                      );
                    }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      ref
                          .read(assignmentDetailControllerProvider(id).notifier)
                          .submit(answers.value);
                    },
                    child: const Text('提交作业'),
                  ),
                ),
              ),
            ],
          );
        },
        error: (err, stack) => Center(child: Text('Error: $err')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _QuestionCard extends HookWidget {
  const _QuestionCard({
    required this.question,
    required this.onAnswerChanged,
    this.currentAnswer,
  });

  final AssignmentQuestion question;
  final ValueChanged<dynamic> onAnswerChanged;
  final dynamic currentAnswer;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${question.orderIndex + 1}. ${question.prompt} (${question.score}分)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            _buildInput(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(BuildContext context) {
    switch (question.type) {
      case QuestionType.singleChoice:
      case QuestionType.trueFalse:
        return Column(
          children: question.options.map((option) {
            return RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: currentAnswer as String?,
              onChanged: onAnswerChanged,
              contentPadding: EdgeInsets.zero,
            );
          }).toList(),
        );
      case QuestionType.multipleChoice:
        final selected = (currentAnswer as List<String>?) ?? [];
        return Column(
          children: question.options.map((option) {
            return CheckboxListTile(
              title: Text(option),
              value: selected.contains(option),
              onChanged: (checked) {
                final newSelected = List<String>.from(selected);
                if (checked == true) {
                  newSelected.add(option);
                } else {
                  newSelected.remove(option);
                }
                onAnswerChanged(newSelected);
              },
              contentPadding: EdgeInsets.zero,
            );
          }).toList(),
        );
      case QuestionType.fillInBlank:
      case QuestionType.essay:
        final controller = useTextEditingController(
          text: currentAnswer as String?,
        );
        return TextField(
          controller: controller,
          maxLines: question.type == QuestionType.essay ? 5 : 1,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: '请输入答案',
          ),
          onChanged: onAnswerChanged,
        );
    }
  }
}
