// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_go/features/auth/domain/account.dart';
import 'message.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

enum ConversationType { direct, group }

@freezed
abstract class Conversation with _$Conversation {
  const Conversation._();

  const factory Conversation({
    required String id,
    required ConversationType type,
    @JsonKey(name: 'school_id') required String schoolId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'last_message') Message? lastMessage,
    @JsonKey(name: 'unread_count') @Default(0) int unreadCount,
    @Default([]) List<ConversationMember> members,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  String getDisplayName(String currentUserId) {
    if (type == ConversationType.group) {
      return '群聊'; // TODO: Better group name logic
    }
    final otherMember = members.firstWhere(
      (m) => m.accountId != currentUserId,
      orElse: () => members.first,
    );
    if (otherMember.accountName != null &&
        otherMember.accountName!.isNotEmpty) {
      return otherMember.accountName!;
    }
    return 'User ${otherMember.accountId}';
  }
}

@freezed
abstract class ConversationMember with _$ConversationMember {
  const factory ConversationMember({
    required String id,
    @JsonKey(name: 'conversation_id') required String conversationId,
    @JsonKey(name: 'account_id') required String accountId,
    @JsonKey(name: 'account_name') String? accountName,
    required AccountRole role,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _ConversationMember;

  factory ConversationMember.fromJson(Map<String, dynamic> json) =>
      _$ConversationMemberFromJson(json);
}
