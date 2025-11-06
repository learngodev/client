import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum AdminAccountRole { teacher, student }

extension AdminAccountRoleX on AdminAccountRole {
  String get label {
    return switch (this) {
      AdminAccountRole.teacher => '教师账号',
      AdminAccountRole.student => '学生账号',
    };
  }

  String get apiValue {
    return switch (this) {
      AdminAccountRole.teacher => 'teacher',
      AdminAccountRole.student => 'student',
    };
  }

  IconData get icon {
    return switch (this) {
      AdminAccountRole.teacher => Icons.co_present_outlined,
      AdminAccountRole.student => Icons.school_outlined,
    };
  }

  static AdminAccountRole fromApiValue(String value) {
    switch (value) {
      case 'student':
        return AdminAccountRole.student;
      case 'teacher':
      default:
        return AdminAccountRole.teacher;
    }
  }
}

enum AdminAccountStatus { active, locked, passwordResetRequired }

extension AdminAccountStatusX on AdminAccountStatus {
  String get label {
    return switch (this) {
      AdminAccountStatus.active => '正常',
      AdminAccountStatus.locked => '已锁定',
      AdminAccountStatus.passwordResetRequired => '待重置密码',
    };
  }

  String get apiValue {
    return switch (this) {
      AdminAccountStatus.active => 'active',
      AdminAccountStatus.locked => 'locked',
      AdminAccountStatus.passwordResetRequired => 'password_reset_required',
    };
  }

  Color statusColor(ThemeData theme) {
    return switch (this) {
      AdminAccountStatus.active => theme.colorScheme.primary,
      AdminAccountStatus.locked => theme.colorScheme.error,
      AdminAccountStatus.passwordResetRequired => theme.colorScheme.tertiary,
    };
  }

  static AdminAccountStatus fromApiValue(String value) {
    switch (value) {
      case 'locked':
        return AdminAccountStatus.locked;
      case 'password_reset_required':
        return AdminAccountStatus.passwordResetRequired;
      case 'active':
      default:
        return AdminAccountStatus.active;
    }
  }
}

class AdminAccount {
  const AdminAccount({
    required this.id,
    required this.role,
    required this.name,
    required this.identifier,
    required this.email,
    required this.status,
    required this.createdAt,
    this.phone,
    this.departmentId,
    this.department,
    this.classId,
    this.className,
    this.lastActiveAt,
  });

  final String id;
  final AdminAccountRole role;
  final String name;
  final String identifier;
  final String email;
  final String? phone;
  final String? departmentId;
  final String? department;
  final String? classId;
  final String? className;
  final AdminAccountStatus status;
  final DateTime? lastActiveAt;
  final DateTime createdAt;

  AdminAccount copyWith({
    String? id,
    AdminAccountRole? role,
    String? name,
    String? identifier,
    String? email,
    String? phone,
    String? departmentId,
    String? department,
    String? classId,
    String? className,
    AdminAccountStatus? status,
    DateTime? lastActiveAt,
    DateTime? createdAt,
  }) {
    return AdminAccount(
      id: id ?? this.id,
      role: role ?? this.role,
      name: name ?? this.name,
      identifier: identifier ?? this.identifier,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      departmentId: departmentId ?? this.departmentId,
      department: department ?? this.department,
      classId: classId ?? this.classId,
      className: className ?? this.className,
      status: status ?? this.status,
      lastActiveAt: lastActiveAt ?? this.lastActiveAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory AdminAccount.fromJson(Map<String, dynamic> json) {
    final roleValue = (json['role'] ?? '').toString().toLowerCase();
    final statusValue = (json['status'] ?? '').toString().toLowerCase();
    final emailValue = (json['email'] ?? '').toString();
    final phoneValue = json['phone']?.toString();
    final departmentIdValue = json['department_id']?.toString();
    final departmentValue = json['department']?.toString();
    final classIdValue = json['class_id']?.toString();
    final classNameValue = json['class_name']?.toString();

    DateTime? lastActive;
    final lastActiveRaw = json['last_active_at'];
    if (lastActiveRaw is String && lastActiveRaw.isNotEmpty) {
      lastActive = DateTime.tryParse(lastActiveRaw);
    }

    DateTime createdAt = DateTime.now();
    final createdRaw = json['created_at'];
    if (createdRaw is String && createdRaw.isNotEmpty) {
      createdAt = DateTime.tryParse(createdRaw) ?? createdAt;
    }

    return AdminAccount(
      id: (json['id'] ?? '').toString(),
      role: AdminAccountRoleX.fromApiValue(roleValue),
      name: (json['name'] ?? '').toString(),
      identifier: (json['identifier'] ?? '').toString(),
      email: emailValue,
      phone: phoneValue?.isEmpty ?? true ? null : phoneValue,
      departmentId: departmentIdValue?.isEmpty ?? true
          ? null
          : departmentIdValue,
      department: departmentValue?.isEmpty ?? true ? null : departmentValue,
      classId: classIdValue?.isEmpty ?? true ? null : classIdValue,
      className: classNameValue?.isEmpty ?? true ? null : classNameValue,
      status: AdminAccountStatusX.fromApiValue(statusValue),
      lastActiveAt: lastActive,
      createdAt: createdAt,
    );
  }

  String get structureLabel {
    final trimmedDepartment = department?.trim() ?? '';
    final trimmedClass = className?.trim() ?? '';
    if (trimmedDepartment.isNotEmpty && trimmedClass.isNotEmpty) {
      return '$trimmedDepartment · $trimmedClass';
    }
    if (trimmedDepartment.isNotEmpty) {
      return trimmedDepartment;
    }
    if (trimmedClass.isNotEmpty) {
      return trimmedClass;
    }
    return '未分配班级';
  }

  String get statusLabel => status.label;

  Color statusColor(ThemeData theme) => status.statusColor(theme);

  String get lastActiveLabel {
    final reference = (lastActiveAt ?? createdAt).toLocal();
    final now = DateTime.now();
    final difference = now.difference(reference);
    if (difference.inMinutes < 1) {
      return '刚刚';
    }
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} 分钟前';
    }
    if (difference.inHours < 24) {
      return '${difference.inHours} 小时前';
    }
    if (difference.inDays < 7) {
      return '${difference.inDays} 天前';
    }
    return DateFormat('yyyy-MM-dd HH:mm').format(reference);
  }
}

