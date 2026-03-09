import '../../student/domain/assignment_models.dart';
import '../../student/domain/course_chapter_models.dart';
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
  Future<List<TeacherCourse>> listCourses();
  Future<List<TeacherClass>> listCourseClasses(String courseId);
  Future<List<TeacherStudent>> listClassStudents(String classId);
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
  Future<void> updateSession(
    String sessionId, {
    String? location,
    String? status,
  });
  Future<TeacherCourse> updateCourse({
    required String courseId,
    String? name,
    String? description,
    String? imageUrl,
  });

  Future<List<CourseChapterSummary>> listCourseChapters(String courseId);
  Future<CourseChapterDetail> getCourseChapter(
    String courseId,
    String chapterId,
  );
  Future<CourseChapterSummary> createCourseChapter(
    String courseId, {
    required String title,
    String content,
    int orderIndex,
  });
  Future<void> updateCourseChapter(
    String courseId,
    String chapterId, {
    String? title,
    String? content,
    int? orderIndex,
  });
  Future<void> deleteCourseChapter(String courseId, String chapterId);
  Future<void> attachCourseChapterFile(
    String courseId,
    String chapterId,
    String fileId,
  );
  Future<void> detachCourseChapterFile(
    String courseId,
    String chapterId,
    String fileId,
  );
}
