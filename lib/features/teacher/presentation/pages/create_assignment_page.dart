import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../domain/teacher_models.dart';
import '../../domain/teacher_repository.dart';
import '../../data/teacher_repository.dart';
import '../../../auth/application/auth_controller.dart';

class CreateAssignmentPage extends HookConsumerWidget {
  const CreateAssignmentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final repository = ref.watch(teacherRepositoryProvider);
    final authState = ref.watch(authStateProvider);

    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final maxScoreController = useTextEditingController(text: '100');

    final selectedClass = useState<TeacherClass?>(null);
    final selectedType = useState<String>('homework');
    final startAt = useState<DateTime?>(null);
    final dueAt = useState<DateTime?>(null);
    final allowResubmit = useState(false);

    final questions = useState<List<CreateAssignmentQuestionInput>>([]);

    final classesSnapshot = useFuture(
      useMemoized(() => repository.listMyClasses()),
    );

    final isSubmitting = useState(false);

    Future<void> submit() async {
      if (titleController.text.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('请输入标题')));
        return;
      }
      if (selectedClass.value == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('请选择班级')));
        return;
      }
      if (questions.value.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('请至少添加一道题目')));
        return;
      }

      isSubmitting.value = true;
      try {
        final request = CreateAssignmentRequest(
          courseId: selectedClass.value!.courseId,
          teacherId: authState.account?.id ?? '',
          classId: selectedClass.value!.id,
          type: selectedType.value,
          title: titleController.text,
          description: descriptionController.text,
          startAt: startAt.value,
          dueAt: dueAt.value,
          maxScore: double.tryParse(maxScoreController.text),
          allowResubmit: allowResubmit.value,
          questions: questions.value,
        );

        await repository.createAssignment(request);

        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('发布成功')));
          context.pop();
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('发布失败: $e')));
        }
      } finally {
        isSubmitting.value = false;
      }
    }

    Future<void> generateQuestions() async {
      final result = await showDialog<List<CreateAssignmentQuestionInput>>(
        context: context,
        builder: (context) => _GenerateQuestionsDialog(repository: repository),
      );
      if (result != null) {
        questions.value = [...questions.value, ...result];
      }
    }

    void addQuestion() async {
      final result = await showDialog<CreateAssignmentQuestionInput>(
        context: context,
        builder: (context) => const _QuestionEditorDialog(),
      );
      if (result != null) {
        questions.value = [...questions.value, result];
      }
    }

    void editQuestion(int index) async {
      final result = await showDialog<CreateAssignmentQuestionInput>(
        context: context,
        builder: (context) =>
            _QuestionEditorDialog(initialValue: questions.value[index]),
      );
      if (result != null) {
        final newQuestions = [...questions.value];
        newQuestions[index] = result;
        questions.value = newQuestions;
      }
    }

    void removeQuestion(int index) {
      final newQuestions = [...questions.value];
      newQuestions.removeAt(index);
      questions.value = newQuestions;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('发布作业/考试'),
        actions: [
          TextButton(
            onPressed: isSubmitting.value ? null : submit,
            child: isSubmitting.value
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('发布'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: '标题',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              labelText: '描述',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<TeacherClass>(
            initialValue: selectedClass.value,
            decoration: const InputDecoration(
              labelText: '班级/课程',
              border: OutlineInputBorder(),
            ),
            items:
                classesSnapshot.data
                    ?.map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text('${e.courseName} - ${e.name}'),
                      ),
                    )
                    .toList() ??
                [],
            onChanged: (value) => selectedClass.value = value,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  initialValue: selectedType.value,
                  decoration: const InputDecoration(
                    labelText: '类型',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'homework', child: Text('作业')),
                    DropdownMenuItem(value: 'exam', child: Text('考试')),
                  ],
                  onChanged: (value) => selectedType.value = value!,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: maxScoreController,
                  decoration: const InputDecoration(
                    labelText: '总分',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: startAt.value ?? DateTime.now(),
                      firstDate: DateTime.now().subtract(
                        const Duration(days: 365),
                      ),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (!context.mounted) return;
                    if (date != null) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                          startAt.value ?? DateTime.now(),
                        ),
                      );
                      if (time != null) {
                        startAt.value = DateTime(
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
                      labelText: '开始时间',
                      border: OutlineInputBorder(),
                    ),
                    child: Text(
                      startAt.value != null
                          ? DateFormat(
                              'yyyy-MM-dd HH:mm',
                            ).format(startAt.value!)
                          : '立即开始',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate:
                          dueAt.value ??
                          DateTime.now().add(const Duration(days: 1)),
                      firstDate: DateTime.now().subtract(
                        const Duration(days: 365),
                      ),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (!context.mounted) return;
                    if (date != null) {
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
                          : '无截止',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('允许重新提交'),
            value: allowResubmit.value,
            onChanged: (value) => allowResubmit.value = value,
          ),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('题目列表', style: theme.textTheme.titleMedium),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: generateQuestions,
                    icon: const Icon(Icons.auto_awesome),
                    label: const Text('AI 出题'),
                  ),
                  TextButton.icon(
                    onPressed: addQuestion,
                    icon: const Icon(Icons.add),
                    label: const Text('添加题目'),
                  ),
                ],
              ),
            ],
          ),
          if (questions.value.isEmpty)
            const Padding(
              padding: EdgeInsets.all(32),
              child: Center(child: Text('暂无题目，请点击上方按钮添加')),
            )
          else
            ...questions.value.asMap().entries.map((entry) {
              final index = entry.key;
              final question = entry.value;
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  title: Text(
                    '${index + 1}. [${_questionTypeLabel(question.type)}] ${question.prompt}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text('分值: ${question.score}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => editQuestion(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => removeQuestion(index),
                      ),
                    ],
                  ),
                ),
              );
            }),
        ],
      ),
    );
  }

  String _questionTypeLabel(String type) {
    return switch (type) {
      'fill' => '填空',
      'choice' => '选择',
      'judge' => '判断',
      'essay' => '简答',
      _ => type,
    };
  }
}

