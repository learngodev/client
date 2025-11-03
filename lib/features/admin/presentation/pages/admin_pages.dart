import 'dart:async';
import 'dart:convert';

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
import '../../domain/sample_data.dart' as admin_data;

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

    return tree.when(
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
              child: OutlinedButton.icon(
                icon: const Icon(Icons.refresh),
                label: const Text('刷新院系数据'),
                onPressed: () async {
                  try {
                    await notifier.refresh();
                    if (context.mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('院系数据已刷新')));
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
      error: (e, _) => _ErrorPlaceholder(message: e.toString(), onRetry: () {}),
    );
  }
}

class AdminAccountsPage extends HookConsumerWidget {
  const AdminAccountsPage({super.key});

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
        '$schoolId|${selectedRole?.apiValue ?? 'all'}|${selectedStatus?.apiValue ?? 'all'}|${department.value}|${classFilter.value}|${debouncedQuery.value}';
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
    final invitesState = useState<List<admin_data.AdminAccountInvite>>(
      admin_data.adminAccountInvites.map((invite) => invite).toList(),
    );
    final invites = invitesState.value;
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
        loading: () {},
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

    final metrics = _AccountMetrics.fromAccounts(filtered);
    final hasActiveFilters =
        role.value != _AccountRoleFilter.all ||
        statusFilter.value != _AccountStatusFilter.all ||
        department.value != _kAllDepartments ||
        classFilter.value != _kAllClasses ||
        debouncedQuery.value.isNotEmpty;

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
        final _ = await ref.refresh(
          adminAccountListProvider(refreshRequest).future,
        );
      } catch (_) {
        // 错误由 accountsState 的 error 分支统一处理。
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

    void showInviteSnack(String message, {bool error = false}) {
      if (!context.mounted) {
        return;
      }
      final messenger = ScaffoldMessenger.of(context);
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          backgroundColor: error ? Theme.of(context).colorScheme.error : null,
        ),
      );
    }

    Future<void> copyInviteLink(admin_data.AdminAccountInvite invite) async {
      await Clipboard.setData(ClipboardData(text: invite.invitationUrl));
      showInviteSnack('邀请链接已复制，可直接发送给 ${invite.email}');
    }

    Future<void> resendInvite(admin_data.AdminAccountInvite invite) async {
      showInviteSnack('已重新发送邀请邮件至 ${invite.email}');
    }

    Future<void> revokeInvite(admin_data.AdminAccountInvite invite) async {
      if (!context.mounted) {
        return;
      }
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('撤销邀请'),
            content: Text('确认要撤销发给 ${invite.email} 的邀请吗？'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: const Text('取消'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(dialogContext).pop(true),
                child: const Text('确认撤销'),
              ),
            ],
          );
        },
      );
      if (confirmed != true) {
        return;
      }
      invitesState.value = [
        for (final existing in invitesState.value)
          if (existing.id != invite.id) existing,
      ];
      showInviteSnack('已撤销邀请');
    }

    return RefreshIndicator(
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
                if (hasActiveFilters) ...[
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      if (role.value != _AccountRoleFilter.all)
                        FilterChip(
                          label: Text(
                            '角色：${_accountRoleFilterLabel(role.value)}',
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
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.unfold_more),
                      label: Text(isLoadingMore.value ? '加载中…' : '加载更多'),
                    ),
                  ),
              ],
            ),
          ),
          if (invites.isNotEmpty) ...[
            const SizedBox(height: 16),
            _AccountSectionCard(
              icon: Icons.mark_email_unread_outlined,
              title: '待处理邀请',
              child: Column(
                children: [
                  for (final invite in invites)
                    _AccountInviteTile(
                      invite: invite,
                      onCopyLink: () => copyInviteLink(invite),
                      onResend: () => resendInvite(invite),
                      onRevoke: () => revokeInvite(invite),
                    ),
                ],
              ),
            ),
          ],
        ],
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
        ref
            .read(adminExpandedDepartmentsProvider.notifier)
            .pruneToIds(data.map((node) => node.department.id));
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
                            child: Text('${dept.name}（${dept.id}）'),
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

    return filteredTree.when(
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
                    onPressed: canManageStructures && allDepartments.isNotEmpty
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
                  ),
                  if (canToggleBulkExpansion && nodes.isNotEmpty) ...[
                    OutlinedButton.icon(
                      icon: const Icon(Icons.unfold_more),
                      label: const Text('展开全部'),
                      onPressed: allVisibleExpanded
                          ? null
                          : () => expandAllDepartments(nodes),
                    ),
                    OutlinedButton.icon(
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
      final regionController = TextEditingController();
      final bucketController = TextEditingController();
      final prefixController = TextEditingController();
      final accessKeyController = TextEditingController();
      var allowPublicRead = false;
      var allowMultipart = false;
      var isPrimary = false;
      var active = true;
      try {
        final result =
            await showDialog<
              ({
                String name,
                String endpoint,
                String region,
                String bucket,
                String directoryPrefix,
                String accessKey,
                bool allowPublicRead,
                bool allowMultipart,
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
                          region: regionController.text.trim(),
                          bucket: bucketController.text.trim(),
                          directoryPrefix: prefixController.text.trim(),
                          accessKey: accessKeyController.text.trim(),
                          allowPublicRead: allowPublicRead,
                          allowMultipart: allowMultipart,
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
          region: result.region,
          bucket: result.bucket,
          directoryPrefix: result.directoryPrefix,
          accessKeyDisplay: result.accessKey,
          allowPublicRead: result.allowPublicRead,
          allowMultipartUpload: result.allowMultipart,
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
        regionController.dispose();
        bucketController.dispose();
        prefixController.dispose();
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

    return ossState.when(
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
                        label: Text(creatingCredential.value ? '创建中…' : '新增凭证'),
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
                          final regionController = TextEditingController(
                            text: credential.region,
                          );
                          final bucketController = TextEditingController(
                            text: credential.bucket,
                          );
                          final prefixController = TextEditingController(
                            text: credential.directoryPrefix,
                          );
                          final accessKeyController = TextEditingController(
                            text: credential.accessKeyMasked,
                          );
                          try {
                            final result =
                                await showDialog<
                                  ({
                                    String name,
                                    String endpoint,
                                    String region,
                                    String bucket,
                                    String directoryPrefix,
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
                                                controller: endpointController,
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
                                                controller: accessKeyController,
                                                decoration: const InputDecoration(
                                                  labelText: '访问凭证标识',
                                                  helperText:
                                                      '仅展示已有凭证掩码，例如：LTAI****',
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.trim().isEmpty) {
                                                    return '访问凭证标识不能为空';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(dialogContext).pop(),
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
                                              name: nameController.text.trim(),
                                              endpoint: endpointController.text
                                                  .trim(),
                                              region: regionController.text
                                                  .trim(),
                                              bucket: bucketController.text
                                                  .trim(),
                                              directoryPrefix: prefixController
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
                                      region: result.region,
                                      bucket: result.bucket,
                                      directoryPrefix: result.directoryPrefix,
                                      accessKeyDisplay: result.accessKeyMasked,
                                    );
                                return '已更新 ${updated.name} 的访问信息';
                              },
                            );
                          } finally {
                            nameController.dispose();
                            endpointController.dispose();
                            regionController.dispose();
                            bucketController.dispose();
                            prefixController.dispose();
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
    );
  }
}

class AdminSystemSettingsPage extends HookConsumerWidget {
  const AdminSystemSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switchesState = useState<List<admin_data.AdminSystemSwitch>>(
      admin_data.adminSystemSwitches.map((s) => s).toList(),
    );
    final parametersState = useState<List<admin_data.AdminSystemParameter>>(
      admin_data.adminSystemParameters.map((p) => p).toList(),
    );
    final broadcastsState = useState<List<admin_data.AdminSystemBroadcast>>(
      admin_data.adminSystemBroadcasts.map((b) => b).toList(),
    );
    final audits = admin_data.adminSystemAuditLogs;

    void showSnack(String message) {
      if (!context.mounted) return;
      final messenger = ScaffoldMessenger.of(context);
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(
        SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
      );
    }

    void toggleSystemSwitch(String id, bool value) {
      final nowLabel = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
      switchesState.value = switchesState.value.map((item) {
        if (item.id == id) {
          return item.copyWith(
            enabled: value,
            lastUpdatedLabel: '最近更新：$nowLabel · 由 系统管理员',
          );
        }
        return item;
      }).toList();
      final target = switchesState.value.firstWhere((item) => item.id == id);
      showSnack(value ? '已启用「${target.title}」' : '已停用「${target.title}」');
    }

    Future<void> editParameter(
      admin_data.AdminSystemParameter parameter,
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
                onPressed: () =>
                    Navigator.of(dialogContext).pop(controller.text.trim()),
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
      final nowLabel = DateFormat('MM-dd HH:mm').format(DateTime.now());
      parametersState.value = parametersState.value.map((item) {
        if (item.id == parameter.id) {
          return item.copyWith(
            value: normalized,
            lastUpdatedLabel: '更新于 $nowLabel',
          );
        }
        return item;
      }).toList();
      showSnack('参数 ${parameter.key} 已更新');
    }

    void toggleBroadcastPinned(String id) {
      broadcastsState.value = broadcastsState.value.map((item) {
        if (item.id == id) {
          return item.copyWith(pinned: !item.pinned);
        }
        return item;
      }).toList();
    }

    void updateBroadcastStatus(
      String id,
      admin_data.AdminSystemBroadcastStatus status,
    ) {
      final nowLabel = DateFormat('MM-dd HH:mm').format(DateTime.now());
      admin_data.AdminSystemBroadcast? affected;
      broadcastsState.value = broadcastsState.value.map((item) {
        if (item.id == id) {
          affected = item;
          return item.copyWith(
            status: status,
            scheduleLabel: status == admin_data.AdminSystemBroadcastStatus.sent
                ? '发送时间：$nowLabel'
                : item.scheduleLabel,
          );
        }
        return item;
      }).toList();
      if (affected != null) {
        showSnack('已更新公告「${affected!.title}」状态');
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
              for (final item in switchesState.value)
                _SystemSwitchTile(
                  item: item,
                  onToggle: (value) => toggleSystemSwitch(item.id, value),
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
              for (final parameter in parametersState.value)
                _SystemParameterTile(
                  item: parameter,
                  onEdit: () => editParameter(parameter),
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
              for (final broadcast in broadcastsState.value)
                _SystemBroadcastTile(
                  item: broadcast,
                  onTogglePinned: () => toggleBroadcastPinned(broadcast.id),
                  onStatusChanged: (status) =>
                      updateBroadcastStatus(broadcast.id, status),
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
            ],
          ),
        ),
      ],
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
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.headlineSmall?.copyWith(color: color),
            ),
            const SizedBox(height: 4),
            Text(title, style: theme.textTheme.titleMedium),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
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
      margin: const EdgeInsets.symmetric(vertical: 4),
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
          subtitle: Text(
            '院系ID：${node.department.id} · 学校：${node.department.schoolId}',
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

  addSeparatorIfNeeded();
  spans.addAll(
    _buildHighlightedSpans(
      '班级ID：${clazz.id}',
      query,
      baseStyle,
      highlightStyle,
    ),
  );

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

  return spans;
}

class _AccountTile extends StatelessWidget {
  const _AccountTile({required this.account, required this.onOpenDetails});
  final AdminAccount account;
  final VoidCallback onOpenDetails;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                          side: BorderSide.none,
                          backgroundColor: theme
                              .colorScheme
                              .surfaceContainerHighest
                              .withValues(alpha: 0.4),
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
                    Text(
                      '所属：${account.structureLabel}',
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
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
              IconButton(
                tooltip: '更多操作',
                onPressed: onOpenDetails,
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
                style: action.destructive
                    ? FilledButton.styleFrom(
                        backgroundColor: theme.colorScheme.error,
                        foregroundColor: theme.colorScheme.onError,
                      )
                    : null,
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
              Column(
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
  });

  factory _AccountMetrics.fromAccounts(List<AdminAccount> accounts) {
    var teachers = 0;
    var students = 0;
    var locked = 0;
    var pendingReset = 0;

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
    }

    return _AccountMetrics(
      total: accounts.length,
      teachers: teachers,
      students: students,
      locked: locked,
      pendingReset: pendingReset,
    );
  }

  final int total;
  final int teachers;
  final int students;
  final int locked;
  final int pendingReset;
}

class _AccountMetricsGrid extends StatelessWidget {
  const _AccountMetricsGrid({required this.metrics});

  final _AccountMetrics metrics;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cards = <Widget>[
      _AccountMetricCard(
        icon: Icons.people_alt_outlined,
        label: '账号数量',
        value: metrics.total.toString(),
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
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

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
            ],
          ),
        ],
      ),
    );
  }
}

class _AccountInviteTile extends StatelessWidget {
  const _AccountInviteTile({
    required this.invite,
    required this.onCopyLink,
    required this.onResend,
    required this.onRevoke,
  });

  final admin_data.AdminAccountInvite invite;
  final VoidCallback onCopyLink;
  final VoidCallback onResend;
  final VoidCallback onRevoke;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(8),
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
                    Text(invite.email, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(
                      '由 ${invite.invitedBy} 邀请 · 创建时间：${invite.createdAtLabel}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Chip(
                label: Text(invite.roleLabel),
                backgroundColor: theme.colorScheme.surfaceContainerHighest
                    .withValues(alpha: 0.4),
                side: BorderSide.none,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.schedule_outlined,
                size: 18,
                color: theme.colorScheme.outline,
              ),
              const SizedBox(width: 6),
              Text(
                '有效期至 ${invite.expiresAtLabel}',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.link_outlined),
                  label: const Text('复制邀请链接'),
                  onPressed: onCopyLink,
                ),
                TextButton.icon(
                  icon: const Icon(Icons.send_outlined),
                  label: const Text('重新发送'),
                  onPressed: onResend,
                ),
                TextButton.icon(
                  icon: const Icon(Icons.close_outlined),
                  label: const Text('撤销邀请'),
                  onPressed: onRevoke,
                  style: TextButton.styleFrom(
                    foregroundColor: theme.colorScheme.error,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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

class _OssCredentialTile extends StatelessWidget {
  const _OssCredentialTile({
    required this.credential,
    required this.isMutating,
    this.onCopyKey,
    this.onToggleActive,
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
  const _SystemSwitchTile({required this.item, required this.onToggle});

  final admin_data.AdminSystemSwitch item;
  final ValueChanged<bool> onToggle;

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
          Switch.adaptive(value: item.enabled, onChanged: onToggle),
        ],
      ),
    );
  }
}

class _SystemParameterTile extends StatelessWidget {
  const _SystemParameterTile({required this.item, required this.onEdit});

  final admin_data.AdminSystemParameter item;
  final VoidCallback onEdit;

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
  });

  final admin_data.AdminSystemBroadcast item;
  final VoidCallback onTogglePinned;
  final ValueChanged<admin_data.AdminSystemBroadcastStatus> onStatusChanged;

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
                onPressed: onTogglePinned,
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
              DropdownButton<admin_data.AdminSystemBroadcastStatus>(
                value: item.status,
                onChanged: (value) {
                  if (value != null) {
                    onStatusChanged(value);
                  }
                },
                items: admin_data.AdminSystemBroadcastStatus.values
                    .map(
                      (status) =>
                          DropdownMenuItem<
                            admin_data.AdminSystemBroadcastStatus
                          >(value: status, child: Text(status.label)),
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
  final admin_data.AdminSystemAuditLog item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.action),
      subtitle: Text('${item.category} · ${item.operator}'),
    );
  }
}
