import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../application/teacher_courses_provider.dart';

class TeacherClassStudentsPage extends HookConsumerWidget {
  const TeacherClassStudentsPage({super.key, required this.classId});

  final String classId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsAsync = ref.watch(teacherClassStudentsProvider(classId));
    final searchController = useTextEditingController();
    final searchQuery = useState('');

    useEffect(() {
      searchController.addListener(() {
        searchQuery.value = searchController.text;
      });
      return null;
    }, [searchController]);

    return Scaffold(
      appBar: AppBar(title: const Text('学生列表')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: '搜索学生',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: studentsAsync.when(
              data: (students) {
                final filteredStudents = students.where((s) {
                  final query = searchQuery.value.toLowerCase();
                  return s.name.toLowerCase().contains(query) ||
                      s.number.toLowerCase().contains(query);
                }).toList();

                if (filteredStudents.isEmpty) {
                  return const Center(child: Text('暂无学生'));
                }
                return ListView.builder(
                  itemCount: filteredStudents.length,
                  itemBuilder: (context, index) {
                    final student = filteredStudents[index];
                    return ListTile(
                      leading: CircleAvatar(child: Text(student.name[0])),
                      title: Text(student.name),
                      subtitle: Text(student.number),
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
