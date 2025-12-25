import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/features/im/data/repositories/im_repository.dart';
import 'package:learn_go/features/im/domain/entities/conversation.dart';
import 'package:learn_go/features/im/domain/entities/message.dart';
import 'package:learn_go/features/im/data/generated/conversation.pb.dart' as pb;
import 'package:learn_go/features/im/data/generated/google/protobuf/timestamp.pb.dart'
    as $google_pb;
import 'package:learn_go/features/auth/domain/account.dart';

final conversationsProvider = FutureProvider<List<Conversation>>((ref) async {
  final repository = ref.watch(imRepositoryProvider);
  return repository.getConversations();
});

final imServiceProvider = Provider<IMService>((ref) {
  final repository = ref.watch(imRepositoryProvider);
  final service = IMService(repository);
  ref.onDispose(() => service.dispose());
  return service;
});

class IMService {
  final IMRepository _repository;
  final StreamController<pb.ConversationStreamRequest> _requestController =
      StreamController.broadcast();
  final StreamController<pb.ConversationStreamResponse> _mergedController =
      StreamController.broadcast();

  StreamSubscription? _responseSubscription;
  StreamSubscription? _appRequestSubscription;
  StreamController<pb.ConversationStreamRequest>? _currentGrpcRequestController;
  final Set<String> _joinedConversations = {};
  bool _isDisposed = false;

  IMService(this._repository) {
    _appRequestSubscription = _requestController.stream.listen((request) {
      if (_currentGrpcRequestController != null &&
          !_currentGrpcRequestController!.isClosed) {
        _currentGrpcRequestController!.add(request);
      }
    });
    _connect();
  }

  void _connect() {
    if (_isDisposed) return;

    _responseSubscription?.cancel();
    _currentGrpcRequestController?.close();

    _currentGrpcRequestController =
        StreamController<pb.ConversationStreamRequest>();

    try {
      final stream = _repository.connectToStream(
        _currentGrpcRequestController!.stream,
      );

      _responseSubscription = stream.listen(
        (event) => _mergedController.add(event),
        onError: (e) {
          debugPrint('gRPC Stream Error: $e');
          _handleReconnect();
        },
        onDone: () {
          debugPrint('gRPC Stream Closed');
          _handleReconnect();
        },
      );

      // Re-join conversations upon reconnection
      for (final conversationId in _joinedConversations) {
        final request = pb.ConversationStreamRequest()
          ..join = (pb.JoinConversation()..conversationId = conversationId);
        _currentGrpcRequestController?.add(request);
      }
    } catch (e) {
      debugPrint('gRPC Connection Error: $e');
      _handleReconnect();
    }
  }

  void _handleReconnect() {
    if (_isDisposed) return;

    Future.delayed(const Duration(seconds: 3), () {
      debugPrint('Reconnecting gRPC stream...');
      _connect();
    });
  }

  Stream<pb.ConversationStreamResponse> get stream => _mergedController.stream;

  void joinConversation(String conversationId) {
    _joinedConversations.add(conversationId);
    _requestController.add(
      pb.ConversationStreamRequest()
        ..join = (pb.JoinConversation()..conversationId = conversationId),
    );
  }

  void leaveConversation(String conversationId) {
    _joinedConversations.remove(conversationId);
  }

  Future<void> markAsRead(String conversationId, String messageId) async {
    await _repository.markConversationAsRead(conversationId, messageId);
  }

  void emitLocalMessage(Message message) {
    final pbMessage = pb.Message()
      ..id = message.id
      ..conversationId = message.conversationId
      ..senderId = message.senderId
      ..senderRole = message.senderRole.apiValue
      ..kind = message.kind.name
      ..text = message.text
      ..createdAt = $google_pb.Timestamp.fromDateTime(message.createdAt);

    if (message.mediaUri != null) pbMessage.mediaUri = message.mediaUri!;
    if (message.metadata != null) pbMessage.metadata = message.metadata!;

    final event = pb.ConversationStreamResponse()
      ..messageEvent = (pb.MessageCreatedEvent()..message = pbMessage);

    _mergedController.add(event);
  }

