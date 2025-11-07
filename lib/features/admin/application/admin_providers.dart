import 'dart:async';
import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/application/auth_controller.dart';
import '../data/admin_repository.dart';
import '../domain/accounts.dart';
import '../domain/models.dart';
import '../domain/oss.dart' as oss;
import '../domain/system_settings.dart';

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

class AdminAccountInvitesNotifier
    extends AsyncNotifier<List<AdminAccountInvite>> {
  @override
  Future<List<AdminAccountInvite>> build() async {
    final authState = ref.watch(authStateProvider);
    if (!authState.isAuthenticated) {
      return const <AdminAccountInvite>[];
    }
    final schoolId = authState.account?.schoolId ?? '';
    if (schoolId.isEmpty) {
      throw StateError('缺少学校信息，请重新登录后再试。');
    }
    final repository = ref.watch(adminRepositoryProvider);
    final invites = await repository.fetchAccountInvites(schoolId: schoolId);
    return _sortInvites(invites);
  }

  Future<void> refresh() async {
    final schoolId = _requireSchoolId();
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(adminRepositoryProvider);
      final invites = await repository.fetchAccountInvites(schoolId: schoolId);
      return _sortInvites(invites);
    });
  }

  Future<AdminAccountInvite> createInvite({
    required String email,
    required AdminAccountRole role,
    String? departmentId,
    String? classId,
    String? note,
  }) async {
    final schoolId = _requireSchoolId();
    final repository = ref.read(adminRepositoryProvider);
    final invite = await repository.createAccountInvite(
      schoolId: schoolId,
      email: email,
      role: role,
      departmentId: departmentId,
      classId: classId,
      note: note,
    );
    final current = state.asData?.value ?? const <AdminAccountInvite>[];
    final next = <AdminAccountInvite>[
      for (final existing in current)
        if (existing.id != invite.id) existing,
      invite,
    ];
    state = AsyncData(_sortInvites(next));
    return invite;
  }

  Future<AdminAccountInvite?> resendInvite(String inviteId) async {
    final schoolId = _requireSchoolId();
    final repository = ref.read(adminRepositoryProvider);
    final updated = await repository.resendAccountInvite(
      schoolId: schoolId,
      inviteId: inviteId,
    );
    if (updated != null) {
      _updateState((current) {
        var found = false;
        final next = <AdminAccountInvite>[];
        for (final invite in current) {
          if (invite.id == updated.id) {
            next.add(updated);
            found = true;
          } else {
            next.add(invite);
          }
        }
        if (!found) {
          next.add(updated);
        }
        return next;
      });
    } else {
      await refresh();
    }
    return updated;
  }

  Future<void> revokeInvite(String inviteId) async {
    final schoolId = _requireSchoolId();
    final repository = ref.read(adminRepositoryProvider);
    await repository.revokeAccountInvite(
      schoolId: schoolId,
      inviteId: inviteId,
    );
    _updateState((current) {
      return current.where((invite) => invite.id != inviteId).toList();
    });
  }

  String _requireSchoolId() {
    final authState = ref.read(authStateProvider);
    if (!authState.isAuthenticated) {
      throw StateError('当前登录状态已失效，请重新登录。');
    }
    final schoolId = authState.account?.schoolId ?? '';
    if (schoolId.isEmpty) {
      throw StateError('缺少学校信息，请重新登录后再试。');
    }
    return schoolId;
  }

  void _updateState(
    List<AdminAccountInvite> Function(List<AdminAccountInvite>) transform,
  ) {
    final current = state.asData?.value;
    if (current == null) {
      return;
    }
    final next = transform(current);
    state = AsyncData(_sortInvites(next));
  }

  List<AdminAccountInvite> _sortInvites(List<AdminAccountInvite> invites) {
    final sorted = [...invites];
    sorted.sort((a, b) {
      final left = a.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0);
      final right = b.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0);
      return right.compareTo(left);
    });
    return sorted;
  }
}

class AdminSystemSettingsState {
  const AdminSystemSettingsState({
    required this.switches,
    required this.parameters,
    required this.broadcasts,
    required this.auditLogs,
  });

