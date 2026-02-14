import 'dart:async';
import 'dart:convert';

// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/core/utils/logger.dart';
import 'package:learn_go/features/student/application/student_dashboard_controller.dart';
import 'package:learn_go/features/file/application/file_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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

    // Load draft or previous submission
    useEffect(() {
      Future<void> loadInitialData() async {
        try {
          // 1. Try to load draft first
          final prefs = await SharedPreferences.getInstance();
          final draft = prefs.getString('assignment_draft_$id');
          if (draft != null && context.mounted && !isSubmitted.value) {
            final Map<String, dynamic> decoded = jsonDecode(draft);
            if (decoded.isNotEmpty) {
              answers.value = decoded;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('已恢复上次未提交的草稿')));
              return;
            }
          }

          // 2. If no draft, try to load previous submission
          if (context.mounted && !isSubmitted.value) {
            try {
              final submissionDetail = await ref
                  .read(studentRepositoryProvider)
                  .getSubmissionDetail(id);

              if (context.mounted && submissionDetail != null) {
                final initialAnswers = <String, dynamic>{};

                // Try to get current assignment detail to help with question types
                final currentDetail = ref
                    .read(assignmentDetailControllerProvider(id))
                    .valueOrNull;

                for (final item in submissionDetail.items) {
                  var type = QuestionType.essay;

                  // 1. Try to find question in submission detail
                  try {
                    final q = submissionDetail.assignment.questions.firstWhere(
                      (q) => q.id == item.questionId,
                    );
                    type = q.type;
                  } catch (_) {
                    // 2. Fallback: Try to find in current loaded assignment
                    if (currentDetail != null) {
                      try {
                        final q = currentDetail.questions.firstWhere(
                          (q) => q.id == item.questionId,
                        );
                        type = q.type;
                      } catch (_) {}
                    }
                  }

                  if (type == QuestionType.multipleChoice) {
                    // Try to parse JSON list
                    try {
                      final List<dynamic> list = jsonDecode(item.answer);
                      initialAnswers[item.questionId] = list
                          .map((e) => e.toString())
                          .toList();
                    } catch (_) {
                      // Fallback if not JSON
                      initialAnswers[item.questionId] = [item.answer];
                    }
                  } else {
                    initialAnswers[item.questionId] = item.answer;
                  }
                }

                // 2. If no items found, try to load from assignment questions (if backend returns answers there)
                if (initialAnswers.isEmpty) {
                  for (final q in submissionDetail.assignment.questions) {
                    if (q.answer != null && q.answer!.isNotEmpty) {
                      if (q.type == QuestionType.multipleChoice) {
                        try {
                          final List<dynamic> list = jsonDecode(q.answer!);
                          initialAnswers[q.id] = list
                              .map((e) => e.toString())
                              .toList();
                        } catch (_) {
                          initialAnswers[q.id] = [q.answer!];
                        }
                      } else {
                        initialAnswers[q.id] = q.answer!;
                      }
                    }
                  }
                }

                if (initialAnswers.isNotEmpty) {
                  answers.value = initialAnswers;
                }
              }
            } catch (e) {
              logger.e('Failed to load submission: $e');
            }
          }
        } catch (e) {
          logger.e('Failed to load initial data: $e');
        }
      }

      loadInitialData();
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
            logger.e('Failed to save draft: $e');
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
                IconButton(
                  icon: const Icon(Icons.grid_view),
                  tooltip: '题目导航',
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
                ),
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
                        if (detail.attachments.isNotEmpty) ...[
                          const SizedBox(height: 16),
                          Text(
                            '附件',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          ...detail.attachments.map(
                            (file) => Card(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: ListTile(
                                leading: const Icon(Icons.attach_file),
                                title: Text(file.name),
                                trailing: IconButton(
                                  icon: const Icon(Icons.download),
                                  onPressed: () async {
                                    try {
                                      final url = await ref
                                          .read(fileServiceProvider)
                                          .getDownloadUrl(file.id);
                                      final uri = Uri.parse(url);
                                      if (await canLaunchUrl(uri)) {
                                        await launchUrl(uri);
                                        return;
                                      }
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text('无法打开链接'),
                                          ),
                                        );
                                      }
                                    } catch (_) {
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text('获取下载链接失败'),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
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
                            onAiCheck: !isExam && !isSubmitted.value
                                ? () async {
                                    try {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (c) => const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );

                                      final result = await ref
                                          .read(studentRepositoryProvider)
                                          .explainQuestion(
                                            title: detail.title,
                                            prompt: q.prompt,
                                            questionType: q.type.label,
                                            options: q.options,
                                          );

                                      if (context.mounted) {
                                        Navigator.pop(context);
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          useSafeArea: true,
                                          builder: (context) =>
                                              _AIExplainResultSheet(
                                                result: result,
                                              ),
                                        );
                                      }
                                    } catch (e) {
                                      if (context.mounted) {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text('AI 解析失败: $e'),
                                          ),
                                        );
                                      }
                                    }
                                  }
                                : null,
                          );
                        }),
                        const SizedBox(height: 24),
                      ],
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

                                // Refresh dashboard to update assignment status
                                ref
                                    .read(studentDashboardProvider.notifier)
                                    .refresh();

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

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({
    super.key,
    required this.question,
    required this.onAnswerChanged,
    this.currentAnswer,
    this.onAiCheck,
  });

  final AssignmentQuestion question;
  final ValueChanged<dynamic> onAnswerChanged;
  final dynamic currentAnswer;
  final VoidCallback? onAiCheck;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${question.orderIndex}. ${question.prompt} (${question.score}分)',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                if (onAiCheck != null)
                  IconButton(
                    icon: const Icon(Icons.auto_awesome, size: 20),
                    tooltip: 'AI 解析',
                    onPressed: onAiCheck,
                    style: IconButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
              ],
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
        return _SingleChoiceInput(
          options: question.options,
          currentAnswer: currentAnswer?.toString(),
          onChanged: onAnswerChanged,
        );
      case QuestionType.multipleChoice:
        List<String> selected = [];
        if (currentAnswer is List) {
          selected = (currentAnswer as List).map((e) => e.toString()).toList();
        } else if (currentAnswer is String) {
          try {
            final decoded = jsonDecode(currentAnswer);
            if (decoded is List) {
              selected = decoded.map((e) => e.toString()).toList();
            } else {
              selected = [currentAnswer];
            }
          } catch (_) {
            if (currentAnswer.isNotEmpty) selected = [currentAnswer];
          }
        }
        return _MultipleChoiceInput(
          options: question.options,
          currentAnswer: selected,
          onChanged: onAnswerChanged,
        );
      case QuestionType.fillInBlank:
      case QuestionType.essay:
        return _TextInput(
          initialValue: currentAnswer?.toString(),
          maxLines: question.type == QuestionType.essay ? 5 : 1,
          onChanged: (val) => onAnswerChanged(val),
        );
    }
  }
}

