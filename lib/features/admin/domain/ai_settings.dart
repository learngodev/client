enum AIProvider {
  qwen,
  deepseek;

  String get label {
    return switch (this) {
      AIProvider.qwen => '通义千问 (Qwen)',
      AIProvider.deepseek => 'DeepSeek',
    };
  }

  static AIProvider fromString(String value) {
    return AIProvider.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => AIProvider.deepseek,
    );
  }
}

class AIAgentSetting {
  const AIAgentSetting({
    required this.id,
    required this.schoolId,
    required this.provider,
    required this.model,
    required this.apiKey,
    required this.baseUrl,
    required this.temperature,
    required this.topP,
    required this.maxOutputTokens,
    required this.maxDailyRequests,
    required this.maxConcurrentRequests,
    required this.maxConversationMessages,
    required this.systemPrompt,
    required this.visionEnabled,
    required this.updatedBy,
    required this.updatedByName,
    required this.updatedAt,
    required this.apiKeyPresent,
  });

  final String id;
  final String schoolId;
  final AIProvider provider;
  final String model;
  final String apiKey;
  final String baseUrl;
  final double temperature;
  final double topP;
  final int maxOutputTokens;
  final int maxDailyRequests;
  final int maxConcurrentRequests;
  final int maxConversationMessages;
  final String systemPrompt;
  final bool visionEnabled;
  final String updatedBy;
  final String updatedByName;
  final DateTime updatedAt;
  final bool apiKeyPresent;

  factory AIAgentSetting.fromJson(Map<String, dynamic> json) {
    return AIAgentSetting(
      id: json['id'] as String? ?? '',
      schoolId: json['school_id'] as String? ?? '',
      provider: AIProvider.fromString(json['provider'] as String? ?? ''),
      model: json['model'] as String? ?? '',
      apiKey: json['api_key'] as String? ?? '',
      baseUrl: json['base_url'] as String? ?? '',
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0.7,
      topP: (json['top_p'] as num?)?.toDouble() ?? 0.9,
      maxOutputTokens: json['max_output_tokens'] as int? ?? 2048,
      maxDailyRequests: json['max_daily_requests'] as int? ?? 1000,
      maxConcurrentRequests: json['max_concurrent_requests'] as int? ?? 10,
      maxConversationMessages: json['max_conversation_messages'] as int? ?? 50,
      systemPrompt: json['system_prompt'] as String? ?? '',
      visionEnabled: json['vision_enabled'] as bool? ?? false,
      updatedBy: json['updated_by'] as String? ?? '',
      updatedByName: json['updated_by_name'] as String? ?? '',
      updatedAt:
          DateTime.tryParse(json['updated_at'] as String? ?? '') ??
          DateTime.now(),
      apiKeyPresent: json['api_key_present'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'school_id': schoolId,
      'provider': provider.name,
      'model': model,
      'api_key': apiKey,
      'base_url': baseUrl,
      'temperature': temperature,
      'top_p': topP,
      'max_output_tokens': maxOutputTokens,
      'max_daily_requests': maxDailyRequests,
      'max_concurrent_requests': maxConcurrentRequests,
      'max_conversation_messages': maxConversationMessages,
      'system_prompt': systemPrompt,
      'vision_enabled': visionEnabled,
    };
  }

  AIAgentSetting copyWith({
    String? id,
    String? schoolId,
    AIProvider? provider,
    String? model,
    String? apiKey,
    String? baseUrl,
    double? temperature,
    double? topP,
    int? maxOutputTokens,
    int? maxDailyRequests,
    int? maxConcurrentRequests,
    int? maxConversationMessages,
    String? systemPrompt,
    bool? visionEnabled,
    String? updatedBy,
    String? updatedByName,
    DateTime? updatedAt,
    bool? apiKeyPresent,
  }) {
    return AIAgentSetting(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      provider: provider ?? this.provider,
      model: model ?? this.model,
      apiKey: apiKey ?? this.apiKey,
      baseUrl: baseUrl ?? this.baseUrl,
      temperature: temperature ?? this.temperature,
      topP: topP ?? this.topP,
      maxOutputTokens: maxOutputTokens ?? this.maxOutputTokens,
      maxDailyRequests: maxDailyRequests ?? this.maxDailyRequests,
      maxConcurrentRequests:
          maxConcurrentRequests ?? this.maxConcurrentRequests,
      maxConversationMessages:
          maxConversationMessages ?? this.maxConversationMessages,
      systemPrompt: systemPrompt ?? this.systemPrompt,
      visionEnabled: visionEnabled ?? this.visionEnabled,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedByName: updatedByName ?? this.updatedByName,
      updatedAt: updatedAt ?? this.updatedAt,
      apiKeyPresent: apiKeyPresent ?? this.apiKeyPresent,
    );
  }
}
