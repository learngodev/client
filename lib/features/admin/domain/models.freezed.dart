// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Department implements DiagnosticableTreeMixin {

 String get id; String get schoolId; String get name; int get teacherCount; int get studentCount;
/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentCopyWith<Department> get copyWith => _$DepartmentCopyWithImpl<Department>(this as Department, _$identity);

  /// Serializes this Department to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Department'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('schoolId', schoolId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('teacherCount', teacherCount))..add(DiagnosticsProperty('studentCount', studentCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Department&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.teacherCount, teacherCount) || other.teacherCount == teacherCount)&&(identical(other.studentCount, studentCount) || other.studentCount == studentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,name,teacherCount,studentCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Department(id: $id, schoolId: $schoolId, name: $name, teacherCount: $teacherCount, studentCount: $studentCount)';
}


}

/// @nodoc
abstract mixin class $DepartmentCopyWith<$Res>  {
  factory $DepartmentCopyWith(Department value, $Res Function(Department) _then) = _$DepartmentCopyWithImpl;
@useResult
$Res call({
 String id, String schoolId, String name, int teacherCount, int studentCount
});




}
/// @nodoc
class _$DepartmentCopyWithImpl<$Res>
    implements $DepartmentCopyWith<$Res> {
  _$DepartmentCopyWithImpl(this._self, this._then);

  final Department _self;
  final $Res Function(Department) _then;

/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? schoolId = null,Object? name = null,Object? teacherCount = null,Object? studentCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,teacherCount: null == teacherCount ? _self.teacherCount : teacherCount // ignore: cast_nullable_to_non_nullable
as int,studentCount: null == studentCount ? _self.studentCount : studentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Department].
extension DepartmentPatterns on Department {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Department value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Department() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Department value)  $default,){
final _that = this;
switch (_that) {
case _Department():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Department value)?  $default,){
final _that = this;
switch (_that) {
case _Department() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String schoolId,  String name,  int teacherCount,  int studentCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Department() when $default != null:
return $default(_that.id,_that.schoolId,_that.name,_that.teacherCount,_that.studentCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String schoolId,  String name,  int teacherCount,  int studentCount)  $default,) {final _that = this;
switch (_that) {
case _Department():
return $default(_that.id,_that.schoolId,_that.name,_that.teacherCount,_that.studentCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String schoolId,  String name,  int teacherCount,  int studentCount)?  $default,) {final _that = this;
switch (_that) {
case _Department() when $default != null:
return $default(_that.id,_that.schoolId,_that.name,_that.teacherCount,_that.studentCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Department extends Department with DiagnosticableTreeMixin {
  const _Department({this.id = '', this.schoolId = '', this.name = '', this.teacherCount = 0, this.studentCount = 0}): super._();
  factory _Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String schoolId;
@override@JsonKey() final  String name;
@override@JsonKey() final  int teacherCount;
@override@JsonKey() final  int studentCount;

/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentCopyWith<_Department> get copyWith => __$DepartmentCopyWithImpl<_Department>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartmentToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Department'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('schoolId', schoolId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('teacherCount', teacherCount))..add(DiagnosticsProperty('studentCount', studentCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Department&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.teacherCount, teacherCount) || other.teacherCount == teacherCount)&&(identical(other.studentCount, studentCount) || other.studentCount == studentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,name,teacherCount,studentCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Department(id: $id, schoolId: $schoolId, name: $name, teacherCount: $teacherCount, studentCount: $studentCount)';
}


}

/// @nodoc
abstract mixin class _$DepartmentCopyWith<$Res> implements $DepartmentCopyWith<$Res> {
  factory _$DepartmentCopyWith(_Department value, $Res Function(_Department) _then) = __$DepartmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String schoolId, String name, int teacherCount, int studentCount
});




}
/// @nodoc
class __$DepartmentCopyWithImpl<$Res>
    implements _$DepartmentCopyWith<$Res> {
  __$DepartmentCopyWithImpl(this._self, this._then);

  final _Department _self;
  final $Res Function(_Department) _then;

/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? schoolId = null,Object? name = null,Object? teacherCount = null,Object? studentCount = null,}) {
  return _then(_Department(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,teacherCount: null == teacherCount ? _self.teacherCount : teacherCount // ignore: cast_nullable_to_non_nullable
as int,studentCount: null == studentCount ? _self.studentCount : studentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ClassInfo implements DiagnosticableTreeMixin {

 String get id; String get departmentId; String get name; String? get grade; String? get description; int get studentCount; int get teacherCount;
/// Create a copy of ClassInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClassInfoCopyWith<ClassInfo> get copyWith => _$ClassInfoCopyWithImpl<ClassInfo>(this as ClassInfo, _$identity);

  /// Serializes this ClassInfo to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ClassInfo'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('departmentId', departmentId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('grade', grade))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('studentCount', studentCount))..add(DiagnosticsProperty('teacherCount', teacherCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClassInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.description, description) || other.description == description)&&(identical(other.studentCount, studentCount) || other.studentCount == studentCount)&&(identical(other.teacherCount, teacherCount) || other.teacherCount == teacherCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,departmentId,name,grade,description,studentCount,teacherCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ClassInfo(id: $id, departmentId: $departmentId, name: $name, grade: $grade, description: $description, studentCount: $studentCount, teacherCount: $teacherCount)';
}


}

/// @nodoc
abstract mixin class $ClassInfoCopyWith<$Res>  {
  factory $ClassInfoCopyWith(ClassInfo value, $Res Function(ClassInfo) _then) = _$ClassInfoCopyWithImpl;
@useResult
$Res call({
 String id, String departmentId, String name, String? grade, String? description, int studentCount, int teacherCount
});




}
/// @nodoc
class _$ClassInfoCopyWithImpl<$Res>
    implements $ClassInfoCopyWith<$Res> {
  _$ClassInfoCopyWithImpl(this._self, this._then);

  final ClassInfo _self;
  final $Res Function(ClassInfo) _then;

/// Create a copy of ClassInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? departmentId = null,Object? name = null,Object? grade = freezed,Object? description = freezed,Object? studentCount = null,Object? teacherCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,studentCount: null == studentCount ? _self.studentCount : studentCount // ignore: cast_nullable_to_non_nullable
as int,teacherCount: null == teacherCount ? _self.teacherCount : teacherCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ClassInfo].
extension ClassInfoPatterns on ClassInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClassInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClassInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClassInfo value)  $default,){
final _that = this;
switch (_that) {
case _ClassInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClassInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ClassInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String departmentId,  String name,  String? grade,  String? description,  int studentCount,  int teacherCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClassInfo() when $default != null:
return $default(_that.id,_that.departmentId,_that.name,_that.grade,_that.description,_that.studentCount,_that.teacherCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String departmentId,  String name,  String? grade,  String? description,  int studentCount,  int teacherCount)  $default,) {final _that = this;
switch (_that) {
case _ClassInfo():
return $default(_that.id,_that.departmentId,_that.name,_that.grade,_that.description,_that.studentCount,_that.teacherCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String departmentId,  String name,  String? grade,  String? description,  int studentCount,  int teacherCount)?  $default,) {final _that = this;
switch (_that) {
case _ClassInfo() when $default != null:
return $default(_that.id,_that.departmentId,_that.name,_that.grade,_that.description,_that.studentCount,_that.teacherCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClassInfo extends ClassInfo with DiagnosticableTreeMixin {
  const _ClassInfo({this.id = '', this.departmentId = '', this.name = '', this.grade, this.description, this.studentCount = 0, this.teacherCount = 0}): super._();
  factory _ClassInfo.fromJson(Map<String, dynamic> json) => _$ClassInfoFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String departmentId;
@override@JsonKey() final  String name;
@override final  String? grade;
@override final  String? description;
@override@JsonKey() final  int studentCount;
@override@JsonKey() final  int teacherCount;

/// Create a copy of ClassInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClassInfoCopyWith<_ClassInfo> get copyWith => __$ClassInfoCopyWithImpl<_ClassInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClassInfoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ClassInfo'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('departmentId', departmentId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('grade', grade))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('studentCount', studentCount))..add(DiagnosticsProperty('teacherCount', teacherCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClassInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.description, description) || other.description == description)&&(identical(other.studentCount, studentCount) || other.studentCount == studentCount)&&(identical(other.teacherCount, teacherCount) || other.teacherCount == teacherCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,departmentId,name,grade,description,studentCount,teacherCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ClassInfo(id: $id, departmentId: $departmentId, name: $name, grade: $grade, description: $description, studentCount: $studentCount, teacherCount: $teacherCount)';
}


}

/// @nodoc
abstract mixin class _$ClassInfoCopyWith<$Res> implements $ClassInfoCopyWith<$Res> {
  factory _$ClassInfoCopyWith(_ClassInfo value, $Res Function(_ClassInfo) _then) = __$ClassInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String departmentId, String name, String? grade, String? description, int studentCount, int teacherCount
});




}
/// @nodoc
class __$ClassInfoCopyWithImpl<$Res>
    implements _$ClassInfoCopyWith<$Res> {
  __$ClassInfoCopyWithImpl(this._self, this._then);

  final _ClassInfo _self;
  final $Res Function(_ClassInfo) _then;

/// Create a copy of ClassInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? departmentId = null,Object? name = null,Object? grade = freezed,Object? description = freezed,Object? studentCount = null,Object? teacherCount = null,}) {
  return _then(_ClassInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,studentCount: null == studentCount ? _self.studentCount : studentCount // ignore: cast_nullable_to_non_nullable
as int,teacherCount: null == teacherCount ? _self.teacherCount : teacherCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$DepartmentNode implements DiagnosticableTreeMixin {

 Department get department; List<ClassInfo> get classes;
/// Create a copy of DepartmentNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentNodeCopyWith<DepartmentNode> get copyWith => _$DepartmentNodeCopyWithImpl<DepartmentNode>(this as DepartmentNode, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DepartmentNode'))
    ..add(DiagnosticsProperty('department', department))..add(DiagnosticsProperty('classes', classes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentNode&&(identical(other.department, department) || other.department == department)&&const DeepCollectionEquality().equals(other.classes, classes));
}


@override
int get hashCode => Object.hash(runtimeType,department,const DeepCollectionEquality().hash(classes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DepartmentNode(department: $department, classes: $classes)';
}


}

/// @nodoc
abstract mixin class $DepartmentNodeCopyWith<$Res>  {
  factory $DepartmentNodeCopyWith(DepartmentNode value, $Res Function(DepartmentNode) _then) = _$DepartmentNodeCopyWithImpl;
@useResult
$Res call({
 Department department, List<ClassInfo> classes
});


$DepartmentCopyWith<$Res> get department;

}
/// @nodoc
class _$DepartmentNodeCopyWithImpl<$Res>
    implements $DepartmentNodeCopyWith<$Res> {
  _$DepartmentNodeCopyWithImpl(this._self, this._then);

  final DepartmentNode _self;
  final $Res Function(DepartmentNode) _then;

/// Create a copy of DepartmentNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? department = null,Object? classes = null,}) {
  return _then(_self.copyWith(
department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as Department,classes: null == classes ? _self.classes : classes // ignore: cast_nullable_to_non_nullable
as List<ClassInfo>,
  ));
}
/// Create a copy of DepartmentNode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DepartmentCopyWith<$Res> get department {
  
  return $DepartmentCopyWith<$Res>(_self.department, (value) {
    return _then(_self.copyWith(department: value));
  });
}
}


/// Adds pattern-matching-related methods to [DepartmentNode].
extension DepartmentNodePatterns on DepartmentNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepartmentNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepartmentNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepartmentNode value)  $default,){
final _that = this;
switch (_that) {
case _DepartmentNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepartmentNode value)?  $default,){
final _that = this;
switch (_that) {
case _DepartmentNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Department department,  List<ClassInfo> classes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepartmentNode() when $default != null:
return $default(_that.department,_that.classes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Department department,  List<ClassInfo> classes)  $default,) {final _that = this;
switch (_that) {
case _DepartmentNode():
return $default(_that.department,_that.classes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Department department,  List<ClassInfo> classes)?  $default,) {final _that = this;
switch (_that) {
case _DepartmentNode() when $default != null:
return $default(_that.department,_that.classes);case _:
  return null;

}
}

}

/// @nodoc


class _DepartmentNode extends DepartmentNode with DiagnosticableTreeMixin {
  const _DepartmentNode({required this.department, required final  List<ClassInfo> classes}): _classes = classes,super._();
  

@override final  Department department;
 final  List<ClassInfo> _classes;
@override List<ClassInfo> get classes {
  if (_classes is EqualUnmodifiableListView) return _classes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_classes);
}


/// Create a copy of DepartmentNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentNodeCopyWith<_DepartmentNode> get copyWith => __$DepartmentNodeCopyWithImpl<_DepartmentNode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DepartmentNode'))
    ..add(DiagnosticsProperty('department', department))..add(DiagnosticsProperty('classes', classes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartmentNode&&(identical(other.department, department) || other.department == department)&&const DeepCollectionEquality().equals(other._classes, _classes));
}


@override
int get hashCode => Object.hash(runtimeType,department,const DeepCollectionEquality().hash(_classes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DepartmentNode(department: $department, classes: $classes)';
}


}

/// @nodoc
abstract mixin class _$DepartmentNodeCopyWith<$Res> implements $DepartmentNodeCopyWith<$Res> {
  factory _$DepartmentNodeCopyWith(_DepartmentNode value, $Res Function(_DepartmentNode) _then) = __$DepartmentNodeCopyWithImpl;
@override @useResult
$Res call({
 Department department, List<ClassInfo> classes
});


@override $DepartmentCopyWith<$Res> get department;

}
/// @nodoc
class __$DepartmentNodeCopyWithImpl<$Res>
    implements _$DepartmentNodeCopyWith<$Res> {
  __$DepartmentNodeCopyWithImpl(this._self, this._then);

  final _DepartmentNode _self;
  final $Res Function(_DepartmentNode) _then;

/// Create a copy of DepartmentNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? department = null,Object? classes = null,}) {
  return _then(_DepartmentNode(
department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as Department,classes: null == classes ? _self._classes : classes // ignore: cast_nullable_to_non_nullable
as List<ClassInfo>,
  ));
}

/// Create a copy of DepartmentNode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DepartmentCopyWith<$Res> get department {
  
  return $DepartmentCopyWith<$Res>(_self.department, (value) {
    return _then(_self.copyWith(department: value));
  });
}
}


/// @nodoc
mixin _$AdminDepartmentMetrics implements DiagnosticableTreeMixin {

 int get departmentCount; int get classCount; int get emptyDepartmentCount;
/// Create a copy of AdminDepartmentMetrics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminDepartmentMetricsCopyWith<AdminDepartmentMetrics> get copyWith => _$AdminDepartmentMetricsCopyWithImpl<AdminDepartmentMetrics>(this as AdminDepartmentMetrics, _$identity);

  /// Serializes this AdminDepartmentMetrics to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AdminDepartmentMetrics'))
    ..add(DiagnosticsProperty('departmentCount', departmentCount))..add(DiagnosticsProperty('classCount', classCount))..add(DiagnosticsProperty('emptyDepartmentCount', emptyDepartmentCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminDepartmentMetrics&&(identical(other.departmentCount, departmentCount) || other.departmentCount == departmentCount)&&(identical(other.classCount, classCount) || other.classCount == classCount)&&(identical(other.emptyDepartmentCount, emptyDepartmentCount) || other.emptyDepartmentCount == emptyDepartmentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,departmentCount,classCount,emptyDepartmentCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AdminDepartmentMetrics(departmentCount: $departmentCount, classCount: $classCount, emptyDepartmentCount: $emptyDepartmentCount)';
}


}

/// @nodoc
abstract mixin class $AdminDepartmentMetricsCopyWith<$Res>  {
  factory $AdminDepartmentMetricsCopyWith(AdminDepartmentMetrics value, $Res Function(AdminDepartmentMetrics) _then) = _$AdminDepartmentMetricsCopyWithImpl;
@useResult
$Res call({
 int departmentCount, int classCount, int emptyDepartmentCount
});




}
/// @nodoc
class _$AdminDepartmentMetricsCopyWithImpl<$Res>
    implements $AdminDepartmentMetricsCopyWith<$Res> {
  _$AdminDepartmentMetricsCopyWithImpl(this._self, this._then);

  final AdminDepartmentMetrics _self;
  final $Res Function(AdminDepartmentMetrics) _then;

/// Create a copy of AdminDepartmentMetrics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? departmentCount = null,Object? classCount = null,Object? emptyDepartmentCount = null,}) {
  return _then(_self.copyWith(
departmentCount: null == departmentCount ? _self.departmentCount : departmentCount // ignore: cast_nullable_to_non_nullable
as int,classCount: null == classCount ? _self.classCount : classCount // ignore: cast_nullable_to_non_nullable
as int,emptyDepartmentCount: null == emptyDepartmentCount ? _self.emptyDepartmentCount : emptyDepartmentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminDepartmentMetrics].
extension AdminDepartmentMetricsPatterns on AdminDepartmentMetrics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminDepartmentMetrics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminDepartmentMetrics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminDepartmentMetrics value)  $default,){
final _that = this;
switch (_that) {
case _AdminDepartmentMetrics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminDepartmentMetrics value)?  $default,){
final _that = this;
switch (_that) {
case _AdminDepartmentMetrics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int departmentCount,  int classCount,  int emptyDepartmentCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminDepartmentMetrics() when $default != null:
return $default(_that.departmentCount,_that.classCount,_that.emptyDepartmentCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int departmentCount,  int classCount,  int emptyDepartmentCount)  $default,) {final _that = this;
switch (_that) {
case _AdminDepartmentMetrics():
return $default(_that.departmentCount,_that.classCount,_that.emptyDepartmentCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int departmentCount,  int classCount,  int emptyDepartmentCount)?  $default,) {final _that = this;
switch (_that) {
case _AdminDepartmentMetrics() when $default != null:
return $default(_that.departmentCount,_that.classCount,_that.emptyDepartmentCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminDepartmentMetrics extends AdminDepartmentMetrics with DiagnosticableTreeMixin {
  const _AdminDepartmentMetrics({required this.departmentCount, required this.classCount, required this.emptyDepartmentCount}): super._();
  factory _AdminDepartmentMetrics.fromJson(Map<String, dynamic> json) => _$AdminDepartmentMetricsFromJson(json);

@override final  int departmentCount;
@override final  int classCount;
@override final  int emptyDepartmentCount;

/// Create a copy of AdminDepartmentMetrics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminDepartmentMetricsCopyWith<_AdminDepartmentMetrics> get copyWith => __$AdminDepartmentMetricsCopyWithImpl<_AdminDepartmentMetrics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminDepartmentMetricsToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AdminDepartmentMetrics'))
    ..add(DiagnosticsProperty('departmentCount', departmentCount))..add(DiagnosticsProperty('classCount', classCount))..add(DiagnosticsProperty('emptyDepartmentCount', emptyDepartmentCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminDepartmentMetrics&&(identical(other.departmentCount, departmentCount) || other.departmentCount == departmentCount)&&(identical(other.classCount, classCount) || other.classCount == classCount)&&(identical(other.emptyDepartmentCount, emptyDepartmentCount) || other.emptyDepartmentCount == emptyDepartmentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,departmentCount,classCount,emptyDepartmentCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AdminDepartmentMetrics(departmentCount: $departmentCount, classCount: $classCount, emptyDepartmentCount: $emptyDepartmentCount)';
}


}

/// @nodoc
abstract mixin class _$AdminDepartmentMetricsCopyWith<$Res> implements $AdminDepartmentMetricsCopyWith<$Res> {
  factory _$AdminDepartmentMetricsCopyWith(_AdminDepartmentMetrics value, $Res Function(_AdminDepartmentMetrics) _then) = __$AdminDepartmentMetricsCopyWithImpl;
@override @useResult
$Res call({
 int departmentCount, int classCount, int emptyDepartmentCount
});




}
/// @nodoc
class __$AdminDepartmentMetricsCopyWithImpl<$Res>
    implements _$AdminDepartmentMetricsCopyWith<$Res> {
  __$AdminDepartmentMetricsCopyWithImpl(this._self, this._then);

  final _AdminDepartmentMetrics _self;
  final $Res Function(_AdminDepartmentMetrics) _then;

/// Create a copy of AdminDepartmentMetrics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? departmentCount = null,Object? classCount = null,Object? emptyDepartmentCount = null,}) {
  return _then(_AdminDepartmentMetrics(
departmentCount: null == departmentCount ? _self.departmentCount : departmentCount // ignore: cast_nullable_to_non_nullable
as int,classCount: null == classCount ? _self.classCount : classCount // ignore: cast_nullable_to_non_nullable
as int,emptyDepartmentCount: null == emptyDepartmentCount ? _self.emptyDepartmentCount : emptyDepartmentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
