import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/sample_data.dart' as sample;
import '../domain/student_repository.dart';

class FakeStudentRepository implements StudentRepository {
  const FakeStudentRepository();

  @override
  Future<StudentDashboardData> fetchDashboard() async {
    // 模拟网络延迟，便于后续接入真实接口时保持一致的调用方式。
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return StudentDashboardData(
      reminders: sample.studentReminders,
      schedule: sample.studentScheduleItems,
      assignments: sample.studentAssignments,
      exams: sample.studentExams,
      notes: sample.studentNotes,
      messages: sample.studentMessages,
      quickLinks: sample.studentQuickLinks,
      insights: sample.studentInsights,
    );
  }
}

final studentRepositoryProvider = Provider<StudentRepository>((ref) {
  return const FakeStudentRepository();
});
