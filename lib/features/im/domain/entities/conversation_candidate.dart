import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_go/features/auth/domain/account.dart';

part 'conversation_candidate.freezed.dart';
part 'conversation_candidate.g.dart';

@freezed
abstract class ConversationCandidate with _$ConversationCandidate {
  const factory ConversationCandidate({
    required String id,
    required String displayName,
    required AccountRole role,
  }) = _ConversationCandidate;

  factory ConversationCandidate.fromJson(Map<String, dynamic> json) =>
      _$ConversationCandidateFromJson(json);
}
