import '../../student/domain/assignment_models.dart';
import 'teacher_models.dart';
import 'teacher_schedule_model.dart';
import 'time_slot.dart';

abstract class TeacherRepository {
  Future<List<TimeSlot>> listTimeSlots();
  Future<List<TeacherScheduleItem>> listSchedule(DateTime from, DateTime to);
  Future<List<TeacherAssignment>> listTeacherAssignments();
  Future<List<SubmissionSummary>> listAssignmentSubmissions(
    String assignmentId,
  );
  Future<TeacherSubmissionDetail> getSubmission(
    String assignmentId,
    String submissionId,
  );
  Future<AssignmentDetail> getAssignmentDetail(String assignmentId);
  Future<void> gradeSubmission(
    String assignmentId,
    String submissionId,
    GradeSubmissionRequest request,
  );
  Future<void> createAssignment(CreateAssignmentRequest request);
  Future<void> updateAssignment(String id, UpdateAssignmentRequest request);
  Future<void> returnSubmission(
    String assignmentId,
    String submissionId,
    String comment,
  );
  Future<List<TeacherClass>> listMyClasses();
  Future<GradeAssignmentResult> gradeAssignment({
    required String title,
    required String description,
    required String content,
    required String rubrics,
  });
  Future<List<CreateAssignmentQuestionInput>> generateQuestions({
    required String topic,
    required int count,
    required String difficulty,
  });
}
