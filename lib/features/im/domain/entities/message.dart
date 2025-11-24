// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_go/features/auth/domain/account.dart';

part 'message.freezed.dart';
part 'message.g.dart';

enum MessageKind { text, image, video, audio }

@freezed
abstract class Message with _$Message {
  const factory Message({
    required String id,
    @JsonKey(name: 'conversation_id') required String conversationId,
    @JsonKey(name: 'sender_id') required String senderId,
    @JsonKey(name: 'sender_role') required AccountRole senderRole,
    required MessageKind kind,
    @Default('') String text,
    @JsonKey(name: 'media_uri') String? mediaUri,
    String? metadata,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