  const AdminSystemSettingsState.empty()
    : switches = const <AdminSystemSwitch>[],
      parameters = const <AdminSystemParameter>[],
      broadcasts = const <AdminSystemBroadcast>[],
      auditLogs = const <AdminSystemAuditLog>[];

  final List<AdminSystemSwitch> switches;
  final List<AdminSystemParameter> parameters;
  final List<AdminSystemBroadcast> broadcasts;
  final List<AdminSystemAuditLog> auditLogs;

  AdminSystemSettingsState copyWith({
    List<AdminSystemSwitch>? switches,
    List<AdminSystemParameter>? parameters,
    List<AdminSystemBroadcast>? broadcasts,
    List<AdminSystemAuditLog>? auditLogs,
  }) {
    return AdminSystemSettingsState(
      switches: switches ?? this.switches,
      parameters: parameters ?? this.parameters,
      broadcasts: broadcasts ?? this.broadcasts,
      auditLogs: auditLogs ?? this.auditLogs,
    );
  }
}

class AdminSystemSettingsNotifier
    extends AsyncNotifier<AdminSystemSettingsState> {
  @override
  Future<AdminSystemSettingsState> build() async {
    final authState = ref.watch(authStateProvider);
    if (!authState.isAuthenticated) {
      return const AdminSystemSettingsState.empty();
    }
    final schoolId = authState.account?.schoolId ?? '';
    if (schoolId.isEmpty) {
      throw StateError('缺少学校信息，请重新登录后再试。');
    }
    final repository = ref.watch(adminRepositoryProvider);
    final switches = await repository.fetchSystemSwitches(schoolId: schoolId);
    final parameters = await repository.fetchSystemParameters(
      schoolId: schoolId,
    );
    final broadcasts = await repository.fetchSystemBroadcasts(
      schoolId: schoolId,
    );
    final auditLogs = await repository.fetchSystemAuditLogs(
      schoolId: schoolId,
      limit: 50,
    );
    return AdminSystemSettingsState(
      switches: List.unmodifiable(switches),
      parameters: List.unmodifiable(parameters),
      broadcasts: List.unmodifiable(broadcasts),
      auditLogs: List.unmodifiable(auditLogs),
    );
  }

  Future<void> refresh() async {
    final schoolId = _requireSchoolId();
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(adminRepositoryProvider);
      final switches = await repository.fetchSystemSwitches(schoolId: schoolId);
      final parameters = await repository.fetchSystemParameters(
        schoolId: schoolId,
      );
      final broadcasts = await repository.fetchSystemBroadcasts(
        schoolId: schoolId,
      );
      final auditLogs = await repository.fetchSystemAuditLogs(
        schoolId: schoolId,
        limit: 50,
      );
      return AdminSystemSettingsState(
        switches: List.unmodifiable(switches),
        parameters: List.unmodifiable(parameters),
        broadcasts: List.unmodifiable(broadcasts),
        auditLogs: List.unmodifiable(auditLogs),
      );
    });
  }

  Future<AdminSystemSwitch> setSwitchEnabled({
    required String switchId,
    required bool enabled,
  }) async {
    final schoolId = _requireSchoolId();
    final repository = ref.read(adminRepositoryProvider);
    final updated = await repository.updateSystemSwitch(
      schoolId: schoolId,
      switchId: switchId,
      enabled: enabled,
    );
    _updateState((current) {
      final switches = current.switches
          .map((item) => item.id == updated.id ? updated : item)
          .toList(growable: false);
      return current.copyWith(switches: List.unmodifiable(switches));
    });
    await _refreshAuditLogs(schoolId);
    return updated;
  }

  Future<AdminSystemParameter> updateParameterValue({
    required String parameterId,
    required String value,
  }) async {
    final schoolId = _requireSchoolId();
    final repository = ref.read(adminRepositoryProvider);
    final updated = await repository.updateSystemParameter(
      schoolId: schoolId,
      parameterId: parameterId,
      value: value,
    );
    _updateState((current) {
      final parameters = current.parameters
          .map((item) => item.id == updated.id ? updated : item)
          .toList(growable: false);
      return current.copyWith(parameters: List.unmodifiable(parameters));
    });
    await _refreshAuditLogs(schoolId);
    return updated;
  }

  Future<AdminSystemBroadcast> updateBroadcast({
    required String broadcastId,
    AdminSystemBroadcastStatus? status,
    bool? pinned,
  }) async {
    final schoolId = _requireSchoolId();
    final repository = ref.read(adminRepositoryProvider);
    final updated = await repository.updateSystemBroadcast(
      schoolId: schoolId,
      broadcastId: broadcastId,
      status: status,
      pinned: pinned,
    );
    _updateState((current) {
      final broadcasts = current.broadcasts
          .map((item) => item.id == updated.id ? updated : item)
          .toList(growable: false);
      return current.copyWith(broadcasts: List.unmodifiable(broadcasts));
    });
    await _refreshAuditLogs(schoolId);
    return updated;
  }

  String _requireSchoolId() {
    final authState = ref.read(authStateProvider);
    if (!authState.isAuthenticated) {
      throw StateError('当前登录状态已失效，请重新登录。');
    }
    final schoolId = authState.account?.schoolId ?? '';
    if (schoolId.isEmpty) {
      throw StateError('缺少学校信息，请重新登录后再试。');
    }
    return schoolId;
  }

  void _updateState(
    AdminSystemSettingsState Function(AdminSystemSettingsState) transform,
  ) {
    final current = state.asData?.value;
    if (current == null) {
      return;
    }
    final next = transform(current);
    state = AsyncData(next);
  }

  Future<void> _refreshAuditLogs(String schoolId) async {
    final repository = ref.read(adminRepositoryProvider);
    final logs = await repository.fetchSystemAuditLogs(
      schoolId: schoolId,
      limit: 50,
    );
    _updateState((current) {
      return current.copyWith(auditLogs: List.unmodifiable(logs));
    });
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

class AdminOssState {
  const AdminOssState({
    this.credentials = const <oss.AdminOssCredential>[],
    this.policies = const <oss.AdminOssPolicy>[],
    this.auditLogs = const <oss.AdminOssAuditLog>[],
    this.hasMoreAuditLogs = false,
  });

  final List<oss.AdminOssCredential> credentials;
  final List<oss.AdminOssPolicy> policies;
  final List<oss.AdminOssAuditLog> auditLogs;
  final bool hasMoreAuditLogs;

  AdminOssState copyWith({
    List<oss.AdminOssCredential>? credentials,
    List<oss.AdminOssPolicy>? policies,
    List<oss.AdminOssAuditLog>? auditLogs,
    bool? hasMoreAuditLogs,
  }) {
    return AdminOssState(
      credentials: credentials ?? this.credentials,
      policies: policies ?? this.policies,
      auditLogs: auditLogs ?? this.auditLogs,
      hasMoreAuditLogs: hasMoreAuditLogs ?? this.hasMoreAuditLogs,
    );
  }
}

class AdminOssNotifier extends AsyncNotifier<AdminOssState> {
  static const int _defaultAuditLimit = 20;
  int _auditLimit = _defaultAuditLimit;

  @override
  Future<AdminOssState> build() async {
    final authState = ref.watch(authStateProvider);
    if (!authState.isAuthenticated) {
      return const AdminOssState();
    }
    final schoolId = authState.account?.schoolId ?? '';
    if (schoolId.isEmpty) {
      throw StateError('缺少学校信息，请重新登录后再试。');
    }
    _auditLimit = _defaultAuditLimit;
    return _fetchAll(schoolId: schoolId, limit: _auditLimit);
  }

  Future<void> refresh({int limit = _defaultAuditLimit}) async {
    final schoolId = _requireSchoolId();
    _auditLimit = limit;
    final result = await AsyncValue.guard(
      () => _fetchAll(schoolId: schoolId, limit: _auditLimit),
    );
    state = result;
  }

  Future<oss.AdminOssCredential> createCredential({
    required String name,
    required String endpoint,
    required String region,
    required String bucket,
    String directoryPrefix = '',
    String accessKeyDisplay = '',
    bool allowPublicRead = false,
    bool allowMultipartUpload = false,
    bool active = true,
    bool isPrimary = false,
  }) async {
    final schoolId = _requireSchoolId();
    final repository = ref.read(adminRepositoryProvider);
    final credential = await repository.createOssCredential(
      schoolId: schoolId,
      name: name,
      endpoint: endpoint,
      region: region,
      bucket: bucket,
      directoryPrefix: directoryPrefix,
      accessKeyDisplay: accessKeyDisplay,
      allowPublicRead: allowPublicRead,
      allowMultipartUpload: allowMultipartUpload,
      active: active,
      isPrimary: isPrimary,
    );

    state = state.whenData((current) {
      final updated = <oss.AdminOssCredential>[
        credential,
        ...current.credentials.map((item) {
          if (credential.isPrimary && item.isPrimary) {
            return item.copyWith(isPrimary: false);
          }
          return item;
        }),
      ];
      return current.copyWith(credentials: updated);
    });

    await _refreshAuditLogs(schoolId: schoolId, limit: _auditLimit);
    return credential;
  }

  Future<void> deleteCredential({required String credentialId}) async {
    final schoolId = _requireSchoolId();
    final repository = ref.read(adminRepositoryProvider);
    await repository.deleteOssCredential(
      schoolId: schoolId,
      credentialId: credentialId,
    );

    state = state.whenData((current) {
      final updated = current.credentials
          .where((item) => item.id != credentialId)
          .toList(growable: false);
      return current.copyWith(credentials: updated);
    });

    await _refreshAuditLogs(schoolId: schoolId, limit: _auditLimit);
  }

  Future<oss.AdminOssCredential> updateCredential({
    required String credentialId,
    String? name,
    String? endpoint,
    String? region,
    String? bucket,
    String? directoryPrefix,
    String? accessKeyDisplay,
    bool? allowPublicRead,
    bool? allowMultipartUpload,
    bool? active,
    bool? isPrimary,
  }) async {
    final schoolId = _requireSchoolId();
    final repository = ref.read(adminRepositoryProvider);
    final credential = await repository.updateOssCredential(
      schoolId: schoolId,
      credentialId: credentialId,
      name: name,
      endpoint: endpoint,
      region: region,
      bucket: bucket,
      directoryPrefix: directoryPrefix,
      accessKeyDisplay: accessKeyDisplay,
      allowPublicRead: allowPublicRead,
      allowMultipartUpload: allowMultipartUpload,
      active: active,
      isPrimary: isPrimary,
    );

    state = state.whenData((current) {
      final updatedCredentials = current.credentials.map((item) {
        if (item.id == credential.id) {
          return credential;
        }
        if (credential.isPrimary && item.isPrimary) {
          return item.copyWith(isPrimary: false);
        }
        return item;
      }).toList();
      return current.copyWith(credentials: updatedCredentials);
    });

    await _refreshAuditLogs(schoolId: schoolId, limit: _auditLimit);
    return credential;
  }

  Future<oss.AdminOssPolicy> createPolicy({
    required String name,
    required String appliesTo,
    String description = '',
    oss.AdminOssPolicyStatus status = oss.AdminOssPolicyStatus.enabled,
  }) async {
    final schoolId = _requireSchoolId();
    final repository = ref.read(adminRepositoryProvider);
    final policy = await repository.createOssPolicy(
      schoolId: schoolId,
      name: name,
      appliesTo: appliesTo,
      description: description,
      status: status,
    );

    state = state.whenData((current) {
      final updated = <oss.AdminOssPolicy>[policy, ...current.policies];
      return current.copyWith(policies: updated);
    });

    await _refreshAuditLogs(schoolId: schoolId, limit: _auditLimit);
    return policy;
  }

  Future<void> deletePolicy({required String policyId}) async {
    final schoolId = _requireSchoolId();
    final repository = ref.read(adminRepositoryProvider);
    await repository.deleteOssPolicy(schoolId: schoolId, policyId: policyId);

    state = state.whenData((current) {
      final updated = current.policies
          .where((item) => item.id != policyId)
          .toList(growable: false);
      return current.copyWith(policies: updated);
    });

    await _refreshAuditLogs(schoolId: schoolId, limit: _auditLimit);
  }

  Future<oss.AdminOssPolicy> updatePolicyStatus({
    required String policyId,
    required oss.AdminOssPolicyStatus status,
  }) async {
    final schoolId = _requireSchoolId();
    final repository = ref.read(adminRepositoryProvider);
    final policy = await repository.updateOssPolicyStatus(
      schoolId: schoolId,
      policyId: policyId,
      status: status,
    );

    state = state.whenData((current) {
      final updatedPolicies = current.policies.map((item) {
        if (item.id == policy.id) {
          return policy;
        }
        return item;
      }).toList();
      return current.copyWith(policies: updatedPolicies);
    });

    await _refreshAuditLogs(schoolId: schoolId, limit: _auditLimit);
    return policy;
  }

  Future<void> loadMoreAuditLogs({int? limit}) async {
    final current = state.valueOrNull;
    if (current != null && !current.hasMoreAuditLogs) {
      return;
    }
    final schoolId = _requireSchoolId();
    final nextLimit = limit ?? (_auditLimit + _defaultAuditLimit);
    await _refreshAuditLogs(
      schoolId: schoolId,
      limit: nextLimit,
      replaceLimit: true,
    );
  }

  Future<void> _refreshAuditLogs({
    required String schoolId,
    required int limit,
    bool replaceLimit = false,
  }) async {
    try {
      final repository = ref.read(adminRepositoryProvider);
      final logs = await repository.fetchOssAuditLogs(
        schoolId: schoolId,
        limit: limit,
      );
      if (replaceLimit) {
        _auditLimit = limit;
      }
      final hasMore = logs.length >= limit;
      state = state.whenData(
        (current) =>
            current.copyWith(auditLogs: logs, hasMoreAuditLogs: hasMore),
      );
    } catch (_) {
      // 忽略日志刷新失败，避免影响主流程。
    }
  }

  Future<AdminOssState> _fetchAll({
    required String schoolId,
    required int limit,
  }) async {
    final repository = ref.read(adminRepositoryProvider);
    final credentialsFuture = repository.fetchOssCredentials(
      schoolId: schoolId,
    );
    final policiesFuture = repository.fetchOssPolicies(schoolId: schoolId);
    final logsFuture = repository.fetchOssAuditLogs(
      schoolId: schoolId,
      limit: limit,
    );

    final credentials = await credentialsFuture;
    final policies = await policiesFuture;
    final logs = await logsFuture;

    _auditLimit = limit;
    final hasMore = logs.length >= limit;
    return AdminOssState(
      credentials: credentials,
      policies: policies,
      auditLogs: logs,
      hasMoreAuditLogs: hasMore,
    );
  }

  String _requireSchoolId() {
    final authState = ref.read(authStateProvider);
    if (!authState.isAuthenticated) {
      throw StateError('当前登录状态已失效，请重新登录。');
    }
    final schoolId = authState.account?.schoolId ?? '';
    if (schoolId.isEmpty) {
      throw StateError('缺少学校信息，请重新登录后再试。');
    }
    return schoolId;
  }
}

final adminOssProvider = AsyncNotifierProvider<AdminOssNotifier, AdminOssState>(
  AdminOssNotifier.new,
);

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

final adminAccountInvitesProvider =
    AsyncNotifierProvider<
      AdminAccountInvitesNotifier,
      List<AdminAccountInvite>
    >(AdminAccountInvitesNotifier.new);

final adminSystemSettingsProvider =
    AsyncNotifierProvider<
      AdminSystemSettingsNotifier,
      AdminSystemSettingsState
    >(AdminSystemSettingsNotifier.new);

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
