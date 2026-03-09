// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminAccount implements DiagnosticableTreeMixin {

 String get id; String? get profileId; AdminAccountRole get role; String get name; String get identifier; String get email; String? get phone; List<String> get departmentId; List<String> get department; List<String> get classId; List<String> get className; AdminAccountStatus get status; DateTime? get lastActiveAt; DateTime get createdAt;
/// Create a copy of AdminAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminAccountCopyWith<AdminAccount> get copyWith => _$AdminAccountCopyWithImpl<AdminAccount>(this as AdminAccount, _$identity);

  /// Serializes this AdminAccount to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AdminAccount'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('profileId', profileId))..add(DiagnosticsProperty('role', role))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('identifier', identifier))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('phone', phone))..add(DiagnosticsProperty('departmentId', departmentId))..add(DiagnosticsProperty('department', department))..add(DiagnosticsProperty('classId', classId))..add(DiagnosticsProperty('className', className))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('lastActiveAt', lastActiveAt))..add(DiagnosticsProperty('createdAt', createdAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.role, role) || other.role == role)&&(identical(other.name, name) || other.name == name)&&(identical(other.identifier, identifier) || other.identifier == identifier)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&const DeepCollectionEquality().equals(other.departmentId, departmentId)&&const DeepCollectionEquality().equals(other.department, department)&&const DeepCollectionEquality().equals(other.classId, classId)&&const DeepCollectionEquality().equals(other.className, className)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastActiveAt, lastActiveAt) || other.lastActiveAt == lastActiveAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,profileId,role,name,identifier,email,phone,const DeepCollectionEquality().hash(departmentId),const DeepCollectionEquality().hash(department),const DeepCollectionEquality().hash(classId),const DeepCollectionEquality().hash(className),status,lastActiveAt,createdAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AdminAccount(id: $id, profileId: $profileId, role: $role, name: $name, identifier: $identifier, email: $email, phone: $phone, departmentId: $departmentId, department: $department, classId: $classId, className: $className, status: $status, lastActiveAt: $lastActiveAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AdminAccountCopyWith<$Res>  {
  factory $AdminAccountCopyWith(AdminAccount value, $Res Function(AdminAccount) _then) = _$AdminAccountCopyWithImpl;
