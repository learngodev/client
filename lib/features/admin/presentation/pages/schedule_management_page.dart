import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../application/schedule_providers.dart';
import '../../../auth/application/auth_controller.dart';

class ScheduleManagementPage extends HookConsumerWidget {
  const ScheduleManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final schoolId = user?.schoolId;

    if (schoolId == null) {
      return const Center(child: Text('School ID not found'));
    }

    final tabController = useTabController(initialLength: 2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('排课管理'),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(text: '时间段管理'),
            Tab(text: '排课规则'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month),
            tooltip: '生成课表',
            onPressed: () =>
                _showGenerateSessionsDialog(context, ref, schoolId),
          ),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          _TimeSlotsTab(schoolId: schoolId),
          _ScheduleRulesTab(schoolId: schoolId),
        ],
      ),
    );
  }

  void _showGenerateSessionsDialog(
    BuildContext context,
    WidgetRef ref,
    String schoolId,
  ) {
    showDialog(
      context: context,
      builder: (context) => _GenerateSessionsDialog(schoolId: schoolId),
    );
  }
}

class _TimeSlotsTab extends ConsumerWidget {
  const _TimeSlotsTab({required this.schoolId});

  final String schoolId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeSlotsAsync = ref.watch(timeSlotsProvider(schoolId));

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTimeSlotDialog(context, ref, schoolId),
        child: const Icon(Icons.add),
      ),
      body: timeSlotsAsync.when(
        data: (slots) {
          if (slots.isEmpty) {
            return const Center(child: Text('暂无时间段'));
          }
          return ListView.builder(
            itemCount: slots.length,
            itemBuilder: (context, index) {
              final slot = slots[index];
              return ListTile(
                title: Text(slot.name),
                subtitle: Text('${slot.startTime} - ${slot.endTime}'),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  void _showAddTimeSlotDialog(
    BuildContext context,
    WidgetRef ref,
    String schoolId,
  ) {
    showDialog(
      context: context,
      builder: (context) => _AddTimeSlotDialog(schoolId: schoolId),
    );
  }
}

class _AddTimeSlotDialog extends HookConsumerWidget {
  const _AddTimeSlotDialog({required this.schoolId});

  final String schoolId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final startController = useTextEditingController();
    final endController = useTextEditingController();

    return AlertDialog(
      title: const Text('添加时间段'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: '名称 (如: 第一节)'),
          ),
          TextField(
            controller: startController,
            decoration: const InputDecoration(labelText: '开始时间 (HH:mm)'),
          ),
          TextField(
            controller: endController,
            decoration: const InputDecoration(labelText: '结束时间 (HH:mm)'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
        TextButton(
          onPressed: () async {
            await ref
                .read(scheduleControllerProvider.notifier)
                .createTimeSlot(
                  schoolId: schoolId,
                  name: nameController.text,
                  startTime: startController.text,
                  endTime: endController.text,
                );
            if (context.mounted) Navigator.pop(context);
          },
          child: const Text('添加'),
        ),
      ],
    );
  }
}

class _ScheduleRulesTab extends HookConsumerWidget {
  const _ScheduleRulesTab({required this.schoolId});

  final String schoolId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Implement Schedule Rules UI
    // This requires fetching courses, classes, teachers, and time slots to populate dropdowns.
    return const Center(child: Text('排课规则功能开发中...'));
  }
}

class _GenerateSessionsDialog extends HookConsumerWidget {
  const _GenerateSessionsDialog({required this.schoolId});

  final String schoolId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startDate = useState<DateTime>(DateTime.now());
    final endDate = useState<DateTime>(
      DateTime.now().add(const Duration(days: 7)),
    );

    return AlertDialog(
      title: const Text('生成课表'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('开始日期'),
            subtitle: Text(startDate.value.toIso8601String().split('T')[0]),
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: startDate.value,
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (picked != null) startDate.value = picked;
            },
          ),
          ListTile(
            title: const Text('结束日期'),
            subtitle: Text(endDate.value.toIso8601String().split('T')[0]),
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: endDate.value,
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (picked != null) endDate.value = picked;
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
        TextButton(
          onPressed: () async {
            await ref
                .read(scheduleControllerProvider.notifier)
                .generateSessions(
                  schoolId: schoolId,
                  start: startDate.value,
                  end: endDate.value,
                );
            if (context.mounted) {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('课表生成任务已提交')));
            }
          },
          child: const Text('生成'),
        ),
      ],
    );
  }
}
