import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../application/ai_settings_provider.dart';
import '../../domain/ai_settings.dart';

class AdminAISettingsPage extends HookConsumerWidget {
  const AdminAISettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(adminAISettingsProvider);
    final notifier = ref.read(adminAISettingsProvider.notifier);

    void showSnack(String message) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
      );
    }

    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: settingsState.when(
        data: (setting) {
          if (setting == null) {
            return const Center(child: Text('未找到 AI 配置'));
          }
          return _AISettingsForm(
            setting: setting,
            onSave: (newSetting) async {
              try {
                await notifier.updateSettings(newSetting);
                showSnack('AI 配置已保存');
              } catch (e) {
                showSnack('保存失败: ${e.toString()}');
              }
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('加载失败: ${err.toString()}'),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () => ref.refresh(adminAISettingsProvider),
                icon: const Icon(Icons.refresh),
                label: const Text('重试'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AISettingsForm extends HookWidget {
  const _AISettingsForm({required this.setting, required this.onSave});

  final AIAgentSetting setting;
  final ValueChanged<AIAgentSetting> onSave;

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final provider = useState(setting.provider);
    final modelController = useTextEditingController(text: setting.model);
    final apiKeyController = useTextEditingController(text: setting.apiKey);
    final baseUrlController = useTextEditingController(text: setting.baseUrl);
    final systemPromptController = useTextEditingController(
      text: setting.systemPrompt,
    );
    final temperature = useState(setting.temperature);
    final topP = useState(setting.topP);
    final maxTokensController = useTextEditingController(
      text: setting.maxOutputTokens.toString(),
    );
    final visionEnabled = useState(setting.visionEnabled);

    // Only show API key if user explicitly wants to edit it, otherwise show placeholder if present
    final isEditingApiKey = useState(setting.apiKey.isEmpty);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(context, '基本配置'),
            const SizedBox(height: 16),
            DropdownButtonFormField<AIProvider>(
              initialValue: provider.value,
              decoration: const InputDecoration(
                labelText: 'AI 提供商',
                border: OutlineInputBorder(),
                helperText: '选择接入的大模型服务商',
              ),
              items: AIProvider.values.map((p) {
                return DropdownMenuItem(value: p, child: Text(p.label));
              }).toList(),
              onChanged: (v) {
                if (v != null) provider.value = v;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: modelController,
              decoration: const InputDecoration(
                labelText: '模型名称 (Model)',
                border: OutlineInputBorder(),
                helperText: '例如: deepseek-chat, qwen-turbo',
              ),
              validator: (v) => v?.isEmpty == true ? '请输入模型名称' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: baseUrlController,
              decoration: const InputDecoration(
                labelText: 'API Base URL',
                border: OutlineInputBorder(),
                helperText: '例如: https://api.deepseek.com',
              ),
              validator: (v) => v?.isEmpty == true ? '请输入 Base URL' : null,
            ),
            const SizedBox(height: 16),
            if (!isEditingApiKey.value && setting.apiKeyPresent)
              InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'API Key',
                  border: OutlineInputBorder(),
                  helperText: 'API Key 已设置。如需修改，请点击右侧按钮。',
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('••••••••••••••••••••••••'),
                    TextButton(
                      onPressed: () {
                        apiKeyController.clear();
                        isEditingApiKey.value = true;
                      },
                      child: const Text('修改'),
                    ),
                  ],
                ),
              )
            else
              TextFormField(
                controller: apiKeyController,
                decoration: InputDecoration(
                  labelText: 'API Key',
                  border: const OutlineInputBorder(),
                  helperText: '请输入新的 API Key',
                  suffixIcon: setting.apiKeyPresent && isEditingApiKey.value
                      ? IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => isEditingApiKey.value = false,
                          tooltip: '取消修改',
                        )
                      : null,
                ),
                obscureText: true,
                validator: (v) {
                  if (setting.apiKeyPresent && !isEditingApiKey.value) {
                    return null;
                  }
                  if (v?.isEmpty == true) {
                    return '请输入 API Key';
                  }
                  return null;
                },
              ),
            const SizedBox(height: 32),
            _buildSectionHeader(context, '模型参数'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '温度 (Temperature): ${temperature.value.toStringAsFixed(1)}',
                      ),
                      Slider(
                        value: temperature.value,
                        min: 0.0,
                        max: 2.0,
                        divisions: 20,
                        label: temperature.value.toStringAsFixed(1),
                        onChanged: (v) => temperature.value = v,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('核采样 (Top P): ${topP.value.toStringAsFixed(1)}'),
                      Slider(
                        value: topP.value,
                        min: 0.0,
                        max: 1.0,
                        divisions: 10,
                        label: topP.value.toStringAsFixed(1),
                        onChanged: (v) => topP.value = v,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: maxTokensController,
              decoration: const InputDecoration(
                labelText: '最大输出 Token (Max Output Tokens)',
                border: OutlineInputBorder(),
                helperText: '0 表示使用模型默认值',
              ),
              keyboardType: TextInputType.number,
              validator: (v) {
                if (v == null || v.isEmpty) return null;
                if (int.tryParse(v) == null) return '请输入有效的数字';
                return null;
              },
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('启用视觉能力 (Vision)'),
              subtitle: const Text('允许模型处理图片输入（需模型支持）'),
              value: visionEnabled.value,
              onChanged: (v) => visionEnabled.value = v,
            ),
            const SizedBox(height: 32),
            _buildSectionHeader(context, '系统提示词 (System Prompt)'),
            const SizedBox(height: 16),
            TextFormField(
              controller: systemPromptController,
              decoration: const InputDecoration(
                labelText: '系统提示词',
                border: OutlineInputBorder(),
                helperText: '设定 AI 的角色和行为规范',
                alignLabelWithHint: true,
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 32),
            if (setting.updatedBy.isNotEmpty) ...[
              Text(
                '最后更新: ${setting.updatedByName} 于 ${DateFormat('yyyy-MM-dd HH:mm').format(setting.updatedAt.toLocal())}',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 16),
            ],
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final newSetting = setting.copyWith(
                      provider: provider.value,
                      model: modelController.text.trim(),
                      baseUrl: baseUrlController.text.trim(),
                      apiKey: isEditingApiKey.value
                          ? apiKeyController.text.trim()
                          : setting.apiKey,
                      temperature: temperature.value,
                      topP: topP.value,
                      maxOutputTokens:
                          int.tryParse(maxTokensController.text) ?? 0,
                      systemPrompt: systemPromptController.text.trim(),
                      visionEnabled: visionEnabled.value,
                    );
                    onSave(newSetting);
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text('保存配置'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
