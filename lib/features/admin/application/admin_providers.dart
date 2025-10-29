import 'dart:async';
import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/application/auth_controller.dart';
import '../data/admin_repository.dart';
import '../domain/accounts.dart';
import '../domain/models.dart';

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

class AdminDepartmentTreeNotifier extends AsyncNotifier<List<DepartmentNode>> {
  @override
  Future<List<DepartmentNode>> build() async {
    final authState = ref.watch(authStateProvider);
    if (!authState.isAuthenticated) {
      return const <DepartmentNode>[];
    }

    final schoolId = authState.account?.schoolId ?? '';
    if (schoolId.isEmpty) {
      throw StateError('缺少学校信息，请重新登录后再试。');
    }

    final repository = ref.watch(adminRepositoryProvider);
    final tree = await repository.fetchDepartmentTree(schoolId: schoolId);
    return _sortTree(tree);
  }

  Future<void> refresh() async {
    final authState = ref.read(authStateProvider);
    if (!authState.isAuthenticated) {
      state = const AsyncData(<DepartmentNode>[]);
      return;
    }

    final schoolId = authState.account?.schoolId ?? '';
    if (schoolId.isEmpty) {
      state = AsyncError(StateError('缺少学校信息，请重新登录后再试。'), StackTrace.current);
      return;
    }

    final repository = ref.read(adminRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final tree = await repository.fetchDepartmentTree(schoolId: schoolId);
      return _sortTree(tree);
    });
  }

  bool updateTree(
    List<DepartmentNode> Function(List<DepartmentNode>) transform,
  ) {
    final current = state.asData?.value;
    if (current == null) {
      return false;
    }
    final transformed = transform(current);
    if (identical(transformed, current)) {
      state = AsyncData(current);
      return true;
    }
    state = AsyncData(_sortTree(transformed));
    return true;
  }

  List<DepartmentNode> _sortTree(List<DepartmentNode> nodes) {
    final sortedNodes = nodes
        .map(
          (node) => node.copyWith(
            classes: [...node.classes]..sort(_compareClassInfos),
          ),
        )
        .toList();
    sortedNodes.sort(_compareDepartmentNodes);
    return sortedNodes;
  }
}

class AdminExpandedDepartmentsNotifier extends StateNotifier<Set<String>> {
  AdminExpandedDepartmentsNotifier(this.ref) : super(<String>{}) {
    _authSubscription = ref.listen<AuthState>(authStateProvider, (
      previous,
      next,
    ) {
      unawaited(_handleAuthStateChange(previous, next));
    }, fireImmediately: true);
  }

  static const _prefsKey = 'admin.expanded_departments';

  final Ref ref;
  ProviderSubscription<AuthState>? _authSubscription;
  String? _currentSchoolId;
  var _isHydrating = false;

  void setExpanded(String id, bool expanded) {
    if (expanded) {
      if (state.contains(id)) return;
      _emit({...state, id});
    } else {
      if (!state.contains(id)) return;
      final next = {...state}..remove(id);
      _emit(next);
    }
  }

  void pruneToIds(Iterable<String> ids) {
    final valid = ids.toSet();
    if (valid.isEmpty) {
      if (state.isNotEmpty) {
        _emit(<String>{});
      }
      return;
    }
    final next = state.where(valid.contains).toSet();
    if (_setsDiffer(next, state)) {
      _emit(next);
    }
  }

  void setAll(Iterable<String> ids) {
    final next = {...state, ...ids};
    if (_setsDiffer(next, state)) {
      _emit(next);
    }
  }

  void clear({bool persist = true}) {
    if (state.isEmpty) return;
    if (persist) {
      _emit(<String>{});
    } else {
      _setStateWithoutPersist(<String>{});
    }
  }

  @override
  void dispose() {
    _authSubscription?.close();
    super.dispose();
  }

  void _emit(Set<String> next) {
    if (_setsDiffer(next, state)) {
      _setStateWithoutPersist(next);
      _schedulePersist();
    }
  }

  void _setStateWithoutPersist(Set<String> next) {
    if (_setsDiffer(next, state)) {
      state = next;
    }
  }

  bool _setsDiffer(Set<String> a, Set<String> b) {
    if (a.length != b.length) {
      return true;
    }
    for (final value in a) {
      if (!b.contains(value)) {
        return true;
      }
    }
    return false;
  }

  void _schedulePersist() {
    if (_isHydrating) {
      return;
    }
    final schoolId = _currentSchoolId;
    if (schoolId == null || schoolId.isEmpty) {
      return;
    }
    unawaited(_persistState(schoolId, state));
  }

  Future<void> _handleAuthStateChange(
    AuthState? previous,
    AuthState next,
  ) async {
    final prevId = previous?.account?.schoolId;
    final nextId = next.account?.schoolId;
    if (!next.isAuthenticated || nextId == null || nextId.isEmpty) {
      _currentSchoolId = null;
      _setStateWithoutPersist(<String>{});
      return;
    }
    if (prevId == nextId && previous?.isAuthenticated == next.isAuthenticated) {
      return;
    }
    await _loadForSchool(nextId);
  }

