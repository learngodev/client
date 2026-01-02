import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/student_repository.dart';
import '../domain/course_chapter_models.dart';
import '../domain/sample_data.dart' as sample;

final courseAssignmentsProvider =
    FutureProvider.family<List<sample.StudentAssignmentItem>, String>((
      ref,
      courseId,
    ) {
      final repo = ref.watch(studentRepositoryProvider);
      return repo.listAssignments(courseId: courseId, limit: 50);
    });

final courseChaptersProvider =
    FutureProvider.family<List<CourseChapterSummary>, String>((ref, courseId) {
      final repo = ref.watch(studentRepositoryProvider);
      return repo.listCourseChapters(courseId);
    });

final courseChapterDetailProvider =
    FutureProvider.family<
      CourseChapterDetail,
      ({String courseId, String chapterId})
    >((ref, args) {
      final repo = ref.watch(studentRepositoryProvider);
      return repo.getCourseChapter(args.courseId, args.chapterId);
    });
