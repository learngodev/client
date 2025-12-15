import 'dart:async';
import 'dart:convert';

// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../application/assignment_controller.dart';
import '../../data/student_repository.dart';
import '../../domain/assignment_models.dart';

class AssignmentDetailPage extends HookConsumerWidget {
  const AssignmentDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(assignmentDetailControllerProvider(id));
    final answers = useState<Map<String, dynamic>>({});
    final isSubmitting = useState(false);
    final isSubmitted = useState(false);
    final itemKeys = useRef<Map<String, GlobalKey>>({});

    // Load draft
    useEffect(() {
      Future<void> loadDraft() async {
        try {
          final prefs = await SharedPreferences.getInstance();
          final draft = prefs.getString('assignment_draft_$id');
          if (draft != null && context.mounted && !isSubmitted.value) {
            final Map<String, dynamic> decoded = jsonDecode(draft);
            if (decoded.isNotEmpty) {
              answers.value = decoded;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('已恢复上次未提交的草稿')));
            }
          }
        } catch (e) {
          debugPrint('Failed to load draft: $e');
        }
      }

      loadDraft();
      return null;
    }, [id]);

    // Save draft
    useEffect(() {
      final timer = Timer(const Duration(seconds: 1), () async {
        if (answers.value.isNotEmpty && !isSubmitted.value) {
          try {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString(
              'assignment_draft_$id',
              jsonEncode(answers.value),
            );
          } catch (e) {
            debugPrint('Failed to save draft: $e');
          }
        }
      });
      return timer.cancel;
    }, [answers.value, isSubmitted.value]);

    return asyncValue.when(
      data: (detail) {
        final isExam = detail.type == AssignmentType.exam;

        return PopScope(
          canPop: !isExam || isSubmitted.value,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) return;
            final shouldPop = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('退出考试？'),
                content: const Text('考试正在进行中，退出将无法暂停计时。确定要退出吗？'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('取消'),
                  ),
                  FilledButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('退出'),
                  ),
                ],
              ),
            );
            if (shouldPop == true && context.mounted) {
              Navigator.of(context).pop();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(isExam ? '在线考试' : '作业详情'),
              actions: [
                if (isExam && detail.dueAt != null)
                  _ExamTimer(
                    dueAt: detail.dueAt!,
                    onTimeUp: () async {
                      if (!isSubmitting.value) {
                        isSubmitting.value = true;
                        await ref
                            .read(
                              assignmentDetailControllerProvider(id).notifier,
                            )
                            .submit(answers.value);
                        isSubmitted.value = true;
                        // Clear draft
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.remove('assignment_draft_$id');

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('考试时间到，已自动提交')),
                          );
                          Navigator.of(context).pop();
                        }
                      }
                    },
                  ),
                const SizedBox(width: 16),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => _QuestionNavigationSheet(
                    questions: detail.questions,
                    answers: answers.value,
                    onJumpTo: (index) {
                      Navigator.pop(context);
                      final qId = detail.questions[index].id;
                      final key = itemKeys.value[qId];
                      if (key?.currentContext != null) {
                        Scrollable.ensureVisible(
                          key!.currentContext!,
                          duration: const Duration(milliseconds: 300),
                          alignment: 0.1,
                        );
                      }
                    },
                  ),
                );
              },
              label: const Text('题目导航'),
              icon: const Icon(Icons.grid_view),
            ),
            body: Column(
              children: [
                if (isExam)
                  Container(
                    width: double.infinity,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '考试模式：请勿切屏，时间结束将自动提交。',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          itemKeys.value.putIfAbsent(q.id, () => GlobalKey());
                          return _QuestionCard(
                            key: itemKeys.value[q.id],
                            question: q,
                            onAnswerChanged: (value) {
                              answers.value = {...answers.value, q.id: value};
                            },
                            currentAnswer: answers.value[q.id],
                          );
                        }),
                        const SizedBox(height: 80), // Space for FAB
                      ],
                    ),
                  ),
                ),
                if (!isExam && !isSubmitted.value)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: isSubmitting.value
                            ? null
                            : () async {
                                final content = answers.value.entries
                                    .map((e) {
                                      final q = detail.questions.firstWhere(
                                        (q) => q.id == e.key,
                                        orElse: () => const AssignmentQuestion(
                                          id: '',
                                          prompt: '',
                                          type: QuestionType.essay,
                                          score: 0,
                                          orderIndex: 0,
                                        ),
                                      );
                                      return '题目: ${q.prompt}\n回答: ${e.value}';
                                    })
                                    .join('\n\n');

                                if (content.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('请先填写作业内容')),
                                  );
                                  return;
                                }

                                try {
                                  // Show loading
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (c) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );

                                  final result = await ref
                                      .read(studentRepositoryProvider)
                                      .checkAssignment(
                                        title: detail.title,
                                        description: detail.description,
                                        content: content,
                                      );

                                  if (context.mounted) {
                                    Navigator.pop(context); // Hide loading
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      useSafeArea: true,
                                      builder: (context) =>
                                          _AICheckResultSheet(result: result),
                                    );
                                  }
                                } catch (e) {
                                  if (context.mounted) {
                                    Navigator.pop(context); // Hide loading
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('AI 检查失败: $e')),
                                    );
                                  }
                                }
                              },
                        icon: const Icon(Icons.auto_awesome),
                        label: const Text('AI 智能预检'),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: isSubmitting.value
                          ? null
                          : () async {
                              final confirmed = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('确认提交'),
                                  content: Text(
                                    isExam ? '提交后将无法修改答案，确定要提交吗？' : '确定要提交作业吗？',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: const Text('取消'),
                                    ),
                                    FilledButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const Text('提交'),
                                    ),
                                  ],
                                ),
                              );

                              if (confirmed == true) {
                                isSubmitting.value = true;
                                await ref
                                    .read(
                                      assignmentDetailControllerProvider(
                                        id,
                                      ).notifier,
                                    )
                                    .submit(answers.value);
                                isSubmitted.value = true;
                                // Clear draft
                                final prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.remove('assignment_draft_$id');

                                if (context.mounted) {
                                  Navigator.of(context).pop();
                                }
                              }
                            },
                      child: isSubmitting.value
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(isExam ? '交卷' : '提交作业'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (err, stack) => Scaffold(
        appBar: AppBar(title: const Text('错误')),
        body: Center(child: Text('Error: $err')),
      ),
      loading: () => Scaffold(
        appBar: AppBar(title: const Text('加载中')),
        body: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _ExamTimer extends HookWidget {
  const _ExamTimer({required this.dueAt, required this.onTimeUp});

  final DateTime dueAt;
  final VoidCallback onTimeUp;

  @override
  Widget build(BuildContext context) {
    final remaining = useState(dueAt.difference(DateTime.now()));

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        final newRemaining = dueAt.difference(DateTime.now());
        if (newRemaining.isNegative) {
          timer.cancel();
          remaining.value = Duration.zero;
          onTimeUp();
        } else {
          remaining.value = newRemaining;
        }
      });
      return timer.cancel;
    }, [dueAt]);

    final hours = remaining.value.inHours;
    final minutes = remaining.value.inMinutes % 60;
    final seconds = remaining.value.inSeconds % 60;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.timer,
            size: 16,
            color: Theme.of(context).colorScheme.onErrorContainer,
          ),
          const SizedBox(width: 4),
          Text(
            '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onErrorContainer,
              fontWeight: FontWeight.bold,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuestionNavigationSheet extends StatelessWidget {
  const _QuestionNavigationSheet({
    required this.questions,
    required this.answers,
    required this.onJumpTo,
  });

  final List<AssignmentQuestion> questions;
  final Map<String, dynamic> answers;
  final ValueChanged<int> onJumpTo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('题目导航', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final q = questions[index];
                final isAnswered =
                    answers[q.id] != null &&
                    (answers[q.id] is String
                        ? (answers[q.id] as String).isNotEmpty
                        : (answers[q.id] as List).isNotEmpty);

                return InkWell(
                  onTap: () => onJumpTo(index),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isAnswered
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isAnswered
                            ? Theme.of(context).colorScheme.primary
                            : Colors.transparent,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: isAnswered
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _QuestionCard extends HookWidget {
  const _QuestionCard({
    super.key,
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

class _AICheckResultSheet extends StatelessWidget {
  const _AICheckResultSheet({required this.result});

  final CheckAssignmentResult result;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            AppBar(
              title: const Text('AI 预检报告'),
              leading: const SizedBox(),
              actions: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Expanded(
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(16),
                children: [
                  if (result.overall.isNotEmpty) ...[
                    Text(
                      '总体评价',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(result.overall),
                    ),
                    const SizedBox(height: 24),
                  ],
                  if (result.issues.isNotEmpty) ...[
                    Text(
                      '发现的问题',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...result.issues.map(
                      (e) => ListTile(
                        leading: Icon(
                          Icons.warning_amber,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        title: Text(e),
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                  if (result.suggestions.isNotEmpty) ...[
                    Text(
                      '修改建议',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...result.suggestions.map(
                      (e) => ListTile(
                        leading: Icon(
                          Icons.lightbulb_outline,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(e),
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
