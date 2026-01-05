import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../application/admin_providers.dart';
import '../../../auth/application/auth_controller.dart';
import '../../../../core/exceptions/app_exception.dart';
import '../../data/admin_repository.dart';
import '../../domain/accounts.dart';
import '../../domain/models.dart';
import '../../domain/oss.dart' as oss;
import '../../domain/system_settings.dart' as system;
import '../../domain/ai_ops.dart';
import '../widgets/assign_student_dialog.dart';
import 'class_detail_page.dart';
import 'account_management_page.dart';

int _compareDepartmentNodes(DepartmentNode a, DepartmentNode b) {
  final nameCompare = a.department.name.toLowerCase().compareTo(
    b.department.name.toLowerCase(),
  );
  if (nameCompare != 0) {
    return nameCompare;
  }
  return a.department.id.compareTo(b.department.id);
}

int _compareClassInfos(ClassInfo a, ClassInfo b) {
  final nameCompare = a.name.toLowerCase().compareTo(b.name.toLowerCase());
  if (nameCompare != 0) {
    return nameCompare;
  }
  return a.id.compareTo(b.id);
}

const _kAutoLoadMoreThreshold = 280.0;
const _kAccountFilterPrefsKey = 'admin.account.filters';
const Duration _kRecentActiveWindow = Duration(days: 7);

typedef _AccountFilterPayload = Map<String, dynamic>;

List<AdminAccount> _mergeAccountPages(
  List<AdminAccount> existing,
  List<AdminAccount> incoming,
) {
  if (existing.isEmpty) {
    return [...incoming];
  }
  if (incoming.isEmpty) {
    return existing;
  }
  final merged = [...existing];
  for (final account in incoming) {
    final index = merged.indexWhere((item) => item.id == account.id);
    if (index >= 0) {
      merged[index] = account;
    } else {
      merged.add(account);
    }
  }
  return merged;
}

/// Clean, single-file admin pages implementation (overview, accounts, structures, OSS, system)

