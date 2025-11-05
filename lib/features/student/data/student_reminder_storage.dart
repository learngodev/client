import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/sample_data.dart';

class StudentReminderStorage {
  static const _storageKey = 'student.reminders.custom.v1';

  Future<List<StudentReminderItem>> loadCustomReminders() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);
    if (raw == null || raw.isEmpty) {
      return const <StudentReminderItem>[];
    }

    try {
      final data = jsonDecode(raw);
      if (data is! List) {
        return const <StudentReminderItem>[];
      }
      final reminders = data
          .whereType<Map<String, dynamic>>()
          .map<StudentReminderItem>(StudentReminderItem.fromJson)
          .map((item) => item.copyWith(isCustom: true))
          .toList(growable: false);
      return reminders;
    } catch (_) {
      return const <StudentReminderItem>[];
    }
  }

  Future<void> saveCustomReminders(List<StudentReminderItem> reminders) async {
    final prefs = await SharedPreferences.getInstance();
    final payload = reminders
        .where((item) => item.isCustom)
        .map((item) => item.copyWith(isCustom: true).toJson())
        .toList(growable: false);

    if (payload.isEmpty) {
      await prefs.remove(_storageKey);
      return;
    }

    await prefs.setString(_storageKey, jsonEncode(payload));
  }
}

final studentReminderStorageProvider = Provider<StudentReminderStorage>(
  (_) => StudentReminderStorage(),
);
