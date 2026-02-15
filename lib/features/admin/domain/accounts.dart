import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'accounts.freezed.dart';
part 'accounts.g.dart';

enum AdminAccountRole { teacher, student }

extension AdminAccountRoleX on AdminAccountRole {
  String get label {
    return switch (this) {
      AdminAccountRole.teacher => '教师账号',
      AdminAccountRole.student => '学生账号',
    };
  }

  IconData get icon {
    return switch (this) {
      AdminAccountRole.teacher => Icons.co_present_outlined,
      AdminAccountRole.student => Icons.school_outlined,
    };
  }

  Color chipColor(ThemeData theme) {
    return switch (this) {
      AdminAccountRole.teacher => theme.colorScheme.secondary,
      AdminAccountRole.student => theme.colorScheme.primary,
    };
  }

  Color chipForegroundColor(ThemeData theme) {
    return switch (this) {
      AdminAccountRole.teacher => theme.colorScheme.onSecondary,
      AdminAccountRole.student => theme.colorScheme.onPrimary,
    };
  }
}

@JsonEnum(fieldRename: FieldRename.snake, alwaysCreate: true)
enum AdminAccountStatus {
  active,
  locked,
  passwordResetRequired;

  const AdminAccountStatus();

  String get name => _$AdminAccountStatusEnumMap[this]!;
}

extension AdminAccountStatusX on AdminAccountStatus {
  String get label {
    return switch (this) {
      AdminAccountStatus.active => '正常',
      AdminAccountStatus.locked => '已锁定',
      AdminAccountStatus.passwordResetRequired => '待重置密码',
    };
  }

  Color statusColor(ThemeData theme) {
    return switch (this) {
      AdminAccountStatus.active => theme.colorScheme.primary,
      AdminAccountStatus.locked => theme.colorScheme.error,
      AdminAccountStatus.passwordResetRequired => theme.colorScheme.tertiary,
    };
  }
}

@freezed
abstract class AdminAccount with _$AdminAccount {
  const AdminAccount._();

  const factory AdminAccount({
    @Default('') String id,
    String? profileId,
    required AdminAccountRole role,
    @Default('') String name,
    @Default('') String identifier,
    @Default('') String email,
    String? phone,
    String? departmentId,
    String? department,
    String? classId,
    String? className,
    required AdminAccountStatus status,
    DateTime? lastActiveAt,
    required DateTime createdAt,
  }) = _AdminAccount;

  factory AdminAccount.fromJson(Map<String, dynamic> json) =>
      _$AdminAccountFromJson(json);

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
    if (role == AdminAccountRole.teacher) {
      return '';
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

@freezed
abstract class AdminAccountPage with _$AdminAccountPage {
  const AdminAccountPage._();

  const factory AdminAccountPage({
    @Default([]) List<AdminAccount> accounts,
    @Default(1) int page,
    @Default(0) int pageSize,
    @Default(0) int total,
  }) = _AdminAccountPage;

  factory AdminAccountPage.empty() => const AdminAccountPage();

  factory AdminAccountPage.fromJson(Map<String, dynamic> json) =>
      _$AdminAccountPageFromJson(json);
}
