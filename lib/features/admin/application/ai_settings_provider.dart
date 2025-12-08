import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/application/auth_controller.dart';
import '../data/admin_repository.dart';
import '../domain/ai_settings.dart';

class AdminAISettingsNotifier extends AsyncNotifier<AIAgentSetting?> {
  @override
  Future<AIAgentSetting?> build() async {
    final authState = ref.watch(authStateProvider);
    if (!authState.isAuthenticated) {
      return null;
    }

    final schoolId = authState.account?.schoolId ?? '';
    if (schoolId.isEmpty) {
      throw StateError('缺少学校信息');
    }

    final repository = ref.watch(adminRepositoryProvider);
    try {
      return await repository.fetchAISettings(schoolId: schoolId);
    } catch (e) {
      // If it's a 404 or similar, we might want to return a default object or null
      // For now, let's rethrow so the UI shows the error
      rethrow;
    }
  }

  Future<void> updateSettings(AIAgentSetting setting) async {
    final repository = ref.read(adminRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await repository.updateAISettings(setting: setting);
    });
  }
}

final adminAISettingsProvider =
    AsyncNotifierProvider<AdminAISettingsNotifier, AIAgentSetting?>(
      AdminAISettingsNotifier.new,
    );
