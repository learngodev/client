// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AIAgentSetting _$AIAgentSettingFromJson(Map<String, dynamic> json) =>
    _AIAgentSetting(
      id: json['id'] as String? ?? '',
      schoolId: json['school_id'] as String? ?? '',
      provider: _parseProvider(json['provider']),
      model: json['model'] as String? ?? '',
      apiKey: json['api_key'] as String? ?? '',
      baseUrl: json['base_url'] as String? ?? '',
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0.7,
      topP: (json['top_p'] as num?)?.toDouble() ?? 0.9,
      maxOutputTokens: (json['max_output_tokens'] as num?)?.toInt() ?? 2048,
      maxDailyRequests: (json['max_daily_requests'] as num?)?.toInt() ?? 1000,
      maxConcurrentRequests:
          (json['max_concurrent_requests'] as num?)?.toInt() ?? 10,
      maxConversationMessages:
          (json['max_conversation_messages'] as num?)?.toInt() ?? 50,
      systemPrompt: json['system_prompt'] as String? ?? '',
      visionEnabled: json['vision_enabled'] as bool? ?? false,
      updatedBy: json['updated_by'] as String? ?? '',
      updatedByName: json['updated_by_name'] as String? ?? '',
      updatedAt: _parseDateTimeOrNow(json['updated_at']),
      apiKeyPresent: json['api_key_present'] as bool? ?? false,
    );

Map<String, dynamic> _$AIAgentSettingToJson(_AIAgentSetting instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_id': instance.schoolId,
      'provider': _$AIProviderEnumMap[instance.provider]!,
      'model': instance.model,
      'api_key': instance.apiKey,
      'base_url': instance.baseUrl,
      'temperature': instance.temperature,
      'top_p': instance.topP,
      'max_output_tokens': instance.maxOutputTokens,
      'max_daily_requests': instance.maxDailyRequests,
      'max_concurrent_requests': instance.maxConcurrentRequests,
      'max_conversation_messages': instance.maxConversationMessages,
      'system_prompt': instance.systemPrompt,
      'vision_enabled': instance.visionEnabled,
      'updated_by': instance.updatedBy,
      'updated_by_name': instance.updatedByName,
      'updated_at': instance.updatedAt.toIso8601String(),
      'api_key_present': instance.apiKeyPresent,
    };

const _$AIProviderEnumMap = {
  AIProvider.qwen: 'qwen',
  AIProvider.deepseek: 'deepseek',
};