class AdminOverviewPage extends ConsumerWidget {
  const AdminOverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tree = ref.watch(adminDepartmentTreeProvider);

    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tree.when(
        data: (nodes) {
          final metrics = AdminDepartmentMetrics.fromNodes(nodes);
          final notifier = ref.read(adminDepartmentTreeProvider.notifier);
          final emptyDepartments = [
            for (final node in nodes)
              if (node.classes.isEmpty) node.department.name,
          ];
          final quickChecks = <_QuickCheckItem>[];
          if (metrics.departmentCount == 0) {
            quickChecks.add(
              _QuickCheckItem(
                icon: Icons.corporate_fare_outlined,
                title: '尚未创建院系',
                description: '创建院系后即可录入班级与账号信息。',
                severity: _QuickCheckSeverity.warning,
              ),
            );
          } else if (metrics.emptyDepartmentCount > 0) {
            final previewNames = emptyDepartments.take(3).join('、');
            final detail = emptyDepartments.length > 3
                ? '$previewNames 等 ${metrics.emptyDepartmentCount} 个院系待补充班级。'
                : '$previewNames 缺少班级配置，建议尽快补充。';
            quickChecks.add(
              _QuickCheckItem(
                icon: Icons.warning_amber_outlined,
                title: '${metrics.emptyDepartmentCount} 个院系未配置班级',
                description: detail.isEmpty ? '存在未配置班级的院系，建议补充班级信息。' : detail,
                severity: _QuickCheckSeverity.warning,
              ),
            );
          } else {
            quickChecks.add(
              _QuickCheckItem(
                icon: Icons.task_alt_outlined,
                title: '所有院系均已配置班级',
                description: '班级结构完整，可进行账号分配。',
                severity: _QuickCheckSeverity.success,
              ),
            );
          }

          if (metrics.classCount == 0 && metrics.departmentCount > 0) {
            quickChecks.add(
              const _QuickCheckItem(
                icon: Icons.class_outlined,
                title: '院系已创建但尚无班级',
                description: '为院系添加至少一个班级后，学生账号才能正确分配。',
                severity: _QuickCheckSeverity.info,
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text('学校概览', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: const Text('刷新院系数据'),
                  onPressed: () async {
                    try {
                      await notifier.refresh();
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('院系数据已刷新')),
                        );
                      }
                    } catch (error) {
                      if (!context.mounted) {
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('刷新失败：$error'),
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.errorContainer,
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _AdminStatsCard(
                    icon: Icons.apartment,
                    title: '院系总数',
                    value: metrics.departmentCount.toString(),
                    subtitle: '当前已创建的院系数量。',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  _AdminStatsCard(
                    icon: Icons.class_outlined,
                    title: '班级总数',
                    value: metrics.classCount.toString(),
                    subtitle: '所有院系下的班级合计。',
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  _AdminStatsCard(
                    icon: Icons.pending_actions_outlined,
                    title: '未配置班级的院系',
                    value: metrics.emptyDepartmentCount.toString(),
                    subtitle: '需要补充班级信息的院系数。',
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _AccountSectionCard(
                icon: Icons.analytics_outlined,
                title: '快速检查',
                child: _QuickCheckList(items: quickChecks),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) =>
            _ErrorPlaceholder(message: e.toString(), onRetry: () {}),
      ),
    );
  }
}

class AdminAccountsPage extends StatelessWidget {
  const AdminAccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AccountManagementPage();
  }
}

// ignore: unused_element
class _LegacyAdminAccountsPage extends HookConsumerWidget {
  // ignore: unused_element_parameter
  const _LegacyAdminAccountsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = useState(_AccountRoleFilter.all);
    final statusFilter = useState(_AccountStatusFilter.all);
    final queryController = useTextEditingController();
    useListenable(queryController);
    final debouncedQuery = useState(queryController.text.trim());
    useEffect(() {
      final timer = Timer(const Duration(milliseconds: 320), () {
        debouncedQuery.value = queryController.text.trim();
      });
      return timer.cancel;
    }, [queryController.text]);

    final department = useState<String>(_kAllDepartments);
    final classFilter = useState<String>(_kAllClasses);
    final isFilterHydrated = useState<bool>(false);
    final requestedPage = useState<int>(1);
    final aggregatedAccountsState = useState<List<AdminAccount>>(
      <AdminAccount>[],
    );
    final totalAccountsState = useState<int>(0);
    final isLoadingMore = useState<bool>(false);
    final isRefreshing = useState<bool>(false);
    final loadMoreError = useState<String?>(null);
    final lastCompletedPageRef = useRef<int>(0);
    final sortOption = useState(_AccountSortOption.nameAsc);
    final exportingAccounts = useState<bool>(false);

    final authState = ref.watch(authStateProvider);
    final schoolId = authState.account?.schoolId ?? '';
    final isAuthenticated = authState.isAuthenticated && schoolId.isNotEmpty;

    useEffect(() {
      final accountId = authState.account?.id;
      if (!authState.isAuthenticated ||
          accountId == null ||
          accountId.isEmpty) {
        role.value = _AccountRoleFilter.all;
        statusFilter.value = _AccountStatusFilter.all;
        department.value = _kAllDepartments;
        classFilter.value = _kAllClasses;
        isFilterHydrated.value = true;
        return null;
      }

      var cancelled = false;
      isFilterHydrated.value = false;
      Future<void>(() async {
        try {
          final prefs = await SharedPreferences.getInstance();
          final raw = prefs.getString(_kAccountFilterPrefsKey);
          if (cancelled) {
            return;
          }
          if (raw != null && raw.isNotEmpty) {
            final decoded = jsonDecode(raw);
            if (decoded is Map<String, dynamic>) {
              final entry = decoded[accountId];
              if (entry is Map<String, dynamic>) {
                final roleRaw = entry['role'] as String?;
                final statusRaw = entry['status'] as String?;
                final departmentRaw = entry['department'] as String?;
                final classRaw = entry['class'] as String?;
                final sortRaw = entry['sort'] as String?;

                if (roleRaw != null) {
                  final matchedRole = _AccountRoleFilter.values.firstWhere(
                    (value) => value.name == roleRaw,
                    orElse: () => _AccountRoleFilter.all,
                  );
                  if (role.value != matchedRole) {
                    role.value = matchedRole;
                  }
                }

                if (statusRaw != null) {
                  final matchedStatus = _AccountStatusFilter.values.firstWhere(
                    (value) => value.name == statusRaw,
                    orElse: () => _AccountStatusFilter.all,
                  );
                  if (statusFilter.value != matchedStatus) {
                    statusFilter.value = matchedStatus;
                  }
                }

                if (departmentRaw != null && departmentRaw.isNotEmpty) {
                  if (department.value != departmentRaw) {
                    department.value = departmentRaw;
                  }
                }

                if (classRaw != null && classRaw.isNotEmpty) {
                  if (classFilter.value != classRaw) {
                    classFilter.value = classRaw;
                  }
                }

                if (sortRaw != null) {
                  final matchedSort = _AccountSortOption.values.firstWhere(
                    (value) => value.name == sortRaw,
                    orElse: () => _AccountSortOption.nameAsc,
                  );
                  if (sortOption.value != matchedSort) {
                    sortOption.value = matchedSort;
                  }
                }
              }
            }
          }
        } catch (_) {
          // Ignore hydration errors to avoid blocking UI.
        } finally {
          if (!cancelled) {
            isFilterHydrated.value = true;
          }
        }
      });

      return () {
        cancelled = true;
      };
    }, [authState.account?.id]);

    if (!isAuthenticated) {
      return const Center(child: Text('请先登录以查看账号信息'));
    }

    useEffect(
      () {
        if (!isFilterHydrated.value) {
          return null;
        }
        final accountId = authState.account?.id;
        if (!authState.isAuthenticated ||
            accountId == null ||
            accountId.isEmpty) {
          return null;
        }

        Future<void>(() async {
          try {
            final prefs = await SharedPreferences.getInstance();
            _AccountFilterPayload payload = <String, dynamic>{};
            final raw = prefs.getString(_kAccountFilterPrefsKey);
            if (raw != null && raw.isNotEmpty) {
              final decoded = jsonDecode(raw);
              if (decoded is Map<String, dynamic>) {
                payload = Map<String, dynamic>.from(decoded);
              }
            }

            payload[accountId] = <String, dynamic>{
              'role': role.value.name,
              'status': statusFilter.value.name,
              'department': department.value,
              'class': classFilter.value,
              'sort': sortOption.value.name,
            };

            await prefs.setString(_kAccountFilterPrefsKey, jsonEncode(payload));
          } catch (_) {
            // Ignore persistence errors to keep UX smooth.
          }
        });

        return null;
      },
      [
        authState.account?.id,
        role.value,
        statusFilter.value,
        department.value,
        classFilter.value,
        sortOption.value,
        isFilterHydrated.value,
      ],
    );

    final departmentTreeAsync = ref.watch(adminDepartmentTreeProvider);
    final departmentNodes =
        departmentTreeAsync.asData?.value ?? const <DepartmentNode>[];

    const pageSize = 200;
    AdminAccountRole? selectedRole;
    switch (role.value) {
      case _AccountRoleFilter.all:
        selectedRole = null;
      case _AccountRoleFilter.teachers:
        selectedRole = AdminAccountRole.teacher;
      case _AccountRoleFilter.students:
        selectedRole = AdminAccountRole.student;
    }

    AdminAccountStatus? selectedStatus;
    switch (statusFilter.value) {
      case _AccountStatusFilter.all:
        selectedStatus = null;
      case _AccountStatusFilter.active:
        selectedStatus = AdminAccountStatus.active;
      case _AccountStatusFilter.locked:
        selectedStatus = AdminAccountStatus.locked;
      case _AccountStatusFilter.pendingReset:
        selectedStatus = AdminAccountStatus.passwordResetRequired;
    }

    String? selectedDepartmentId;
    String? departmentScope;
    switch (department.value) {
      case _kAllDepartments:
        selectedDepartmentId = null;
        departmentScope = null;
      case _kNoDepartment:
        selectedDepartmentId = null;
        departmentScope = 'unassigned';
      default:
        selectedDepartmentId = department.value;
        departmentScope = null;
    }

    String? selectedClassId;
    String? classScope;
    switch (classFilter.value) {
      case _kAllClasses:
        selectedClassId = null;
        classScope = null;
      case _kNoClass:
        selectedClassId = null;
        classScope = 'unassigned';
      default:
        selectedClassId = classFilter.value;
        classScope = null;
    }

    final filterKey =
        '$schoolId|${selectedRole?.apiValue ?? 'all'}|${selectedStatus?.apiValue ?? 'all'}|${department.value}|${classFilter.value}|${debouncedQuery.value}|${sortOption.value.name}';
    final previousFilterKey = usePrevious(filterKey);
    final filtersChanged =
        previousFilterKey != null && previousFilterKey != filterKey;

    final effectivePage = filtersChanged ? 1 : requestedPage.value;

    final request = AdminAccountListRequest(
      schoolId: schoolId,
      role: selectedRole,
      page: effectivePage,
      pageSize: pageSize,
      query: debouncedQuery.value,
      status: selectedStatus,
      departmentId: selectedDepartmentId,
      departmentScope: departmentScope,
      classId: selectedClassId,
      classScope: classScope,
    );

    useEffect(() {
      if (!filtersChanged) {
        return null;
      }
      aggregatedAccountsState.value = const <AdminAccount>[];
      totalAccountsState.value = 0;
      loadMoreError.value = null;
      isLoadingMore.value = false;
      isRefreshing.value = false;
      lastCompletedPageRef.value = 0;
      if (requestedPage.value != 1) {
        requestedPage.value = 1;
      }
      return null;
    }, [filterKey]);

    final accountsState = ref.watch(adminAccountListProvider(request));
    final scrollController = useScrollController();

    useEffect(() {
      if (!filtersChanged) {
        return null;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!scrollController.hasClients) {
          return;
        }
        scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOutCubic,
        );
      });
      return null;
    }, [filterKey, filtersChanged, scrollController]);

    useEffect(() {
      accountsState.when(
        data: (pageData) {
          totalAccountsState.value = pageData.total;
          if (effectivePage == 1) {
            aggregatedAccountsState.value = [...pageData.accounts];
          } else if (pageData.accounts.isNotEmpty) {
            aggregatedAccountsState.value = _mergeAccountPages(
              aggregatedAccountsState.value,
              pageData.accounts,
            );
          }
          loadMoreError.value = null;
          isLoadingMore.value = false;
          isRefreshing.value = false;
          lastCompletedPageRef.value = effectivePage;
          if (requestedPage.value != effectivePage) {
            requestedPage.value = effectivePage;
          }
        },
        error: (error, _) {
          if (aggregatedAccountsState.value.isNotEmpty) {
            loadMoreError.value = error.toString();
          }
          isLoadingMore.value = false;
          isRefreshing.value = false;
          final previousPage = lastCompletedPageRef.value == 0
              ? 1
              : lastCompletedPageRef.value;
          if (requestedPage.value != previousPage) {
            requestedPage.value = previousPage;
          }
        },
        loading: () => null,
      );
      return null;
    }, [accountsState, effectivePage]);

    final pageData = accountsState.valueOrNull;
    final List<AdminAccount> aggregatedAccounts =
        aggregatedAccountsState.value.isEmpty &&
            (pageData?.accounts.isNotEmpty ?? false)
        ? pageData!.accounts
        : aggregatedAccountsState.value;
    final totalAvailable = totalAccountsState.value > 0
        ? totalAccountsState.value
        : (pageData?.total ?? aggregatedAccounts.length);

    final showInitialLoading =
        accountsState.isLoading &&
        aggregatedAccounts.isEmpty &&
        !isRefreshing.value;
    if (showInitialLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (accountsState.hasError && aggregatedAccounts.isEmpty) {
      final error = accountsState.error;
      return _ErrorPlaceholder(
        message: error?.toString() ?? '加载失败',
        onRetry: () => ref.invalidate(adminAccountListProvider(request)),
      );
    }

    final List<AdminAccount> accounts = [...aggregatedAccounts]
      ..sort((a, b) => a.name.compareTo(b.name));

    final departmentLabels = <String, String>{
      for (final node in departmentNodes)
        if (node.department.id.isNotEmpty)
          node.department.id: node.department.name,
    };
    final classLabelsByDepartment = <String, Map<String, String>>{
      for (final node in departmentNodes)
        if (node.department.id.isNotEmpty)
          node.department.id: {
            for (final cls in node.classes)
              if (cls.id.isNotEmpty) cls.id: cls.name,
          },
    };

    var hasNoDepartment = false;
    for (final account in accounts) {
      final deptId = account.departmentId?.trim() ?? '';
      if (deptId.isEmpty) {
        hasNoDepartment = true;
        continue;
      }
      final label = account.department?.trim();
      if (label != null && label.isNotEmpty) {
        departmentLabels.putIfAbsent(deptId, () => label);
      }
    }
    final sortedDepartmentEntries = departmentLabels.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    Map<String, String> classLabels = {};
    if (selectedDepartmentId != null && selectedDepartmentId.isNotEmpty) {
      classLabels = Map<String, String>.from(
        classLabelsByDepartment[selectedDepartmentId] ??
            const <String, String>{},
      );
    }

    var hasNoClass = false;
    if (selectedDepartmentId != null && selectedDepartmentId.isNotEmpty) {
      for (final account in accounts) {
        if (account.departmentId != selectedDepartmentId) {
          continue;
        }
        final clsId = account.classId?.trim() ?? '';
        if (clsId.isEmpty) {
          hasNoClass = true;
          continue;
        }
        final label = account.className?.trim();
        if (label != null && label.isNotEmpty) {
          classLabels.putIfAbsent(clsId, () => label);
        }
      }
    }
    final sortedClassEntries = classLabels.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    final classDropdownEntries = <DropdownMenuEntry<String>>[];
    if (selectedDepartmentId != null && selectedDepartmentId.isNotEmpty) {
      classDropdownEntries.add(
        const DropdownMenuEntry<String>(value: _kAllClasses, label: '全部班级'),
      );
      if (hasNoClass || classFilter.value == _kNoClass) {
        if (!classDropdownEntries.any((entry) => entry.value == _kNoClass)) {
          classDropdownEntries.add(
            const DropdownMenuEntry<String>(value: _kNoClass, label: '未分配班级'),
          );
        }
      }
      for (final entry in sortedClassEntries) {
        classDropdownEntries.add(
          DropdownMenuEntry<String>(value: entry.key, label: entry.value),
        );
      }
      if (classFilter.value != _kAllClasses &&
          classFilter.value != _kNoClass &&
          !classDropdownEntries.any(
            (entry) => entry.value == classFilter.value,
          )) {
        classDropdownEntries.add(
          DropdownMenuEntry<String>(
            value: classFilter.value,
            label: classLabels[classFilter.value] ?? '已选择班级',
          ),
        );
      }
    }

    final normalizedQuery = debouncedQuery.value.toLowerCase();
    final List<AdminAccount> filtered = accounts.where((account) {
      final matchesRole = switch (role.value) {
        _AccountRoleFilter.all => true,
        _AccountRoleFilter.teachers => account.role == AdminAccountRole.teacher,
        _AccountRoleFilter.students => account.role == AdminAccountRole.student,
      };
      final matchesDepartment = switch (department.value) {
        _kAllDepartments => true,
        _kNoDepartment =>
          account.departmentId == null || account.departmentId!.isEmpty,
        _ => account.departmentId == department.value,
      };
      final matchesClass = switch (classFilter.value) {
        _kAllClasses => true,
        _kNoClass => account.classId == null || account.classId!.isEmpty,
        _ => account.classId == classFilter.value,
      };
      final matchesStatus = switch (statusFilter.value) {
        _AccountStatusFilter.all => true,
        _AccountStatusFilter.active =>
          account.status == AdminAccountStatus.active,
        _AccountStatusFilter.locked =>
          account.status == AdminAccountStatus.locked,
        _AccountStatusFilter.pendingReset =>
          account.status == AdminAccountStatus.passwordResetRequired,
      };
      final matchesQuery = normalizedQuery.isEmpty
          ? true
          : account.name.toLowerCase().contains(normalizedQuery) ||
                account.identifier.toLowerCase().contains(normalizedQuery) ||
                account.email.toLowerCase().contains(normalizedQuery);
      return matchesRole &&
          matchesDepartment &&
          matchesClass &&
          matchesStatus &&
          matchesQuery;
    }).toList();

    filtered.sort((a, b) => _compareAccounts(a, b, sortOption.value));

    final metrics = _AccountMetrics.fromAccounts(filtered);
    final hasActiveFilters =
        role.value != _AccountRoleFilter.all ||
        statusFilter.value != _AccountStatusFilter.all ||
        department.value != _kAllDepartments ||
        classFilter.value != _kAllClasses ||
        debouncedQuery.value.isNotEmpty ||
        sortOption.value != _AccountSortOption.nameAsc;

    final dropdownEntries = <DropdownMenuEntry<String>>[
      const DropdownMenuEntry<String>(value: _kAllDepartments, label: '全部院系'),
      if (hasNoDepartment)
        const DropdownMenuEntry<String>(value: _kNoDepartment, label: '未分配院系'),
      for (final entry in sortedDepartmentEntries)
        DropdownMenuEntry<String>(value: entry.key, label: entry.value),
    ];

    if (department.value != _kAllDepartments &&
        department.value != _kNoDepartment &&
        !dropdownEntries.any((entry) => entry.value == department.value)) {
      dropdownEntries.add(
        DropdownMenuEntry<String>(
          value: department.value,
          label: departmentLabels[department.value] ?? '已选择院系',
        ),
      );
    }

    if (department.value == _kNoDepartment &&
        !dropdownEntries.any((entry) => entry.value == _kNoDepartment)) {
      dropdownEntries.insert(
        1,
        const DropdownMenuEntry<String>(value: _kNoDepartment, label: '未分配院系'),
      );
    }

    final selectedDepartmentLabel = switch (department.value) {
      _kAllDepartments => null,
      _kNoDepartment => '未分配院系',
      _ => departmentLabels[department.value] ?? '已选择院系',
    };

    final selectedClassLabel = switch (classFilter.value) {
      _kAllClasses => null,
      _kNoClass => '未分配班级',
      _ => classLabels[classFilter.value] ?? '已选择班级',
    };

    final departmentChipLabel = department.value == _kNoDepartment
        ? '未分配院系'
        : selectedDepartmentLabel ?? '已选择院系';
    final classChipLabel = classFilter.value == _kNoClass
        ? '未分配班级'
        : selectedClassLabel ?? '已选择班级';

    final filterNotices = <String>[];
    if (department.value == _kNoDepartment) {
      filterNotices.add('当前仅显示未分配院系的账号。');
    }
    if (classFilter.value == _kNoClass) {
      if (department.value != _kAllDepartments &&
          department.value != _kNoDepartment) {
        final label = departmentLabels[department.value]?.trim();
        final displayLabel = (label == null || label.isEmpty) ? '所选院系' : label;
        filterNotices.add('当前仅显示 $displayLabel 下未分配班级的账号。');
      } else {
        filterNotices.add('当前仅显示未分配班级的账号。');
      }
    }

    final hasMore = accounts.length < totalAvailable;

    Future<void> handleLoadMore() async {
      if (isLoadingMore.value || accountsState.isLoading) {
        return;
      }
      if (!hasMore) {
        return;
      }
      final nextPage = lastCompletedPageRef.value + 1;
      isLoadingMore.value = true;
      loadMoreError.value = null;
      requestedPage.value = nextPage;
    }

    useEffect(
      () {
        void maybeTriggerAutoLoad() {
          if (!scrollController.hasClients) {
            return;
          }
          if (!hasMore ||
              isLoadingMore.value ||
              accountsState.isLoading ||
              loadMoreError.value != null) {
            return;
          }
          final position = scrollController.position;
          final remaining = position.maxScrollExtent - position.pixels;
          if (remaining <= _kAutoLoadMoreThreshold) {
            unawaited(handleLoadMore());
          }
        }

        scrollController.addListener(maybeTriggerAutoLoad);
        return () => scrollController.removeListener(maybeTriggerAutoLoad);
      },
      [
        scrollController,
        hasMore,
        accountsState.isLoading,
        isLoadingMore.value,
        loadMoreError.value,
      ],
    );

    useEffect(() {
      final error = loadMoreError.value;
      if (error == null) {
        return null;
      }
      final messenger = ScaffoldMessenger.of(context);
      messenger.showSnackBar(SnackBar(content: Text('加载更多失败：$error')));
      return null;
    }, [loadMoreError.value]);

    Future<void> handleRefresh() async {
      isRefreshing.value = true;
      loadMoreError.value = null;
      aggregatedAccountsState.value = const <AdminAccount>[];
      totalAccountsState.value = 0;
      lastCompletedPageRef.value = 0;
      requestedPage.value = 1;
      final refreshRequest = AdminAccountListRequest(
        schoolId: schoolId,
        role: selectedRole,
        page: 1,
        pageSize: pageSize,
        query: debouncedQuery.value,
        status: selectedStatus,
        departmentId: selectedDepartmentId,
        departmentScope: departmentScope,
        classId: selectedClassId,
        classScope: classScope,
      );
      try {
        final refreshed = ref.refresh(
          adminAccountListProvider(refreshRequest).future,
        );
        await refreshed;
      } catch (_) {
        // 错误由 accountsState 的 error 分支统一处理。
      } finally {
        isRefreshing.value = false;
      }
    }

    void updateAccountInState(AdminAccount updated) {
      aggregatedAccountsState.value = [
        for (final existing in aggregatedAccountsState.value)
          if (existing.id == updated.id) updated else existing,
      ];
    }

    void removeAccountFromState(String accountId) {
      final next = [
        for (final existing in aggregatedAccountsState.value)
          if (existing.id != accountId) existing,
      ];
      aggregatedAccountsState.value = next;
      if (totalAccountsState.value > 0) {
        totalAccountsState.value = totalAccountsState.value - 1;
      }
    }

    Future<void> exportAccountsToClipboard(List<AdminAccount> accounts) async {
      if (exportingAccounts.value) {
        return;
      }
      if (accounts.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('当前没有可导出的账号。')));
        return;
      }
      exportingAccounts.value = true;
      try {
        final buffer = StringBuffer();
        buffer.writeln('姓名,角色,状态,院系,班级,学号/工号,邮箱,手机号,最近活跃,创建时间');
        final dateFormat = DateFormat('yyyy-MM-dd HH:mm');
        for (final account in accounts) {
          final lastActive = account.lastActiveAt ?? account.createdAt;
          final row = [
            account.name,
            account.role.label,
            account.status.label,
            account.department?.trim() ?? '',
            account.className?.trim() ?? '',
            account.identifier,
            account.email,
            account.phone?.trim() ?? '',
            dateFormat.format(lastActive.toLocal()),
            dateFormat.format(account.createdAt.toLocal()),
          ];
          buffer.writeln(row.map(_escapeCsvField).join(','));
        }
        await Clipboard.setData(ClipboardData(text: buffer.toString()));
        if (!context.mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('账号列表已复制为 CSV，可直接粘贴到表格工具中。')),
        );
      } catch (error) {
        if (!context.mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('导出失败：$error'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      } finally {
        exportingAccounts.value = false;
      }
    }

    void resetFilters() {
      FocusScope.of(context).unfocus();
      if (role.value != _AccountRoleFilter.all) {
        role.value = _AccountRoleFilter.all;
      }
      if (statusFilter.value != _AccountStatusFilter.all) {
        statusFilter.value = _AccountStatusFilter.all;
      }
      if (department.value != _kAllDepartments) {
        department.value = _kAllDepartments;
      }
      if (classFilter.value != _kAllClasses) {
        classFilter.value = _kAllClasses;
      }
      if (sortOption.value != _AccountSortOption.nameAsc) {
        sortOption.value = _AccountSortOption.nameAsc;
      }
      if (queryController.text.isNotEmpty) {
        queryController.clear();
      }
      if (debouncedQuery.value.isNotEmpty) {
        debouncedQuery.value = '';
      }
    }

    void showAccountDetails(AdminAccount account) {
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (sheetContext) {
          return _AccountDetailSheet(
            account: account,
            onAccountUpdated: updateAccountInState,
            onAccountRemoved: removeAccountFromState,
          );
        },
      );
    }

    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: RefreshIndicator(
        onRefresh: handleRefresh,
        child: ListView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          children: [
            Text('账号管理', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            _AccountSectionCard(
              icon: Icons.insights_outlined,
              title: '筛选结果概览',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hasActiveFilters
                        ? '共筛选到 ${metrics.total} 个账号'
                        : '系统共包含 $totalAvailable 个账号',
                  ),
                  if (filterNotices.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _FilterNoticeGroup(notices: filterNotices),
                  ],
                  const SizedBox(height: 12),
                  _AccountMetricsGrid(metrics: metrics),
                  if (metrics.total > 0) ...[
                    const SizedBox(height: 12),
                    _AccountInsightsPanel(metrics: metrics, accounts: filtered),
                  ],
                  if (hasActiveFilters) ...[
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        if (role.value != _AccountRoleFilter.all)
                          FilterChip(
                            label: Text(
                              '身份：${_accountRoleFilterLabel(role.value)}',
                            ),
                            onSelected: (_) {},
                            onDeleted: () {
                              role.value = _AccountRoleFilter.all;
                            },
                          ),
                        if (statusFilter.value != _AccountStatusFilter.all)
                          FilterChip(
                            label: Text(
                              '状态：${_accountStatusFilterLabel(statusFilter.value)}',
                            ),
                            onSelected: (_) {},
                            onDeleted: () {
                              statusFilter.value = _AccountStatusFilter.all;
                            },
                          ),
                        if (department.value != _kAllDepartments)
                          FilterChip(
                            label: Text('院系：$departmentChipLabel'),
                            onSelected: (_) {},
                            onDeleted: () {
                              department.value = _kAllDepartments;
                              classFilter.value = _kAllClasses;
                            },
                          ),
                        if (classFilter.value != _kAllClasses)
                          FilterChip(
                            label: Text('班级：$classChipLabel'),
                            onSelected: (_) {},
                            onDeleted: () {
                              classFilter.value = _kAllClasses;
                            },
                          ),
                        if (sortOption.value != _AccountSortOption.nameAsc)
                          FilterChip(
                            label: Text(
                              '排序：${_accountSortOptionLabel(sortOption.value)}',
                            ),
                            onSelected: (_) {},
                            onDeleted: () {
                              sortOption.value = _AccountSortOption.nameAsc;
                            },
                          ),
                        if (debouncedQuery.value.isNotEmpty)
                          FilterChip(
                            label: Text('关键词：${debouncedQuery.value}'),
                            onSelected: (_) {},
                            onDeleted: () {
                              queryController.clear();
                              debouncedQuery.value = '';
                            },
                          ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16),
            _AccountSectionCard(
              icon: Icons.tune_outlined,
              title: '筛选',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: queryController,
                    decoration: InputDecoration(
                      labelText: '搜索账号',
                      hintText: '支持姓名、学号/工号或邮箱关键词',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: queryController.text.isEmpty
                          ? null
                          : IconButton(
                              tooltip: '清空搜索',
                              onPressed: () {
                                queryController.clear();
                                debouncedQuery.value = '';
                              },
                              icon: const Icon(Icons.close),
                            ),
                    ),
                    textInputAction: TextInputAction.search,
                    onSubmitted: (_) {
                      debouncedQuery.value = queryController.text.trim();
                    },
                  ),
                  const SizedBox(height: 12),
                  if (hasActiveFilters) ...[
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: resetFilters,
                        icon: const Icon(Icons.refresh),
                        label: const Text('重置筛选'),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final f in _AccountRoleFilter.values)
                        ChoiceChip(
                          label: Text(_accountRoleFilterLabel(f)),
                          selected: role.value == f,
                          onSelected: (selected) {
                            if (selected) {
                              role.value = f;
                            }
                          },
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final f in _AccountStatusFilter.values)
                        ChoiceChip(
                          label: Text(_accountStatusFilterLabel(f)),
                          selected: statusFilter.value == f,
                          onSelected: (selected) {
                            if (selected) {
                              statusFilter.value = f;
                            }
                          },
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final option in _AccountSortOption.values)
                        ChoiceChip(
                          label: Text(_accountSortOptionLabel(option)),
                          avatar: sortOption.value == option
                              ? const Icon(Icons.check, size: 16)
                              : null,
                          selected: sortOption.value == option,
                          onSelected: (selected) {
                            if (selected) {
                              sortOption.value = option;
                            }
                          },
                        ),
                    ],
                  ),
                  if (department.value == _kAllDepartments ||
                      department.value == _kNoDepartment) ...[
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ChoiceChip(
                          label: const Text('全部班级'),
                          selected: classFilter.value == _kAllClasses,
                          onSelected: (selected) {
                            if (selected) {
                              classFilter.value = _kAllClasses;
                            }
                          },
                        ),
                        ChoiceChip(
                          label: const Text('未分配班级'),
                          selected: classFilter.value == _kNoClass,
                          onSelected: (selected) {
                            classFilter.value = selected
                                ? _kNoClass
                                : _kAllClasses;
                          },
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 12),
                  DropdownMenu<String>(
                    key: ValueKey(department.value),
                    initialSelection: department.value,
                    label: const Text('按院系统一筛选'),
                    leadingIcon: const Icon(Icons.account_tree_outlined),
                    onSelected: (value) {
                      department.value = value ?? _kAllDepartments;
                      classFilter.value = _kAllClasses;
                    },
                    dropdownMenuEntries: dropdownEntries,
                  ),
                  if (department.value != _kAllDepartments &&
                      department.value != _kNoDepartment) ...[
                    const SizedBox(height: 12),
                    DropdownMenu<String>(
                      key: ValueKey('${department.value}|${classFilter.value}'),
                      initialSelection: classFilter.value,
                      label: const Text('按班级筛选'),
                      leadingIcon: const Icon(Icons.group_outlined),
                      onSelected: (value) {
                        classFilter.value = value ?? _kAllClasses;
                      },
                      dropdownMenuEntries: classDropdownEntries,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16),
            _AccountSectionCard(
              icon: Icons.manage_accounts_outlined,
              title: '账号列表',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (filtered.isNotEmpty) ...[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FilledButton.tonalIcon(
                            icon: const Icon(Icons.auto_awesome),
                            label: const Text('AI 批量操作'),
                            onPressed: () async {
                              final success = await showDialog<bool>(
                                context: context,
                                builder: (context) => const _AIBatchDialog(),
                              );
                              if (success == true) {
                                handleRefresh();
                              }
                            },
                          ),
                          const SizedBox(width: 12),
                          FilledButton.icon(
                            icon: const Icon(Icons.add),
                            label: const Text('添加账号'),
                            onPressed: () async {
                              final success = await showDialog<bool>(
                                context: context,
                                builder: (context) =>
                                    const _CreateAccountDialog(),
                              );
                              if (success == true) {
                                handleRefresh();
                              }
                            },
                          ),
                          const SizedBox(width: 12),
                          FilledButton.icon(
                            icon: exportingAccounts.value
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Icon(Icons.download_outlined),
                            label: Text(
                              exportingAccounts.value ? '导出中…' : '导出列表',
                            ),
                            onPressed: exportingAccounts.value
                                ? null
                                : () => exportAccountsToClipboard(filtered),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                  if (filtered.isEmpty)
                    _EmptyPlaceholder(
                      title: '暂无账号',
                      description: hasActiveFilters
                          ? '没有符合筛选条件的账号，请调整筛选条件后再试。'
                          : '暂未查询到账号数据，稍后再试或检查连接。',
                    )
                  else
                    Column(
                      children: [
                        _AccountListHeader(
                          currentSort: sortOption.value,
                          onSortChanged: (option) {
                            if (sortOption.value != option) {
                              sortOption.value = option;
                            }
                          },
                        ),
                        const SizedBox(height: 8),
                        for (final account in filtered)
                          _AccountTile(
                            account: account,
                            onOpenDetails: () => showAccountDetails(account),
                          ),
                      ],
                    ),
                  if (loadMoreError.value != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        '加载更多失败：${loadMoreError.value}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  if (hasMore || isLoadingMore.value)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: OutlinedButton.icon(
                        onPressed: isLoadingMore.value ? null : handleLoadMore,
                        icon: isLoadingMore.value
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.unfold_more),
                        label: Text(isLoadingMore.value ? '加载中…' : '加载更多'),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminStructuresPage extends HookConsumerWidget {
  const AdminStructuresPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewPreferences = ref.watch(adminDepartmentViewPreferencesProvider);
    final filterController = useTextEditingController(
      text: viewPreferences.query,
    );
    useListenable(filterController);
    final authState = ref.watch(authStateProvider);
    final schoolId = authState.account?.schoolId ?? '';
    final canManageStructures =
        authState.isAuthenticated && schoolId.isNotEmpty;
    final baseTree = ref.watch(adminDepartmentTreeProvider);
    final allDepartments = baseTree.maybeWhen(
      data: (nodes) => nodes.map((node) => node.department).toList(),
      orElse: () => <Department>[],
    );
    final expandedDepartments = ref.watch(adminExpandedDepartmentsProvider);
    final filteredTree = ref.watch(adminFilteredDepartmentTreeProvider);
    final metrics = ref.watch(adminFilteredDepartmentMetricsProvider);
    final filterValue = viewPreferences.query;
    final onlyEmpty = viewPreferences.onlyEmpty;
    final normalizedQuery = filterController.text.trim().toLowerCase();
    final highlightedDepartmentId = useState<String?>(null);
    final highlightTimer = useRef<Timer?>(null);
    final scrollController = useScrollController();
    final departmentItemKeys = useRef<Map<String, GlobalKey>>(
      <String, GlobalKey>{},
    );
    final lastScrolledQuery = useRef<String>('');

    void scheduleHighlight(String? departmentId) {
      if (departmentId == null || departmentId.isEmpty) {
        return;
      }
      highlightTimer.value?.cancel();
      highlightedDepartmentId.value = departmentId;
      highlightTimer.value = Timer(const Duration(seconds: 3), () {
        if (!context.mounted) return;
        highlightedDepartmentId.value = null;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final key = departmentItemKeys.value[departmentId];
        final targetContext = key?.currentContext;
        if (targetContext == null) {
          return;
        }
        await Scrollable.ensureVisible(
          targetContext,
          duration: const Duration(milliseconds: 360),
          curve: Curves.easeInOut,
          alignment: 0.08,
        );
      });
    }

    useEffect(() {
      if (filterController.text != filterValue) {
        filterController.text = filterValue;
      }
      return null;
    }, [filterValue]);

    useEffect(() {
      final data = baseTree.asData?.value;
      if (data != null) {
        Future.microtask(
          () => ref
              .read(adminExpandedDepartmentsProvider.notifier)
              .pruneToIds(data.map((node) => node.department.id)),
        );
      }
      return null;
    }, [baseTree]);

    useEffect(() {
      if (!canManageStructures) {
        ref
            .read(adminExpandedDepartmentsProvider.notifier)
            .clear(persist: false);
      }
      return null;
    }, [canManageStructures]);

    useEffect(() {
      if (normalizedQuery.isEmpty) {
        lastScrolledQuery.value = '';
        return null;
      }
      final nodes = filteredTree.asData?.value;
      if (nodes != null) {
        final notifier = ref.read(adminExpandedDepartmentsProvider.notifier);
        for (final node in nodes) {
          notifier.setExpanded(node.department.id, true);
        }
      }
      return null;
    }, [filteredTree, normalizedQuery]);

    useEffect(() {
      if (normalizedQuery.isEmpty) {
        lastScrolledQuery.value = '';
        return null;
      }
      final nodes = filteredTree.asData?.value;
      if (nodes == null || nodes.isEmpty) {
        return null;
      }
      if (lastScrolledQuery.value == normalizedQuery) {
        return null;
      }
      lastScrolledQuery.value = normalizedQuery;
      scheduleHighlight(nodes.first.department.id);
      return null;
    }, [filteredTree, normalizedQuery]);

    useEffect(() {
      return () {
        highlightTimer.value?.cancel();
      };
    }, const []);

    Future<void> refreshStructures() async {
      await ref.read(adminDepartmentTreeProvider.notifier).refresh();
      ref.invalidate(adminFilteredDepartmentTreeProvider);
    }

    bool updateDepartmentTreeLocally(
      List<DepartmentNode> Function(List<DepartmentNode>) transform,
    ) {
      final applied = ref
          .read(adminDepartmentTreeProvider.notifier)
          .updateTree(transform);
      if (applied) {
        ref.invalidate(adminFilteredDepartmentTreeProvider);
        final currentNodes = ref
            .read(adminDepartmentTreeProvider)
            .maybeWhen<List<DepartmentNode>?>(
              data: (value) => value,
              orElse: () => null,
            );
        if (currentNodes != null) {
          ref
              .read(adminExpandedDepartmentsProvider.notifier)
              .pruneToIds(currentNodes.map((node) => node.department.id));
        }
      }
      return applied;
    }

    void expandAllDepartments(Iterable<DepartmentNode> nodes) {
      final notifier = ref.read(adminExpandedDepartmentsProvider.notifier);
      notifier.setAll(nodes.map((node) => node.department.id));
    }

    void collapseAllDepartments() {
      ref.read(adminExpandedDepartmentsProvider.notifier).clear();
    }

    Future<void> showCreateDepartmentDialog() async {
      if (!canManageStructures) return;

      final nameController = TextEditingController();
      var submitting = false;
      String? errorText;

      final result = await showDialog<bool>(
        context: context,
        barrierDismissible: !submitting,
        builder: (dialogContext) {
          return StatefulBuilder(
            builder: (dialogCtx, setState) {
              return AlertDialog(
                title: const Text('新增院系'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: nameController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: '院系名称',
                        hintText: '例如：计算机学院',
                        errorText: errorText,
                      ),
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) {
                        if (!submitting) {
                          setState(() {
                            errorText = null;
                          });
                        }
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: submitting
                        ? null
                        : () {
                            Navigator.of(dialogCtx).pop(false);
                          },
                    child: const Text('取消'),
                  ),
                  FilledButton(
                    onPressed: submitting
                        ? null
                        : () async {
                            final name = nameController.text.trim();
                            if (name.isEmpty) {
                              setState(() {
                                errorText = '请输入院系名称';
                              });
                              return;
                            }
                            setState(() {
                              submitting = true;
                              errorText = null;
                            });
                            try {
                              var applied = false;
                              final departmentId = await ref
                                  .read(adminRepositoryProvider)
                                  .createDepartment(
                                    schoolId: schoolId,
                                    name: name,
                                  );
                              if (departmentId.isNotEmpty) {
                                final department = Department(
                                  id: departmentId,
                                  schoolId: schoolId,
                                  name: name,
                                );
                                var mutated = false;
                                final updated = updateDepartmentTreeLocally((
                                  nodes,
                                ) {
                                  final updatedNodes = <DepartmentNode>[];
                                  for (final existing in nodes) {
                                    if (existing.department.id ==
                                        department.id) {
                                      mutated = true;
                                      final classes = [...existing.classes]
                                        ..sort(_compareClassInfos);
                                      updatedNodes.add(
                                        existing.copyWith(
                                          department: department,
                                          classes: classes,
                                        ),
                                      );
                                    } else {
                                      updatedNodes.add(existing);
                                    }
                                  }
                                  if (!mutated) {
                                    mutated = true;
                                    updatedNodes.add(
                                      DepartmentNode(
                                        department: department,
                                        classes: const [],
                                      ),
                                    );
                                  }
                                  updatedNodes.sort(_compareDepartmentNodes);
                                  return updatedNodes;
                                });
                                applied = updated && mutated;
                              }
                              if (applied) {
                                ref
                                    .read(
                                      adminExpandedDepartmentsProvider.notifier,
                                    )
                                    .setExpanded(departmentId, true);
                              } else {
                                await refreshStructures();
                                ref
                                    .read(
                                      adminExpandedDepartmentsProvider.notifier,
                                    )
                                    .setExpanded(departmentId, true);
                              }
                              scheduleHighlight(departmentId);
                              if (!dialogCtx.mounted) return;
                              Navigator.of(dialogCtx).pop(true);
                            } catch (error, stackTrace) {
                              debugPrint('创建院系异常: $error\n$stackTrace');
                              setState(() {
                                errorText = '创建失败：${error.toString()}';
                                submitting = false;
                              });
                            }
                          },
                    child: submitting
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('创建'),
                  ),
                ],
              );
            },
          );
        },
      );

      if (result == true && context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('院系创建成功')));
      }
    }

    Future<void> showCreateClassDialog() async {
      if (!canManageStructures) return;
      final departments = allDepartments;
      if (departments.isEmpty) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('请先创建院系，再添加班级。')));
        }
        return;
      }

      final nameController = TextEditingController();
      var submitting = false;
      String? selectedDepartmentId = departments.first.id;
      String? errorText;

      final result = await showDialog<bool>(
        context: context,
        barrierDismissible: !submitting,
        builder: (dialogContext) {
          return StatefulBuilder(
            builder: (dialogCtx, setState) {
              return AlertDialog(
                title: const Text('新增班级'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DropdownButtonFormField<String>(
                      initialValue: selectedDepartmentId,
                      decoration: const InputDecoration(labelText: '所属院系'),
                      items: [
                        for (final dept in departments)
                          DropdownMenuItem<String>(
                            value: dept.id,
                            child: Text(dept.name),
                          ),
                      ],
                      onChanged: submitting
                          ? null
                          : (value) {
                              setState(() {
                                selectedDepartmentId = value;
                              });
                            },
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: '班级名称',
                        hintText: '例如：22 级 1 班',
                        errorText: errorText,
                      ),
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) {
                        if (!submitting) {
                          setState(() {
                            errorText = null;
                          });
                        }
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: submitting
                        ? null
                        : () {
                            Navigator.of(dialogCtx).pop(false);
                          },
                    child: const Text('取消'),
                  ),
                  FilledButton(
                    onPressed: submitting
                        ? null
                        : () async {
                            final departmentId = selectedDepartmentId;
                            final name = nameController.text.trim();
                            if (departmentId == null || departmentId.isEmpty) {
                              setState(() {
                                errorText = '请选择院系';
                              });
                              return;
                            }
                            if (name.isEmpty) {
                              setState(() {
                                errorText = '请输入班级名称';
                              });
                              return;
                            }
                            setState(() {
                              submitting = true;
                              errorText = null;
                            });
                            try {
                              var applied = false;
                              final classId = await ref
                                  .read(adminRepositoryProvider)
                                  .createClass(
                                    schoolId: schoolId,
                                    departmentId: departmentId,
                                    name: name,
                                  );
                              if (classId.isNotEmpty) {
                                final newClass = ClassInfo(
                                  id: classId,
                                  departmentId: departmentId,
                                  name: name,
                                );
                                var inserted = false;
                                final updated = updateDepartmentTreeLocally((
                                  nodes,
                                ) {
                                  final updatedNodes = <DepartmentNode>[];
                                  for (final existing in nodes) {
                                    if (existing.department.id ==
                                        departmentId) {
                                      inserted = true;
                                      final classes = [
                                        ...existing.classes,
                                        newClass,
                                      ]..sort(_compareClassInfos);
                                      updatedNodes.add(
                                        existing.copyWith(classes: classes),
                                      );
                                    } else {
                                      updatedNodes.add(existing);
                                    }
                                  }
                                  if (!inserted) {
                                    return nodes;
                                  }
                                  updatedNodes.sort(_compareDepartmentNodes);
                                  return updatedNodes;
                                });
                                applied = updated && inserted;
                              }
                              if (applied) {
                                ref
                                    .read(
                                      adminExpandedDepartmentsProvider.notifier,
                                    )
                                    .setExpanded(departmentId, true);
                              } else {
                                await refreshStructures();
                                ref
                                    .read(
                                      adminExpandedDepartmentsProvider.notifier,
                                    )
                                    .setExpanded(departmentId, true);
                              }
                              scheduleHighlight(departmentId);
                              if (!dialogCtx.mounted) return;
                              Navigator.of(dialogCtx).pop(true);
                            } catch (error, stackTrace) {
                              debugPrint('创建班级异常: $error\n$stackTrace');
                              setState(() {
                                errorText = '创建失败：${error.toString()}';
                                submitting = false;
                              });
                            }
                          },
                    child: submitting
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('创建'),
                  ),
                ],
              );
            },
          );
        },
      );

      if (result == true && context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('班级创建成功')));
      }
    }

    Future<void> showRenameDepartmentDialog(DepartmentNode node) async {
      if (!canManageStructures) return;

      final nameController = TextEditingController(text: node.department.name);
      var submitting = false;
      String? errorText;

      final result = await showDialog<bool>(
        context: context,
        barrierDismissible: !submitting,
        builder: (dialogContext) {
          return StatefulBuilder(
            builder: (dialogCtx, setState) {
              return AlertDialog(
                title: const Text('重命名院系'),
                content: TextField(
                  controller: nameController,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: '新的院系名称',
                    errorText: errorText,
                  ),
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) {
                    if (!submitting) {
                      setState(() {
                        errorText = null;
                      });
                    }
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: submitting
                        ? null
                        : () {
                            Navigator.of(dialogCtx).pop(false);
                          },
                    child: const Text('取消'),
                  ),
                  FilledButton(
                    onPressed: submitting
                        ? null
                        : () async {
                            final name = nameController.text.trim();
                            if (name.isEmpty) {
                              setState(() {
                                errorText = '请输入院系名称';
                              });
                              return;
                            }
                            setState(() {
                              submitting = true;
                              errorText = null;
                            });
                            try {
                              final updatedDepartment = await ref
                                  .read(adminRepositoryProvider)
                                  .updateDepartment(
                                    schoolId: schoolId,
                                    departmentId: node.department.id,
                                    name: name,
                                  );
                              final applied = updateDepartmentTreeLocally((
                                nodes,
                              ) {
                                var changed = false;
                                final updatedNodes = <DepartmentNode>[];
                                for (final existing in nodes) {
                                  if (existing.department.id ==
                                      updatedDepartment.id) {
                                    changed = true;
                                    final classes = [...existing.classes]
                                      ..sort(_compareClassInfos);
                                    updatedNodes.add(
                                      existing.copyWith(
                                        department: updatedDepartment,
                                        classes: classes,
                                      ),
                                    );
                                  } else {
                                    updatedNodes.add(existing);
                                  }
                                }
                                if (!changed) {
                                  return nodes;
                                }
                                updatedNodes.sort(_compareDepartmentNodes);
                                return updatedNodes;
                              });
                              if (!applied) {
                                await refreshStructures();
                              }
                              scheduleHighlight(updatedDepartment.id);
                              if (!dialogCtx.mounted) return;
                              Navigator.of(dialogCtx).pop(true);
                            } catch (error) {
                              setState(() {
                                errorText = error.toString();
                                submitting = false;
                              });
                            }
                          },
                    child: submitting
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('保存'),
                  ),
                ],
              );
            },
          );
        },
      );

      if (result == true && context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('院系名称已更新')));
      }
    }

    Future<void> confirmDeleteDepartment(DepartmentNode node) async {
      if (!canManageStructures) return;
      if (node.classes.isNotEmpty) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('请先删除该院系下的所有班级。')));
        }
        return;
      }

      final confirmed = await showDialog<bool>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('删除院系'),
            content: Text('确定要删除院系“${node.department.name}”吗？此操作不可恢复。'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: const Text('取消'),
              ),
              FilledButton.tonal(
                onPressed: () => Navigator.of(dialogContext).pop(true),
                style: FilledButton.styleFrom(
                  foregroundColor: Theme.of(
                    context,
                  ).colorScheme.onErrorContainer,
                  backgroundColor: Theme.of(context).colorScheme.errorContainer,
                ),
                child: const Text('确认删除'),
              ),
            ],
          );
        },
      );

      if (confirmed == true) {
        try {
          await ref
              .read(adminRepositoryProvider)
              .deleteDepartment(
                schoolId: schoolId,
                departmentId: node.department.id,
              );
          final applied = updateDepartmentTreeLocally((nodes) {
            final filtered = nodes
                .where(
                  (existing) => existing.department.id != node.department.id,
                )
                .toList();
            if (filtered.length == nodes.length) {
              return nodes;
            }
            filtered.sort(_compareDepartmentNodes);
            return filtered;
          });
          if (!applied) {
            await refreshStructures();
          }
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('院系已删除')));
          }
        } catch (error) {
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('删除失败：${error.toString()}')));
          }
        }
      }
    }

    Future<void> showRenameClassDialog(
      DepartmentNode node,
      ClassInfo clazz,
    ) async {
      if (!canManageStructures) return;

      final nameController = TextEditingController(text: clazz.name);
      var submitting = false;
      String? errorText;

      final result = await showDialog<bool>(
        context: context,
        barrierDismissible: !submitting,
        builder: (dialogContext) {
          return StatefulBuilder(
            builder: (dialogCtx, setState) {
              return AlertDialog(
                title: Text('重命名班级（${node.department.name}）'),
                content: TextField(
                  controller: nameController,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: '新的班级名称',
                    errorText: errorText,
                  ),
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) {
                    if (!submitting) {
                      setState(() {
                        errorText = null;
                      });
                    }
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: submitting
                        ? null
                        : () {
                            Navigator.of(dialogCtx).pop(false);
                          },
                    child: const Text('取消'),
                  ),
                  FilledButton(
                    onPressed: submitting
                        ? null
                        : () async {
                            final name = nameController.text.trim();
                            if (name.isEmpty) {
                              setState(() {
                                errorText = '请输入班级名称';
                              });
                              return;
                            }
                            setState(() {
                              submitting = true;
                              errorText = null;
                            });
                            try {
                              final updatedClass = await ref
                                  .read(adminRepositoryProvider)
                                  .updateClass(
                                    schoolId: schoolId,
                                    classId: clazz.id,
                                    name: name,
                                  );
                              final applied = updateDepartmentTreeLocally((
                                nodes,
                              ) {
                                var nodeUpdated = false;
                                final updatedNodes = <DepartmentNode>[];
                                for (final existing in nodes) {
                                  if (!nodeUpdated &&
                                      existing.department.id ==
                                          updatedClass.departmentId) {
                                    final classes = <ClassInfo>[];
                                    var classUpdated = false;
                                    for (final item in existing.classes) {
                                      if (item.id == updatedClass.id) {
                                        classUpdated = true;
                                        classes.add(updatedClass);
                                      } else {
                                        classes.add(item);
                                      }
                                    }
                                    if (!classUpdated) {
                                      return nodes;
                                    }
                                    classes.sort(_compareClassInfos);
                                    updatedNodes.add(
                                      existing.copyWith(classes: classes),
                                    );
                                    nodeUpdated = true;
                                  } else {
                                    updatedNodes.add(existing);
                                  }
                                }
                                if (!nodeUpdated) {
                                  return nodes;
                                }
                                updatedNodes.sort(_compareDepartmentNodes);
                                return updatedNodes;
                              });
                              if (!applied) {
                                await refreshStructures();
                              }
                              scheduleHighlight(updatedClass.departmentId);
                              if (!dialogCtx.mounted) return;
                              Navigator.of(dialogCtx).pop(true);
                            } catch (error) {
                              setState(() {
                                errorText = error.toString();
                                submitting = false;
                              });
                            }
                          },
                    child: submitting
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('保存'),
                  ),
                ],
              );
            },
          );
        },
      );

      if (result == true && context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('班级名称已更新')));
      }
    }

    Future<void> confirmDeleteClass(
      DepartmentNode node,
      ClassInfo clazz,
    ) async {
      if (!canManageStructures) return;

      final confirmed = await showDialog<bool>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('删除班级'),
            content: Text('确定要删除班级“${clazz.name}”吗？此操作不可恢复。'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: const Text('取消'),
              ),
              FilledButton.tonal(
                onPressed: () => Navigator.of(dialogContext).pop(true),
                style: FilledButton.styleFrom(
                  foregroundColor: Theme.of(
                    context,
                  ).colorScheme.onErrorContainer,
                  backgroundColor: Theme.of(context).colorScheme.errorContainer,
                ),
                child: const Text('确认删除'),
              ),
            ],
          );
        },
      );

      if (confirmed == true) {
        try {
          await ref
              .read(adminRepositoryProvider)
              .deleteClass(schoolId: schoolId, classId: clazz.id);
          final applied = updateDepartmentTreeLocally((nodes) {
            final updatedNodes = <DepartmentNode>[];
            var nodeUpdated = false;
            for (final existing in nodes) {
              if (!nodeUpdated &&
                  existing.department.id == node.department.id) {
                final classes = [
                  for (final item in existing.classes)
                    if (item.id != clazz.id) item,
                ];
                if (classes.length == existing.classes.length) {
                  return nodes;
                }
                classes.sort(_compareClassInfos);
                updatedNodes.add(existing.copyWith(classes: classes));
                nodeUpdated = true;
              } else {
                updatedNodes.add(existing);
              }
            }
            if (!nodeUpdated) {
              return nodes;
            }
            updatedNodes.sort(_compareDepartmentNodes);
            return updatedNodes;
          });
          if (!applied) {
            await refreshStructures();
          }
          scheduleHighlight(node.department.id);
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('班级已删除')));
          }
        } catch (error) {
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('删除失败：${error.toString()}')));
          }
        }
      }
    }

    Future<void> showAssignStudentDialog(
      DepartmentNode node,
      ClassInfo clazz,
    ) async {
      if (!canManageStructures) return;

      final result = await showDialog<bool>(
        context: context,
        builder: (context) =>
            AssignStudentDialog(department: node.department, classInfo: clazz),
      );

      if (result == true) {
        await refreshStructures();
      }
    }

    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: filteredTree.when(
        data: (nodes) {
          final normalized = normalizedQuery;
          final metricsValue = metrics.maybeWhen(
            data: (value) => value,
            orElse: () => null,
          );
          final canToggleBulkExpansion = normalized.isEmpty;
          final allVisibleExpanded =
              canToggleBulkExpansion &&
              nodes.isNotEmpty &&
              nodes.every(
                (node) => expandedDepartments.contains(node.department.id),
              );
          final canCollapseAny =
              canToggleBulkExpansion && expandedDepartments.isNotEmpty;

          return RefreshIndicator(
            onRefresh: refreshStructures,
            child: ListView(
              controller: scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              children: [
                Text('院系与班级', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    FilledButton.icon(
                      onPressed: canManageStructures
                          ? () {
                              showCreateDepartmentDialog();
                            }
                          : null,
                      icon: const Icon(Icons.domain_add_outlined),
                      label: const Text('新增院系'),
                    ),
                    FilledButton.icon(
                      onPressed:
                          canManageStructures && allDepartments.isNotEmpty
                          ? () {
                              showCreateClassDialog();
                            }
                          : null,
                      icon: const Icon(Icons.group_add_outlined),
                      label: const Text('新增班级'),
                    ),
                  ],
                ),
                if (!canManageStructures) ...[
                  const SizedBox(height: 12),
                  Text(
                    '需登录且拥有学校信息后才能创建院系与班级。',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                if (metricsValue != null)
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _AdminStatsCard(
                        icon: Icons.apartment_outlined,
                        title: '筛选院系',
                        value: metricsValue.departmentCount.toString(),
                        subtitle: '符合条件的院系数量。',
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      _AdminStatsCard(
                        icon: Icons.class_outlined,
                        title: '筛选班级',
                        value: metricsValue.classCount.toString(),
                        subtitle: '这些院系下的班级合计。',
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      _AdminStatsCard(
                        icon: Icons.hourglass_empty_outlined,
                        title: '暂无班级',
                        value: metricsValue.emptyDepartmentCount.toString(),
                        subtitle: '仍未配置班级的院系数。',
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ],
                  ),
                if (metricsValue != null) const SizedBox(height: 12),
                TextField(
                  controller: filterController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    labelText: '搜索院系或班级',
                    suffixIcon: filterController.text.isEmpty
                        ? null
                        : IconButton(
                            tooltip: '清空搜索',
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              ref
                                  .read(
                                    adminDepartmentViewPreferencesProvider
                                        .notifier,
                                  )
                                  .setQuery('');
                            },
                          ),
                  ),
                  onChanged: (value) => ref
                      .read(adminDepartmentViewPreferencesProvider.notifier)
                      .setQuery(value),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    FilterChip(
                      label: const Text('仅显示未配置班级'),
                      selected: onlyEmpty,
                      onSelected: (selected) => ref
                          .read(adminDepartmentViewPreferencesProvider.notifier)
                          .setOnlyEmpty(selected),
                      side: BorderSide.none,
                      visualDensity: VisualDensity.compact,
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerLow,
                    ),
                    if (canToggleBulkExpansion && nodes.isNotEmpty) ...[
                      TextButton.icon(
                        icon: const Icon(Icons.unfold_more),
                        label: const Text('展开全部'),
                        onPressed: allVisibleExpanded
                            ? null
                            : () => expandAllDepartments(nodes),
                      ),
                      TextButton.icon(
                        icon: const Icon(Icons.unfold_less),
                        label: const Text('折叠全部'),
                        onPressed: canCollapseAny
                            ? () => collapseAllDepartments()
                            : null,
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 12),
                if (nodes.isEmpty)
                  const _EmptyPlaceholder(
                    title: '暂无匹配结果',
                    description: '尝试调整关键词或取消筛选条件后再试。',
                  )
                else
                  ...(() {
                    final visibleIds = {
                      for (final node in nodes) node.department.id,
                    };
                    departmentItemKeys.value.removeWhere(
                      (key, _) => !visibleIds.contains(key),
                    );
                    return nodes.map((node) {
                      final key = departmentItemKeys.value.putIfAbsent(
                        node.department.id,
                        () => GlobalKey(),
                      );
                      return _DepartmentExpansion(
                        key: key,
                        node: node,
                        query: normalized,
                        canManage: canManageStructures,
                        initiallyExpanded: expandedDepartments.contains(
                          node.department.id,
                        ),
                        highlighted:
                            highlightedDepartmentId.value == node.department.id,
                        onExpansionChanged: (isExpanded) {
                          ref
                              .read(adminExpandedDepartmentsProvider.notifier)
                              .setExpanded(node.department.id, isExpanded);
                        },
                        onRenameDepartment: showRenameDepartmentDialog,
                        onDeleteDepartment: confirmDeleteDepartment,
                        onRenameClass: showRenameClassDialog,
                        onDeleteClass: confirmDeleteClass,
                        onAssignStudent: showAssignStudentDialog,
                      );
                    }).toList();
                  })(),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _ErrorPlaceholder(
          message: e.toString(),
          onRetry: () {
            ref.invalidate(adminDepartmentTreeProvider);
          },
        ),
      ),
    );
  }
}

class AdminOssSettingsPage extends HookConsumerWidget {
  const AdminOssSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ossState = ref.watch(adminOssProvider);
    final ossNotifier = ref.read(adminOssProvider.notifier);
    final credentialBusy = useState<Set<String>>(<String>{});
    final policyBusy = useState<Set<String>>(<String>{});
    final auditBusy = useState(false);
    final creatingCredential = useState(false);
    final creatingPolicy = useState(false);

    void showSnack(String message) {
      if (!context.mounted) return;
      final messenger = ScaffoldMessenger.of(context);
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(
        SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
      );
    }

    String errorMessage(Object error) {
      if (error is AppException) {
        return error.message;
      }
      if (error is StateError) {
        return error.message;
      }
      return error.toString();
    }

    Future<void> copyCredential(oss.AdminOssCredential credential) async {
      final payload = StringBuffer()
        ..writeln('名称：${credential.name}')
        ..writeln('Endpoint：${credential.endpoint}')
        ..writeln(
          'Internal Endpoint：${credential.internalEndpoint.isEmpty ? '-' : credential.internalEndpoint}',
        )
        ..writeln('Bucket：${credential.bucket}')
        ..writeln('访问凭证：${credential.accessKeyMasked}');
      await Clipboard.setData(ClipboardData(text: payload.toString()));
      showSnack('已复制 ${credential.name} 的访问信息');
    }

    Future<void> runCredentialMutation(
      String id,
      Future<String?> Function() operation,
    ) async {
      if (id.isEmpty) {
        return;
      }
      final current = {...credentialBusy.value}..add(id);
      credentialBusy.value = current;
      try {
        final message = await operation();
        if (message != null && message.isNotEmpty) {
          showSnack(message);
        }
      } on Object catch (error) {
        showSnack('操作失败：${errorMessage(error)}');
      } finally {
        final updated = {...credentialBusy.value}..remove(id);
        credentialBusy.value = updated;
      }
    }

    Future<void> runPolicyMutation(
      String id,
      Future<String?> Function() operation,
    ) async {
      if (id.isEmpty) {
        return;
      }
      final current = {...policyBusy.value}..add(id);
      policyBusy.value = current;
      try {
        final message = await operation();
        if (message != null && message.isNotEmpty) {
          showSnack(message);
        }
      } on Object catch (error) {
        showSnack('操作失败：${errorMessage(error)}');
      } finally {
        final updated = {...policyBusy.value}..remove(id);
        policyBusy.value = updated;
      }
    }

    bool isCredentialBusy(String id) => credentialBusy.value.contains(id);
    bool isPolicyBusy(String id) => policyBusy.value.contains(id);

    Future<void> createCredential() async {
      if (creatingCredential.value) {
        return;
      }
      final formKey = GlobalKey<FormState>();
      final nameController = TextEditingController();
      final endpointController = TextEditingController();
      final internalEndpointController = TextEditingController();
      final regionController = TextEditingController();
      final bucketController = TextEditingController();
      final prefixController = TextEditingController();
      final accessKeyIdController = TextEditingController();
      final accessKeySecretController = TextEditingController();
      final accessKeyController = TextEditingController();
      var allowPublicRead = false;
      var allowMultipart = false;
      var useRelayUpload = false;
      var isPrimary = false;
      var active = true;
      try {
        final result =
            await showDialog<
              ({
                String name,
                String endpoint,
                String internalEndpoint,
                String region,
                String bucket,
                String directoryPrefix,
                String accessKeyId,
                String accessKeySecret,
                String accessKey,
                bool allowPublicRead,
                bool allowMultipart,
                bool useRelayUpload,
                bool isPrimary,
                bool active,
              })
            >(
              context: context,
              builder: (dialogContext) {
                return AlertDialog(
                  title: const Text('新增 OSS 凭证'),
                  content: StatefulBuilder(
                    builder: (context, setStateBuilder) {
                      return SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  labelText: '名称',
                                  helperText: '仅用于管理端展示，建议包含用途说明',
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return '请输入名称';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: endpointController,
                                decoration: const InputDecoration(
                                  labelText: 'Endpoint',
                                  hintText:
                                      'https://oss-cn-example.aliyuncs.com',
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return '请输入 Endpoint';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: internalEndpointController,
                                decoration: const InputDecoration(
                                  labelText: 'Internal Endpoint（可选）',
                                  helperText: '用于服务端上传加速（内网），下载仍使用公网 Endpoint',
                                ),
                              ),
                              TextFormField(
                                controller: regionController,
                                decoration: const InputDecoration(
                                  labelText: '区域',
                                  hintText: 'cn-example',
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return '请输入区域';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: bucketController,
                                decoration: const InputDecoration(
                                  labelText: 'Bucket',
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return '请输入 Bucket 名称';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: prefixController,
                                decoration: const InputDecoration(
                                  labelText: '目录前缀',
                                  helperText: '可选，建议以 / 结尾',
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                controller: accessKeyIdController,
                                decoration: const InputDecoration(
                                  labelText: 'AccessKey ID',
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return '请输入 AccessKey ID';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                controller: accessKeySecretController,
                                decoration: const InputDecoration(
                                  labelText: 'AccessKey Secret',
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return '请输入 AccessKey Secret';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                controller: accessKeyController,
                                decoration: const InputDecoration(
                                  labelText: '访问凭证展示值',
                                  helperText: '仅用于标识，推荐使用已脱敏 AccessKey',
                                ),
                              ),
                              const SizedBox(height: 12),
                              SwitchListTile.adaptive(
                                contentPadding: EdgeInsets.zero,
                                title: const Text('启用凭证'),
                                value: active,
                                onChanged: (value) {
                                  setStateBuilder(() {
                                    active = value;
                                  });
                                },
                              ),
                              SwitchListTile.adaptive(
                                contentPadding: EdgeInsets.zero,
                                title: const Text('设为主凭证'),
                                subtitle: const Text('主凭证会默认启用并覆盖旧主凭证'),
                                value: isPrimary,
                                onChanged: (value) {
                                  setStateBuilder(() {
                                    isPrimary = value;
                                    if (value) {
                                      active = true;
                                    }
                                  });
                                },
                              ),
                              SwitchListTile.adaptive(
                                contentPadding: EdgeInsets.zero,
                                title: const Text('允许公开只读访问'),
                                value: allowPublicRead,
                                onChanged: (value) {
                                  setStateBuilder(() {
                                    allowPublicRead = value;
                                  });
                                },
                              ),
                              SwitchListTile.adaptive(
                                contentPadding: EdgeInsets.zero,
                                title: const Text('允许分片上传'),
                                value: allowMultipart,
                                onChanged: (value) {
                                  setStateBuilder(() {
                                    allowMultipart = value;
                                  });
                                },
                              ),
                              SwitchListTile.adaptive(
                                contentPadding: EdgeInsets.zero,
                                title: const Text('服务端中继上传'),
                                subtitle: const Text(
                                  '开启后文件将先上传到服务端再转存到 OSS（仅主凭证生效）',
                                ),
                                value: useRelayUpload,
                                onChanged: (value) {
                                  setStateBuilder(() {
                                    useRelayUpload = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      child: const Text('取消'),
                    ),
                    FilledButton(
                      onPressed: () {
                        if (!(formKey.currentState?.validate() ?? false)) {
                          return;
                        }
                        Navigator.of(dialogContext).pop((
                          name: nameController.text.trim(),
                          endpoint: endpointController.text.trim(),
                          internalEndpoint: internalEndpointController.text
                              .trim(),
                          region: regionController.text.trim(),
                          bucket: bucketController.text.trim(),
                          directoryPrefix: prefixController.text.trim(),
                          accessKeyId: accessKeyIdController.text.trim(),
                          accessKeySecret: accessKeySecretController.text
                              .trim(),
                          accessKey: accessKeyController.text.trim(),
                          allowPublicRead: allowPublicRead,
                          allowMultipart: allowMultipart,
                          useRelayUpload: useRelayUpload,
                          isPrimary: isPrimary,
                          active: active,
                        ));
                      },
                      child: const Text('创建'),
                    ),
                  ],
                );
              },
            );
        if (result == null) {
          return;
        }
        creatingCredential.value = true;
        final created = await ossNotifier.createCredential(
          name: result.name,
          endpoint: result.endpoint,
          internalEndpoint: result.internalEndpoint,
          region: result.region,
          bucket: result.bucket,
          accessKeyId: result.accessKeyId,
          accessKeySecret: result.accessKeySecret,
          directoryPrefix: result.directoryPrefix,
          accessKeyDisplay: result.accessKey,
          allowPublicRead: result.allowPublicRead,
          allowMultipartUpload: result.allowMultipart,
          useRelayUpload: result.useRelayUpload,
          active: result.active,
          isPrimary: result.isPrimary,
        );
        showSnack('已创建凭证「${created.name}」');
      } on Object catch (error) {
        showSnack('创建凭证失败：${errorMessage(error)}');
      } finally {
        creatingCredential.value = false;
        nameController.dispose();
        endpointController.dispose();
        internalEndpointController.dispose();
        regionController.dispose();
        bucketController.dispose();
        prefixController.dispose();
        accessKeyIdController.dispose();
        accessKeySecretController.dispose();
        accessKeyController.dispose();
      }
    }

    Future<void> confirmDeleteCredential(
      oss.AdminOssCredential credential,
    ) async {
      if (credential.isPrimary || isCredentialBusy(credential.id)) {
        return;
      }
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('删除凭证'),
            content: Text('确定删除「${credential.name}」？该操作不可撤销。'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: const Text('取消'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(dialogContext).pop(true),
                style: FilledButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
                child: const Text('删除'),
              ),
            ],
          );
        },
      );
      if (confirmed != true) {
        return;
      }
      await runCredentialMutation(credential.id, () async {
        await ossNotifier.deleteCredential(credentialId: credential.id);
        return '已删除凭证「${credential.name}」';
      });
    }

    Future<void> createPolicy() async {
      if (creatingPolicy.value) {
        return;
      }
      final formKey = GlobalKey<FormState>();
      final nameController = TextEditingController();
      final descriptionController = TextEditingController();
      final appliesToController = TextEditingController();
      var status = oss.AdminOssPolicyStatus.enabled;
      try {
        final result =
            await showDialog<
              ({
                String name,
                String description,
                String appliesTo,
                oss.AdminOssPolicyStatus status,
              })
            >(
              context: context,
              builder: (dialogContext) {
                return AlertDialog(
                  title: const Text('新增安全策略'),
                  content: StatefulBuilder(
                    builder: (context, setStateBuilder) {
                      return SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  labelText: '策略名称',
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return '请输入策略名称';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: appliesToController,
                                decoration: const InputDecoration(
                                  labelText: '适用范围',
                                  helperText: '例如：student_uploads',
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return '请输入适用范围标识';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: descriptionController,
                                decoration: const InputDecoration(
                                  labelText: '描述',
                                  helperText: '可选，说明策略用途',
                                ),
                                maxLines: 3,
                              ),
                              const SizedBox(height: 12),
                              DropdownButtonFormField<oss.AdminOssPolicyStatus>(
                                initialValue: status,
                                decoration: const InputDecoration(
                                  labelText: '策略状态',
                                ),
                                items: oss.AdminOssPolicyStatus.values
                                    .map(
                                      (value) => DropdownMenuItem(
                                        value: value,
                                        child: Text(value.label),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    setStateBuilder(() {
                                      status = value;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      child: const Text('取消'),
                    ),
                    FilledButton(
                      onPressed: () {
                        if (!(formKey.currentState?.validate() ?? false)) {
                          return;
                        }
                        Navigator.of(dialogContext).pop((
                          name: nameController.text.trim(),
                          description: descriptionController.text.trim(),
                          appliesTo: appliesToController.text.trim(),
                          status: status,
                        ));
                      },
                      child: const Text('创建'),
                    ),
                  ],
                );
              },
            );
        if (result == null) {
          return;
        }
        creatingPolicy.value = true;
        final created = await ossNotifier.createPolicy(
          name: result.name,
          description: result.description,
          appliesTo: result.appliesTo,
          status: result.status,
        );
        showSnack('已创建策略「${created.name}」');
      } on Object catch (error) {
        showSnack('创建策略失败：${errorMessage(error)}');
      } finally {
        creatingPolicy.value = false;
        nameController.dispose();
        descriptionController.dispose();
        appliesToController.dispose();
      }
    }

    Future<void> confirmDeletePolicy(oss.AdminOssPolicy policy) async {
      if (isPolicyBusy(policy.id)) {
        return;
      }
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('删除策略'),
            content: Text('确认删除「${policy.name}」策略？该操作不可恢复。'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: const Text('取消'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(dialogContext).pop(true),
                style: FilledButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
                child: const Text('删除'),
              ),
            ],
          );
        },
      );
      if (confirmed != true) {
        return;
      }
      await runPolicyMutation(policy.id, () async {
        await ossNotifier.deletePolicy(policyId: policy.id);
        return '已删除策略「${policy.name}」';
      });
    }

    Future<void> loadMoreAudits() async {
      if (auditBusy.value) {
        return;
      }
      final hasMore =
          ref.read(adminOssProvider).valueOrNull?.hasMoreAuditLogs ?? false;
      if (!hasMore) {
        return;
      }
      auditBusy.value = true;
      try {
        await ossNotifier.loadMoreAuditLogs();
      } on Object catch (error) {
        showSnack('加载审计记录失败：${errorMessage(error)}');
      } finally {
        auditBusy.value = false;
      }
    }

    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ossState.when(
        data: (data) {
          final credentials = data.credentials;
          final policies = data.policies;
          final logs = data.auditLogs;
          final hasMoreLogs = data.hasMoreAuditLogs;
          return RefreshIndicator(
            onRefresh: () => ossNotifier.refresh(),
            child: ListView(
              padding: const EdgeInsets.all(16),
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Row(
                  children: [
                    Text(
                      'OSS 设置',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Spacer(),
                    IconButton(
                      tooltip: '刷新',
                      onPressed: () {
                        unawaited(ossNotifier.refresh());
                      },
                      icon: const Icon(Icons.refresh_outlined),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _AccountSectionCard(
                  icon: Icons.vpn_key_outlined,
                  title: '访问凭证',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: FilledButton.icon(
                          onPressed: creatingCredential.value
                              ? null
                              : createCredential,
                          icon: creatingCredential.value
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.add_circle_outline),
                          label: Text(
                            creatingCredential.value ? '创建中…' : '新增凭证',
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      if (credentials.isEmpty)
                        const _EmptyPlaceholder(
                          title: '暂无凭证',
                          description: '尚未配置 OSS 访问凭证，无法上传教学资料。',
                        ),
                      for (final credential in credentials)
                        _OssCredentialTile(
                          credential: credential,
                          isMutating: isCredentialBusy(credential.id),
                          onCopyKey: () => copyCredential(credential),
                          onToggleActive: (value) =>
                              runCredentialMutation(credential.id, () async {
                                await ossNotifier.updateCredential(
                                  credentialId: credential.id,
                                  active: value,
                                );
                                return value ? '凭证已启用' : '凭证已停用';
                              }),
                          onToggleRelayUpload: (value) =>
                              runCredentialMutation(credential.id, () async {
                                await ossNotifier.updateCredential(
                                  credentialId: credential.id,
                                  useRelayUpload: value,
                                );
                                return value
                                    ? '已启用服务端中继上传（仅主凭证生效）'
                                    : '已关闭服务端中继上传';
                              }),
                          onTogglePublicRead: (value) =>
                              runCredentialMutation(credential.id, () async {
                                await ossNotifier.updateCredential(
                                  credentialId: credential.id,
                                  allowPublicRead: value,
                                );
                                return value ? '已允许公开只读访问' : '已关闭公开只读访问';
                              }),
                          onToggleMultipart: (value) =>
                              runCredentialMutation(credential.id, () async {
                                await ossNotifier.updateCredential(
                                  credentialId: credential.id,
                                  allowMultipartUpload: value,
                                );
                                return value ? '已开启分片上传' : '已关闭分片上传';
                              }),
                          onSetPrimary: credential.isPrimary
                              ? null
                              : () => runCredentialMutation(
                                  credential.id,
                                  () async {
                                    await ossNotifier.updateCredential(
                                      credentialId: credential.id,
                                      isPrimary: true,
                                      active: true,
                                    );
                                    return '已设为主凭证，并保持启用状态';
                                  },
                                ),
                          onEdit: () async {
                            final formKey = GlobalKey<FormState>();
                            final nameController = TextEditingController(
                              text: credential.name,
                            );
                            final endpointController = TextEditingController(
                              text: credential.endpoint,
                            );
                            final internalEndpointController =
                                TextEditingController(
                                  text: credential.internalEndpoint,
                                );
                            final regionController = TextEditingController(
                              text: credential.region,
                            );
                            final bucketController = TextEditingController(
                              text: credential.bucket,
                            );
                            final prefixController = TextEditingController(
                              text: credential.directoryPrefix,
                            );
                            final accessKeyIdController =
                                TextEditingController();
                            final accessKeySecretController =
                                TextEditingController();
                            final accessKeyController = TextEditingController(
                              text: credential.accessKeyMasked,
                            );
                            try {
                              final result =
                                  await showDialog<
                                    ({
                                      String name,
                                      String endpoint,
                                      String internalEndpoint,
                                      String region,
                                      String bucket,
                                      String directoryPrefix,
                                      String accessKeyId,
                                      String accessKeySecret,
                                      String accessKeyMasked,
                                    })
                                  >(
                                    context: context,
                                    builder: (dialogContext) {
                                      return AlertDialog(
                                        title: Text('编辑 ${credential.name}'),
                                        content: SingleChildScrollView(
                                          child: Form(
                                            key: formKey,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextFormField(
                                                  controller: nameController,
                                                  decoration:
                                                      const InputDecoration(
                                                        labelText: '名称',
                                                        helperText:
                                                            '仅用于管理端展示，建议包含用途说明',
                                                      ),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.trim().isEmpty) {
                                                      return '名称不能为空';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                const SizedBox(height: 12),
                                                TextFormField(
                                                  controller:
                                                      endpointController,
                                                  decoration: const InputDecoration(
                                                    labelText: 'Endpoint',
                                                    helperText:
                                                        '例如：oss-cn-hangzhou.aliyuncs.com',
                                                  ),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.trim().isEmpty) {
                                                      return 'Endpoint 不能为空';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                const SizedBox(height: 12),
                                                TextFormField(
                                                  controller:
                                                      internalEndpointController,
                                                  decoration: const InputDecoration(
                                                    labelText:
                                                        'Internal Endpoint（可选）',
                                                    helperText:
                                                        '用于服务端上传加速（内网），下载仍使用公网 Endpoint',
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                TextFormField(
                                                  controller: regionController,
                                                  decoration:
                                                      const InputDecoration(
                                                        labelText: '区域',
                                                        helperText: '例如：华东 1',
                                                      ),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.trim().isEmpty) {
                                                      return '区域不能为空';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                const SizedBox(height: 12),
                                                TextFormField(
                                                  controller: bucketController,
                                                  decoration:
                                                      const InputDecoration(
                                                        labelText: 'Bucket',
                                                        helperText:
                                                            '例如：learn-go-prod',
                                                      ),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.trim().isEmpty) {
                                                      return 'Bucket 不能为空';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                const SizedBox(height: 12),
                                                TextFormField(
                                                  controller: prefixController,
                                                  decoration: const InputDecoration(
                                                    labelText: '目录前缀',
                                                    helperText:
                                                        '可留空，示例：prod/ 或 teacher/',
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                TextFormField(
                                                  controller:
                                                      accessKeyController,
                                                  decoration: const InputDecoration(
                                                    labelText: '访问凭证标识',
                                                    helperText:
                                                        '仅展示已有凭证掩码，例如：LTAI****',
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                TextFormField(
                                                  controller:
                                                      accessKeyIdController,
                                                  decoration:
                                                      const InputDecoration(
                                                        labelText:
                                                            'AccessKey ID（可选）',
                                                        helperText: '留空则不更新',
                                                      ),
                                                ),
                                                const SizedBox(height: 12),
                                                TextFormField(
                                                  controller:
                                                      accessKeySecretController,
                                                  decoration:
                                                      const InputDecoration(
                                                        labelText:
                                                            'AccessKey Secret（可选）',
                                                        helperText: '留空则不更新',
                                                      ),
                                                  obscureText: true,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.of(
                                              dialogContext,
                                            ).pop(),
                                            child: const Text('取消'),
                                          ),
                                          FilledButton(
                                            onPressed: () {
                                              if (!(formKey.currentState
                                                      ?.validate() ??
                                                  false)) {
                                                return;
                                              }
                                              Navigator.of(dialogContext).pop((
                                                name: nameController.text
                                                    .trim(),
                                                endpoint: endpointController
                                                    .text
                                                    .trim(),
                                                internalEndpoint:
                                                    internalEndpointController
                                                        .text
                                                        .trim(),
                                                region: regionController.text
                                                    .trim(),
                                                bucket: bucketController.text
                                                    .trim(),
                                                directoryPrefix:
                                                    prefixController.text
                                                        .trim(),
                                                accessKeyId:
                                                    accessKeyIdController.text
                                                        .trim(),
                                                accessKeySecret:
                                                    accessKeySecretController
                                                        .text
                                                        .trim(),
                                                accessKeyMasked:
                                                    accessKeyController.text
                                                        .trim(),
                                              ));
                                            },
                                            child: const Text('保存'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                              if (result == null) {
                                return;
                              }
                              await runCredentialMutation(
                                credential.id,
                                () async {
                                  final updated = await ossNotifier
                                      .updateCredential(
                                        credentialId: credential.id,
                                        name: result.name,
                                        endpoint: result.endpoint,
                                        internalEndpoint:
                                            result.internalEndpoint,
                                        region: result.region,
                                        bucket: result.bucket,
                                        directoryPrefix: result.directoryPrefix,
                                        accessKeyId: result.accessKeyId.isEmpty
                                            ? null
                                            : result.accessKeyId,
                                        accessKeySecret:
                                            result.accessKeySecret.isEmpty
                                            ? null
                                            : result.accessKeySecret,
                                        accessKeyDisplay:
                                            result.accessKeyMasked.isEmpty
                                            ? null
                                            : result.accessKeyMasked,
                                      );
                                  return '已更新 ${updated.name} 的访问信息';
                                },
                              );
                            } finally {
                              nameController.dispose();
                              endpointController.dispose();
                              internalEndpointController.dispose();
                              regionController.dispose();
                              bucketController.dispose();
                              prefixController.dispose();
                              accessKeyIdController.dispose();
                              accessKeySecretController.dispose();
                              accessKeyController.dispose();
                            }
                          },
                          onDelete: credential.isPrimary
                              ? null
                              : () => confirmDeleteCredential(credential),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                _AccountSectionCard(
                  icon: Icons.rule_folder_outlined,
                  title: '安全策略',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: FilledButton.icon(
                          onPressed: creatingPolicy.value ? null : createPolicy,
                          icon: creatingPolicy.value
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.add_task_outlined),
                          label: Text(creatingPolicy.value ? '创建中…' : '新增策略'),
                        ),
                      ),
                      const SizedBox(height: 12),
                      if (policies.isEmpty)
                        const _EmptyPlaceholder(
                          title: '暂无安全策略',
                          description: '建议为不同业务配置合适的策略，以保障文件访问安全。',
                        ),
                      for (final policy in policies)
                        _OssPolicyTile(
                          policy: policy,
                          isMutating: isPolicyBusy(policy.id),
                          onStatusChanged: isPolicyBusy(policy.id)
                              ? null
                              : (status) =>
                                    runPolicyMutation(policy.id, () async {
                                      final updated = await ossNotifier
                                          .updatePolicyStatus(
                                            policyId: policy.id,
                                            status: status,
                                          );
                                      return '已更新 ${updated.name} 策略状态';
                                    }),
                          onDelete: () => confirmDeletePolicy(policy),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                _AccountSectionCard(
                  icon: Icons.event_note_outlined,
                  title: '审计记录',
                  child: logs.isEmpty
                      ? const _EmptyPlaceholder(
                          title: '暂无审计',
                          description: '当发生凭证或策略变更时，会在此记录操作轨迹。',
                        )
                      : Column(
                          children: [
                            for (final log in logs) _OssAuditTile(log: log),
                            const SizedBox(height: 8),
                            if (hasMoreLogs)
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton.icon(
                                  onPressed: auditBusy.value
                                      ? null
                                      : loadMoreAudits,
                                  icon: auditBusy.value
                                      ? const SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : const Icon(Icons.unfold_more_outlined),
                                  label: Text(
                                    auditBusy.value ? '加载中…' : '加载更多记录',
                                  ),
                                ),
                              )
                            else
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    '已加载全部记录',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                          ],
                        ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _ErrorPlaceholder(
          message: errorMessage(error),
          onRetry: () {
            unawaited(ossNotifier.refresh());
          },
        ),
      ),
    );
  }
}

class AdminSystemSettingsPage extends HookConsumerWidget {
  const AdminSystemSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final systemState = ref.watch(adminSystemSettingsProvider);
    final notifier = ref.read(adminSystemSettingsProvider.notifier);
    final switchBusy = useState<String?>(null);
    final parameterBusy = useState<String?>(null);
    final broadcastBusy = useState<String?>(null);

    void showSnack(String message) {
      if (!context.mounted) {
        return;
      }
      final messenger = ScaffoldMessenger.of(context);
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(
        SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
      );
    }

    String formatError(Object error) {
      if (error is AppException) {
        return error.message;
      }
      if (error is StateError) {
        return error.message;
      }
      return error.toString();
    }

    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: systemState.when(
        data: (data) {
          final switches = data.switches;
          final parameters = data.parameters;
          final broadcasts = data.broadcasts;
          final audits = data.auditLogs;

          Future<void> toggleSystemSwitch(
            system.AdminSystemSwitch item,
            bool value,
          ) async {
            if (switchBusy.value == item.id) {
              return;
            }
            switchBusy.value = item.id;
            try {
              await notifier.setSwitchEnabled(
                switchId: item.id,
                enabled: value,
              );
              showSnack(value ? '已启用「${item.title}」' : '已停用「${item.title}」');
            } catch (error) {
              showSnack('操作失败：${formatError(error)}');
            } finally {
              switchBusy.value = null;
            }
          }

          Future<void> editParameter(
            system.AdminSystemParameter parameter,
          ) async {
            if (parameter.locked) {
              showSnack('参数 ${parameter.key} 已锁定，无法修改');
              return;
            }
            final controller = TextEditingController(text: parameter.value);
            final result = await showDialog<String>(
              context: context,
              builder: (dialogContext) {
                return AlertDialog(
                  title: Text('编辑 ${parameter.key}'),
                  content: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: '新的参数值',
                      helperText: parameter.description,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      child: const Text('取消'),
                    ),
                    FilledButton(
                      onPressed: () => Navigator.of(
                        dialogContext,
                      ).pop(controller.text.trim()),
                      child: const Text('保存'),
                    ),
                  ],
                );
              },
            );
            final normalized = result?.trim();
            if (normalized == null || normalized.isEmpty) {
              return;
            }
            if (normalized == parameter.value) {
              showSnack('参数 ${parameter.key} 未发生变化');
              return;
            }
            parameterBusy.value = parameter.id;
            try {
              await notifier.updateParameterValue(
                parameterId: parameter.id,
                value: normalized,
              );
              showSnack('参数 ${parameter.key} 已更新');
            } catch (error) {
              showSnack('操作失败：${formatError(error)}');
            } finally {
              parameterBusy.value = null;
            }
          }

          Future<void> toggleBroadcastPinned(
            system.AdminSystemBroadcast item,
          ) async {
            if (broadcastBusy.value == item.id) {
              return;
            }
            broadcastBusy.value = item.id;
            try {
              await notifier.updateBroadcast(
                broadcastId: item.id,
                pinned: !item.pinned,
              );
              showSnack(
                !item.pinned ? '已置顶「${item.title}」' : '已取消置顶「${item.title}」',
              );
            } catch (error) {
              showSnack('操作失败：${formatError(error)}');
            } finally {
              broadcastBusy.value = null;
            }
          }

          Future<void> updateBroadcastStatus(
            system.AdminSystemBroadcast item,
            system.AdminSystemBroadcastStatus status,
          ) async {
            if (broadcastBusy.value == item.id) {
              return;
            }
            broadcastBusy.value = item.id;
            try {
              await notifier.updateBroadcast(
                broadcastId: item.id,
                status: status,
              );
              showSnack('已更新公告「${item.title}」状态');
            } catch (error) {
              showSnack('操作失败：${formatError(error)}');
            } finally {
              broadcastBusy.value = null;
            }
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('系统设置', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              _AccountSectionCard(
                icon: Icons.toggle_on_outlined,
                title: '系统开关',
                child: Column(
                  children: [
                    for (final item in switches)
                      _SystemSwitchTile(
                        item: item,
                        isBusy: switchBusy.value == item.id,
                        onToggle: (value) =>
                            unawaited(toggleSystemSwitch(item, value)),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _AccountSectionCard(
                icon: Icons.settings_applications_outlined,
                title: '平台参数',
                child: Column(
                  children: [
                    for (final parameter in parameters)
                      _SystemParameterTile(
                        item: parameter,
                        isBusy: parameterBusy.value == parameter.id,
                        onEdit: () => unawaited(editParameter(parameter)),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _AccountSectionCard(
                icon: Icons.campaign_outlined,
                title: '通知广播',
                child: Column(
                  children: [
                    for (final broadcast in broadcasts)
                      _SystemBroadcastTile(
                        item: broadcast,
                        isBusy: broadcastBusy.value == broadcast.id,
                        onTogglePinned: () =>
                            unawaited(toggleBroadcastPinned(broadcast)),
                        onStatusChanged: (status) =>
                            unawaited(updateBroadcastStatus(broadcast, status)),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _AccountSectionCard(
                icon: Icons.rule_outlined,
                title: '审计记录',
                child: Column(
                  children: [
                    for (final audit in audits) _SystemAuditTile(item: audit),
                    if (audits.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: _EmptyPlaceholder(
                          title: '暂无审计记录',
                          description: '所有系统操作都会记录在此处，便于追踪。',
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _ErrorPlaceholder(
          message: formatError(error),
          onRetry: () {
            unawaited(notifier.refresh());
          },
        ),
      ),
    );
  }
}

// -------------------- Helpers & small widgets --------------------

class _FilterNotice extends StatelessWidget {
  const _FilterNotice({required this.text, this.hasBottomPadding = true});

  final String text;
  final bool hasBottomPadding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: hasBottomPadding ? 8 : 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, size: 18, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: theme.textTheme.bodySmall)),
        ],
      ),
    );
  }
}

class _FilterNoticeGroup extends StatelessWidget {
  const _FilterNoticeGroup({required this.notices});

  final List<String> notices;

  @override
  Widget build(BuildContext context) {
    if (notices.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < notices.length; i++)
          _FilterNotice(
            text: notices[i],
            hasBottomPadding: i < notices.length - 1,
          ),
      ],
    );
  }
}

enum _QuickCheckSeverity { success, info, warning }

class _QuickCheckItem {
  const _QuickCheckItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.severity,
  });

  final IconData icon;
  final String title;
  final String description;
  final _QuickCheckSeverity severity;
}

class _QuickCheckList extends StatelessWidget {
  const _QuickCheckList({required this.items});

  final List<_QuickCheckItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const _EmptyPlaceholder(
        title: '暂无提醒',
        description: '当前没有需要处理的事项。',
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < items.length; i++) ...[
          _QuickCheckRow(item: items[i]),
          if (i < items.length - 1) const Divider(height: 16),
        ],
      ],
    );
  }
}

class _QuickCheckRow extends StatelessWidget {
  const _QuickCheckRow({required this.item});

  final _QuickCheckItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color tone = switch (item.severity) {
      _QuickCheckSeverity.success => theme.colorScheme.primary,
      _QuickCheckSeverity.info => theme.colorScheme.tertiary,
      _QuickCheckSeverity.warning => theme.colorScheme.error,
    };
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(item.icon, color: tone),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: theme.textTheme.titleSmall?.copyWith(color: tone),
              ),
              const SizedBox(height: 4),
              Text(item.description, style: theme.textTheme.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}

class _AdminStatsCard extends StatelessWidget {
  const _AdminStatsCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String value;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      // Theme handles shape and color
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 16),
            Text(
              value,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant.withValues(
                  alpha: 0.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountSectionCard extends StatelessWidget {
  const _AccountSectionCard({
    required this.icon,
    required this.title,
    required this.child,
  });

  final IconData icon;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(title, style: theme.textTheme.titleMedium),
                ),
              ],
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class _EmptyPlaceholder extends StatelessWidget {
  const _EmptyPlaceholder({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inbox_outlined, size: 48, color: Colors.grey.shade400),
            const SizedBox(height: 12),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 6),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorPlaceholder extends StatelessWidget {
  const _ErrorPlaceholder({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 8),
            Text('加载失败', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 6),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('重试'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DepartmentExpansion extends StatelessWidget {
  const _DepartmentExpansion({
    super.key,
    required this.node,
    required this.query,
    required this.canManage,
    required this.initiallyExpanded,
    required this.highlighted,
    required this.onExpansionChanged,
    required this.onRenameDepartment,
    required this.onDeleteDepartment,
    required this.onRenameClass,
    required this.onDeleteClass,
    required this.onAssignStudent,
  });

  final DepartmentNode node;
  final String query;
  final bool canManage;
  final bool initiallyExpanded;
  final bool highlighted;
  final ValueChanged<bool> onExpansionChanged;
  final Future<void> Function(DepartmentNode) onRenameDepartment;
  final Future<void> Function(DepartmentNode) onDeleteDepartment;
  final Future<void> Function(DepartmentNode, ClassInfo) onRenameClass;
  final Future<void> Function(DepartmentNode, ClassInfo) onDeleteClass;
  final Future<void> Function(DepartmentNode, ClassInfo) onAssignStudent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final departmentTitleStyle = theme.textTheme.titleMedium;
    final departmentHighlightStyle = departmentTitleStyle?.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.w600,
    );
    final classTitleStyle = theme.textTheme.bodyLarge;
    final classHighlightStyle = classTitleStyle?.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.w600,
    );
    final classSubtitleStyle = theme.textTheme.bodySmall;
    final classSubtitleHighlightStyle = classSubtitleStyle?.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.w600,
    );
    final normalized = query.trim().toLowerCase();
    final departmentMatches = normalized.isEmpty
        ? true
        : node.department.name.toLowerCase().contains(normalized);
    final filteredClasses = normalized.isEmpty
        ? node.classes
        : node.classes.where((clazz) {
            final grade = clazz.grade?.toLowerCase() ?? '';
            final description = clazz.description?.toLowerCase() ?? '';
            return clazz.name.toLowerCase().contains(normalized) ||
                grade.contains(normalized) ||
                description.contains(normalized);
          }).toList();

    final shouldExpandForQuery =
        normalized.isNotEmpty &&
        (departmentMatches || filteredClasses.isNotEmpty);
    final expanded = shouldExpandForQuery ? true : initiallyExpanded;

    final children = filteredClasses.isEmpty
        ? <Widget>[
            ListTile(
              title: Text(
                node.classes.isEmpty
                    ? '暂无班级'
                    : (departmentMatches ? '无匹配的班级' : '无匹配的结果'),
              ),
            ),
          ]
        : filteredClasses
              .map(
                (clazz) => ListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  contentPadding: const EdgeInsets.only(left: 56, right: 16),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ClassDetailPage(
                          department: node.department,
                          classInfo: clazz,
                        ),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.class_outlined,
                    size: 18,
                    color: theme.colorScheme.onSurfaceVariant.withValues(
                      alpha: 0.7,
                    ),
                  ),
                  title: Text.rich(
                    TextSpan(
                      children: _buildHighlightedSpans(
                        clazz.name,
                        normalized,
                        classTitleStyle,
                        classHighlightStyle,
                      ),
                    ),
                    style: classTitleStyle,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: _buildClassSubtitleSpans(
                        clazz,
                        normalized,
                        classSubtitleStyle,
                        classSubtitleHighlightStyle,
                      ),
                    ),
                    style: classSubtitleStyle,
                  ),
                  trailing: PopupMenuButton<String>(
                    tooltip: '管理班级',
                    enabled: canManage,
                    onSelected: (value) {
                      switch (value) {
                        case 'rename':
                          unawaited(onRenameClass(node, clazz));
                          break;
                        case 'assign':
                          unawaited(onAssignStudent(node, clazz));
                          break;
                        case 'delete':
                          unawaited(onDeleteClass(node, clazz));
                          break;
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem<String>(
                        value: 'rename',
                        child: Text('重命名班级'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'assign',
                        child: Text('分配学生'),
                      ),
                      PopupMenuItem<String>(
                        value: 'delete',
                        child: Text(
                          '删除班级',
                          style: TextStyle(color: theme.colorScheme.error),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList();

    final highlightColor = theme.colorScheme.secondaryContainer.withValues(
      alpha: highlighted ? 0.5 : 0.0,
    );
    final surfaceColor = theme.colorScheme.surface;
    final borderRadius = BorderRadius.circular(12);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: highlighted ? highlightColor : surfaceColor,
        borderRadius: borderRadius,
        border: highlighted
            ? Border.all(color: theme.colorScheme.secondary, width: 1.2)
            : null,
        boxShadow: highlighted
            ? [
                BoxShadow(
                  color: theme.colorScheme.secondary.withValues(alpha: 0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        clipBehavior: Clip.antiAlias,
        child: ExpansionTile(
          key: PageStorageKey(node.department.id),
          initiallyExpanded: expanded,
          onExpansionChanged: onExpansionChanged,
          shape: const Border(),
          collapsedShape: const Border(),
          tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          childrenPadding: const EdgeInsets.only(bottom: 8),
          leading: Icon(
            Icons.apartment_outlined,
            color: theme.colorScheme.primary,
          ),
          title: Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: _buildHighlightedSpans(
                      node.department.name,
                      normalized,
                      departmentTitleStyle,
                      departmentHighlightStyle,
                    ),
                  ),
                  style: departmentTitleStyle,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${node.classes.length} 班 · ${node.department.teacherCount} 师 · ${node.department.studentCount} 生',
                  style: theme.textTheme.labelSmall,
                ),
              ),
              const SizedBox(width: 8),
              PopupMenuButton<String>(
                tooltip: '管理院系',
                enabled: canManage,
                onSelected: (value) {
                  switch (value) {
                    case 'rename':
                      unawaited(onRenameDepartment(node));
                      break;
                    case 'delete':
                      unawaited(onDeleteDepartment(node));
                      break;
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem<String>(
                    value: 'rename',
                    child: Text('重命名院系'),
                  ),
                  PopupMenuItem<String>(
                    value: 'delete',
                    enabled: node.classes.isEmpty,
                    child: Text(
                      node.classes.isEmpty ? '删除院系' : '删除院系（需先清空班级）',
                      style: TextStyle(
                        color: node.classes.isEmpty
                            ? theme.colorScheme.error
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          children: children,
        ),
      ),
    );
  }
}

List<InlineSpan> _buildHighlightedSpans(
  String text,
  String query,
  TextStyle? baseStyle,
  TextStyle? highlightStyle,
) {
  if (query.isEmpty) {
    return [TextSpan(text: text, style: baseStyle)];
  }
  final lowerText = text.toLowerCase();
  final lowerQuery = query.toLowerCase();
  final matchIndex = lowerText.indexOf(lowerQuery);
  if (matchIndex == -1) {
    return [TextSpan(text: text, style: baseStyle)];
  }

  final spans = <InlineSpan>[];
  var start = 0;
  final queryLength = query.length;
  while (start < text.length) {
    final index = lowerText.indexOf(lowerQuery, start);
    if (index < 0) {
      spans.add(TextSpan(text: text.substring(start), style: baseStyle));
      break;
    }
    if (index > start) {
      spans.add(TextSpan(text: text.substring(start, index), style: baseStyle));
    }
    final matchText = text.substring(index, index + queryLength);
    spans.add(
      TextSpan(
        text: matchText,
        style:
            highlightStyle ??
            (baseStyle ?? const TextStyle()).merge(
              const TextStyle(fontWeight: FontWeight.w600),
            ),
      ),
    );
    start = index + queryLength;
  }
  return spans;
}

List<InlineSpan> _buildClassSubtitleSpans(
  ClassInfo clazz,
  String query,
  TextStyle? baseStyle,
  TextStyle? highlightStyle,
) {
  final spans = <InlineSpan>[];

  void addSeparatorIfNeeded() {
    if (spans.isNotEmpty) {
      spans.add(TextSpan(text: ' · ', style: baseStyle));
    }
  }

  final grade = clazz.grade;
  if (grade != null && grade.isNotEmpty) {
    addSeparatorIfNeeded();
    spans.addAll(
      _buildHighlightedSpans('年级：$grade', query, baseStyle, highlightStyle),
    );
  }

  final description = clazz.description;
  if (description != null && description.isNotEmpty) {
    addSeparatorIfNeeded();
    spans.addAll(
      _buildHighlightedSpans(description, query, baseStyle, highlightStyle),
    );
  }

  addSeparatorIfNeeded();
  spans.add(
    TextSpan(
      text: '${clazz.teacherCount} 师 · ${clazz.studentCount} 生',
      style: baseStyle,
    ),
  );

  return spans;
}

class _AccountTile extends StatelessWidget {
  const _AccountTile({required this.account, required this.onOpenDetails});
  final AdminAccount account;
  final VoidCallback onOpenDetails;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final roleColor = account.role.chipColor(theme);
    final roleForeground = account.role.chipForegroundColor(theme);
    void showSnack(String message) {
      final messenger = ScaffoldMessenger.maybeOf(context);
      if (messenger == null) {
        return;
      }
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
        );
    }

    Future<void> handleAction(_AccountTileAction action) async {
      switch (action) {
        case _AccountTileAction.viewDetails:
          onOpenDetails();
          return;
        case _AccountTileAction.copyIdentifier:
          HapticFeedback.selectionClick();
          await Clipboard.setData(ClipboardData(text: account.identifier));
          showSnack('账号 ID 已复制：${account.identifier}');
          return;
        case _AccountTileAction.copyEmail:
          if (account.email.isEmpty) {
            return;
          }
          HapticFeedback.selectionClick();
          await Clipboard.setData(ClipboardData(text: account.email));
          showSnack('邮箱地址已复制：${account.email}');
          return;
        case _AccountTileAction.copyPhone:
          final phone = account.phone?.trim();
          if (phone == null || phone.isEmpty) {
            return;
          }
          HapticFeedback.selectionClick();
          await Clipboard.setData(ClipboardData(text: phone));
          showSnack('联系电话已复制：$phone');
          return;
      }
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onOpenDetails,
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: theme.colorScheme.outlineVariant),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Icon(
                  account.role.icon,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            account.name,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        Chip(
                          label: Text(account.role.label),
                          avatar: Icon(
                            account.role.icon,
                            size: 16,
                            color: roleForeground,
                          ),
                          side: BorderSide(
                            color: roleColor.withValues(alpha: 0.6),
                          ),
                          backgroundColor: roleColor.withValues(alpha: 0.48),
                          labelStyle: theme.textTheme.bodySmall?.copyWith(
                            color: roleForeground,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Chip(
                          label: Text(account.statusLabel),
                          side: BorderSide(
                            color: account
                                .statusColor(theme)
                                .withValues(alpha: 0.4),
                          ),
                          backgroundColor: account
                              .statusColor(theme)
                              .withValues(alpha: 0.16),
                          labelStyle: theme.textTheme.bodySmall?.copyWith(
                            color: account.statusColor(theme),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(account.email.isEmpty ? '未提供邮箱' : account.email),
                    const SizedBox(height: 4),
                    Text(
                      '账号：${account.identifier}',
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    if (account.structureLabel.isNotEmpty) ...[
                      Text(
                        '所属：${account.structureLabel}',
                        style: theme.textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                    ],
                    Text(
                      '最近活跃：${account.lastActiveLabel}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    if (account.phone != null && account.phone!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        '联系电话：${account.phone}',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ],
                ),
              ),
              PopupMenuButton<_AccountTileAction>(
                tooltip: '更多操作',
                onSelected: (action) {
                  unawaited(handleAction(action));
                },
                itemBuilder: (menuContext) {
                  final items = <PopupMenuEntry<_AccountTileAction>>[
                    PopupMenuItem<_AccountTileAction>(
                      value: _AccountTileAction.viewDetails,
                      child: Row(
                        children: const [
                          Icon(Icons.visibility_outlined, size: 20),
                          SizedBox(width: 12),
                          Text('查看详情'),
                        ],
                      ),
                    ),
                    PopupMenuItem<_AccountTileAction>(
                      value: _AccountTileAction.copyIdentifier,
                      child: Row(
                        children: const [
                          Icon(Icons.badge_outlined, size: 20),
                          SizedBox(width: 12),
                          Text('复制账号 ID'),
                        ],
                      ),
                    ),
                  ];
                  if (account.email.isNotEmpty) {
                    items.add(
                      PopupMenuItem<_AccountTileAction>(
                        value: _AccountTileAction.copyEmail,
                        child: Row(
                          children: const [
                            Icon(Icons.email_outlined, size: 20),
                            SizedBox(width: 12),
                            Text('复制邮箱'),
                          ],
                        ),
                      ),
                    );
                  }
                  final phone = account.phone?.trim();
                  if (phone != null && phone.isNotEmpty) {
                    items.add(
                      PopupMenuItem<_AccountTileAction>(
                        value: _AccountTileAction.copyPhone,
                        child: Row(
                          children: const [
                            Icon(Icons.phone_outlined, size: 20),
                            SizedBox(width: 12),
                            Text('复制电话'),
                          ],
                        ),
                      ),
                    );
                  }
                  return items;
                },
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _AccountTileAction { viewDetails, copyIdentifier, copyEmail, copyPhone }

class _AccountDetailSheet extends HookConsumerWidget {
  const _AccountDetailSheet({
    required this.account,
    required this.onAccountUpdated,
    required this.onAccountRemoved,
  });

  final AdminAccount account;
  final ValueChanged<AdminAccount> onAccountUpdated;
  final ValueChanged<String> onAccountRemoved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentAccount = useState(account);
    final loadingAction = useState<_AccountActionType?>(null);

    void showSnack(String message, {bool error = false}) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: error
              ? theme.colorScheme.error
              : theme.colorScheme.inverseSurface,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }

    Future<bool> confirmAction(_AccountSheetAction action) async {
      if (action.confirmationMessage == null) {
        return true;
      }
      if (!context.mounted) {
        return false;
      }
      final confirmLabel = action.confirmationConfirmLabel ?? '确认';
      final title = action.destructive ? '请谨慎操作' : '确认操作';
      final result = await showDialog<bool>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: Text(title),
            content: Text(action.confirmationMessage!),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: const Text('取消'),
              ),
              FilledButton(
                // style: action.destructive
                //     ? FilledButton.styleFrom(
                //         backgroundColor: theme.colorScheme.error,
                //         foregroundColor: theme.colorScheme.onError,
                //       )
                //     : null,
                onPressed: () => Navigator.of(dialogContext).pop(true),
                child: Text(confirmLabel),
              ),
            ],
          );
        },
      );
      return result ?? false;
    }

    Future<void> handleAction(_AccountSheetAction action) async {
      if (loadingAction.value != null) {
        return;
      }
      if (!await confirmAction(action)) {
        return;
      }
      final authState = ref.read(authStateProvider);
      final schoolId = authState.account?.schoolId ?? '';
      if (schoolId.isEmpty) {
        showSnack('缺少学校信息，请重新登录后再试。', error: true);
        return;
      }
      final repository = ref.read(adminRepositoryProvider);
      loadingAction.value = action.type;
      try {
        switch (action.type) {
          case _AccountActionType.resetPassword:
            await repository.resetAccountPassword(
              schoolId: schoolId,
              accountId: currentAccount.value.id,
            );
            final updated = currentAccount.value.copyWith(
              status: AdminAccountStatus.passwordResetRequired,
            );
            currentAccount.value = updated;
            onAccountUpdated(updated);
            showSnack('已发送密码重置指引');
            break;
          case _AccountActionType.lock:
            await repository.lockAccount(
              schoolId: schoolId,
              accountId: currentAccount.value.id,
            );
            final updated = currentAccount.value.copyWith(
              status: AdminAccountStatus.locked,
            );
            currentAccount.value = updated;
            onAccountUpdated(updated);
            showSnack('账号已锁定');
            break;
          case _AccountActionType.unlock:
            await repository.unlockAccount(
              schoolId: schoolId,
              accountId: currentAccount.value.id,
            );
            final updated = currentAccount.value.copyWith(
              status: AdminAccountStatus.active,
            );
            currentAccount.value = updated;
            onAccountUpdated(updated);
            showSnack('账号已恢复正常');
            break;
          case _AccountActionType.delete:
            await repository.deleteAccount(
              schoolId: schoolId,
              accountId: currentAccount.value.id,
            );
            onAccountRemoved(currentAccount.value.id);
            showSnack('账号已移除');
            if (context.mounted) {
              Navigator.of(context).pop();
            }
            return;
        }
      } on AppException catch (error) {
        showSnack(error.message, error: true);
      } catch (error) {
        showSnack(error.toString(), error: true);
      } finally {
        if (context.mounted) {
          loadingAction.value = null;
        }
      }
    }

    final accountValue = currentAccount.value;
    final statusColor = accountValue.statusColor(theme);
    final createdAtLabel = DateFormat(
      'yyyy-MM-dd HH:mm',
    ).format(accountValue.createdAt.toLocal());

    final actions = <_AccountSheetAction>[
      const _AccountSheetAction(
        label: '重置密码',
        type: _AccountActionType.resetPassword,
        icon: Icons.lock_reset_outlined,
        confirmationMessage: '确定向该账号发送密码重置指引吗？',
        confirmationConfirmLabel: '发送',
      ),
      if (accountValue.status == AdminAccountStatus.locked)
        const _AccountSheetAction(
          label: '解除锁定',
          type: _AccountActionType.unlock,
          icon: Icons.lock_open_outlined,
          confirmationMessage: '确认解除账号锁定并允许其重新登录吗？',
          confirmationConfirmLabel: '解除锁定',
        )
      else
        const _AccountSheetAction(
          label: '锁定账号',
          type: _AccountActionType.lock,
          icon: Icons.lock_outline,
          confirmationMessage: '锁定后账号将无法登录，确定继续吗？',
          confirmationConfirmLabel: '锁定',
        ),
      const _AccountSheetAction(
        label: '移除账号',
        type: _AccountActionType.delete,
        icon: Icons.person_remove_outlined,
        destructive: true,
        confirmationMessage: '账号删除后不可恢复，确定永久删除该账号吗？',
        confirmationConfirmLabel: '删除',
      ),
    ];

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 12,
          bottom: MediaQuery.of(context).viewPadding.bottom + 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: theme.colorScheme.primaryContainer,
                    child: Icon(
                      accountValue.role.icon,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          accountValue.name,
                          style: theme.textTheme.titleLarge,
                        ),
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: [
                            Chip(
                              label: Text(accountValue.role.label),
                              side: BorderSide.none,
                              backgroundColor: theme
                                  .colorScheme
                                  .surfaceContainerHighest
                                  .withValues(alpha: 0.35),
                            ),
                            Chip(
                              label: Text(accountValue.statusLabel),
                              side: BorderSide(color: statusColor),
                              labelStyle: theme.textTheme.bodySmall?.copyWith(
                                color: statusColor,
                              ),
                              backgroundColor: statusColor.withValues(
                                alpha: 0.12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _AccountInfoTile(
                icon: Icons.badge_outlined,
                label: '账号 ID',
                value: accountValue.id,
                onCopy: () =>
                    _copyTextToClipboard(context, '账号 ID', accountValue.id),
              ),
              _AccountInfoTile(
                icon: Icons.alternate_email_outlined,
                label: '登录账号',
                value: accountValue.identifier,
                onCopy: () => _copyTextToClipboard(
                  context,
                  '登录账号',
                  accountValue.identifier,
                ),
              ),
              _AccountInfoTile(
                icon: Icons.email_outlined,
                label: '邮箱地址',
                value: accountValue.email,
                onCopy: () =>
                    _copyTextToClipboard(context, '邮箱地址', accountValue.email),
              ),
              _AccountInfoTile(
                icon: Icons.phone_outlined,
                label: '联系电话',
                value: accountValue.phone ?? '',
                onCopy:
                    accountValue.phone == null || accountValue.phone!.isEmpty
                    ? null
                    : () => _copyTextToClipboard(
                        context,
                        '联系电话',
                        accountValue.phone!,
                      ),
              ),
              _AccountInfoTile(
                icon: Icons.account_tree_outlined,
                label: '所属结构',
                value: accountValue.structureLabel,
              ),
              _AccountInfoTile(
                icon: Icons.lock_clock_outlined,
                label: '最近活跃',
                value: accountValue.lastActiveLabel,
              ),
              _AccountInfoTile(
                icon: Icons.calendar_month_outlined,
                label: '创建时间',
                value: createdAtLabel,
              ),
              const SizedBox(height: 20),
              Text('操作', style: theme.textTheme.titleMedium),
              const SizedBox(height: 12),
              Row(
                spacing: 12,
                children: [
                  for (final action in actions)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: OutlinedButton.icon(
                        icon: loadingAction.value == action.type
                            ? SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation(
                                    action.destructive
                                        ? theme.colorScheme.error
                                        : theme.colorScheme.primary,
                                  ),
                                ),
                              )
                            : Icon(
                                action.icon,
                                color: action.destructive
                                    ? theme.colorScheme.error
                                    : null,
                              ),
                        label: Text(action.label),
                        style: action.destructive
                            ? OutlinedButton.styleFrom(
                                foregroundColor: theme.colorScheme.error,
                              )
                            : null,
                        onPressed: loadingAction.value == action.type
                            ? null
                            : () => handleAction(action),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _AccountActionType { resetPassword, lock, unlock, delete }

class _AccountSheetAction {
  const _AccountSheetAction({
    required this.label,
    required this.type,
    required this.icon,
    this.destructive = false,
    this.confirmationMessage,
    this.confirmationConfirmLabel,
  });

  final String label;
  final _AccountActionType type;
  final IconData icon;
  final bool destructive;
  final String? confirmationMessage;
  final String? confirmationConfirmLabel;
}

class _AccountInfoTile extends StatelessWidget {
  const _AccountInfoTile({
    required this.icon,
    required this.label,
    required this.value,
    this.onCopy,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onCopy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayValue = value.isEmpty ? '—' : value;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: theme.colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: theme.textTheme.labelSmall),
                const SizedBox(height: 4),
                SelectableText(displayValue),
              ],
            ),
          ),
          if (onCopy != null && value.isNotEmpty)
            IconButton(
              tooltip: '复制$label',
              icon: const Icon(Icons.copy, size: 18),
              onPressed: onCopy,
            ),
        ],
      ),
    );
  }
}

void _copyTextToClipboard(BuildContext context, String label, String value) {
  if (value.isEmpty) {
    return;
  }
  Clipboard.setData(ClipboardData(text: value));
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text('$label已复制')));
}

class _AccountMetrics {
  const _AccountMetrics({
    required this.total,
    required this.teachers,
    required this.students,
    required this.locked,
    required this.pendingReset,
    required this.recentActive,
  });

  factory _AccountMetrics.fromAccounts(List<AdminAccount> accounts) {
    var teachers = 0;
    var students = 0;
    var locked = 0;
    var pendingReset = 0;
    var recentActive = 0;
    final cutoff = DateTime.now().subtract(_kRecentActiveWindow);

    for (final account in accounts) {
      switch (account.role) {
        case AdminAccountRole.teacher:
          teachers++;
        case AdminAccountRole.student:
          students++;
      }
      if (account.status == AdminAccountStatus.locked) {
        locked++;
      }
      if (account.status == AdminAccountStatus.passwordResetRequired) {
        pendingReset++;
      }
      final lastActive = account.lastActiveAt ?? account.createdAt;
      if (lastActive.isAfter(cutoff)) {
        recentActive++;
      }
    }

    return _AccountMetrics(
      total: accounts.length,
      teachers: teachers,
      students: students,
      locked: locked,
      pendingReset: pendingReset,
      recentActive: recentActive,
    );
  }

  final int total;
  final int teachers;
  final int students;
  final int locked;
  final int pendingReset;
  final int recentActive;

  int get inactive => (total - recentActive).clamp(0, total);

  double get recentActiveShare {
    if (total == 0) {
      return 0;
    }
    return recentActive / total;
  }

  Map<AdminAccountRole, int> get roleDistribution => {
    AdminAccountRole.teacher: teachers,
    AdminAccountRole.student: students,
  };
}

class _AccountMetricsGrid extends StatelessWidget {
  const _AccountMetricsGrid({required this.metrics});

  final _AccountMetrics metrics;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percentFormatter = NumberFormat.percentPattern('zh_CN');
    final activeShareLabel = metrics.total == 0
        ? '—'
        : percentFormatter.format(metrics.recentActiveShare);
    final cards = <Widget>[
      _AccountMetricCard(
        icon: Icons.people_alt_outlined,
        label: '账号数量',
        value: metrics.total.toString(),
        color: theme.colorScheme.primary,
      ),
      _AccountMetricCard(
        icon: Icons.bolt_outlined,
        label: '近7天活跃',
        value: metrics.recentActive.toString(),
        subtitle: '占比 $activeShareLabel',
        color: theme.colorScheme.primary,
      ),
      _AccountMetricCard(
        icon: Icons.co_present_outlined,
        label: '教师账号',
        value: metrics.teachers.toString(),
        color: theme.colorScheme.primary,
      ),
      _AccountMetricCard(
        icon: Icons.school_outlined,
        label: '学生账号',
        value: metrics.students.toString(),
        color: theme.colorScheme.secondary,
      ),
      _AccountMetricCard(
        icon: Icons.lock_outlined,
        label: '已锁定',
        value: metrics.locked.toString(),
        color: theme.colorScheme.error,
      ),
      _AccountMetricCard(
        icon: Icons.refresh_outlined,
        label: '待重置密码',
        value: metrics.pendingReset.toString(),
        color: theme.colorScheme.tertiary,
      ),
    ];

    return Wrap(spacing: 12, runSpacing: 12, children: cards);
  }
}

class _AccountMetricCard extends StatelessWidget {
  const _AccountMetricCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    this.subtitle,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      constraints: const BoxConstraints(minWidth: 160),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.35,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: theme.textTheme.titleLarge?.copyWith(color: color),
              ),
              Text(label, style: theme.textTheme.bodySmall),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.textTheme.bodySmall?.color?.withValues(
                      alpha: 0.7,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AccountInsightsPanel extends StatelessWidget {
  const _AccountInsightsPanel({required this.metrics, required this.accounts});

  final _AccountMetrics metrics;
  final List<AdminAccount> accounts;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cutoff = DateTime.now().subtract(_kRecentActiveWindow);
    final recentActive =
        accounts.where((account) {
          final lastActive = account.lastActiveAt ?? account.createdAt;
          return lastActive.isAfter(cutoff);
        }).toList()..sort((a, b) {
          final aTime = a.lastActiveAt ?? a.createdAt;
          final bTime = b.lastActiveAt ?? b.createdAt;
          return bTime.compareTo(aTime);
        });

    final highlighted = recentActive.take(4).toList();
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 640;
        final left = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('活跃洞察', style: theme.textTheme.titleMedium),
            Text(
              '统计窗口：近${_kRecentActiveWindow.inDays}天',
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 12),
            if (highlighted.isEmpty)
              Text(
                '最近暂无活跃账号',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.textTheme.bodyMedium?.color?.withValues(
                    alpha: 0.7,
                  ),
                ),
              )
            else
              Column(
                children: [
                  for (var i = 0; i < highlighted.length; i++)
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: i == highlighted.length - 1 ? 0 : 8,
                      ),
                      child: _RecentActiveAccountRow(
                        rank: i + 1,
                        account: highlighted[i],
                      ),
                    ),
                ],
              ),
            const SizedBox(height: 12),
            Text('未活跃账号：${metrics.inactive}', style: theme.textTheme.bodySmall),
          ],
        );

        final right = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('角色分布', style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            _RoleDistributionPieChart(metrics: metrics),
          ],
        );

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: left),
                    const SizedBox(width: 24),
                    Expanded(child: right),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [left, const SizedBox(height: 24), right],
                ),
        );
      },
    );
  }
}

class _RecentActiveAccountRow extends StatelessWidget {
  const _RecentActiveAccountRow({required this.rank, required this.account});

  final int rank;
  final AdminAccount account;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final roleColor = account.role.chipColor(theme);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: roleColor.withValues(alpha: 0.2),
            foregroundColor: roleColor,
            child: Text(rank.toString()),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(account.name, style: theme.textTheme.titleSmall),
                const SizedBox(height: 4),
                Text(
                  account.structureLabel,
                  style: theme.textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(account.role.label, style: theme.textTheme.bodySmall),
              Text(
                account.lastActiveLabel,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.textTheme.bodySmall?.color?.withValues(
                    alpha: 0.7,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RoleDistributionPieChart extends StatelessWidget {
  const _RoleDistributionPieChart({required this.metrics});

  final _AccountMetrics metrics;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final distribution = metrics.roleDistribution;
    final total = distribution.values.fold<int>(
      0,
      (prev, value) => prev + value,
    );
    final entries = distribution.entries
        .where((entry) => entry.value > 0)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 180,
          child: total == 0
              ? Center(child: Text('暂无数据', style: theme.textTheme.bodyMedium))
              : CustomPaint(
                  painter: _PieChartPainter(
                    entries.map((entry) {
                      final color = entry.key.chipColor(theme);
                      final fraction = entry.value / total;
                      return _PieSlice(
                        color: color,
                        fraction: fraction.toDouble(),
                      );
                    }).toList(),
                  ),
                ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            for (final entry in distribution.entries)
              _RoleDistributionLegendItem(
                label: entry.key.label,
                count: entry.value,
                color: entry.key.chipColor(theme),
              ),
          ],
        ),
      ],
    );
  }
}

class _RoleDistributionLegendItem extends StatelessWidget {
  const _RoleDistributionLegendItem({
    required this.label,
    required this.count,
    required this.color,
  });

  final String label;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 6),
        Text('$label：$count', style: theme.textTheme.bodySmall),
      ],
    );
  }
}

class _PieSlice {
  const _PieSlice({required this.color, required this.fraction});

  final Color color;
  final double fraction;
}

class _PieChartPainter extends CustomPainter {
  const _PieChartPainter(this.slices);

  final List<_PieSlice> slices;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = math.min(size.width, size.height) / 2;
    final rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: radius,
    );
    var startAngle = -math.pi / 2;

    if (slices.isEmpty) {
      final paint = Paint()
        ..color = Colors.grey.withValues(alpha: 0.2)
        ..style = PaintingStyle.fill;
      canvas.drawArc(rect, 0, 2 * math.pi, true, paint);
      return;
    }

    for (final slice in slices) {
      final sweep = 2 * math.pi * slice.fraction;
      final paint = Paint()
        ..color = slice.color
        ..style = PaintingStyle.fill;
      canvas.drawArc(rect, startAngle, sweep, true, paint);
      startAngle += sweep;
    }
  }

  @override
  bool shouldRepaint(covariant _PieChartPainter oldDelegate) {
    return oldDelegate.slices != slices;
  }
}

enum _AccountRoleFilter { all, teachers, students }

const String _kAllDepartments = '__all_departments__';
const String _kNoDepartment = '__no_department__';
const String _kAllClasses = '__all_classes__';
const String _kNoClass = '__no_class__';

String _accountRoleFilterLabel(_AccountRoleFilter f) {
  return switch (f) {
    _AccountRoleFilter.all => '全部账号',
    _AccountRoleFilter.teachers => '教师',
    _AccountRoleFilter.students => '学生',
  };
}

enum _AccountStatusFilter { all, active, locked, pendingReset }

String _accountStatusFilterLabel(_AccountStatusFilter f) {
  return switch (f) {
    _AccountStatusFilter.all => '全部状态',
    _AccountStatusFilter.active => '正常',
    _AccountStatusFilter.locked => '已锁定',
    _AccountStatusFilter.pendingReset => '待重置密码',
  };
}

enum _AccountSortOption { nameAsc, lastActiveDesc, createdDesc }

String _accountSortOptionLabel(_AccountSortOption option) {
  return switch (option) {
    _AccountSortOption.nameAsc => '按姓名',
    _AccountSortOption.lastActiveDesc => '最近活跃',
    _AccountSortOption.createdDesc => '最新创建',
  };
}

class _AccountListHeader extends StatelessWidget {
  const _AccountListHeader({
    required this.currentSort,
    required this.onSortChanged,
  });

  final _AccountSortOption currentSort;
  final ValueChanged<_AccountSortOption> onSortChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: _AccountHeaderSortButton(
              label: '姓名 / 账号',
              icon: Icons.sort_by_alpha,
              active: currentSort == _AccountSortOption.nameAsc,
              onTap: () => onSortChanged(_AccountSortOption.nameAsc),
              alignment: Alignment.centerLeft,
              trend: _SortTrend.ascending,
            ),
          ),
          Expanded(
            child: _AccountHeaderSortButton(
              label: '最近活跃',
              icon: Icons.bolt_outlined,
              active: currentSort == _AccountSortOption.lastActiveDesc,
              onTap: () => onSortChanged(_AccountSortOption.lastActiveDesc),
              alignment: Alignment.center,
              trend: _SortTrend.descending,
            ),
          ),
          Expanded(
            child: _AccountHeaderSortButton(
              label: '创建时间',
              icon: Icons.schedule_outlined,
              active: currentSort == _AccountSortOption.createdDesc,
              onTap: () => onSortChanged(_AccountSortOption.createdDesc),
              alignment: Alignment.centerRight,
              trend: _SortTrend.descending,
            ),
          ),
        ],
      ),
    );
  }
}

enum _SortTrend { ascending, descending }

class _AccountHeaderSortButton extends StatelessWidget {
  const _AccountHeaderSortButton({
    required this.label,
    required this.icon,
    required this.active,
    required this.onTap,
    required this.trend,
    this.alignment = Alignment.center,
  });

  final String label;
  final IconData icon;
  final bool active;
  final VoidCallback onTap;
  final Alignment alignment;
  final _SortTrend trend;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = active
        ? theme.colorScheme.primary
        : theme.textTheme.bodyMedium?.color;
    final iconData = active
        ? (trend == _SortTrend.ascending ? Icons.north_east : Icons.south_east)
        : Icons.unfold_more;

    return Align(
      alignment: alignment,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 4),
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: color,
                  fontWeight: active ? FontWeight.w600 : null,
                ),
              ),
              const SizedBox(width: 4),
              Icon(iconData, size: 16, color: color),
            ],
          ),
        ),
      ),
    );
  }
}

int _compareAccounts(
  AdminAccount a,
  AdminAccount b,
  _AccountSortOption option,
) {
  int compareByName() {
    final nameOrder = a.name.compareTo(b.name);
    if (nameOrder != 0) {
      return nameOrder;
    }
    return a.identifier.compareTo(b.identifier);
  }

  switch (option) {
    case _AccountSortOption.nameAsc:
      return compareByName();
    case _AccountSortOption.lastActiveDesc:
      final aTime = a.lastActiveAt ?? a.createdAt;
      final bTime = b.lastActiveAt ?? b.createdAt;
      final activityOrder = bTime.compareTo(aTime);
      if (activityOrder != 0) {
        return activityOrder;
      }
      return compareByName();
    case _AccountSortOption.createdDesc:
      final createdOrder = b.createdAt.compareTo(a.createdAt);
      if (createdOrder != 0) {
        return createdOrder;
      }
      return compareByName();
  }
}

String _escapeCsvField(String value) {
  if (value.isEmpty) {
    return '';
  }
  final needsEscaping =
      value.contains(',') ||
      value.contains('\n') ||
      value.contains('\r') ||
      value.contains('"');
  if (!needsEscaping) {
    return value;
  }
  final escaped = value.replaceAll('"', '""');
  return '"$escaped"';
}

class _OssCredentialTile extends StatelessWidget {
  const _OssCredentialTile({
    required this.credential,
    required this.isMutating,
    this.onCopyKey,
    this.onToggleActive,
    this.onToggleRelayUpload,
    this.onTogglePublicRead,
    this.onToggleMultipart,
    this.onSetPrimary,
    this.onEdit,
    this.onDelete,
  });

  final oss.AdminOssCredential credential;
  final bool isMutating;
  final VoidCallback? onCopyKey;
  final ValueChanged<bool>? onToggleActive;
  final ValueChanged<bool>? onToggleRelayUpload;
  final ValueChanged<bool>? onTogglePublicRead;
  final ValueChanged<bool>? onToggleMultipart;
  final VoidCallback? onSetPrimary;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = credential.statusColor(theme);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(credential.name, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(
                      '${credential.region} · ${credential.bucket}',
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '目录前缀：${credential.directoryPrefix.isEmpty ? '-' : credential.directoryPrefix}',
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        Chip(
                          label: Text(credential.statusLabel),
                          side: BorderSide(
                            color: statusColor.withValues(alpha: 0.3),
                          ),
                          labelStyle: theme.textTheme.bodySmall?.copyWith(
                            color: statusColor,
                          ),
                          backgroundColor: statusColor.withValues(alpha: 0.12),
                        ),
                        if (credential.isPrimary)
                          Chip(
                            label: const Text('主凭证'),
                            backgroundColor: theme.colorScheme.primary,
                            labelStyle: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Switch.adaptive(
                    value: credential.active,
                    onChanged: isMutating ? null : onToggleActive,
                  ),
                  Text(
                    credential.lastRotatedLabel,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                  if (isMutating) ...[
                    const SizedBox(height: 4),
                    const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2.0),
                    ),
                  ],
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              OutlinedButton.icon(
                icon: const Icon(Icons.edit_outlined),
                label: const Text('编辑信息'),
                onPressed: isMutating ? null : onEdit,
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.key_outlined),
                label: const Text('复制访问信息'),
                onPressed: onCopyKey,
              ),
              if (!credential.isPrimary)
                OutlinedButton.icon(
                  icon: const Icon(Icons.star_outline),
                  label: const Text('设为主凭证'),
                  onPressed: isMutating ? null : onSetPrimary,
                ),
              if (onDelete != null)
                TextButton.icon(
                  icon: const Icon(Icons.delete_outline),
                  label: const Text('删除'),
                  onPressed: isMutating ? null : onDelete,
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.error,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            title: const Text('允许公开只读访问'),
            subtitle: const Text('开启后可直接对外共享只读资源'),
            value: credential.allowPublicRead,
            onChanged: isMutating ? null : onTogglePublicRead,
          ),
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            title: const Text('服务端中继上传'),
            subtitle: const Text('开启后上传将由服务端中转到 OSS（仅主凭证生效）'),
            value: credential.useRelayUpload,
            onChanged: isMutating ? null : onToggleRelayUpload,
          ),
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            title: const Text('允许分片上传'),
            subtitle: const Text('适用于大文件或断点续传场景'),
            value: credential.allowMultipartUpload,
            onChanged: isMutating ? null : onToggleMultipart,
          ),
        ],
      ),
    );
  }
}

class _OssPolicyTile extends StatelessWidget {
  const _OssPolicyTile({
    required this.policy,
    required this.isMutating,
    this.onStatusChanged,
    this.onDelete,
  });

  final oss.AdminOssPolicy policy;
  final bool isMutating;
  final ValueChanged<oss.AdminOssPolicyStatus>? onStatusChanged;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = policy.status.color(theme);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(policy.name, style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(policy.description, style: theme.textTheme.bodySmall),
          const SizedBox(height: 12),
          Row(
            children: [
              DropdownButton<oss.AdminOssPolicyStatus>(
                value: policy.status,
                onChanged: isMutating
                    ? null
                    : (value) {
                        if (value != null) {
                          onStatusChanged?.call(value);
                        }
                      },
                items: oss.AdminOssPolicyStatus.values
                    .map(
                      (status) => DropdownMenuItem<oss.AdminOssPolicyStatus>(
                        value: status,
                        child: Text(status.label),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(width: 12),
              Chip(
                label: Text(policy.status.label),
                backgroundColor: statusColor.withValues(alpha: 0.12),
                labelStyle: theme.textTheme.bodySmall?.copyWith(
                  color: statusColor,
                ),
              ),
              if (isMutating) ...[
                const SizedBox(width: 12),
                const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2.0),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              Chip(
                avatar: const Icon(Icons.inventory_2_outlined, size: 16),
                label: Text(policy.appliesTo),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            policy.lastUpdatedLabel,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
          if (onDelete != null) ...[
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: isMutating ? null : onDelete,
                icon: const Icon(Icons.delete_outline),
                label: const Text('删除策略'),
                style: TextButton.styleFrom(
                  foregroundColor: theme.colorScheme.error,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _OssAuditTile extends StatelessWidget {
  const _OssAuditTile({required this.log});
  final oss.AdminOssAuditLog log;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final detail = log.detail.trim();
    final hasDetail = detail.isNotEmpty;
    return ListTile(
      leading: Icon(Icons.history_toggle_off, color: theme.colorScheme.primary),
      title: Text(log.action),
      subtitle: Text(
        hasDetail
            ? '${log.operator} · ${log.timeLabel}\n$detail'
            : '${log.operator} · ${log.timeLabel}',
      ),
      isThreeLine: hasDetail,
      dense: true,
    );
  }
}

class _SystemSwitchTile extends StatelessWidget {
  const _SystemSwitchTile({
    required this.item,
    required this.onToggle,
    this.isBusy = false,
  });

  final system.AdminSystemSwitch item;
  final ValueChanged<bool> onToggle;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: theme.textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(item.description, style: theme.textTheme.bodySmall),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    Chip(
                      label: Text(item.environment),
                      avatar: const Icon(Icons.cloud_outlined, size: 16),
                    ),
                    for (final tag in item.tags)
                      Chip(
                        label: Text(tag),
                        backgroundColor:
                            theme.colorScheme.surfaceContainerHighest,
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  item.lastUpdatedLabel,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: isBusy ? 0.4 : 1,
                child: Switch.adaptive(
                  value: item.enabled,
                  onChanged: isBusy ? null : onToggle,
                ),
              ),
              if (isBusy)
                const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SystemParameterTile extends StatelessWidget {
  const _SystemParameterTile({
    required this.item,
    required this.onEdit,
    this.isBusy = false,
  });

  final system.AdminSystemParameter item;
  final VoidCallback onEdit;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(item.key, style: theme.textTheme.titleMedium),
              ),
              if (isBusy)
                const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              else
                IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  tooltip: item.locked ? '参数已锁定' : '编辑参数',
                  onPressed: item.locked ? null : onEdit,
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text('当前值：${item.value}', style: theme.textTheme.bodySmall),
          const SizedBox(height: 4),
          Text('作用域：${item.scope}', style: theme.textTheme.bodySmall),
          const SizedBox(height: 4),
          Text(
            item.lastUpdatedLabel,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
          if (item.locked) ...[
            const SizedBox(height: 6),
            Chip(
              label: const Text('已锁定'),
              avatar: const Icon(Icons.lock_outline, size: 16),
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
            ),
          ],
        ],
      ),
    );
  }
}

class _SystemBroadcastTile extends StatelessWidget {
  const _SystemBroadcastTile({
    required this.item,
    required this.onTogglePinned,
    required this.onStatusChanged,
    this.isBusy = false,
  });

  final system.AdminSystemBroadcast item;
  final VoidCallback onTogglePinned;
  final ValueChanged<system.AdminSystemBroadcastStatus> onStatusChanged;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = item.status.color(theme);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(item.messagePreview, style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  item.pinned ? Icons.push_pin : Icons.push_pin_outlined,
                ),
                tooltip: item.pinned ? '取消置顶' : '置顶公告',
                onPressed: isBusy ? null : onTogglePinned,
              ),
              if (isBusy)
                const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              Chip(
                label: Text(item.status.label),
                backgroundColor: statusColor.withValues(alpha: 0.12),
                labelStyle: theme.textTheme.bodySmall?.copyWith(
                  color: statusColor,
                ),
              ),
              Chip(
                label: Text(item.targetLabel),
                avatar: const Icon(Icons.group_outlined, size: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              DropdownButton<system.AdminSystemBroadcastStatus>(
                value: item.status,
                onChanged: isBusy
                    ? null
                    : (value) {
                        if (value != null) {
                          onStatusChanged(value);
                        }
                      },
                items: system.AdminSystemBroadcastStatus.values
                    .map(
                      (status) =>
                          DropdownMenuItem<system.AdminSystemBroadcastStatus>(
                            value: status,
                            child: Text(status.label),
                          ),
                    )
                    .toList(),
              ),
              const SizedBox(width: 12),
              Text(
                item.scheduleLabel,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text('创建人：${item.createdBy}', style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _SystemAuditTile extends StatelessWidget {
  const _SystemAuditTile({required this.item});
  final system.AdminSystemAuditLog item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.action),
      subtitle: Text('${item.category} · ${item.operator}'),
    );
  }
}

class _CreateAccountDialog extends HookConsumerWidget {
  const _CreateAccountDialog();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = useState(AdminAccountRole.student);
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final numberController = useTextEditingController();
    final emailController = useTextEditingController();
    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController(text: '123456');
    final isSubmitting = useState(false);

    final authState = ref.watch(authStateProvider);
    final schoolId = authState.account?.schoolId ?? '';

    final departmentTreeAsync = ref.watch(adminDepartmentTreeProvider);
    final departmentNodes =
        departmentTreeAsync.asData?.value ?? const <DepartmentNode>[];

    final allClasses = <ClassInfo>[];
    for (final node in departmentNodes) {
      allClasses.addAll(node.classes);
    }

    Future<void> submit() async {
      if (!formKey.currentState!.validate()) {
        return;
      }

      isSubmitting.value = true;
      try {
        final repository = ref.read(adminRepositoryProvider);
        if (role.value == AdminAccountRole.teacher) {
          await repository.createTeacher(
            schoolId: schoolId,
            number: numberController.text.trim(),
            name: nameController.text.trim(),
            email: emailController.text.trim(),
            phone: phoneController.text.trim().isEmpty
                ? null
                : phoneController.text.trim(),
            defaultPassword: passwordController.text,
          );
        } else {
          await repository.createStudent(
            schoolId: schoolId,
            number: numberController.text.trim(),
            name: nameController.text.trim(),
            email: emailController.text.trim(),
            phone: phoneController.text.trim().isEmpty
                ? null
                : phoneController.text.trim(),
            classId: null,
            defaultPassword: passwordController.text,
          );
        }
        if (context.mounted) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('账号创建成功')));
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('创建失败: $e')));
        }
      } finally {
        isSubmitting.value = false;
      }
    }

    return AlertDialog(
      title: const Text('添加账号'),
      content: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<AdminAccountRole>(
                  initialValue: role.value,
                  decoration: const InputDecoration(labelText: '角色'),
                  items: const [
                    DropdownMenuItem(
                      value: AdminAccountRole.student,
                      child: Text('学生'),
                    ),
                    DropdownMenuItem(
                      value: AdminAccountRole.teacher,
                      child: Text('教师'),
                    ),
                  ],
                  onChanged: (v) {
                    if (v != null) role.value = v;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: '姓名'),
                  validator: (v) => v?.trim().isEmpty == true ? '请输入姓名' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: numberController,
                  decoration: const InputDecoration(labelText: '学号/工号'),
                  validator: (v) =>
                      v?.trim().isEmpty == true ? '请输入学号/工号' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: '邮箱'),
                  validator: (v) => v?.trim().isEmpty == true ? '请输入邮箱' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: '手机号 (可选)'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: '默认密码'),
                  validator: (v) => v?.isEmpty == true ? '请输入默认密码' : null,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('取消'),
        ),
        FilledButton(
          onPressed: isSubmitting.value ? null : submit,
          child: Text(isSubmitting.value ? '提交中...' : '提交'),
        ),
      ],
    );
  }
}

enum _BatchStep { input, preview, result }

class _AIBatchDialog extends HookConsumerWidget {
  const _AIBatchDialog();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final instructionController = useTextEditingController();
    final isLoading = useState(false);
    final step = useState<_BatchStep>(_BatchStep.input);
    final operations = useState<List<AIOperation>>([]);
    final results = useState<List<String>>([]);
    final analysis = useState<String?>(null);
    final error = useState<String?>(null);
    final schoolId = ref.watch(authStateProvider).account?.schoolId ?? '';

    Future<void> analyze() async {
      if (instructionController.text.trim().isEmpty) return;

      isLoading.value = true;
      error.value = null;

      try {
        final res = await ref
            .read(adminRepositoryProvider)
            .analyzeBatchOperation(
              schoolId: schoolId,
              instruction: instructionController.text,
            );
        operations.value = res.operations;
        analysis.value = res.analysis;
        step.value = _BatchStep.preview;
      } catch (e) {
        error.value = e.toString();
      } finally {
        isLoading.value = false;
      }
    }

    Future<void> execute() async {
      isLoading.value = true;
      error.value = null;

      try {
        final res = await ref
            .read(adminRepositoryProvider)
            .executeBatchOperations(
              schoolId: schoolId,
              operations: operations.value,
            );
        results.value = res;
        step.value = _BatchStep.result;
      } catch (e) {
        error.value = e.toString();
      } finally {
        isLoading.value = false;
      }
    }

    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('AI 批量操作', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 16),
              if (step.value == _BatchStep.input) ...[
                Text(
                  '请输入自然语言指令，例如："创建两个学生账号，张三和李四，密码都是123456"',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: instructionController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '在此输入指令...',
                  ),
                ),
              ],
              if (step.value == _BatchStep.preview) ...[
                Text(
                  '即将执行的操作 (${operations.value.length})',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).dividerColor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: operations.value.length,
                      separatorBuilder: (context, index) =>
                          const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final op = operations.value[index];
                        String title;
                        String subtitle;
                        IconData icon;
                        Color? iconColor;

                        switch (op.action) {
                          case 'create_student':
                            title = '创建学生账号';
                            icon = Icons.person_add_outlined;
                            iconColor = Colors.blue;
                            final name = op.data['name'] ?? '未知';
                            final number = op.data['number'] ?? '自动生成';
                            final pwd = op.data['password'] ?? '默认';
                            subtitle = '姓名: $name, 学号: $number, 密码: $pwd';
                            break;
                          case 'create_teacher':
                            title = '创建教师账号';
                            icon = Icons.school_outlined;
                            iconColor = Colors.orange;
                            final name = op.data['name'] ?? '未知';
                            final number = op.data['number'] ?? '自动生成';
                            final pwd = op.data['password'] ?? '默认';
                            subtitle = '姓名: $name, 工号: $number, 密码: $pwd';
                            break;
                          case 'lock_account':
                            title = '锁定账号';
                            icon = Icons.lock_outline;
                            iconColor = Colors.red;
                            final number = op.data['number'] ?? '未知';
                            subtitle = '账号: $number';
                            break;
                          case 'unlock_account':
                            title = '解锁账号';
                            icon = Icons.lock_open_outlined;
                            iconColor = Colors.green;
                            final number = op.data['number'] ?? '未知';
                            subtitle = '账号: $number';
                            break;
                          default:
                            title = '未知操作: ${op.action}';
                            icon = Icons.help_outline;
                            subtitle = op.data.toString();
                        }

                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: iconColor?.withValues(alpha: 0.1),
                            child: Icon(icon, color: iconColor, size: 20),
                          ),
                          title: Text(title),
                          subtitle: Text(subtitle),
                          dense: true,
                        );
                      },
                    ),
                  ),
                ),
              ],
              if (step.value == _BatchStep.result) ...[
                const Text('执行结果：'),
                const SizedBox(height: 8),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).dividerColor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: results.value.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          title: Text(results.value[index]),
                        );
                      },
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 16),
              if (error.value != null)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Theme.of(context).colorScheme.errorContainer,
                  child: Text(
                    error.value!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (step.value == _BatchStep.preview)
                    TextButton(
                      onPressed: () {
                        step.value = _BatchStep.input;
                        error.value = null;
                      },
                      child: const Text('返回修改'),
                    ),
                  if (step.value != _BatchStep.preview)
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).pop(results.value.isNotEmpty),
                      child: const Text('关闭'),
                    ),
                  const SizedBox(width: 12),
                  if (step.value == _BatchStep.input)
                    FilledButton.icon(
                      onPressed: isLoading.value ? null : analyze,
                      icon: isLoading.value
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.analytics),
                      label: const Text('分析'),
                    ),
                  if (step.value == _BatchStep.preview)
                    FilledButton.icon(
                      onPressed: isLoading.value ? null : execute,
                      icon: isLoading.value
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.check),
                      label: const Text('确认执行'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
