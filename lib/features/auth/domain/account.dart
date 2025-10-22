enum AccountRole { admin, teacher, student }

extension AccountRoleLabel on AccountRole {
  String get label {
    return switch (this) {
      AccountRole.admin => '管理员',
      AccountRole.teacher => '教师',
      AccountRole.student => '学生',
    };
  }

  String get apiValue {
    return switch (this) {
      AccountRole.admin => 'admin',
      AccountRole.teacher => 'teacher',
      AccountRole.student => 'student',
    };
  }

  static AccountRole fromApiValue(String value) {
    return switch (value.toLowerCase()) {
      'admin' => AccountRole.admin,
      'teacher' => AccountRole.teacher,
      'student' => AccountRole.student,
      _ => AccountRole.student,
    };
  }
}

class Account {
  const Account({
    required this.id,
    required this.schoolId,
    required this.identifier,
    required this.displayName,
    required this.role,
  });

  final String id;
  final String schoolId;
  final String identifier;
  final String displayName;
  final AccountRole role;

  factory Account.fromJson(Map<String, dynamic> json) {
    final roleValue = json['role']?.toString() ?? 'student';
    return Account(
      id: json['id']?.toString() ?? '',
      schoolId: json['school_id']?.toString() ?? '',
      identifier: json['identifier']?.toString() ?? '',
      displayName: json['display_name']?.toString() ?? '',
      role: AccountRoleLabel.fromApiValue(roleValue),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'school_id': schoolId,
      'identifier': identifier,
      'display_name': displayName,
      'role': role.apiValue,
    };
  }
}
