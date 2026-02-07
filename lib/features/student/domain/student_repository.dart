import 'package:freezed_annotation/freezed_annotation.dart';
import 'assignment_models.dart';
import 'course_chapter_models.dart';
import 'course.dart';
import 'sample_data.dart';
import 'time_slot.dart';

part 'student_repository.freezed.dart';

@freezed
abstract class StudentDashboardData with _$StudentDashboardData {
  const StudentDashboardData._();

  const factory StudentDashboardData({
    required List<StudentReminderItem> reminders,
    required List<StudentScheduleItem> schedule,
    required List<StudentAssignmentItem> assignments,
    required List<StudentExamItem> exams,
    required List<StudentNoteItem> notes,
    required List<StudentMessageItem> messages,
    required List<StudentQuickLink> quickLinks,
    required List<StudentInsightItem> insights,
  }) = _StudentDashboardData;

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
}

abstract class StudentRepository {
  Future<StudentDashboardData> fetchDashboard();
  Future<List<TimeSlot>> listTimeSlots();
  Future<List<StudentAssignmentItem>> listAssignments({
    String? courseId,
    int limit = 20,
  });
  Future<List<CourseChapterSummary>> listCourseChapters(String courseId);
  Future<CourseChapterDetail> getCourseChapter(
    String courseId,
    String chapterId,
  );
  Future<AssignmentDetail> getAssignmentDetail(String id);
  Future<StudentSubmissionDetail?> getSubmissionDetail(String assignmentId);
  Future<SubmissionResult> submitAssignment(
    String id,
    Map<String, dynamic> answers,
  );
  Future<ExplainQuestionResult> explainQuestion({
    required String title,
    required String prompt,
    required String questionType,
    List<String> options = const [],
  });
  Future<void> joinCourse(String code);
  Future<List<Course>> listCourses();
}
