import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/admin_repository.dart';
import '../domain/models.dart';

final adminDepartmentTreeProvider = FutureProvider<List<DepartmentNode>>((
  ref,
) async {
  final repository = ref.watch(adminRepositoryProvider);
  return repository.fetchDepartmentTree();
});

final adminDepartmentMetricsProvider =
    Provider<AsyncValue<AdminDepartmentMetrics>>((ref) {
      final tree = ref.watch(adminDepartmentTreeProvider);
      return tree.whenData(AdminDepartmentMetrics.fromNodes);
    });

final adminDepartmentFilterProvider = StateProvider<String>((ref) => '');
final adminOnlyEmptyDepartmentsProvider = StateProvider<bool>((ref) => false);

final adminFilteredDepartmentTreeProvider =
    Provider<AsyncValue<List<DepartmentNode>>>((ref) {
      final filter = ref.watch(adminDepartmentFilterProvider);
      final onlyEmpty = ref.watch(adminOnlyEmptyDepartmentsProvider);
      final tree = ref.watch(adminDepartmentTreeProvider);
      return tree.whenData((nodes) {
        final query = filter.trim().toLowerCase();
        return nodes.fold<List<DepartmentNode>>([], (acc, node) {
          final matchesDepartment = query.isEmpty
              ? true
              : node.department.name.toLowerCase().contains(query) ||
                    node.department.id.toLowerCase().contains(query);

          final matchingClasses = query.isEmpty
              ? node.classes
              : node.classes.where((clazz) {
                  final name = clazz.name.toLowerCase();
                  final id = clazz.id.toLowerCase();
                  final grade = clazz.grade?.toLowerCase() ?? '';
                  final description = clazz.description?.toLowerCase() ?? '';
                  return name.contains(query) ||
                      id.contains(query) ||
                      grade.contains(query) ||
                      description.contains(query);
                }).toList();

          final hasClassMatch = matchingClasses.isNotEmpty;
          final shouldInclude = matchesDepartment || hasClassMatch;

          if (!shouldInclude) {
            return acc;
          }

          if (onlyEmpty && node.classes.isNotEmpty) {
            return acc;
          }

          final classesToUse = matchesDepartment
              ? node.classes
              : matchingClasses;

          return [
            ...acc,
            DepartmentNode(department: node.department, classes: classesToUse),
          ];
        });
      });
    });

final adminFilteredDepartmentMetricsProvider =
    Provider<AsyncValue<AdminDepartmentMetrics>>((ref) {
      final filtered = ref.watch(adminFilteredDepartmentTreeProvider);
      return filtered.whenData(AdminDepartmentMetrics.fromNodes);
    });
