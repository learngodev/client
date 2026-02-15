// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_go/features/auth/domain/account.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum MessageKind { text, image, video, audio, file }

@freezed
abstract class Message with _$Message {
  const factory Message({
    required String id,
    required String conversationId,
    required String senderId,
    required AccountRole senderRole,
    required MessageKind kind,
    @Default('') String text,
    String? mediaUri,
    String? metadata,
    required DateTime createdAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
