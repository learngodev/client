enum QuestionType {
  singleChoice,
  multipleChoice,
  trueFalse,
  fillInBlank,
  essay,
}

extension QuestionTypeX on QuestionType {
  String get label {
    return switch (this) {
      QuestionType.singleChoice => '单选题',
      QuestionType.multipleChoice => '多选题',
      QuestionType.trueFalse => '判断题',
      QuestionType.fillInBlank => '填空题',
      QuestionType.essay => '简答题',
    };
  }

  static QuestionType fromString(String value) {
    return switch (value.toLowerCase()) {
      'choice' => QuestionType.singleChoice,
      'single_choice' => QuestionType.singleChoice,
      'multiple_choice' => QuestionType.multipleChoice,
      'judge' => QuestionType.trueFalse,
      'true_false' => QuestionType.trueFalse,
      'fill' => QuestionType.fillInBlank,
      'fill_blank' => QuestionType.fillInBlank,
      'essay' => QuestionType.essay,
      _ => QuestionType.essay,
    };
  }
}

class AssignmentQuestion {
  const AssignmentQuestion({
    required this.id,
    required this.prompt,
    required this.type,
    required this.score,
    this.options = const [],
    this.orderIndex = 0,
  });

  final String id;
  final String prompt;
  final QuestionType type;
  final double score;
  final List<String> options;
  final int orderIndex;

  factory AssignmentQuestion.fromJson(Map<String, dynamic> json) {
    return AssignmentQuestion(
      id: json['id'] as String? ?? '',
      prompt: json['prompt'] as String? ?? '',
      type: QuestionTypeX.fromString(json['type'] as String? ?? ''),
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
      options:
          (json['options'] as List?)?.map((e) => e.toString()).toList() ?? [],
      orderIndex: (json['order_index'] as num?)?.toInt() ?? 0,
    );
  }
}

class AssignmentDetail {
  const AssignmentDetail({
    required this.id,
    required this.title,
    required this.description,
    required this.questions,
    required this.maxScore,
    this.allowResubmit = false,
    this.dueAt,
    this.startAt,
  });

  final String id;
  final String title;
  final String description;
  final List<AssignmentQuestion> questions;
  final double maxScore;
  final bool allowResubmit;
  final DateTime? dueAt;
  final DateTime? startAt;

  factory AssignmentDetail.fromJson(Map<String, dynamic> json) {
    final questionsList = json['questions'] as List?;
    final questions =
        questionsList
            ?.map((e) => AssignmentQuestion.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];

    // Sort questions by orderIndex
    questions.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));

    return AssignmentDetail(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      questions: questions,
      maxScore: (json['max_score'] as num?)?.toDouble() ?? 0.0,
      allowResubmit: json['allow_resubmit'] as bool? ?? false,
      dueAt: DateTime.tryParse(json['due_at'] as String? ?? '')?.toLocal(),
      startAt: DateTime.tryParse(json['start_at'] as String? ?? '')?.toLocal(),
    );
  }
}

class SubmissionResult {
  const SubmissionResult({
    required this.id,
    required this.score,
    required this.status,
    required this.submittedAt,
  });

  final String id;
  final double? score;
  final String status;
  final DateTime submittedAt;

  factory SubmissionResult.fromJson(Map<String, dynamic> json) {
    return SubmissionResult(
      id: json['id'] as String? ?? '',
      score: (json['score'] as num?)?.toDouble(),
      status: json['status'] as String? ?? '',
      submittedAt:
          DateTime.tryParse(json['submitted_at'] as String? ?? '')?.toLocal() ??
          DateTime.now(),
    );
  }
}
