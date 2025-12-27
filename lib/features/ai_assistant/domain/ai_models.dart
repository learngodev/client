class AIChatSession {
  const AIChatSession({
    required this.id,
    required this.title,
    required this.lastMessageAt,
    required this.messageCount,
    required this.tokenCount,
    required this.createdAt,
    this.closedAt,
  });

  final String id;
  final String title;
  final DateTime lastMessageAt;
  final int messageCount;
  final int tokenCount;
  final DateTime createdAt;
  final DateTime? closedAt;

  factory AIChatSession.fromJson(Map<String, dynamic> json) {
    return AIChatSession(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      lastMessageAt:
          DateTime.tryParse(
            json['last_message_at'] as String? ?? '',
          )?.toLocal() ??
          DateTime.now(),
      messageCount: (json['message_count'] as num?)?.toInt() ?? 0,
      tokenCount: (json['token_count'] as num?)?.toInt() ?? 0,
      createdAt:
          DateTime.tryParse(json['created_at'] as String? ?? '')?.toLocal() ??
          DateTime.now(),
      closedAt: json['closed_at'] != null
          ? DateTime.tryParse(json['closed_at'] as String)?.toLocal()
          : null,
    );
  }
}

class AIChatMessage {
  const AIChatMessage({
    required this.id,
    required this.sessionId,
    required this.sender,
    required this.content,
    required this.createdAt,
    this.promptTokens = 0,
    this.resultTokens = 0,
    this.latencyMs = 0,
  });

  final String id;
  final String sessionId;
  final String sender; // 'user' or 'assistant'
  final String content;
  final DateTime createdAt;
  final int promptTokens;
  final int resultTokens;
  final int latencyMs;

  bool get isUser => sender == 'user';

  factory AIChatMessage.fromJson(Map<String, dynamic> json) {
    return AIChatMessage(
      id: json['id'] as String? ?? '',
      sessionId: json['session_id'] as String? ?? '',
      sender: json['sender'] as String? ?? '',
      content: json['content'] as String? ?? '',
      createdAt:
          DateTime.tryParse(json['created_at'] as String? ?? '')?.toLocal() ??
          DateTime.now(),
      promptTokens: (json['prompt_tokens'] as num?)?.toInt() ?? 0,
      resultTokens: (json['result_tokens'] as num?)?.toInt() ?? 0,
      latencyMs: (json['latency_ms'] as num?)?.toInt() ?? 0,
    );
  }
}

class AIUsageSummary {
  const AIUsageSummary({
    required this.accountId,
    required this.userMessages,
    required this.assistantMessages,
    required this.totalMessages,
    required this.totalTokens,
    required this.maxDailyRequests,
    required this.remainingDailyRequests,
  });

  final String accountId;
  final int userMessages;
  final int assistantMessages;
  final int totalMessages;
  final int totalTokens;
  final int maxDailyRequests;
  final int remainingDailyRequests;

  factory AIUsageSummary.fromJson(Map<String, dynamic> json) {
    return AIUsageSummary(
      accountId: json['account_id'] as String? ?? '',
      userMessages: (json['user_messages'] as num?)?.toInt() ?? 0,
      assistantMessages: (json['assistant_messages'] as num?)?.toInt() ?? 0,
      totalMessages: (json['total_messages'] as num?)?.toInt() ?? 0,
      totalTokens: (json['total_tokens'] as num?)?.toInt() ?? 0,
      maxDailyRequests: (json['max_daily_requests'] as num?)?.toInt() ?? 0,
      remainingDailyRequests:
          (json['remaining_daily_requests'] as num?)?.toInt() ?? 0,
    );
  }
}

class AIUsageTimelinePoint {
  const AIUsageTimelinePoint({
    required this.date,
    required this.totalMessages,
    required this.totalTokens,
    required this.accountCount,
  });

  final DateTime date;
  final int totalMessages;
  final int totalTokens;
  final int accountCount;

  factory AIUsageTimelinePoint.fromJson(Map<String, dynamic> json) {
    return AIUsageTimelinePoint(
      date:
          DateTime.tryParse(json['date'] as String? ?? '')?.toLocal() ??
          DateTime.now(),
      totalMessages: (json['total_messages'] as num?)?.toInt() ?? 0,
      totalTokens: (json['total_tokens'] as num?)?.toInt() ?? 0,
      accountCount: (json['account_count'] as num?)?.toInt() ?? 0,
    );
  }
}