  Future<void> _loadForSchool(String? schoolId) async {
    _currentSchoolId = schoolId;
    if (schoolId == null || schoolId.isEmpty) {
      _setStateWithoutPersist(<String>{});
      return;
    }
    _isHydrating = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_prefsKey);
      if (raw == null || raw.isEmpty) {
        _setStateWithoutPersist(<String>{});
        return;
      }
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) {
        _setStateWithoutPersist(<String>{});
        return;
      }
      final stored = decoded[schoolId];
      if (stored is List) {
        final entries = {
          for (final value in stored)
            if (value is String && value.isNotEmpty) value,
        };
        _setStateWithoutPersist(entries);
      } else {
        _setStateWithoutPersist(<String>{});
      }
    } catch (_) {
      _setStateWithoutPersist(<String>{});
    } finally {
      _isHydrating = false;
    }
  }

  Future<void> _persistState(String schoolId, Set<String> values) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Map<String, dynamic> payload = <String, dynamic>{};
      final raw = prefs.getString(_prefsKey);
      if (raw != null && raw.isNotEmpty) {
        final decoded = jsonDecode(raw);
        if (decoded is Map<String, dynamic>) {
          payload = Map<String, dynamic>.from(decoded);
        }
      }
      payload[schoolId] = values.toList()..sort();
      await prefs.setString(_prefsKey, jsonEncode(payload));
    } catch (_) {
      // 持久化失败时忽略，以免打断用户流程。
    }
  }
}

class AdminDepartmentViewPreferences {
  const AdminDepartmentViewPreferences({
    this.query = '',
    this.onlyEmpty = false,
  });

  final String query;
  final bool onlyEmpty;

  AdminDepartmentViewPreferences copyWith({String? query, bool? onlyEmpty}) {
    return AdminDepartmentViewPreferences(
      query: query ?? this.query,
      onlyEmpty: onlyEmpty ?? this.onlyEmpty,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'query': query, 'onlyEmpty': onlyEmpty};
  }

  factory AdminDepartmentViewPreferences.fromJson(Map<String, dynamic> json) {
    return AdminDepartmentViewPreferences(
      query: (json['query'] as String?) ?? '',
      onlyEmpty: (json['onlyEmpty'] as bool?) ?? false,
    );
  }
}

class AdminDepartmentViewPreferencesNotifier
    extends StateNotifier<AdminDepartmentViewPreferences> {
  AdminDepartmentViewPreferencesNotifier(this.ref)
    : super(const AdminDepartmentViewPreferences()) {
    _authSubscription = ref.listen<AuthState>(authStateProvider, (
      previous,
      next,
    ) {
      unawaited(_handleAuthStateChange(previous, next));
    }, fireImmediately: true);
  }

  static const _prefsKey = 'admin.department_view_preferences';

  final Ref ref;
  ProviderSubscription<AuthState>? _authSubscription;
  String? _currentAccountId;
  var _isHydrating = false;

  void setQuery(String value) {
    final normalized = value;
    if (state.query == normalized) {
      return;
    }
    _emit(state.copyWith(query: normalized));
  }

  void setOnlyEmpty(bool value) {
    if (state.onlyEmpty == value) {
      return;
    }
    _emit(state.copyWith(onlyEmpty: value));
  }

  void reset() {
    _emit(const AdminDepartmentViewPreferences());
  }

  @override
  void dispose() {
    _authSubscription?.close();
    super.dispose();
  }

  void _emit(AdminDepartmentViewPreferences next) {
    if (_statesEqual(state, next)) {
      return;
    }
    _setStateWithoutPersist(next);
    _schedulePersist();
  }

  void _setStateWithoutPersist(AdminDepartmentViewPreferences next) {
    if (_statesEqual(state, next)) {
      return;
    }
    state = next;
  }

  bool _statesEqual(
    AdminDepartmentViewPreferences a,
    AdminDepartmentViewPreferences b,
  ) {
    return a.query == b.query && a.onlyEmpty == b.onlyEmpty;
  }

  void _schedulePersist() {
    if (_isHydrating) {
      return;
    }
    final accountId = _currentAccountId;
    if (accountId == null || accountId.isEmpty) {
      return;
    }
    unawaited(_persistState(accountId, state));
  }

  Future<void> _handleAuthStateChange(
    AuthState? previous,
    AuthState next,
  ) async {
    final prevAccountId = previous?.account?.id;
    final nextAccountId = next.account?.id;
    if (!next.isAuthenticated ||
        nextAccountId == null ||
        nextAccountId.isEmpty) {
      _currentAccountId = null;
      _setStateWithoutPersist(const AdminDepartmentViewPreferences());
      return;
    }
    if (prevAccountId == nextAccountId &&
        previous?.isAuthenticated == next.isAuthenticated) {
      return;
    }
    await _loadForAccount(nextAccountId);
  }

  Future<void> _loadForAccount(String? accountId) async {
    _currentAccountId = accountId;
    if (accountId == null || accountId.isEmpty) {
      _setStateWithoutPersist(const AdminDepartmentViewPreferences());
      return;
    }
    _isHydrating = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_prefsKey);
      if (raw == null || raw.isEmpty) {
        _setStateWithoutPersist(const AdminDepartmentViewPreferences());
        return;
      }
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) {
        _setStateWithoutPersist(const AdminDepartmentViewPreferences());
        return;
      }
      final stored = decoded[accountId];
      if (stored is Map) {
        final prefsMap = <String, dynamic>{};
        for (final entry in stored.entries) {
          final key = entry.key;
          if (key is String) {
            prefsMap[key] = entry.value;
          }
        }
        _setStateWithoutPersist(
          AdminDepartmentViewPreferences.fromJson(prefsMap),
        );
      } else {
        _setStateWithoutPersist(const AdminDepartmentViewPreferences());
      }
    } catch (_) {
      _setStateWithoutPersist(const AdminDepartmentViewPreferences());
    } finally {
      _isHydrating = false;
    }
  }

  Future<void> _persistState(
    String accountId,
    AdminDepartmentViewPreferences values,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Map<String, dynamic> payload = <String, dynamic>{};
      final raw = prefs.getString(_prefsKey);
      if (raw != null && raw.isNotEmpty) {
        final decoded = jsonDecode(raw);
        if (decoded is Map<String, dynamic>) {
          payload = Map<String, dynamic>.from(decoded);
        }
      }
      payload[accountId] = values.toJson();
      await prefs.setString(_prefsKey, jsonEncode(payload));
    } catch (_) {
      // 忽略持久化异常，避免影响主流程。
    }
  }
}