  void dispose() {
    _isDisposed = true;
    _appRequestSubscription?.cancel();
    _requestController.close();
    _currentGrpcRequestController?.close();
    _responseSubscription?.cancel();
    _mergedController.close();
  }
}

final messagesProvider = StreamProvider.autoDispose
    .family<List<Message>, String>((ref, conversationId) {
      final repository = ref.watch(imRepositoryProvider);
      final imService = ref.watch(imServiceProvider);
      final controller = StreamController<List<Message>>();
      List<Message> currentMessages = [];

      // Initial fetch via REST
      repository
          .getMessages(conversationId)
          .then((messages) {
            currentMessages = messages.reversed.toList();
            controller.add(currentMessages);
          })
          .catchError((e) {
            controller.addError(e);
          });

      // Join conversation via gRPC
      imService.joinConversation(conversationId);

      // Listen to gRPC stream
      final subscription = imService.stream.listen((event) {
        if (event.hasMessageEvent()) {
          final msgEvent = event.messageEvent;
          final msg = msgEvent.message;

          if (msg.conversationId == conversationId) {
            // Map proto Message to domain Message
            final domainMessage = Message(
              id: msg.id,
              conversationId: msg.conversationId,
              senderId: msg.senderId,
              senderRole: _mapRole(msg.senderRole),
              kind: _mapKind(msg.kind),
              text: msg.text,
              mediaUri: msg.mediaUri.isNotEmpty ? msg.mediaUri : null,
              metadata: msg.metadata.isNotEmpty ? msg.metadata : null,
              createdAt: msg.createdAt.toDateTime(),
            );

            // Avoid duplicates if necessary (prepend)
            if (!currentMessages.any((m) => m.id == domainMessage.id)) {
              currentMessages = [domainMessage, ...currentMessages];
              controller.add(currentMessages);
            }
          }
        }
      });

      ref.onDispose(() {
        subscription.cancel();
        controller.close();
        imService.leaveConversation(conversationId);
      });

      return controller.stream;
    });

AccountRole _mapRole(String role) {
  // TODO: Handle 'ai' role properly. Currently mapping to student to avoid crash.
  // Ideally Message entity should support AI role.
  switch (role.toLowerCase()) {
    case 'user':
    case 'student':
      return AccountRole.student;
    case 'teacher':
      return AccountRole.teacher;
    case 'admin':
    case 'system':
      return AccountRole.admin;
    case 'ai':
      return AccountRole.ai;
    default:
      return AccountRole.student;
  }
}

MessageKind _mapKind(String kind) {
  switch (kind.toLowerCase()) {
    case 'text':
      return MessageKind.text;
    case 'image':
      return MessageKind.image;
    case 'video':
      return MessageKind.video;
    case 'audio':
      return MessageKind.audio;
    case 'file':
      return MessageKind.file;
    default:
      return MessageKind.text;
  }
}

final imControllerProvider = Provider((ref) => IMController(ref));

class IMController {
  final Ref _ref;

  IMController(this._ref);

  Future<void> sendMessage(
    String conversationId,
    String text, {
    MessageKind kind = MessageKind.text,
    String? mediaUri,
  }) async {
    final repository = _ref.read(imRepositoryProvider);
    final imService = _ref.read(imServiceProvider);

    final sentMessage = await repository.sendMessage(
      conversationId,
      text,
      kind: kind,
      mediaUri: mediaUri,
    );
    // Optimistically update the stream to ensure UI updates immediately
    imService.emitLocalMessage(sentMessage);

    // Refresh conversation list to update the latest message preview
    await refreshConversations();
  }

  Future<void> refreshConversations() async {
    _ref.invalidate(conversationsProvider);
  }
}
