import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/student_repository.dart';
import '../domain/sample_data.dart'
    show
        StudentAssignmentItem,
        StudentAssignmentStatus,
        StudentMessageItem,
        StudentNoteItem,
        StudentReminderItem;
import '../domain/student_repository.dart';

class StudentDashboardController
    extends AutoDisposeAsyncNotifier<StudentDashboardData> {
  @override
  Future<StudentDashboardData> build() async {
    final repository = ref.watch(studentRepositoryProvider);
    return repository.fetchDashboard();
  }

  Future<void> refresh() async {
    final repository = ref.read(studentRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(repository.fetchDashboard);
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

  void markAllRemindersCompleted() {
    final current = state.valueOrNull;
    if (current == null) {
      return;
    }

    final hasPending = current.reminders.any((item) => !item.isCompleted);
    if (!hasPending) {
      return;
    }

    final updated = current.reminders
        .map(
          (item) => item.isCompleted ? item : item.copyWith(isCompleted: true),
        )
        .toList(growable: false);

    state = AsyncValue.data(
      current.copyWith(reminders: List.unmodifiable(updated)),
    );
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
  }

  String _messageKey(StudentMessageItem item) {
    return '${item.sender}::${item.timeLabel}::${item.preview}::${item.category.name}';
  }
}

final studentDashboardProvider =
    AutoDisposeAsyncNotifierProvider<
      StudentDashboardController,
      StudentDashboardData
    >(StudentDashboardController.new);