class AdminAccountListRequest {
  const AdminAccountListRequest({
    required this.schoolId,
    required this.page,
    required this.pageSize,
    this.role,
    this.status,
    this.departmentId,
    this.departmentScope,
    this.classId,
    this.classScope,
    this.query = '',
  });

  final String schoolId;
  final AdminAccountRole? role;
  final AdminAccountStatus? status;
  final String? departmentId;
  final String? departmentScope;
  final String? classId;
  final String? classScope;
  final int page;
  final int pageSize;
  final String query;

  @override
  bool operator ==(Object other) {
    return other is AdminAccountListRequest &&
        other.schoolId == schoolId &&
        other.role == role &&
        other.status == status &&
        other.departmentId == departmentId &&
        other.departmentScope == departmentScope &&
        other.classId == classId &&
        other.classScope == classScope &&
        other.page == page &&
        other.pageSize == pageSize &&
        other.query == query;
  }

  @override
  int get hashCode => Object.hash(
    schoolId,
    role,
    status,
    departmentId,
    departmentScope,
    classId,
    classScope,
    page,
    pageSize,
    query,
  );
}

final adminExpandedDepartmentsProvider =
    StateNotifierProvider<AdminExpandedDepartmentsNotifier, Set<String>>(
      (ref) => AdminExpandedDepartmentsNotifier(ref),
    );

final adminDepartmentViewPreferencesProvider =
    StateNotifierProvider<
      AdminDepartmentViewPreferencesNotifier,
      AdminDepartmentViewPreferences
    >((ref) => AdminDepartmentViewPreferencesNotifier(ref));

final adminDepartmentTreeProvider =
    AsyncNotifierProvider<AdminDepartmentTreeNotifier, List<DepartmentNode>>(
      AdminDepartmentTreeNotifier.new,
    );

final adminAccountListProvider = FutureProvider.autoDispose
    .family<AdminAccountPage, AdminAccountListRequest>((ref, request) async {
      final repository = ref.watch(adminRepositoryProvider);
      return repository.fetchAccounts(
        schoolId: request.schoolId,
        role: request.role,
        status: request.status,
        departmentId: request.departmentId,
        departmentScope: request.departmentScope,
        classId: request.classId,
        classScope: request.classScope,
        page: request.page,
        pageSize: request.pageSize,
        query: request.query,
      );
    });

final adminDepartmentMetricsProvider =
    Provider<AsyncValue<AdminDepartmentMetrics>>((ref) {
      final tree = ref.watch(adminDepartmentTreeProvider);
      return tree.whenData(AdminDepartmentMetrics.fromNodes);
    });

final adminFilteredDepartmentTreeProvider =
    Provider<AsyncValue<List<DepartmentNode>>>((ref) {
      final preferences = ref.watch(adminDepartmentViewPreferencesProvider);
      final filter = preferences.query;
      final onlyEmpty = preferences.onlyEmpty;
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
