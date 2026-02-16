// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResult _$LoginResultFromJson(Map<String, dynamic> json) => _LoginResult(
  account: Account.fromJson(json['account'] as Map<String, dynamic>),
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
  requiresPasswordReset: json['requires_password_reset'] as bool,
);

Map<String, dynamic> _$LoginResultToJson(_LoginResult instance) =>
    <String, dynamic>{
      'account': instance.account,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'requires_password_reset': instance.requiresPasswordReset,
    };

_SignInPayloadImpl _$SignInPayloadImplFromJson(Map<String, dynamic> json) =>
    _SignInPayloadImpl(
      schoolId: json['school_id'] as String,
      identifier: json['identifier'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignInPayloadImplToJson(_SignInPayloadImpl instance) =>
    <String, dynamic>{
      'school_id': instance.schoolId,
      'identifier': instance.identifier,
      'password': instance.password,
    };

_SchoolsResult _$SchoolsResultFromJson(Map<String, dynamic> json) =>
    _SchoolsResult(
      schools: (json['schools'] as List<dynamic>)
          .map((e) => School.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SchoolsResultToJson(_SchoolsResult instance) =>
    <String, dynamic>{'schools': instance.schools};

_RequestPasswordResetPayloadImpl _$RequestPasswordResetPayloadImplFromJson(
  Map<String, dynamic> json,
) => _RequestPasswordResetPayloadImpl(
  schoolId: json['school_id'] as String,
  identifier: json['identifier'] as String,
);

Map<String, dynamic> _$RequestPasswordResetPayloadImplToJson(
  _RequestPasswordResetPayloadImpl instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'identifier': instance.identifier,
};

_RequestPasswordResetResultImpl _$RequestPasswordResetResultImplFromJson(
  Map<String, dynamic> json,
) => _RequestPasswordResetResultImpl(resetToken: json['reset_token'] as String);

Map<String, dynamic> _$RequestPasswordResetResultImplToJson(
  _RequestPasswordResetResultImpl instance,
) => <String, dynamic>{'reset_token': instance.resetToken};

_ConfirmPasswordResetPayloadImpl _$ConfirmPasswordResetPayloadImplFromJson(
  Map<String, dynamic> json,
) => _ConfirmPasswordResetPayloadImpl(
  schoolId: json['school_id'] as String,
  identifier: json['identifier'] as String,
  token: json['token'] as String,
  newPassword: json['new_password'] as String,
);

Map<String, dynamic> _$ConfirmPasswordResetPayloadImplToJson(
  _ConfirmPasswordResetPayloadImpl instance,
) => <String, dynamic>{
  'school_id': instance.schoolId,
  'identifier': instance.identifier,
  'token': instance.token,
  'new_password': instance.newPassword,
};
