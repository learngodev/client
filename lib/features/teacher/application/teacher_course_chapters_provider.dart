import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../student/domain/course_chapter_models.dart';
import '../data/teacher_repository.dart';

final teacherCourseChaptersProvider = FutureProvider.autoDispose
    .family<List<CourseChapterSummary>, String>((ref, courseId) async {
      final repository = ref.watch(teacherRepositoryProvider);
      return repository.listCourseChapters(courseId);
    });

final teacherCourseChapterDetailProvider = FutureProvider.autoDispose
    .family<CourseChapterDetail, ({String courseId, String chapterId})>((
      ref,
      key,
    ) async {
      final repository = ref.watch(teacherRepositoryProvider);
      return repository.getCourseChapter(key.courseId, key.chapterId);
    });
