import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../ai_assistant/data/ai_repository.dart';
import '../../ai_assistant/domain/ai_models.dart';
import '../../auth/application/auth_controller.dart';

final aiUsageTimelineProvider =
    FutureProvider.autoDispose<List<AIUsageTimelinePoint>>((ref) async {
      final repo = ref.watch(aiRepositoryProvider);
      final account = ref.watch(authStateProvider).account;

      if (account == null) return [];

      return repo.getUsageTimeline(schoolId: account.schoolId, days: 14);
    });
