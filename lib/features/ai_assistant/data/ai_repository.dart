import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/network/dio_provider.dart';
import '../domain/ai_models.dart';

final aiRepositoryProvider = Provider<AIRepository>((ref) {
  return AIRepository(ref.watch(dioProvider));
});

class AIRepository {
  AIRepository(this._dio);

  final Dio _dio;

  Future<List<AIChatSession>> getSessions({int limit = 20}) async {
    final response = await _dio.get(
      '/api/v1/ai/sessions',
      queryParameters: {'limit': limit},
    );
    final body = response.data as Map<String, dynamic>;
    final data = body['data'] as Map<String, dynamic>;
    final list = data['sessions'] as List<dynamic>? ?? [];
    return list
        .map((e) => AIChatSession.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<AIChatSession> createSession({String? title}) async {
    final response = await _dio.post(
      '/api/v1/ai/sessions',
      data: {'title': title ?? 'New Chat'},
    );
    final body = response.data as Map<String, dynamic>;
    final data = body['data'] as Map<String, dynamic>;
    return AIChatSession.fromJson(data['session'] as Map<String, dynamic>);
  }

  Future<AIChatSession> updateSession(String id, String title) async {
    final response = await _dio.patch(
      '/api/v1/ai/sessions/$id',
      data: {'title': title},
    );
    final body = response.data as Map<String, dynamic>;
    final data = body['data'] as Map<String, dynamic>;
    return AIChatSession.fromJson(data['session'] as Map<String, dynamic>);
  }

  Future<void> deleteSession(String id) async {
    await _dio.delete('/api/v1/ai/sessions/$id');
  }

  Future<AIChatSession> closeSession(String id) async {
    final response = await _dio.post('/api/v1/ai/sessions/$id/close');
    final body = response.data as Map<String, dynamic>;
    final data = body['data'] as Map<String, dynamic>;
    return AIChatSession.fromJson(data['session'] as Map<String, dynamic>);
  }

  Future<List<AIChatMessage>> getMessages(
    String sessionId, {
    int limit = 50,
    DateTime? before,
  }) async {
    final query = <String, dynamic>{'limit': limit};
    if (before != null) {
      query['before'] = before.toUtc().toIso8601String();
    }

    final response = await _dio.get(
      '/api/v1/ai/sessions/$sessionId/messages',
      queryParameters: query,
    );
    final body = response.data as Map<String, dynamic>;
    final data = body['data'] as Map<String, dynamic>;
    final list = data['messages'] as List<dynamic>? ?? [];
    return list
        .map((e) => AIChatMessage.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<AIChatMessage> sendMessage(String sessionId, String content) async {
    final response = await _dio.post(
      '/api/v1/ai/sessions/$sessionId/messages',
      data: {'content': content},
    );
    final body = response.data as Map<String, dynamic>;
    final data = body['data'] as Map<String, dynamic>;
    // The backend returns { session, user_message, assistant_message, status }
    // We return the assistant message if available, otherwise the user message (or handle pending state)
    // For simplicity in this chat UI, we might want to return the assistant message.
    // However, if it's streaming or pending, we might need to handle that.
    // Based on the backend code:
    // if result.AssistantMessage != nil { status = "completed"; respPayload["assistant_message"] = ... }

    if (data['assistant_message'] != null) {
      return AIChatMessage.fromJson(
        data['assistant_message'] as Map<String, dynamic>,
      );
    }
    // Fallback to user message if assistant message is not yet ready (though current backend seems synchronous for now)
    return AIChatMessage.fromJson(data['user_message'] as Map<String, dynamic>);
  }

  Future<AIUsageSummary> getUsageSummary({DateTime? since}) async {
    final query = <String, dynamic>{};
    if (since != null) {
      query['since'] = since.toUtc().toIso8601String();
    }
    final response = await _dio.get('/api/v1/ai/usage', queryParameters: query);
    final body = response.data as Map<String, dynamic>;
    final data = body['data'] as Map<String, dynamic>;
    return AIUsageSummary.fromJson(data['usage'] as Map<String, dynamic>);
  }

  Future<List<AIUsageTimelinePoint>> getUsageTimeline({
    required String schoolId,
    int days = 7,
  }) async {
    final response = await _dio.get(
      '/api/v1/ai/usage/timeline',
      queryParameters: {'school_id': schoolId, 'days': days},
    );
    final body = response.data as Map<String, dynamic>;
    final data = body['data'] as Map<String, dynamic>;
    final list = data['timeline'] as List<dynamic>? ?? [];
    return list
        .map((e) => AIUsageTimelinePoint.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
