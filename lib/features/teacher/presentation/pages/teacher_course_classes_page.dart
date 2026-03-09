import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/teacher_courses_provider.dart';

class TeacherCourseClassesPage extends HookConsumerWidget {
  const TeacherCourseClassesPage({
    super.key,
    required this.courseId,
    this.embedded = false,
  });

  final String courseId;
  final bool embedded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classesAsync = ref.watch(teacherCourseClassesProvider(courseId));
    final coursesAsync = ref.watch(teacherCoursesProvider);
    final theme = Theme.of(context);
    final searchController = useTextEditingController();
    final searchQuery = useState('');

    useEffect(() {
      void listener() {
        searchQuery.value = searchController.text;
      }

      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, [searchController]);

    final body = Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: '搜索班级',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.5,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Expanded(
          child: classesAsync.when(
            data: (classes) {
              final filteredClasses = classes.where((item) {
                return item.name.toLowerCase().contains(
                  searchQuery.value.toLowerCase(),
                );
              }).toList();

              if (filteredClasses.isEmpty) {
                return const Center(child: Text('暂无已分配班级'));
              }

              return ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: filteredClasses.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final clazz = filteredClasses[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    child: ListTile(
                      leading: const Icon(Icons.class_outlined),
                      title: Text(
                        clazz.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        context.push('/teacher/classes/${clazz.id}/students');
                      },
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('加载失败: $error')),
          ),
        ),
      ],
    );

    if (embedded) {
      return body;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          coursesAsync.maybeWhen(
            data: (courses) {
              String? courseName;
              for (final c in courses) {
                if (c.id == courseId) {
                  courseName = c.name;
                  break;
                }
              }
              if (courseName == null || courseName.trim().isEmpty) {
                return '班级列表';
              }
              return courseName;
            },
            orElse: () => '班级列表',
          ),
        ),
        actions: [
          IconButton(
            tooltip: '章节管理',
            icon: const Icon(Icons.menu_book_outlined),
            onPressed: () {
              context.push('/teacher/courses/$courseId/chapters');
            },
          ),
        ],
      ),
      body: body,
    );
  }
}
