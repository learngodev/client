import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/ai_repository.dart';
import '../domain/ai_models.dart';

final aiSessionsProvider = FutureProvider.autoDispose<List<AIChatSession>>((
  ref,
) {
  final repo = ref.watch(aiRepositoryProvider);
  return repo.getSessions();
});

final aiSessionMessagesProvider = FutureProvider.autoDispose
    .family<List<AIChatMessage>, String>((ref, sessionId) {
      final repo = ref.watch(aiRepositoryProvider);
      return repo.getMessages(sessionId);
    });

final aiUsageProvider = FutureProvider.autoDispose<AIUsageSummary>((ref) {
  final repo = ref.watch(aiRepositoryProvider);
  return repo.getUsageSummary();
});

final aiChatControllerProvider =
    StateNotifierProvider<AIChatController, AsyncValue<void>>((ref) {
      return AIChatController(ref);
    });

class AIChatController extends StateNotifier<AsyncValue<void>> {
  AIChatController(this._ref) : super(const AsyncValue.data(null));

  final Ref _ref;

  Future<AIChatSession?> createSession() async {
    state = const AsyncValue.loading();
    try {
      final repo = _ref.read(aiRepositoryProvider);
      final session = await repo.createSession();
      _ref.invalidate(aiSessionsProvider);
      state = const AsyncValue.data(null);
      return session;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  Future<void> sendMessage(String sessionId, String content) async {
    // We don't set global loading state here to avoid blocking the UI,
    // but we might want to handle optimistic updates in the UI.
    try {
      final repo = _ref.read(aiRepositoryProvider);
      await repo.sendMessage(sessionId, content);
      _ref.invalidate(aiSessionMessagesProvider(sessionId));
      _ref.invalidate(aiSessionsProvider); // Update last message time/count
      _ref.invalidate(aiUsageProvider);
    } catch (e) {
      // Handle error (maybe show snackbar in UI)
      rethrow;
    }
  }

  Future<void> updateSessionTitle(String sessionId, String title) async {
    try {
      final repo = _ref.read(aiRepositoryProvider);
      await repo.updateSession(sessionId, title);
      _ref.invalidate(aiSessionsProvider);
    } catch (e) {
      rethrow;
    }
  }
}
