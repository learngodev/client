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
}

@freezed
abstract class Account with _$Account {
  const factory Account({
    @Default('') String id,
    @Default('') String schoolId,
    @Default('') String identifier,
    @Default('') String displayName,
    @Default(AccountRole.student) AccountRole role,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
