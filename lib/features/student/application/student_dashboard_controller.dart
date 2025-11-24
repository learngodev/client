import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../auth/application/auth_controller.dart';
import '../data/student_repository.dart';
import '../data/student_reminder_storage.dart';
import '../domain/sample_data.dart'
    show
        StudentAssignmentItem,
        StudentAssignmentStatus,
        StudentMessageItem,
        StudentNoteItem,
        StudentReminderItem,
        StudentReminderPriority;
import '../domain/student_repository.dart';

final _uuid = Uuid();

class StudentDashboardController
    extends AutoDisposeAsyncNotifier<StudentDashboardData> {
  @override
  Future<StudentDashboardData> build() async {
    final authState = ref.watch(authStateProvider);
    if (!authState.isAuthenticated) {
      return const StudentDashboardData(
        reminders: [],
        schedule: [],
        assignments: [],
        exams: [],
        notes: [],
        messages: [],
        quickLinks: [],
        insights: [],
      );
    }
    return _loadDashboard(watch: true);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadDashboard());
  }

  void markMessageAsRead(StudentMessageItem message) {
    _markMessagesAsRead([message]);
  }

  void markMessagesAsRead(Iterable<StudentMessageItem> messages) {
    _markMessagesAsRead(messages);
  }

  void markAllMessagesRead() {
    final current = state.valueOrNull;
    if (current == null) {
      return;
    }
    _markMessagesAsRead(current.messages);
  }

  void toggleNotePinned(StudentNoteItem note) {
    final current = state.valueOrNull;
    if (current == null) {
      return;
    }

    final updatedNotes = current.notes
        .map((item) {
          final sameNote = identical(item, note) || item.id == note.id;
          return sameNote ? item.copyWith(pinned: !item.pinned) : item;
        })
        .toList(growable: false);

    state = AsyncValue.data(
      current.copyWith(notes: List.unmodifiable(updatedNotes)),
    );
  }

  void updateAssignmentProgress(String assignmentId, int progress) {
    _updateAssignment(assignmentId, (assignment) {
      final clamped = progress.clamp(0, 100);
      if (assignment.progress == clamped) {
        return null;
      }
      return assignment.copyWith(progress: clamped);
    });
  }

  void submitAssignment(String assignmentId) {
    _updateAssignment(assignmentId, (assignment) {
      if (assignment.status == StudentAssignmentStatus.submitted &&
          assignment.progress >= 100 &&
          !assignment.isOverdue) {
        return null;
      }
      return assignment.copyWith(
        status: StudentAssignmentStatus.submitted,
        progress: 100,
        isOverdue: false,
      );
    });
  }

  void requestAssignmentResubmission(String assignmentId) {
    _updateAssignment(assignmentId, (assignment) {
      if (!assignment.allowResubmit ||
          assignment.status == StudentAssignmentStatus.pending) {
        return null;
      }
      return assignment.copyWith(
        status: StudentAssignmentStatus.pending,
        progress: 0,
        isOverdue: false,
      );
    });
  }

  void toggleReminderCompleted(String reminderId) {
    _updateReminder(reminderId, (reminder) {
      return reminder.copyWith(isCompleted: !reminder.isCompleted);
    });
  }

  Future<bool> createCustomReminder({
    required String title,
    required String description,
    required String timeLabel,
    required IconData icon,
    StudentReminderPriority priority = StudentReminderPriority.normal,
    String? route,
  }) async {
    final current = state.valueOrNull;
    if (current == null) {
      return false;
    }

    final trimmedTitle = title.trim();
    if (trimmedTitle.isEmpty) {
      return false;
    }

    final trimmedDescription = description.trim();
    final trimmedTimeLabel = timeLabel.trim();
    final sanitizedTimeLabel = trimmedTimeLabel.isEmpty
        ? '时间待定'
        : trimmedTimeLabel;
    final sanitizedRoute = route?.trim();

    final reminder = StudentReminderItem(
      id: 'custom-reminder-${_uuid.v4()}',
      title: trimmedTitle,
      description: trimmedDescription,
      timeLabel: sanitizedTimeLabel,
      icon: icon,
      priority: priority,
      route: sanitizedRoute?.isEmpty ?? true ? null : sanitizedRoute,
      isCustom: true,
    );

    final nextReminders = current.reminders.toList(growable: true)
      ..insert(0, reminder);

    final previous = current;
    final updated = current.copyWith(
      reminders: List.unmodifiable(nextReminders),
    );

    state = AsyncValue.data(updated);

    try {
      await _persistCustomReminders(updated.reminders);
      return true;
    } catch (error, stackTrace) {
      debugPrint('Failed to save custom reminders: $error');
      debugPrintStack(stackTrace: stackTrace);
      state = AsyncValue.data(previous);
      return false;
    }
  }

  Future<bool> deleteReminder(String reminderId) async {
    final current = state.valueOrNull;
    if (current == null) {
      return false;
    }

    final index = current.reminders.indexWhere((item) => item.id == reminderId);
    if (index == -1) {
      return false;
    }

    final target = current.reminders[index];
    if (!target.isCustom) {
      return false;
    }

    final nextReminders = current.reminders.toList(growable: true)
      ..removeAt(index);

    final previous = current;
    final updated = current.copyWith(
      reminders: List.unmodifiable(nextReminders),
    );

    state = AsyncValue.data(updated);

    try {
      await _persistCustomReminders(updated.reminders);
      return true;
    } catch (error, stackTrace) {
      debugPrint('Failed to delete custom reminder: $error');
      debugPrintStack(stackTrace: stackTrace);
      state = AsyncValue.data(previous);
      return false;
    }
  }

  Future<bool> editCustomReminder(
    String reminderId, {
    required String title,
    required String description,
    required String timeLabel,
    required IconData icon,
    StudentReminderPriority priority = StudentReminderPriority.normal,
    String? route,
  }) async {
    final current = state.valueOrNull;
    if (current == null) {
      return false;
    }

    final index = current.reminders.indexWhere((item) => item.id == reminderId);
    if (index == -1) {
      return false;
    }

    final existing = current.reminders[index];
    if (!existing.isCustom) {
      return false;
    }

    final trimmedTitle = title.trim();
    if (trimmedTitle.isEmpty) {
      return false;
    }

    final trimmedDescription = description.trim();
    final trimmedTimeLabel = timeLabel.trim();
    final sanitizedTimeLabel = trimmedTimeLabel.isEmpty
        ? '时间待定'
        : trimmedTimeLabel;
    final sanitizedRoute = route?.trim();

    final updated = existing.copyWith(
      title: trimmedTitle,
      description: trimmedDescription,
      timeLabel: sanitizedTimeLabel,
      icon: icon,
      priority: priority,
      route: sanitizedRoute?.isEmpty ?? true ? null : sanitizedRoute,
    );

    final nextReminders = current.reminders.toList(growable: true)
      ..[index] = updated;

    final previous = current;
    final dashboardUpdated = current.copyWith(
      reminders: List.unmodifiable(nextReminders),
    );

    state = AsyncValue.data(dashboardUpdated);

    try {
      await _persistCustomReminders(dashboardUpdated.reminders);
      return true;
    } catch (error, stackTrace) {
      debugPrint('Failed to edit custom reminder: $error');
      debugPrintStack(stackTrace: stackTrace);
      state = AsyncValue.data(previous);
      return false;
    }
  }

  Future<bool> markAllRemindersCompleted() async {
    final current = state.valueOrNull;
    if (current == null) {
      return false;
    }

    final hasPending = current.reminders.any((item) => !item.isCompleted);
    if (!hasPending) {
      return false;
    }

    final updated = current.reminders
        .map(
          (item) => item.isCompleted ? item : item.copyWith(isCompleted: true),
        )
        .toList(growable: false);

    final previous = current;
    final dashboardUpdated = current.copyWith(
      reminders: List.unmodifiable(updated),
    );

    state = AsyncValue.data(dashboardUpdated);

    try {
      await _persistCustomReminders(dashboardUpdated.reminders);
      return true;
    } catch (error, stackTrace) {
      debugPrint('Failed to mark all reminders complete: $error');
      debugPrintStack(stackTrace: stackTrace);
      state = AsyncValue.data(previous);
      return false;
    }
  }

  void _markMessagesAsRead(Iterable<StudentMessageItem> targets) {
    final current = state.valueOrNull;
    if (current == null) {
      return;
    }

    final targetList = targets.where((item) => item.isUnread).toList();
    if (targetList.isEmpty) {
      return;
    }

    final targetKeys = targetList.map(_messageKey).toSet();
    var changed = false;
    final updatedMessages = current.messages
        .map((item) {
          if (item.unreadCount == 0) {
            return item;
          }
          if (!targetKeys.contains(_messageKey(item))) {
            return item;
          }
          changed = true;
          return item.copyWith(unreadCount: 0);
        })
        .toList(growable: false);

    if (!changed) {
      return;
    }

    state = AsyncValue.data(
      current.copyWith(messages: List.unmodifiable(updatedMessages)),
    );
  }

  void _updateAssignment(
    String assignmentId,
    StudentAssignmentItem? Function(StudentAssignmentItem current) transform,
  ) {
    final current = state.valueOrNull;
    if (current == null) {
      return;
    }

    final index = current.assignments.indexWhere(
      (item) => item.id == assignmentId,
    );
    if (index == -1) {
      return;
    }

    final existing = current.assignments[index];
    final updated = transform(existing);
    if (updated == null || identical(updated, existing)) {
      return;
    }

    final nextAssignments = current.assignments.toList(growable: true)
      ..[index] = updated;

    state = AsyncValue.data(
      current.copyWith(assignments: List.unmodifiable(nextAssignments)),
    );
  }

  void _updateReminder(
    String reminderId,
    StudentReminderItem? Function(StudentReminderItem current) transform,
  ) {
    final current = state.valueOrNull;
    if (current == null) {
      return;
    }

    final index = current.reminders.indexWhere((item) => item.id == reminderId);
    if (index == -1) {
      return;
    }

    final existing = current.reminders[index];
    final updated = transform(existing);
    if (updated == null || identical(updated, existing)) {
      return;
    }

    final nextReminders = current.reminders.toList(growable: true)
      ..[index] = updated;

    state = AsyncValue.data(
      current.copyWith(reminders: List.unmodifiable(nextReminders)),
    );

    unawaited(_persistCustomReminders(nextReminders));
  }

  String _messageKey(StudentMessageItem item) {
    return '${item.sender}::${item.timeLabel}::${item.preview}::${item.category.name}';
  }

  Future<StudentDashboardData> _loadDashboard({bool watch = false}) async {
    final repository = watch
        ? ref.watch(studentRepositoryProvider)
        : ref.read(studentRepositoryProvider);
    final storage = watch
        ? ref.watch(studentReminderStorageProvider)
        : ref.read(studentReminderStorageProvider);

    final base = await repository.fetchDashboard();
    final custom = await storage.loadCustomReminders();
    if (custom.isEmpty) {
      return base;
    }

    final seenIds = <String>{};
    final merged = <StudentReminderItem>[];

    for (final reminder in base.reminders) {
      if (seenIds.add(reminder.id)) {
        merged.add(reminder);
      }
    }

    for (final reminder in custom) {
      final customReminder = reminder.copyWith(isCustom: true);
      final isNew = seenIds.add(customReminder.id);
      if (isNew) {
        merged.add(customReminder);
        continue;
      }

      final index = merged.indexWhere((item) => item.id == customReminder.id);
      if (index != -1) {
        merged[index] = customReminder;
      }
    }

    return base.copyWith(reminders: List.unmodifiable(merged));
  }

  Future<void> _persistCustomReminders(List<StudentReminderItem> reminders) {
    final storage = ref.read(studentReminderStorageProvider);
    return storage.saveCustomReminders(reminders);
  }
}

final studentDashboardProvider =
    AutoDisposeAsyncNotifierProvider<
      StudentDashboardController,
      StudentDashboardData
    >(StudentDashboardController.new);
