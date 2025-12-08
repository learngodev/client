import '../../student/domain/assignment_models.dart';
import 'teacher_models.dart';

abstract class TeacherRepository {
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
  Future<List<TeacherClass>> listMyClasses();
}
