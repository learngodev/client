import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../student/domain/assignment_models.dart';
import '../../data/teacher_repository.dart';
import '../../domain/teacher_models.dart';
import '../../domain/teacher_repository.dart';

class GradingPage extends HookConsumerWidget {
  const GradingPage({
    super.key,
    required this.assignmentId,
    required this.submissionId,
  });

  final String assignmentId;
  final String submissionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(teacherRepositoryProvider);

    final dataFuture = useMemoized(
      () => Future.wait([
        repository.getAssignmentDetail(assignmentId),
        repository.getSubmission(assignmentId, submissionId),
      ]),
      [assignmentId, submissionId],
    );
    final snapshot = useFuture(dataFuture);

    // State for scores and feedback
    final itemScores = useState<Map<String, double>>({});
    final feedbackController = useTextEditingController();
    final isSubmitting = useState(false);

    // Initialize scores when data is loaded
    useEffect(() {
      if (snapshot.hasData) {
        final submissionDetail = snapshot.data![1] as TeacherSubmissionDetail;
        final scores = <String, double>{};
        for (final item in submissionDetail.items) {
          if (item.score != null) {
            scores[item.questionId] = item.score!;
          }
        }
        itemScores.value = scores;
        feedbackController.text = submissionDetail.submission.feedback ?? '';
      }
      return null;
    }, [snapshot.data]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('批改作业'),
        actions: [
          if (snapshot.hasData)
            IconButton(
              icon: const Icon(Icons.auto_awesome),
              tooltip: 'AI 智能批改',
              onPressed: () async {
                final assignment = snapshot.data![0] as AssignmentDetail;
                final submission = snapshot.data![1] as TeacherSubmissionDetail;

                final content = assignment.questions
                    .map((q) {
                      final item = submission.items.firstWhere(
                        (i) => i.questionId == q.id,
                        orElse: () => SubmissionItem(
                          id: '',
                          questionId: q.id,
                          answer: '',
                        ),
                      );
                      return '题目: ${q.prompt}\n回答: ${item.answer}';
                    })
                    .join('\n\n');

                if (content.trim().isEmpty) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('作业内容为空，无法批改')));
                  return;
                }

                try {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (c) =>
                        const Center(child: CircularProgressIndicator()),
                  );

                  final result = await repository.gradeAssignment(
                    title: assignment.title,
                    description: assignment.description,
                    content: content,
                    rubrics: '满分: ${assignment.maxScore}',
                  );

                  if (context.mounted) {
                    Navigator.pop(context); // Hide loading

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('AI 批改建议'),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '建议得分: ${result.score}',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                '评语摘要:',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Text(result.summary),
                              const SizedBox(height: 16),
                              Text(
                                '详细建议:',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              ...result.suggestions.map(
                                (e) => Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text('• $e'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('关闭'),
                          ),
                          FilledButton(
                            onPressed: () {
                              feedbackController.text =
                                  '${result.summary}\n\n改进建议:\n${result.suggestions.join('\n')}';
                              Navigator.pop(context);
                            },
                            child: const Text('采纳评语'),
                          ),
                        ],
                      ),
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('AI 批改失败: $e')));
                  }
                }
              },
            ),
        ],
      ),
      body: snapshot.connectionState == ConnectionState.waiting
          ? const Center(child: CircularProgressIndicator())
          : snapshot.hasError
          ? Center(child: Text('加载失败: ${snapshot.error}'))
          : _buildContent(
              context,
              ref,
              snapshot.data![0] as AssignmentDetail,
              snapshot.data![1] as TeacherSubmissionDetail,
              itemScores,
              feedbackController,
              isSubmitting,
              repository,
            ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    AssignmentDetail assignment,
    TeacherSubmissionDetail submission,
    ValueNotifier<Map<String, double>> itemScores,
    TextEditingController feedbackController,
    ValueNotifier<bool> isSubmitting,
    TeacherRepository repository,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            assignment.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text('学生提交时间: ${submission.submission.submittedAt}'),
          const Divider(height: 32),
          ...assignment.questions.map((question) {
            final submissionItem = submission.items.firstWhere(
              (item) => item.questionId == question.id,
              orElse: () =>
                  SubmissionItem(id: '', questionId: question.id, answer: ''),
            );
            return QuestionGradingItem(
              question: question,
              submissionItem: submissionItem,
              initialScore: itemScores.value[question.id],
              onScoreChanged: (score) {
                final newScores = Map<String, double>.from(itemScores.value);
                if (score != null) {
                  newScores[question.id] = score;
                } else {
                  newScores.remove(question.id);
                }
                itemScores.value = newScores;
              },
            );
          }),
          const SizedBox(height: 24),
          const Text('总评反馈', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            controller: feedbackController,
            maxLines: 3,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '请输入评语...',
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: isSubmitting.value
                  ? null
                  : () => _submitGrade(
                      context,
                      itemScores.value,
                      feedbackController.text,
                      isSubmitting,
                      repository,
                      submission,
                    ),
              child: isSubmitting.value
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('提交评分'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submitGrade(
    BuildContext context,
    Map<String, double> itemScores,
    String feedback,
    ValueNotifier<bool> isSubmitting,
    TeacherRepository repository,
    TeacherSubmissionDetail submission,
  ) async {
    isSubmitting.value = true;
    try {
      // Calculate total score
      double totalScore = 0;
      for (final score in itemScores.values) {
        totalScore += score;
      }

      // Map question IDs to submission item IDs
      final submissionItemScores = <String, double>{};
      for (final entry in itemScores.entries) {
        final questionId = entry.key;
        final score = entry.value;
        try {
          final item = submission.items.firstWhere(
            (i) => i.questionId == questionId,
          );
          if (item.id.isNotEmpty) {
            submissionItemScores[item.id] = score;
          }
        } catch (_) {
          // Ignore items that don't exist in submission
        }
      }

      final request = GradeSubmissionRequest(
        score: totalScore,
        feedback: feedback,
        itemScores: submissionItemScores,
        comment: feedback.isNotEmpty ? feedback : null,
      );

      await repository.gradeSubmission(assignmentId, submissionId, request);
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('批改完成')));
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('提交失败: $e')));
      }
    } finally {
      isSubmitting.value = false;
    }
  }
}

class QuestionGradingItem extends StatefulWidget {
  const QuestionGradingItem({
    super.key,
    required this.question,
    required this.submissionItem,
    required this.onScoreChanged,
    this.initialScore,
  });

  final AssignmentQuestion question;
  final SubmissionItem submissionItem;
  final ValueChanged<double?> onScoreChanged;
  final double? initialScore;

  @override
  State<QuestionGradingItem> createState() => _QuestionGradingItemState();
}

class _QuestionGradingItemState extends State<QuestionGradingItem> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.initialScore?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              children: [
                Expanded(
                  child: Text(
                    'Q${widget.question.orderIndex + 1}. ${widget.question.prompt}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Chip(label: Text('${widget.question.score} 分')),
              ],
            ),
            const SizedBox(height: 8),
            const Text('学生回答:', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 4),
            Text(
              widget.submissionItem.answer.isEmpty
                  ? '未作答'
                  : widget.submissionItem.answer,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('得分: '),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      final score = double.tryParse(value);
                      widget.onScoreChanged(score);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
