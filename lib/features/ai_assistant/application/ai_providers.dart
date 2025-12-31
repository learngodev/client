import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/ai_repository.dart';
import '../domain/ai_models.dart';

final aiSessionsProvider = FutureProvider.autoDispose<List<AIChatSession>>((
  ref,
) {
  final repo = ref.watch(aiRepositoryProvider);
  return repo.getSessions();
});

final aiSessionMessagesProvider = AsyncNotifierProvider.autoDispose
    .family<AIChatMessagesNotifier, List<AIChatMessage>, String>(
      AIChatMessagesNotifier.new,
    );

class AIChatMessagesNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<AIChatMessage>, String> {
  @override
  Future<List<AIChatMessage>> build(String arg) {
    final repo = ref.watch(aiRepositoryProvider);
    return repo.getMessages(arg);
  }

  Future<void> sendMessage(String content) async {
    final repo = ref.read(aiRepositoryProvider);

    final userMsg = AIChatMessage(
      id: 'temp-user-${DateTime.now().millisecondsSinceEpoch}',
      sessionId: arg,
      sender: 'user',
      content: content,
      createdAt: DateTime.now(),
    );

    final previousState = state.valueOrNull ?? [];
    state = AsyncValue.data([...previousState, userMsg]);

    final assistantMsgId = 'temp-ai-${DateTime.now().millisecondsSinceEpoch}';
    final assistantMsg = AIChatMessage(
      id: assistantMsgId,
      sessionId: arg,
      sender: 'assistant',
      content: '',
      createdAt: DateTime.now(),
    );
    state = AsyncValue.data([...previousState, userMsg, assistantMsg]);

    try {
      final stream = repo.streamMessage(arg, content);
      String fullContent = '';

      await for (final chunk in stream) {
        fullContent += chunk;

        final currentMessages = state.valueOrNull ?? [];
        final updatedMessages = currentMessages.map((msg) {
          if (msg.id == assistantMsgId) {
            return msg.copyWith(content: fullContent);
          }
          return msg;
        }).toList();
        state = AsyncValue.data(updatedMessages);
      }

      ref.invalidateSelf();
      ref.invalidate(aiSessionsProvider);
      ref.invalidate(aiUsageProvider);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final aiUsageProvider = FutureProvider.autoDispose<AIUsageSummary>((ref) {
  final repo = ref.watch(aiRepositoryProvider);
  return repo.getUsageSummary();
});

class AIChatController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future<AIChatSession?> createSession() async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(aiRepositoryProvider);
      final session = await repo.createSession();
      ref.invalidate(aiSessionsProvider);
      state = const AsyncValue.data(null);
      return session;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  Future<void> updateSessionTitle(String sessionId, String title) async {
    try {
      final repo = ref.read(aiRepositoryProvider);
      await repo.updateSession(sessionId, title);
      ref.invalidate(aiSessionsProvider);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteSession(String sessionId) async {
    try {
      final repo = ref.read(aiRepositoryProvider);
      await repo.deleteSession(sessionId);
      ref.invalidate(aiSessionsProvider);
    } catch (e) {
      rethrow;
    }
  }
}

final aiChatControllerProvider =
    AsyncNotifierProvider.autoDispose<AIChatController, void>(
      AIChatController.new,
    );
