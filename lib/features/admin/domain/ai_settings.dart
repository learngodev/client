import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_settings.freezed.dart';
part 'ai_settings.g.dart';

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

@freezed
abstract class AIAgentSetting with _$AIAgentSetting {
  const AIAgentSetting._();

  const factory AIAgentSetting({
    @Default('') String id,
    @Default('') String schoolId,
    @JsonKey(fromJson: AIProvider.fromString) required AIProvider provider,
    @Default('') String model,
    @Default('') String apiKey,
    @Default('') String baseUrl,
    @Default(0.7) double temperature,
    @Default(0.9) double topP,
    @Default(2048) int maxOutputTokens,
    @Default(1000) int maxDailyRequests,
    @Default(10) int maxConcurrentRequests,
    @Default(50) int maxConversationMessages,
    @Default('') String systemPrompt,
    @Default(false) bool visionEnabled,
    @Default('') String updatedBy,
    @Default('') String updatedByName,
    required DateTime updatedAt,
    @Default(false) bool apiKeyPresent,
  }) = _AIAgentSetting;

  factory AIAgentSetting.fromJson(Map<String, dynamic> json) =>
      _$AIAgentSettingFromJson(json);
}
