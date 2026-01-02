import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../application/teacher_courses_provider.dart';
import '../../application/teacher_classes_provider.dart';
import '../../data/teacher_repository.dart';

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
    final allClassesAsync = ref.watch(teacherClassesProvider);
    final theme = Theme.of(context);
    final searchController = useTextEditingController();
    final searchQuery = useState('');
    final isSubmitting = useState(false);

    useEffect(() {
      searchController.addListener(() {
        searchQuery.value = searchController.text;
      });
      return null;
    }, [searchController]);

    Future<void> removeClass(String classId) async {
      isSubmitting.value = true;
      try {
        await ref
            .read(teacherRepositoryProvider)
            .removeCourseClass(courseId: courseId, classId: classId);
        ref.invalidate(teacherCourseClassesProvider(courseId));
        ref.invalidate(teacherCoursesProvider);
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('已移除班级')));
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('移除失败: $e')));
        }
      } finally {
        isSubmitting.value = false;
      }
    }

    Widget body = Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: '搜索班级',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: theme.colorScheme.surfaceContainerHighest
                        .withValues(alpha: 0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filledTonal(
                tooltip: '分配班级',
                onPressed: isSubmitting.value
                    ? null
                    : () {
                        final assignedIds = classesAsync.maybeWhen(
                          data: (cls) => cls.map((c) => c.id).toSet(),
                          orElse: () => <String>{},
                        );

                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          showDragHandle: true,
                          builder: (sheetContext) {
                            return HookConsumer(
                              builder: (context, sheetRef, _) {
                                final localQuery = useState('');
                                final localSubmitting = useState(false);
                                final searchCtrl = useTextEditingController(
                                  text: '',
                                );
                                final selectedIds = useState<Set<String>>(
                                  <String>{},
                                );

                                useEffect(() {
                                  void listener() {
                                    localQuery.value = searchCtrl.text.trim();
                                  }

                                  searchCtrl.addListener(listener);
                                  return () =>
                                      searchCtrl.removeListener(listener);
                                }, [searchCtrl]);

                                final availableAsync = allClassesAsync;

                                Future<void> submitSelection() async {
                                  if (selectedIds.value.isEmpty) return;
                                  localSubmitting.value = true;
                                  try {
                                    final repo = sheetRef.read(
                                      teacherRepositoryProvider,
                                    );
                                    for (final id in selectedIds.value) {
                                      await repo.assignCourseClass(
                                        courseId: courseId,
                                        classId: id,
                                      );
                                    }
                                    sheetRef.invalidate(
                                      teacherCourseClassesProvider(courseId),
                                    );
                                    sheetRef.invalidate(teacherCoursesProvider);
                                    if (context.mounted) {
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '已分配 ${selectedIds.value.length} 个班级',
                                          ),
                                        ),
                                      );
                                    }
                                  } catch (e) {
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(content: Text('分配失败: $e')),
                                      );
                                    }
                                  } finally {
                                    localSubmitting.value = false;
                                  }
                                }

                                return SafeArea(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                      top: 12,
                                      bottom:
                                          MediaQuery.of(
                                            context,
                                          ).viewInsets.bottom +
                                          16,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          controller: searchCtrl,
                                          decoration: const InputDecoration(
                                            labelText: '搜索班级',
                                            hintText: '按班级名称搜索',
                                            prefixIcon: Icon(Icons.search),
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          '选择班级后点击确认，支持多选。',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodySmall,
                                        ),
                                        const SizedBox(height: 12),
                                        ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxHeight:
                                                MediaQuery.of(
                                                  context,
                                                ).size.height *
                                                0.6,
                                          ),
                                          child: availableAsync.when(
                                            data: (all) {
                                              final options = all.where((c) {
                                                if (assignedIds.contains(
                                                  c.id,
                                                )) {
                                                  return false;
                                                }
                                                if (c.courseId != null &&
                                                    c.courseId!.isNotEmpty &&
                                                    c.courseId != courseId) {
                                                  return false;
                                                }
                                                if (localQuery.value.isEmpty) {
                                                  return true;
                                                }
                                                return c.name
                                                    .toLowerCase()
                                                    .contains(
                                                      localQuery.value
                                                          .toLowerCase(),
                                                    );
                                              }).toList();

                                              if (options.isEmpty) {
                                                return const Center(
                                                  child: Text('暂无可分配的班级'),
                                                );
                                              }

                                              return ListView.separated(
                                                itemCount: options.length,
                                                separatorBuilder: (_, index) =>
                                                    const Divider(height: 1),
                                                itemBuilder: (context, index) {
                                                  final cls = options[index];
                                                  final checked = selectedIds
                                                      .value
                                                      .contains(cls.id);
                                                  return CheckboxListTile(
                                                    value: checked,
                                                    onChanged:
                                                        localSubmitting.value
                                                        ? null
                                                        : (value) {
                                                            final updated =
                                                                Set<
                                                                  String
                                                                >.from(
                                                                  selectedIds
                                                                      .value,
                                                                );
                                                            if (value == true) {
                                                              updated.add(
                                                                cls.id,
                                                              );
                                                            } else {
                                                              updated.remove(
                                                                cls.id,
                                                              );
                                                            }
                                                            selectedIds.value =
                                                                updated;
                                                          },
                                                    title: Text(cls.name),
                                                    subtitle:
                                                        cls.courseName != null
                                                        ? Text(
                                                            '当前课程: ${cls.courseName}',
                                                          )
                                                        : null,
                                                    secondary: const Icon(
                                                      Icons.class_outlined,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            loading: () => const Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(16),
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ),
                                            error: (err, stack) => Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Text('加载班级失败: $err'),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: localSubmitting.value
                                                  ? null
                                                  : () => Navigator.of(
                                                      context,
                                                    ).pop(),
                                              child: const Text('取消'),
                                            ),
                                            const SizedBox(width: 8),
                                            FilledButton.icon(
                                              icon: localSubmitting.value
                                                  ? const SizedBox(
                                                      width: 16,
                                                      height: 16,
                                                      child:
                                                          CircularProgressIndicator(
                                                            strokeWidth: 2,
                                                          ),
                                                    )
                                                  : const Icon(Icons.check),
                                              label: Text(
                                                localSubmitting.value
                                                    ? '正在分配...'
                                                    : '确认分配 (${selectedIds.value.length})',
                                              ),
                                              onPressed:
                                                  localSubmitting.value ||
                                                      selectedIds.value.isEmpty
                                                  ? null
                                                  : submitSelection,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                icon: const Icon(Icons.group_add_outlined),
              ),
            ],
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
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            tooltip: '移除班级',
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: isSubmitting.value
                                ? null
                                : () => removeClass(clazz.id),
                          ),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
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