class _SingleChoiceInput extends StatelessWidget {
  const _SingleChoiceInput({
    required this.options,
    required this.currentAnswer,
    required this.onChanged,
  });

  final List<String> options;
  final String? currentAnswer;
  final ValueChanged<dynamic> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((option) {
        return RadioListTile<String>(
          title: Text(option),
          value: option,
          groupValue: currentAnswer,
          onChanged: onChanged,
          contentPadding: EdgeInsets.zero,
        );
      }).toList(),
    );
  }
}

class _MultipleChoiceInput extends StatelessWidget {
  const _MultipleChoiceInput({
    required this.options,
    required this.currentAnswer,
    required this.onChanged,
  });

  final List<String> options;
  final List<String> currentAnswer;
  final ValueChanged<dynamic> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((option) {
        return CheckboxListTile(
          title: Text(option),
          value: currentAnswer.contains(option),
          onChanged: (checked) {
            final newSelected = List<String>.from(currentAnswer);
            if (checked == true) {
              newSelected.add(option);
            } else {
              newSelected.remove(option);
            }
            onChanged(newSelected);
          },
          contentPadding: EdgeInsets.zero,
        );
      }).toList(),
    );
  }
}

class _TextInput extends HookWidget {
  const _TextInput({
    required this.initialValue,
    required this.maxLines,
    required this.onChanged,
  });

  final String? initialValue;
  final int maxLines;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initialValue);

    useEffect(() {
      if (initialValue != null && controller.text != initialValue) {
        controller.value = controller.value.copyWith(
          text: initialValue,
          selection: TextSelection.collapsed(offset: initialValue!.length),
        );
      }
      return null;
    }, [initialValue]);

    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: '请输入答案',
      ),
      onChanged: onChanged,
    );
  }
}

class _AIExplainResultSheet extends StatelessWidget {
  const _AIExplainResultSheet({required this.result});

  final ExplainQuestionResult result;

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
              title: const Text('AI 解析'),
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
                  if (result.analysis.isNotEmpty) ...[
                    Text(
                      '题意解析',
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
                      child: Text(result.analysis),
                    ),
                    const SizedBox(height: 24),
                  ],
                  if (result.steps.isNotEmpty) ...[
                    Text(
                      '思路引导',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ...result.steps.map(
                      (e) => ListTile(
                        leading: Icon(
                          Icons.format_list_numbered,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(e),
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                  if (result.keyPoints.isNotEmpty) ...[
                    Text(
                      '关键知识点',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ...result.keyPoints.map(
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
                    const SizedBox(height: 24),
                  ],
                  if (result.pitfalls.isNotEmpty) ...[
                    Text('易错点', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    ...result.pitfalls.map(
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
                  if (result.checklist.isNotEmpty) ...[
                    Text(
                      '自查清单',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ...result.checklist.map(
                      (e) => ListTile(
                        leading: Icon(
                          Icons.check_circle_outline,
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