class AdminAccountPage {
  const AdminAccountPage({
    required this.accounts,
    required this.page,
    required this.pageSize,
    required this.total,
  });

  const AdminAccountPage.empty()
    : accounts = const <AdminAccount>[],
      page = 1,
      pageSize = 0,
      total = 0;

  final List<AdminAccount> accounts;
  final int page;
  final int pageSize;
  final int total;

  factory AdminAccountPage.fromJson(Map<String, dynamic> json) {
    final rawAccounts = json['accounts'];
    final accounts = <AdminAccount>[];
    if (rawAccounts is List) {
      for (final entry in rawAccounts) {
        if (entry is Map<String, dynamic>) {
          accounts.add(AdminAccount.fromJson(entry));
        }
      }
    }

    final total = (json['total'] as num?)?.toInt() ?? accounts.length;
    final page = (json['page'] as num?)?.toInt() ?? 1;
    final pageSize = (json['page_size'] as num?)?.toInt() ?? accounts.length;

    return AdminAccountPage(
      accounts: accounts,
      page: page,
      pageSize: pageSize,
      total: total,
    );
  }
}

class AdminAccountInvite {
  const AdminAccountInvite({
    required this.id,
    required this.email,
    required this.role,
    this.invitedBy,
    this.createdAt,
    this.expiresAt,
    this.invitationUrl,
  });

  final String id;
  final String email;
  final AdminAccountRole role;
  final String? invitedBy;
  final DateTime? createdAt;
  final DateTime? expiresAt;
  final String? invitationUrl;

  String get roleLabel => role.label;

  String get invitedByLabel {
    final value = invitedBy?.trim() ?? '';
    if (value.isEmpty) {
      return '系统管理员';
    }
    return value;
  }

  String get createdAtLabel => _formatDate(createdAt);

  String get expiresAtLabel => _formatDate(expiresAt);

  bool get isExpired {
    final expiry = expiresAt;
    if (expiry == null) {
      return false;
    }
    return expiry.isBefore(DateTime.now());
  }

  AdminAccountInvite copyWith({
    String? id,
    String? email,
    AdminAccountRole? role,
    String? invitedBy,
    DateTime? createdAt,
    DateTime? expiresAt,
    String? invitationUrl,
  }) {
    return AdminAccountInvite(
      id: id ?? this.id,
      email: email ?? this.email,
      role: role ?? this.role,
      invitedBy: invitedBy ?? this.invitedBy,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      invitationUrl: invitationUrl ?? this.invitationUrl,
    );
  }

  factory AdminAccountInvite.fromJson(Map<String, dynamic> json) {
    final roleValue = (json['role'] ?? '').toString().toLowerCase();
    final invitedByValue = json['invited_by'] ??
        json['invited_by_name'] ??
        json['invitedBy'] ??
        json['inviter'];
    final invitationUrlValue = json['invitation_url'] ??
        json['invite_url'] ??
        json['url'] ??
        json['link'];

    return AdminAccountInvite(
      id: (json['id'] ?? '').toString(),
      email: (json['email'] ?? '').toString(),
      role: AdminAccountRoleX.fromApiValue(roleValue),
      invitedBy: invitedByValue == null
          ? null
          : invitedByValue.toString().trim().isEmpty
              ? null
              : invitedByValue.toString().trim(),
      createdAt: _parseDateTime(json['created_at'] ?? json['createdAt']),
      expiresAt: _parseDateTime(json['expires_at'] ?? json['expiresAt']),
      invitationUrl: invitationUrlValue == null
          ? null
          : invitationUrlValue.toString().trim().isEmpty
              ? null
              : invitationUrlValue.toString().trim(),
    );
  }

  static DateTime? _parseDateTime(dynamic raw) {
    if (raw is DateTime) {
      return raw.toLocal();
    }
    if (raw is String && raw.isNotEmpty) {
      return DateTime.tryParse(raw)?.toLocal();
    }
    if (raw is int) {
      final normalized = raw < 1000000000000 ? raw * 1000 : raw;
      return DateTime.fromMillisecondsSinceEpoch(normalized, isUtc: true)
          .toLocal();
    }
    if (raw is num) {
      final value = raw.toInt();
      final normalized = value < 1000000000000 ? value * 1000 : value;
      return DateTime.fromMillisecondsSinceEpoch(normalized, isUtc: true)
          .toLocal();
    }
    return null;
  }

  static String _formatDate(DateTime? value) {
    if (value == null) {
      return '未设置';
    }
    return DateFormat('MM-dd HH:mm').format(value.toLocal());
  }
}