class _QuestionEditorDialog extends HookWidget {
  const _QuestionEditorDialog({this.initialValue});

  final CreateAssignmentQuestionInput? initialValue;

  @override
  Widget build(BuildContext context) {
    final type = useState(initialValue?.type ?? 'choice');
    final promptController = useTextEditingController(
      text: initialValue?.prompt,
    );

    // Parse initial options
    final initialOptionsList = useMemoized(() {
      if (initialValue?.options != null) {
        try {
          final List<dynamic> list = jsonDecode(initialValue!.options!);
          return list.map((e) => e.toString()).toList();
        } catch (_) {}
      }
      return <String>[];
    });

    final options = useState<List<String>>(initialOptionsList);

    final answerController = useTextEditingController(
      text: initialValue?.answer,
    );
    final scoreController = useTextEditingController(
      text: initialValue?.score?.toString() ?? '10',
    );

    return AlertDialog(
      title: Text(initialValue == null ? '添加题目' : '编辑题目'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              initialValue: type.value,
              decoration: const InputDecoration(
                labelText: '题型',
                filled: true,
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'choice', child: Text('选择题')),
                DropdownMenuItem(value: 'fill', child: Text('填空题')),
                DropdownMenuItem(value: 'judge', child: Text('判断题')),
                DropdownMenuItem(value: 'essay', child: Text('简答题')),
              ],
              onChanged: (value) => type.value = value!,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: promptController,
              decoration: const InputDecoration(
                labelText: '题目内容',
                filled: true,
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            if (type.value == 'choice') ...[
              const SizedBox(height: 16),
              const Text('选项列表:'),
              const SizedBox(height: 8),
              ...options.value.asMap().entries.map((entry) {
                final index = entry.key;
                final option = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: option,
                          decoration: InputDecoration(
                            labelText: '选项 ${index + 1}',
                            filled: true,
                            border: const OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                          onChanged: (value) {
                            final newOptions = [...options.value];
                            newOptions[index] = value;
                            options.value = newOptions;
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          final newOptions = [...options.value];
                          newOptions.removeAt(index);
                          options.value = newOptions;
                        },
                      ),
                    ],
                  ),
                );
              }),
              TextButton.icon(
                onPressed: () {
                  options.value = [...options.value, ''];
                },
                icon: const Icon(Icons.add),
                label: const Text('添加选项'),
              ),
            ],
            const SizedBox(height: 16),
            if (type.value == 'choice' && options.value.isNotEmpty)
              DropdownButtonFormField<String>(
                initialValue: options.value.contains(answerController.text)
                    ? answerController.text
                    : null,
                decoration: const InputDecoration(
                  labelText: '参考答案',
                  filled: true,
                  border: OutlineInputBorder(),
                ),
                items: options.value
                    .where((e) => e.isNotEmpty)
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (v) => answerController.text = v ?? '',
              )
            else if (type.value == 'judge')
              DropdownButtonFormField<String>(
                initialValue: ['true', 'false'].contains(answerController.text)
                    ? answerController.text
                    : null,
                decoration: const InputDecoration(
                  labelText: '参考答案',
                  filled: true,
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'true', child: Text('正确')),
                  DropdownMenuItem(value: 'false', child: Text('错误')),
                ],
                onChanged: (v) => answerController.text = v ?? '',
              )
            else
              TextField(
                controller: answerController,
                decoration: const InputDecoration(
                  labelText: '参考答案',
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
            const SizedBox(height: 16),
            TextField(
              controller: scoreController,
              decoration: const InputDecoration(
                labelText: '分值',
                filled: true,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('取消'),
        ),
        TextButton(
          onPressed: () {
            if (promptController.text.isEmpty) return;
            Navigator.of(context).pop(
              CreateAssignmentQuestionInput(
                type: type.value,
                prompt: promptController.text,
                options: type.value == 'choice'
                    ? jsonEncode(
                        options.value.where((e) => e.isNotEmpty).toList(),
                      )
                    : null,
                answer: answerController.text,
                score: double.tryParse(scoreController.text),
              ),
            );
          },
          child: const Text('确定'),
        ),
      ],
    );
  }
}

