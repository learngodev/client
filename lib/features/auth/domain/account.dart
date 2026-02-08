import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

enum AccountRole { admin, teacher, student, ai }

extension AccountRoleLabel on AccountRole {
  String get label {
    return switch (this) {
      AccountRole.admin => '管理员',
      AccountRole.teacher => '教师',
      AccountRole.student => '学生',
      AccountRole.ai => 'AI助手',
    };
  }

  String get apiValue {
    return switch (this) {
      AccountRole.admin => 'admin',
      AccountRole.teacher => 'teacher',
      AccountRole.student => 'student',
      AccountRole.ai => 'ai',
    };
  }

  static AccountRole fromApiValue(String value) {
    return switch (value.toLowerCase()) {
      'admin' => AccountRole.admin,
      'teacher' => AccountRole.teacher,
      'student' => AccountRole.student,
      'ai' => AccountRole.ai,
      _ => AccountRole.student,
    };
  }
}

Object? _readDisplayName(Map map, String key) {
  return map['display_name'] ?? map['name'];
}

@freezed
abstract class Account with _$Account {
  const factory Account({
    @Default('') String id,
    @Default('') String schoolId,
    @Default('') String identifier,
    @JsonKey(readValue: _readDisplayName) @Default('') String displayName,
    @JsonKey(fromJson: AccountRoleLabel.fromApiValue)
    @Default(AccountRole.student)
    AccountRole role,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
