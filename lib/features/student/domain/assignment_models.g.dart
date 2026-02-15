// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssignmentQuestion _$AssignmentQuestionFromJson(Map<String, dynamic> json) =>
    _AssignmentQuestion(
      id: json['id'] as String? ?? '',
      prompt: json['prompt'] as String? ?? '',
      type: $enumDecode(_$QuestionTypeEnumMap, json['type']),
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
      options: json['options'] == null
          ? const []
          : _parseOptions(json['options']),
      orderIndex: (json['order_index'] as num?)?.toInt() ?? 0,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$AssignmentQuestionToJson(_AssignmentQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prompt': instance.prompt,
      'type': _$QuestionTypeEnumMap[instance.type]!,
      'score': instance.score,
      'options': instance.options,
      'order_index': instance.orderIndex,
      'answer': instance.answer,
    };

const _$QuestionTypeEnumMap = {
  QuestionType.singleChoice: 'single_choice',
  QuestionType.multipleChoice: 'multiple_choice',
  QuestionType.trueFalse: 'true_false',
  QuestionType.fillInBlank: 'fill_in_blank',
  QuestionType.essay: 'essay',
};

_AssignmentDetail _$AssignmentDetailFromJson(Map<String, dynamic> json) =>
    _AssignmentDetail(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      questions: json['questions'] == null
          ? const []
          : _parseAndSortQuestions(json['questions']),
      maxScore: (json['max_score'] as num?)?.toDouble() ?? 0.0,
      type:
          $enumDecodeNullable(_$AssignmentTypeEnumMap, json['type']) ??
          AssignmentType.homework,
      allowResubmit: json['allow_resubmit'] as bool? ?? false,
      dueAt: json['due_at'] == null
          ? null
          : DateTime.parse(json['due_at'] as String),
      startAt: json['start_at'] == null
          ? null
          : DateTime.parse(json['start_at'] as String),
      attachments:
          (json['attachments'] as List<dynamic>?)
              ?.map(
                (e) => AssignmentAttachment.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AssignmentDetailToJson(_AssignmentDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'questions': instance.questions,
      'max_score': instance.maxScore,
      'type': _$AssignmentTypeEnumMap[instance.type]!,
      'allow_resubmit': instance.allowResubmit,
      'due_at': instance.dueAt?.toIso8601String(),
      'start_at': instance.startAt?.toIso8601String(),
      'attachments': instance.attachments,
    };

const _$AssignmentTypeEnumMap = {
  AssignmentType.homework: 'homework',
  AssignmentType.exam: 'exam',
};

_AssignmentAttachment _$AssignmentAttachmentFromJson(
  Map<String, dynamic> json,
) => _AssignmentAttachment(
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  url: json['url'] as String? ?? '',
  type: json['type'] as String? ?? '',
);

Map<String, dynamic> _$AssignmentAttachmentToJson(
  _AssignmentAttachment instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'url': instance.url,
  'type': instance.type,
};

_SubmissionResult _$SubmissionResultFromJson(Map<String, dynamic> json) =>
    _SubmissionResult(
      id: json['id'] as String? ?? '',
      score: (json['score'] as num?)?.toDouble(),
      status: json['status'] as String? ?? '',
      submittedAt: DateTime.parse(json['submitted_at'] as String),
      feedback: json['feedback'] as String?,
    );

Map<String, dynamic> _$SubmissionResultToJson(_SubmissionResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'score': instance.score,
      'status': instance.status,
      'submitted_at': instance.submittedAt.toIso8601String(),
      'feedback': instance.feedback,
    };

_SubmissionItem _$SubmissionItemFromJson(Map<String, dynamic> json) =>
    _SubmissionItem(
      id: json['id'] as String? ?? '',
      questionId: json['question_id'] as String? ?? '',
      answer: json['answer'] as String? ?? '',
      score: (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SubmissionItemToJson(_SubmissionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.questionId,
      'answer': instance.answer,
      'score': instance.score,
    };

_ExplainQuestionResult _$ExplainQuestionResultFromJson(
  Map<String, dynamic> json,
) => _ExplainQuestionResult(
  analysis: json['analysis'] as String? ?? '',
  steps:
      (json['steps'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  keyPoints:
      (json['key_points'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  pitfalls:
      (json['pitfalls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  checklist:
      (json['checklist'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$ExplainQuestionResultToJson(
  _ExplainQuestionResult instance,
) => <String, dynamic>{
  'analysis': instance.analysis,
  'steps': instance.steps,
  'key_points': instance.keyPoints,
  'pitfalls': instance.pitfalls,
  'checklist': instance.checklist,
};

_GradeAssignmentResult _$GradeAssignmentResultFromJson(
  Map<String, dynamic> json,
) => _GradeAssignmentResult(
  score: (json['score'] as num?)?.toInt() ?? 0,
  summary: json['summary'] as String? ?? '',
  suggestions:
      (json['suggestions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  itemScores:
      (json['item_scores'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
);

Map<String, dynamic> _$GradeAssignmentResultToJson(
  _GradeAssignmentResult instance,
) => <String, dynamic>{
  'score': instance.score,
  'summary': instance.summary,
  'suggestions': instance.suggestions,
  'item_scores': instance.itemScores,
};
