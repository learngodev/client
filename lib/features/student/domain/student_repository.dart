import 'assignment_models.dart';
import 'sample_data.dart';
import 'time_slot.dart';

class StudentDashboardData {
  const StudentDashboardData({
    required this.reminders,
    required this.schedule,
    required this.assignments,
    required this.exams,
    required this.notes,
    required this.messages,
    required this.quickLinks,
    required this.insights,
  });

  final List<StudentReminderItem> reminders;
  final List<StudentScheduleItem> schedule;
  final List<StudentAssignmentItem> assignments;
  final List<StudentExamItem> exams;
  final List<StudentNoteItem> notes;
  final List<StudentMessageItem> messages;
  final List<StudentQuickLink> quickLinks;
  final List<StudentInsightItem> insights;

  List<StudentReminderItem> get pendingReminders {
    return reminders.where((item) => !item.isCompleted).toList(growable: false);
  }

  List<StudentReminderItem> get completedReminders {
    return reminders.where((item) => item.isCompleted).toList(growable: false);
  }

  List<StudentReminderItem> get highPriorityReminders {
    return reminders
        .where((item) => item.priority == StudentReminderPriority.high)
        .toList(growable: false);
  }

  List<StudentReminderItem> get pendingHighPriorityReminders {
    return pendingReminders
        .where((item) => item.priority == StudentReminderPriority.high)
        .toList(growable: false);
  }

  List<StudentScheduleItem> get todaySchedule {
    return schedule
        .where((item) => item.dayLabel == '今天')
        .toList(growable: false);
  }

  List<StudentAssignmentItem> get pendingAssignments {
    return assignments
        .where((item) => item.status == StudentAssignmentStatus.pending)
        .toList(growable: false);
  }

  List<StudentAssignmentItem> get submittedAssignments {
    return assignments
        .where((item) => item.status == StudentAssignmentStatus.submitted)
        .toList(growable: false);
  }

  List<StudentAssignmentItem> get gradedAssignments {
    return assignments
        .where((item) => item.status == StudentAssignmentStatus.graded)
        .toList(growable: false);
  }

  List<StudentExamItem> get upcomingExams {
    return exams
        .where((item) => item.status == StudentExamStatus.upcoming)
        .toList(growable: false);
  }

  List<StudentExamItem> get examHistory {
    return exams
        .where((item) => item.status == StudentExamStatus.completed)
        .toList(growable: false);
  }

  StudentDashboardData copyWith({
    List<StudentReminderItem>? reminders,
    List<StudentScheduleItem>? schedule,
    List<StudentAssignmentItem>? assignments,
    List<StudentExamItem>? exams,
    List<StudentNoteItem>? notes,
    List<StudentMessageItem>? messages,
    List<StudentQuickLink>? quickLinks,
    List<StudentInsightItem>? insights,
  }) {
    return StudentDashboardData(
      reminders: reminders ?? this.reminders,
      schedule: schedule ?? this.schedule,
      assignments: assignments ?? this.assignments,
      exams: exams ?? this.exams,
      notes: notes ?? this.notes,
      messages: messages ?? this.messages,
      quickLinks: quickLinks ?? this.quickLinks,
      insights: insights ?? this.insights,
    );
  }
}

abstract class StudentRepository {
  Future<StudentDashboardData> fetchDashboard();
  Future<List<TimeSlot>> listTimeSlots();
  Future<AssignmentDetail> getAssignmentDetail(String id);
  Future<StudentSubmissionDetail> getSubmissionDetail(String assignmentId);
  Future<SubmissionResult> submitAssignment(
    String id,
    Map<String, dynamic> answers,
  );
  Future<CheckAssignmentResult> checkAssignment({
    required String title,
    required String description,
    required String content,
  });
}