@useResult
$Res call({
 String id, String? profileId, AdminAccountRole role, String name, String identifier, String email, String? phone, List<String> departmentId, List<String> department, List<String> classId, List<String> className, AdminAccountStatus status, DateTime? lastActiveAt, DateTime createdAt
});




}
/// @nodoc
class _$AdminAccountCopyWithImpl<$Res>
    implements $AdminAccountCopyWith<$Res> {
  _$AdminAccountCopyWithImpl(this._self, this._then);

  final AdminAccount _self;
  final $Res Function(AdminAccount) _then;

/// Create a copy of AdminAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? profileId = freezed,Object? role = null,Object? name = null,Object? identifier = null,Object? email = null,Object? phone = freezed,Object? departmentId = null,Object? department = null,Object? classId = null,Object? className = null,Object? status = null,Object? lastActiveAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profileId: freezed == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AdminAccountRole,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,identifier: null == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as List<String>,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as List<String>,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as List<String>,className: null == className ? _self.className : className // ignore: cast_nullable_to_non_nullable
as List<String>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdminAccountStatus,lastActiveAt: freezed == lastActiveAt ? _self.lastActiveAt : lastActiveAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminAccount].
extension AdminAccountPatterns on AdminAccount {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminAccount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminAccount() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminAccount value)  $default,){
final _that = this;
switch (_that) {
case _AdminAccount():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminAccount value)?  $default,){
final _that = this;
switch (_that) {
case _AdminAccount() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? profileId,  AdminAccountRole role,  String name,  String identifier,  String email,  String? phone,  List<String> departmentId,  List<String> department,  List<String> classId,  List<String> className,  AdminAccountStatus status,  DateTime? lastActiveAt,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminAccount() when $default != null:
return $default(_that.id,_that.profileId,_that.role,_that.name,_that.identifier,_that.email,_that.phone,_that.departmentId,_that.department,_that.classId,_that.className,_that.status,_that.lastActiveAt,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? profileId,  AdminAccountRole role,  String name,  String identifier,  String email,  String? phone,  List<String> departmentId,  List<String> department,  List<String> classId,  List<String> className,  AdminAccountStatus status,  DateTime? lastActiveAt,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _AdminAccount():
return $default(_that.id,_that.profileId,_that.role,_that.name,_that.identifier,_that.email,_that.phone,_that.departmentId,_that.department,_that.classId,_that.className,_that.status,_that.lastActiveAt,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? profileId,  AdminAccountRole role,  String name,  String identifier,  String email,  String? phone,  List<String> departmentId,  List<String> department,  List<String> classId,  List<String> className,  AdminAccountStatus status,  DateTime? lastActiveAt,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AdminAccount() when $default != null:
return $default(_that.id,_that.profileId,_that.role,_that.name,_that.identifier,_that.email,_that.phone,_that.departmentId,_that.department,_that.classId,_that.className,_that.status,_that.lastActiveAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminAccount extends AdminAccount with DiagnosticableTreeMixin {
  const _AdminAccount({this.id = '', this.profileId, required this.role, this.name = '', this.identifier = '', this.email = '', this.phone, final  List<String> departmentId = const <String>[], final  List<String> department = const <String>[], final  List<String> classId = const <String>[], final  List<String> className = const <String>[], required this.status, this.lastActiveAt, required this.createdAt}): _departmentId = departmentId,_department = department,_classId = classId,_className = className,super._();
  factory _AdminAccount.fromJson(Map<String, dynamic> json) => _$AdminAccountFromJson(json);

@override@JsonKey() final  String id;
@override final  String? profileId;
@override final  AdminAccountRole role;
@override@JsonKey() final  String name;
@override@JsonKey() final  String identifier;
@override@JsonKey() final  String email;
@override final  String? phone;
 final  List<String> _departmentId;
@override@JsonKey() List<String> get departmentId {
  if (_departmentId is EqualUnmodifiableListView) return _departmentId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departmentId);
}

 final  List<String> _department;
@override@JsonKey() List<String> get department {
  if (_department is EqualUnmodifiableListView) return _department;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_department);
}

 final  List<String> _classId;
@override@JsonKey() List<String> get classId {
  if (_classId is EqualUnmodifiableListView) return _classId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_classId);
}

 final  List<String> _className;
@override@JsonKey() List<String> get className {
  if (_className is EqualUnmodifiableListView) return _className;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_className);
}

@override final  AdminAccountStatus status;
@override final  DateTime? lastActiveAt;
@override final  DateTime createdAt;

/// Create a copy of AdminAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminAccountCopyWith<_AdminAccount> get copyWith => __$AdminAccountCopyWithImpl<_AdminAccount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminAccountToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AdminAccount'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('profileId', profileId))..add(DiagnosticsProperty('role', role))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('identifier', identifier))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('phone', phone))..add(DiagnosticsProperty('departmentId', departmentId))..add(DiagnosticsProperty('department', department))..add(DiagnosticsProperty('classId', classId))..add(DiagnosticsProperty('className', className))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('lastActiveAt', lastActiveAt))..add(DiagnosticsProperty('createdAt', createdAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.role, role) || other.role == role)&&(identical(other.name, name) || other.name == name)&&(identical(other.identifier, identifier) || other.identifier == identifier)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&const DeepCollectionEquality().equals(other._departmentId, _departmentId)&&const DeepCollectionEquality().equals(other._department, _department)&&const DeepCollectionEquality().equals(other._classId, _classId)&&const DeepCollectionEquality().equals(other._className, _className)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastActiveAt, lastActiveAt) || other.lastActiveAt == lastActiveAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,profileId,role,name,identifier,email,phone,const DeepCollectionEquality().hash(_departmentId),const DeepCollectionEquality().hash(_department),const DeepCollectionEquality().hash(_classId),const DeepCollectionEquality().hash(_className),status,lastActiveAt,createdAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AdminAccount(id: $id, profileId: $profileId, role: $role, name: $name, identifier: $identifier, email: $email, phone: $phone, departmentId: $departmentId, department: $department, classId: $classId, className: $className, status: $status, lastActiveAt: $lastActiveAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AdminAccountCopyWith<$Res> implements $AdminAccountCopyWith<$Res> {
  factory _$AdminAccountCopyWith(_AdminAccount value, $Res Function(_AdminAccount) _then) = __$AdminAccountCopyWithImpl;
@override @useResult
$Res call({
 String id, String? profileId, AdminAccountRole role, String name, String identifier, String email, String? phone, List<String> departmentId, List<String> department, List<String> classId, List<String> className, AdminAccountStatus status, DateTime? lastActiveAt, DateTime createdAt
});




}
/// @nodoc
class __$AdminAccountCopyWithImpl<$Res>
    implements _$AdminAccountCopyWith<$Res> {
  __$AdminAccountCopyWithImpl(this._self, this._then);

  final _AdminAccount _self;
  final $Res Function(_AdminAccount) _then;

/// Create a copy of AdminAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? profileId = freezed,Object? role = null,Object? name = null,Object? identifier = null,Object? email = null,Object? phone = freezed,Object? departmentId = null,Object? department = null,Object? classId = null,Object? className = null,Object? status = null,Object? lastActiveAt = freezed,Object? createdAt = null,}) {
  return _then(_AdminAccount(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profileId: freezed == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AdminAccountRole,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,identifier: null == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,departmentId: null == departmentId ? _self._departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as List<String>,department: null == department ? _self._department : department // ignore: cast_nullable_to_non_nullable
as List<String>,classId: null == classId ? _self._classId : classId // ignore: cast_nullable_to_non_nullable
as List<String>,className: null == className ? _self._className : className // ignore: cast_nullable_to_non_nullable
as List<String>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdminAccountStatus,lastActiveAt: freezed == lastActiveAt ? _self.lastActiveAt : lastActiveAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$AdminAccountPage implements DiagnosticableTreeMixin {

 List<AdminAccount> get accounts; int get page; int get pageSize; int get total;
/// Create a copy of AdminAccountPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminAccountPageCopyWith<AdminAccountPage> get copyWith => _$AdminAccountPageCopyWithImpl<AdminAccountPage>(this as AdminAccountPage, _$identity);

  /// Serializes this AdminAccountPage to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AdminAccountPage'))
    ..add(DiagnosticsProperty('accounts', accounts))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('pageSize', pageSize))..add(DiagnosticsProperty('total', total));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminAccountPage&&const DeepCollectionEquality().equals(other.accounts, accounts)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(accounts),page,pageSize,total);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AdminAccountPage(accounts: $accounts, page: $page, pageSize: $pageSize, total: $total)';
}


}

/// @nodoc
abstract mixin class $AdminAccountPageCopyWith<$Res>  {
  factory $AdminAccountPageCopyWith(AdminAccountPage value, $Res Function(AdminAccountPage) _then) = _$AdminAccountPageCopyWithImpl;
@useResult
$Res call({
 List<AdminAccount> accounts, int page, int pageSize, int total
});




}
/// @nodoc
class _$AdminAccountPageCopyWithImpl<$Res>
    implements $AdminAccountPageCopyWith<$Res> {
  _$AdminAccountPageCopyWithImpl(this._self, this._then);

  final AdminAccountPage _self;
  final $Res Function(AdminAccountPage) _then;

/// Create a copy of AdminAccountPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accounts = null,Object? page = null,Object? pageSize = null,Object? total = null,}) {
  return _then(_self.copyWith(
accounts: null == accounts ? _self.accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<AdminAccount>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminAccountPage].
extension AdminAccountPagePatterns on AdminAccountPage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminAccountPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminAccountPage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminAccountPage value)  $default,){
final _that = this;
switch (_that) {
case _AdminAccountPage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminAccountPage value)?  $default,){
final _that = this;
switch (_that) {
case _AdminAccountPage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AdminAccount> accounts,  int page,  int pageSize,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminAccountPage() when $default != null:
return $default(_that.accounts,_that.page,_that.pageSize,_that.total);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AdminAccount> accounts,  int page,  int pageSize,  int total)  $default,) {final _that = this;
switch (_that) {
case _AdminAccountPage():
return $default(_that.accounts,_that.page,_that.pageSize,_that.total);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AdminAccount> accounts,  int page,  int pageSize,  int total)?  $default,) {final _that = this;
switch (_that) {
case _AdminAccountPage() when $default != null:
return $default(_that.accounts,_that.page,_that.pageSize,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminAccountPage extends AdminAccountPage with DiagnosticableTreeMixin {
  const _AdminAccountPage({final  List<AdminAccount> accounts = const [], this.page = 1, this.pageSize = 0, this.total = 0}): _accounts = accounts,super._();
  factory _AdminAccountPage.fromJson(Map<String, dynamic> json) => _$AdminAccountPageFromJson(json);

 final  List<AdminAccount> _accounts;
@override@JsonKey() List<AdminAccount> get accounts {
  if (_accounts is EqualUnmodifiableListView) return _accounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accounts);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int pageSize;
@override@JsonKey() final  int total;

/// Create a copy of AdminAccountPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminAccountPageCopyWith<_AdminAccountPage> get copyWith => __$AdminAccountPageCopyWithImpl<_AdminAccountPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminAccountPageToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AdminAccountPage'))
    ..add(DiagnosticsProperty('accounts', accounts))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('pageSize', pageSize))..add(DiagnosticsProperty('total', total));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminAccountPage&&const DeepCollectionEquality().equals(other._accounts, _accounts)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_accounts),page,pageSize,total);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AdminAccountPage(accounts: $accounts, page: $page, pageSize: $pageSize, total: $total)';
}


}

/// @nodoc
abstract mixin class _$AdminAccountPageCopyWith<$Res> implements $AdminAccountPageCopyWith<$Res> {
  factory _$AdminAccountPageCopyWith(_AdminAccountPage value, $Res Function(_AdminAccountPage) _then) = __$AdminAccountPageCopyWithImpl;
@override @useResult
$Res call({
 List<AdminAccount> accounts, int page, int pageSize, int total
});




}
/// @nodoc
class __$AdminAccountPageCopyWithImpl<$Res>
    implements _$AdminAccountPageCopyWith<$Res> {
  __$AdminAccountPageCopyWithImpl(this._self, this._then);

  final _AdminAccountPage _self;
  final $Res Function(_AdminAccountPage) _then;

/// Create a copy of AdminAccountPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accounts = null,Object? page = null,Object? pageSize = null,Object? total = null,}) {
  return _then(_AdminAccountPage(
accounts: null == accounts ? _self._accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<AdminAccount>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