class _GenerateQuestionsDialog extends HookWidget {
  const _GenerateQuestionsDialog({required this.repository});

  final TeacherRepository repository;

  @override
  Widget build(BuildContext context) {
    final topicController = useTextEditingController();
    final countController = useTextEditingController(text: '5');
    final difficulty = useState('medium');
    final isLoading = useState(false);

    return AlertDialog(
      title: const Text('AI 智能出题'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: topicController,
              decoration: const InputDecoration(
                labelText: '出题主题',
                hintText: '例如：Go语言并发编程',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: countController,
              decoration: const InputDecoration(labelText: '题目数量'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: difficulty.value,
              decoration: const InputDecoration(labelText: '难度'),
              items: const [
                DropdownMenuItem(value: 'easy', child: Text('简单')),
                DropdownMenuItem(value: 'medium', child: Text('中等')),
                DropdownMenuItem(value: 'hard', child: Text('困难')),
              ],
              onChanged: (value) {
                if (value != null) difficulty.value = value;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: isLoading.value ? null : () => Navigator.of(context).pop(),
          child: const Text('取消'),
        ),
        FilledButton(
          onPressed: isLoading.value
              ? null
              : () async {
                  if (topicController.text.isEmpty) return;

                  isLoading.value = true;
                  try {
                    final questions = await repository.generateQuestions(
                      topic: topicController.text,
                      count: int.tryParse(countController.text) ?? 5,
                      difficulty: difficulty.value,
                    );
                    if (context.mounted) {
                      Navigator.of(context).pop(questions);
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('生成失败: $e')));
                    }
                  } finally {
                    isLoading.value = false;
                  }
                },
          child: isLoading.value
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('生成'),
        ),
      ],
    );
  }
}
