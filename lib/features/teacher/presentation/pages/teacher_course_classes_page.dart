import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../application/teacher_courses_provider.dart';

class TeacherCourseClassesPage extends HookConsumerWidget {
  const TeacherCourseClassesPage({super.key, required this.courseId});

  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classesAsync = ref.watch(teacherCourseClassesProvider(courseId));
    final searchController = useTextEditingController();
    final searchQuery = useState('');

    useEffect(() {
      searchController.addListener(() {
        searchQuery.value = searchController.text;
      });
      return null;
    }, [searchController]);

    return Scaffold(
      appBar: AppBar(title: const Text('班级列表')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: '搜索班级',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: classesAsync.when(
              data: (classes) {
                final filteredClasses = classes.where((c) {
                  return c.name.toLowerCase().contains(
                    searchQuery.value.toLowerCase(),
                  );
                }).toList();

                if (filteredClasses.isEmpty) {
                  return const Center(child: Text('暂无班级'));
                }
                return ListView.builder(
                  itemCount: filteredClasses.length,
                  itemBuilder: (context, index) {
                    final clazz = filteredClasses[index];
                    return ListTile(
                      title: Text(clazz.name),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        context.push('/teacher/classes/${clazz.id}/students');
                      },
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('加载失败: $error')),
            ),
          ),
        ],
      ),
    );
  }
}
