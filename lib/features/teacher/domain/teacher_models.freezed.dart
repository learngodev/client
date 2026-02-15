// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeacherCourse {

 String get id; String get name; String get description; String? get imageUrl; String? get invitationCode;
/// Create a copy of TeacherCourse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherCourseCopyWith<TeacherCourse> get copyWith => _$TeacherCourseCopyWithImpl<TeacherCourse>(this as TeacherCourse, _$identity);

  /// Serializes this TeacherCourse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherCourse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.invitationCode, invitationCode) || other.invitationCode == invitationCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,imageUrl,invitationCode);

@override
String toString() {
  return 'TeacherCourse(id: $id, name: $name, description: $description, imageUrl: $imageUrl, invitationCode: $invitationCode)';
}


}

/// @nodoc
abstract mixin class $TeacherCourseCopyWith<$Res>  {
  factory $TeacherCourseCopyWith(TeacherCourse value, $Res Function(TeacherCourse) _then) = _$TeacherCourseCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String? imageUrl, String? invitationCode
});




}
/// @nodoc
class _$TeacherCourseCopyWithImpl<$Res>
    implements $TeacherCourseCopyWith<$Res> {
  _$TeacherCourseCopyWithImpl(this._self, this._then);

  final TeacherCourse _self;
  final $Res Function(TeacherCourse) _then;

/// Create a copy of TeacherCourse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? imageUrl = freezed,Object? invitationCode = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,invitationCode: freezed == invitationCode ? _self.invitationCode : invitationCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherCourse].
extension TeacherCoursePatterns on TeacherCourse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherCourse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherCourse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherCourse value)  $default,){
final _that = this;
switch (_that) {
case _TeacherCourse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherCourse value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherCourse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String? imageUrl,  String? invitationCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherCourse() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.invitationCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String? imageUrl,  String? invitationCode)  $default,) {final _that = this;
switch (_that) {
case _TeacherCourse():
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.invitationCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String? imageUrl,  String? invitationCode)?  $default,) {final _that = this;
switch (_that) {
case _TeacherCourse() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.invitationCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherCourse implements TeacherCourse {
  const _TeacherCourse({this.id = '', this.name = '', this.description = '', this.imageUrl, this.invitationCode});
  factory _TeacherCourse.fromJson(Map<String, dynamic> json) => _$TeacherCourseFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
@override final  String? imageUrl;
@override final  String? invitationCode;

/// Create a copy of TeacherCourse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherCourseCopyWith<_TeacherCourse> get copyWith => __$TeacherCourseCopyWithImpl<_TeacherCourse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherCourseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherCourse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.invitationCode, invitationCode) || other.invitationCode == invitationCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,imageUrl,invitationCode);

@override
String toString() {
  return 'TeacherCourse(id: $id, name: $name, description: $description, imageUrl: $imageUrl, invitationCode: $invitationCode)';
}


}

/// @nodoc
abstract mixin class _$TeacherCourseCopyWith<$Res> implements $TeacherCourseCopyWith<$Res> {
  factory _$TeacherCourseCopyWith(_TeacherCourse value, $Res Function(_TeacherCourse) _then) = __$TeacherCourseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String? imageUrl, String? invitationCode
});




}
/// @nodoc
class __$TeacherCourseCopyWithImpl<$Res>
    implements _$TeacherCourseCopyWith<$Res> {
  __$TeacherCourseCopyWithImpl(this._self, this._then);

  final _TeacherCourse _self;
  final $Res Function(_TeacherCourse) _then;

/// Create a copy of TeacherCourse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? imageUrl = freezed,Object? invitationCode = freezed,}) {
  return _then(_TeacherCourse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,invitationCode: freezed == invitationCode ? _self.invitationCode : invitationCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TeacherStudent {

 String get id; String get name; String get number; String get email;
/// Create a copy of TeacherStudent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherStudentCopyWith<TeacherStudent> get copyWith => _$TeacherStudentCopyWithImpl<TeacherStudent>(this as TeacherStudent, _$identity);

  /// Serializes this TeacherStudent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherStudent&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,number,email);

@override
String toString() {
  return 'TeacherStudent(id: $id, name: $name, number: $number, email: $email)';
}


}

/// @nodoc
abstract mixin class $TeacherStudentCopyWith<$Res>  {
  factory $TeacherStudentCopyWith(TeacherStudent value, $Res Function(TeacherStudent) _then) = _$TeacherStudentCopyWithImpl;
@useResult
$Res call({
 String id, String name, String number, String email
});




}
/// @nodoc
class _$TeacherStudentCopyWithImpl<$Res>
    implements $TeacherStudentCopyWith<$Res> {
  _$TeacherStudentCopyWithImpl(this._self, this._then);

  final TeacherStudent _self;
  final $Res Function(TeacherStudent) _then;

/// Create a copy of TeacherStudent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? number = null,Object? email = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherStudent].
extension TeacherStudentPatterns on TeacherStudent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherStudent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherStudent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherStudent value)  $default,){
final _that = this;
switch (_that) {
case _TeacherStudent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherStudent value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherStudent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String number,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherStudent() when $default != null:
return $default(_that.id,_that.name,_that.number,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String number,  String email)  $default,) {final _that = this;
switch (_that) {
case _TeacherStudent():
return $default(_that.id,_that.name,_that.number,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String number,  String email)?  $default,) {final _that = this;
switch (_that) {
case _TeacherStudent() when $default != null:
return $default(_that.id,_that.name,_that.number,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherStudent implements TeacherStudent {
  const _TeacherStudent({this.id = '', this.name = 'Unknown', this.number = '', this.email = ''});
  factory _TeacherStudent.fromJson(Map<String, dynamic> json) => _$TeacherStudentFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String number;
@override@JsonKey() final  String email;

/// Create a copy of TeacherStudent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherStudentCopyWith<_TeacherStudent> get copyWith => __$TeacherStudentCopyWithImpl<_TeacherStudent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherStudentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherStudent&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,number,email);

@override
String toString() {
  return 'TeacherStudent(id: $id, name: $name, number: $number, email: $email)';
}


}

/// @nodoc
abstract mixin class _$TeacherStudentCopyWith<$Res> implements $TeacherStudentCopyWith<$Res> {
  factory _$TeacherStudentCopyWith(_TeacherStudent value, $Res Function(_TeacherStudent) _then) = __$TeacherStudentCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String number, String email
});




}
/// @nodoc
class __$TeacherStudentCopyWithImpl<$Res>
    implements _$TeacherStudentCopyWith<$Res> {
  __$TeacherStudentCopyWithImpl(this._self, this._then);

  final _TeacherStudent _self;
  final $Res Function(_TeacherStudent) _then;

/// Create a copy of TeacherStudent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? number = null,Object? email = null,}) {
  return _then(_TeacherStudent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TeacherClass {

 String get id; String get name; String? get courseId; String? get courseName;
/// Create a copy of TeacherClass
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherClassCopyWith<TeacherClass> get copyWith => _$TeacherClassCopyWithImpl<TeacherClass>(this as TeacherClass, _$identity);

  /// Serializes this TeacherClass to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherClass&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.courseName, courseName) || other.courseName == courseName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,courseId,courseName);

@override
String toString() {
  return 'TeacherClass(id: $id, name: $name, courseId: $courseId, courseName: $courseName)';
}


}

/// @nodoc
abstract mixin class $TeacherClassCopyWith<$Res>  {
  factory $TeacherClassCopyWith(TeacherClass value, $Res Function(TeacherClass) _then) = _$TeacherClassCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? courseId, String? courseName
});




}
/// @nodoc
class _$TeacherClassCopyWithImpl<$Res>
    implements $TeacherClassCopyWith<$Res> {
  _$TeacherClassCopyWithImpl(this._self, this._then);

  final TeacherClass _self;
  final $Res Function(TeacherClass) _then;

/// Create a copy of TeacherClass
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? courseId = freezed,Object? courseName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,courseName: freezed == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherClass].
extension TeacherClassPatterns on TeacherClass {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherClass value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherClass() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherClass value)  $default,){
final _that = this;
switch (_that) {
case _TeacherClass():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherClass value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherClass() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? courseId,  String? courseName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherClass() when $default != null:
return $default(_that.id,_that.name,_that.courseId,_that.courseName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? courseId,  String? courseName)  $default,) {final _that = this;
switch (_that) {
case _TeacherClass():
return $default(_that.id,_that.name,_that.courseId,_that.courseName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? courseId,  String? courseName)?  $default,) {final _that = this;
switch (_that) {
case _TeacherClass() when $default != null:
return $default(_that.id,_that.name,_that.courseId,_that.courseName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherClass implements TeacherClass {
  const _TeacherClass({this.id = '', this.name = '', this.courseId, this.courseName});
  factory _TeacherClass.fromJson(Map<String, dynamic> json) => _$TeacherClassFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override final  String? courseId;
@override final  String? courseName;

/// Create a copy of TeacherClass
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherClassCopyWith<_TeacherClass> get copyWith => __$TeacherClassCopyWithImpl<_TeacherClass>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherClassToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherClass&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.courseName, courseName) || other.courseName == courseName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,courseId,courseName);

@override
String toString() {
  return 'TeacherClass(id: $id, name: $name, courseId: $courseId, courseName: $courseName)';
}


}

/// @nodoc
abstract mixin class _$TeacherClassCopyWith<$Res> implements $TeacherClassCopyWith<$Res> {
  factory _$TeacherClassCopyWith(_TeacherClass value, $Res Function(_TeacherClass) _then) = __$TeacherClassCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? courseId, String? courseName
});




}
/// @nodoc
class __$TeacherClassCopyWithImpl<$Res>
    implements _$TeacherClassCopyWith<$Res> {
  __$TeacherClassCopyWithImpl(this._self, this._then);

  final _TeacherClass _self;
  final $Res Function(_TeacherClass) _then;

/// Create a copy of TeacherClass
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? courseId = freezed,Object? courseName = freezed,}) {
  return _then(_TeacherClass(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,courseName: freezed == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TeacherAssignment {

 String get id; String get title; String get courseName; String get className; int get submissionCount; int get submittedCount; int get gradedCount; int get pendingGradeCount; DateTime? get dueAt; int get classStudentCount;
/// Create a copy of TeacherAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherAssignmentCopyWith<TeacherAssignment> get copyWith => _$TeacherAssignmentCopyWithImpl<TeacherAssignment>(this as TeacherAssignment, _$identity);

  /// Serializes this TeacherAssignment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.className, className) || other.className == className)&&(identical(other.submissionCount, submissionCount) || other.submissionCount == submissionCount)&&(identical(other.submittedCount, submittedCount) || other.submittedCount == submittedCount)&&(identical(other.gradedCount, gradedCount) || other.gradedCount == gradedCount)&&(identical(other.pendingGradeCount, pendingGradeCount) || other.pendingGradeCount == pendingGradeCount)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&(identical(other.classStudentCount, classStudentCount) || other.classStudentCount == classStudentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,courseName,className,submissionCount,submittedCount,gradedCount,pendingGradeCount,dueAt,classStudentCount);

@override
String toString() {
  return 'TeacherAssignment(id: $id, title: $title, courseName: $courseName, className: $className, submissionCount: $submissionCount, submittedCount: $submittedCount, gradedCount: $gradedCount, pendingGradeCount: $pendingGradeCount, dueAt: $dueAt, classStudentCount: $classStudentCount)';
}


}

/// @nodoc
abstract mixin class $TeacherAssignmentCopyWith<$Res>  {
  factory $TeacherAssignmentCopyWith(TeacherAssignment value, $Res Function(TeacherAssignment) _then) = _$TeacherAssignmentCopyWithImpl;
@useResult
$Res call({
 String id, String title, String courseName, String className, int submissionCount, int submittedCount, int gradedCount, int pendingGradeCount, DateTime? dueAt, int classStudentCount
});




}
/// @nodoc
class _$TeacherAssignmentCopyWithImpl<$Res>
    implements $TeacherAssignmentCopyWith<$Res> {
  _$TeacherAssignmentCopyWithImpl(this._self, this._then);

  final TeacherAssignment _self;
  final $Res Function(TeacherAssignment) _then;

/// Create a copy of TeacherAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? courseName = null,Object? className = null,Object? submissionCount = null,Object? submittedCount = null,Object? gradedCount = null,Object? pendingGradeCount = null,Object? dueAt = freezed,Object? classStudentCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,courseName: null == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String,className: null == className ? _self.className : className // ignore: cast_nullable_to_non_nullable
as String,submissionCount: null == submissionCount ? _self.submissionCount : submissionCount // ignore: cast_nullable_to_non_nullable
as int,submittedCount: null == submittedCount ? _self.submittedCount : submittedCount // ignore: cast_nullable_to_non_nullable
as int,gradedCount: null == gradedCount ? _self.gradedCount : gradedCount // ignore: cast_nullable_to_non_nullable
as int,pendingGradeCount: null == pendingGradeCount ? _self.pendingGradeCount : pendingGradeCount // ignore: cast_nullable_to_non_nullable
as int,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,classStudentCount: null == classStudentCount ? _self.classStudentCount : classStudentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TeacherAssignment].
extension TeacherAssignmentPatterns on TeacherAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherAssignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherAssignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherAssignment value)  $default,){
final _that = this;
switch (_that) {
case _TeacherAssignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherAssignment value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherAssignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String courseName,  String className,  int submissionCount,  int submittedCount,  int gradedCount,  int pendingGradeCount,  DateTime? dueAt,  int classStudentCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherAssignment() when $default != null:
return $default(_that.id,_that.title,_that.courseName,_that.className,_that.submissionCount,_that.submittedCount,_that.gradedCount,_that.pendingGradeCount,_that.dueAt,_that.classStudentCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String courseName,  String className,  int submissionCount,  int submittedCount,  int gradedCount,  int pendingGradeCount,  DateTime? dueAt,  int classStudentCount)  $default,) {final _that = this;
switch (_that) {
case _TeacherAssignment():
return $default(_that.id,_that.title,_that.courseName,_that.className,_that.submissionCount,_that.submittedCount,_that.gradedCount,_that.pendingGradeCount,_that.dueAt,_that.classStudentCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String courseName,  String className,  int submissionCount,  int submittedCount,  int gradedCount,  int pendingGradeCount,  DateTime? dueAt,  int classStudentCount)?  $default,) {final _that = this;
switch (_that) {
case _TeacherAssignment() when $default != null:
return $default(_that.id,_that.title,_that.courseName,_that.className,_that.submissionCount,_that.submittedCount,_that.gradedCount,_that.pendingGradeCount,_that.dueAt,_that.classStudentCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherAssignment implements TeacherAssignment {
  const _TeacherAssignment({this.id = '', this.title = '', this.courseName = '', this.className = '', this.submissionCount = 0, this.submittedCount = 0, this.gradedCount = 0, this.pendingGradeCount = 0, this.dueAt, this.classStudentCount = 0});
  factory _TeacherAssignment.fromJson(Map<String, dynamic> json) => _$TeacherAssignmentFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String courseName;
@override@JsonKey() final  String className;
@override@JsonKey() final  int submissionCount;
@override@JsonKey() final  int submittedCount;
@override@JsonKey() final  int gradedCount;
@override@JsonKey() final  int pendingGradeCount;
@override final  DateTime? dueAt;
@override@JsonKey() final  int classStudentCount;

/// Create a copy of TeacherAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherAssignmentCopyWith<_TeacherAssignment> get copyWith => __$TeacherAssignmentCopyWithImpl<_TeacherAssignment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherAssignmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.className, className) || other.className == className)&&(identical(other.submissionCount, submissionCount) || other.submissionCount == submissionCount)&&(identical(other.submittedCount, submittedCount) || other.submittedCount == submittedCount)&&(identical(other.gradedCount, gradedCount) || other.gradedCount == gradedCount)&&(identical(other.pendingGradeCount, pendingGradeCount) || other.pendingGradeCount == pendingGradeCount)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&(identical(other.classStudentCount, classStudentCount) || other.classStudentCount == classStudentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,courseName,className,submissionCount,submittedCount,gradedCount,pendingGradeCount,dueAt,classStudentCount);

@override
String toString() {
  return 'TeacherAssignment(id: $id, title: $title, courseName: $courseName, className: $className, submissionCount: $submissionCount, submittedCount: $submittedCount, gradedCount: $gradedCount, pendingGradeCount: $pendingGradeCount, dueAt: $dueAt, classStudentCount: $classStudentCount)';
}


}

/// @nodoc
abstract mixin class _$TeacherAssignmentCopyWith<$Res> implements $TeacherAssignmentCopyWith<$Res> {
  factory _$TeacherAssignmentCopyWith(_TeacherAssignment value, $Res Function(_TeacherAssignment) _then) = __$TeacherAssignmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String courseName, String className, int submissionCount, int submittedCount, int gradedCount, int pendingGradeCount, DateTime? dueAt, int classStudentCount
});




}
/// @nodoc
class __$TeacherAssignmentCopyWithImpl<$Res>
    implements _$TeacherAssignmentCopyWith<$Res> {
  __$TeacherAssignmentCopyWithImpl(this._self, this._then);

  final _TeacherAssignment _self;
  final $Res Function(_TeacherAssignment) _then;

/// Create a copy of TeacherAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? courseName = null,Object? className = null,Object? submissionCount = null,Object? submittedCount = null,Object? gradedCount = null,Object? pendingGradeCount = null,Object? dueAt = freezed,Object? classStudentCount = null,}) {
  return _then(_TeacherAssignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,courseName: null == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String,className: null == className ? _self.className : className // ignore: cast_nullable_to_non_nullable
as String,submissionCount: null == submissionCount ? _self.submissionCount : submissionCount // ignore: cast_nullable_to_non_nullable
as int,submittedCount: null == submittedCount ? _self.submittedCount : submittedCount // ignore: cast_nullable_to_non_nullable
as int,gradedCount: null == gradedCount ? _self.gradedCount : gradedCount // ignore: cast_nullable_to_non_nullable
as int,pendingGradeCount: null == pendingGradeCount ? _self.pendingGradeCount : pendingGradeCount // ignore: cast_nullable_to_non_nullable
as int,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,classStudentCount: null == classStudentCount ? _self.classStudentCount : classStudentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SubmissionSummary {

 String get id; String get studentId; String get studentName; DateTime? get submittedAt; String get status; double? get score;
/// Create a copy of SubmissionSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmissionSummaryCopyWith<SubmissionSummary> get copyWith => _$SubmissionSummaryCopyWithImpl<SubmissionSummary>(this as SubmissionSummary, _$identity);

  /// Serializes this SubmissionSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmissionSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.studentName, studentName) || other.studentName == studentName)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,studentId,studentName,submittedAt,status,score);

@override
String toString() {
  return 'SubmissionSummary(id: $id, studentId: $studentId, studentName: $studentName, submittedAt: $submittedAt, status: $status, score: $score)';
}


}

/// @nodoc
abstract mixin class $SubmissionSummaryCopyWith<$Res>  {
  factory $SubmissionSummaryCopyWith(SubmissionSummary value, $Res Function(SubmissionSummary) _then) = _$SubmissionSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String studentId, String studentName, DateTime? submittedAt, String status, double? score
});




}
/// @nodoc
class _$SubmissionSummaryCopyWithImpl<$Res>
    implements $SubmissionSummaryCopyWith<$Res> {
  _$SubmissionSummaryCopyWithImpl(this._self, this._then);

  final SubmissionSummary _self;
  final $Res Function(SubmissionSummary) _then;

/// Create a copy of SubmissionSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? studentId = null,Object? studentName = null,Object? submittedAt = freezed,Object? status = null,Object? score = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,studentName: null == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmissionSummary].
extension SubmissionSummaryPatterns on SubmissionSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmissionSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmissionSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmissionSummary value)  $default,){
final _that = this;
switch (_that) {
case _SubmissionSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmissionSummary value)?  $default,){
final _that = this;
switch (_that) {
case _SubmissionSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String studentId,  String studentName,  DateTime? submittedAt,  String status,  double? score)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmissionSummary() when $default != null:
return $default(_that.id,_that.studentId,_that.studentName,_that.submittedAt,_that.status,_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String studentId,  String studentName,  DateTime? submittedAt,  String status,  double? score)  $default,) {final _that = this;
switch (_that) {
case _SubmissionSummary():
return $default(_that.id,_that.studentId,_that.studentName,_that.submittedAt,_that.status,_that.score);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String studentId,  String studentName,  DateTime? submittedAt,  String status,  double? score)?  $default,) {final _that = this;
switch (_that) {
case _SubmissionSummary() when $default != null:
return $default(_that.id,_that.studentId,_that.studentName,_that.submittedAt,_that.status,_that.score);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmissionSummary implements SubmissionSummary {
  const _SubmissionSummary({this.id = '', this.studentId = '', this.studentName = '学生', this.submittedAt, this.status = 'pending', this.score});
  factory _SubmissionSummary.fromJson(Map<String, dynamic> json) => _$SubmissionSummaryFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String studentId;
@override@JsonKey() final  String studentName;
@override final  DateTime? submittedAt;
@override@JsonKey() final  String status;
@override final  double? score;

/// Create a copy of SubmissionSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmissionSummaryCopyWith<_SubmissionSummary> get copyWith => __$SubmissionSummaryCopyWithImpl<_SubmissionSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmissionSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmissionSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.studentName, studentName) || other.studentName == studentName)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,studentId,studentName,submittedAt,status,score);

@override
String toString() {
  return 'SubmissionSummary(id: $id, studentId: $studentId, studentName: $studentName, submittedAt: $submittedAt, status: $status, score: $score)';
}


}

/// @nodoc
abstract mixin class _$SubmissionSummaryCopyWith<$Res> implements $SubmissionSummaryCopyWith<$Res> {
  factory _$SubmissionSummaryCopyWith(_SubmissionSummary value, $Res Function(_SubmissionSummary) _then) = __$SubmissionSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String studentId, String studentName, DateTime? submittedAt, String status, double? score
});




}
/// @nodoc
class __$SubmissionSummaryCopyWithImpl<$Res>
    implements _$SubmissionSummaryCopyWith<$Res> {
  __$SubmissionSummaryCopyWithImpl(this._self, this._then);

  final _SubmissionSummary _self;
  final $Res Function(_SubmissionSummary) _then;

/// Create a copy of SubmissionSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? studentId = null,Object? studentName = null,Object? submittedAt = freezed,Object? status = null,Object? score = freezed,}) {
  return _then(_SubmissionSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,studentName: null == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$TeacherSubmissionDetail {

@JsonKey(fromJson: _parseSubmissionResult) SubmissionResult get submission; List<SubmissionItem> get items; List<SubmissionComment> get comments;
/// Create a copy of TeacherSubmissionDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherSubmissionDetailCopyWith<TeacherSubmissionDetail> get copyWith => _$TeacherSubmissionDetailCopyWithImpl<TeacherSubmissionDetail>(this as TeacherSubmissionDetail, _$identity);

  /// Serializes this TeacherSubmissionDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherSubmissionDetail&&(identical(other.submission, submission) || other.submission == submission)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.comments, comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,submission,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(comments));

@override
String toString() {
  return 'TeacherSubmissionDetail(submission: $submission, items: $items, comments: $comments)';
}


}

/// @nodoc
abstract mixin class $TeacherSubmissionDetailCopyWith<$Res>  {
  factory $TeacherSubmissionDetailCopyWith(TeacherSubmissionDetail value, $Res Function(TeacherSubmissionDetail) _then) = _$TeacherSubmissionDetailCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _parseSubmissionResult) SubmissionResult submission, List<SubmissionItem> items, List<SubmissionComment> comments
});


$SubmissionResultCopyWith<$Res> get submission;

}
/// @nodoc
class _$TeacherSubmissionDetailCopyWithImpl<$Res>
    implements $TeacherSubmissionDetailCopyWith<$Res> {
  _$TeacherSubmissionDetailCopyWithImpl(this._self, this._then);

  final TeacherSubmissionDetail _self;
  final $Res Function(TeacherSubmissionDetail) _then;

/// Create a copy of TeacherSubmissionDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? submission = null,Object? items = null,Object? comments = null,}) {
  return _then(_self.copyWith(
submission: null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as SubmissionResult,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SubmissionItem>,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<SubmissionComment>,
  ));
}
/// Create a copy of TeacherSubmissionDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubmissionResultCopyWith<$Res> get submission {
  
  return $SubmissionResultCopyWith<$Res>(_self.submission, (value) {
    return _then(_self.copyWith(submission: value));
  });
}
}


/// Adds pattern-matching-related methods to [TeacherSubmissionDetail].
extension TeacherSubmissionDetailPatterns on TeacherSubmissionDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherSubmissionDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherSubmissionDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherSubmissionDetail value)  $default,){
final _that = this;
switch (_that) {
case _TeacherSubmissionDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherSubmissionDetail value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherSubmissionDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseSubmissionResult)  SubmissionResult submission,  List<SubmissionItem> items,  List<SubmissionComment> comments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherSubmissionDetail() when $default != null:
return $default(_that.submission,_that.items,_that.comments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseSubmissionResult)  SubmissionResult submission,  List<SubmissionItem> items,  List<SubmissionComment> comments)  $default,) {final _that = this;
switch (_that) {
case _TeacherSubmissionDetail():
return $default(_that.submission,_that.items,_that.comments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _parseSubmissionResult)  SubmissionResult submission,  List<SubmissionItem> items,  List<SubmissionComment> comments)?  $default,) {final _that = this;
switch (_that) {
case _TeacherSubmissionDetail() when $default != null:
return $default(_that.submission,_that.items,_that.comments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeacherSubmissionDetail implements TeacherSubmissionDetail {
  const _TeacherSubmissionDetail({@JsonKey(fromJson: _parseSubmissionResult) required this.submission, final  List<SubmissionItem> items = const [], final  List<SubmissionComment> comments = const []}): _items = items,_comments = comments;
  factory _TeacherSubmissionDetail.fromJson(Map<String, dynamic> json) => _$TeacherSubmissionDetailFromJson(json);

@override@JsonKey(fromJson: _parseSubmissionResult) final  SubmissionResult submission;
 final  List<SubmissionItem> _items;
@override@JsonKey() List<SubmissionItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<SubmissionComment> _comments;
@override@JsonKey() List<SubmissionComment> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}


/// Create a copy of TeacherSubmissionDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherSubmissionDetailCopyWith<_TeacherSubmissionDetail> get copyWith => __$TeacherSubmissionDetailCopyWithImpl<_TeacherSubmissionDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherSubmissionDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherSubmissionDetail&&(identical(other.submission, submission) || other.submission == submission)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._comments, _comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,submission,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_comments));

@override
String toString() {
  return 'TeacherSubmissionDetail(submission: $submission, items: $items, comments: $comments)';
}


}

/// @nodoc
abstract mixin class _$TeacherSubmissionDetailCopyWith<$Res> implements $TeacherSubmissionDetailCopyWith<$Res> {
  factory _$TeacherSubmissionDetailCopyWith(_TeacherSubmissionDetail value, $Res Function(_TeacherSubmissionDetail) _then) = __$TeacherSubmissionDetailCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _parseSubmissionResult) SubmissionResult submission, List<SubmissionItem> items, List<SubmissionComment> comments
});


@override $SubmissionResultCopyWith<$Res> get submission;

}
/// @nodoc
class __$TeacherSubmissionDetailCopyWithImpl<$Res>
    implements _$TeacherSubmissionDetailCopyWith<$Res> {
  __$TeacherSubmissionDetailCopyWithImpl(this._self, this._then);

  final _TeacherSubmissionDetail _self;
  final $Res Function(_TeacherSubmissionDetail) _then;

/// Create a copy of TeacherSubmissionDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? submission = null,Object? items = null,Object? comments = null,}) {
  return _then(_TeacherSubmissionDetail(
submission: null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as SubmissionResult,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SubmissionItem>,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<SubmissionComment>,
  ));
}

/// Create a copy of TeacherSubmissionDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubmissionResultCopyWith<$Res> get submission {
  
  return $SubmissionResultCopyWith<$Res>(_self.submission, (value) {
    return _then(_self.copyWith(submission: value));
  });
}
}


/// @nodoc
mixin _$SubmissionComment {

 String get id; String get content; String get authorId; DateTime get createdAt;
/// Create a copy of SubmissionComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmissionCommentCopyWith<SubmissionComment> get copyWith => _$SubmissionCommentCopyWithImpl<SubmissionComment>(this as SubmissionComment, _$identity);

  /// Serializes this SubmissionComment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmissionComment&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,authorId,createdAt);

@override
String toString() {
  return 'SubmissionComment(id: $id, content: $content, authorId: $authorId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SubmissionCommentCopyWith<$Res>  {
  factory $SubmissionCommentCopyWith(SubmissionComment value, $Res Function(SubmissionComment) _then) = _$SubmissionCommentCopyWithImpl;
@useResult
$Res call({
 String id, String content, String authorId, DateTime createdAt
});




}
/// @nodoc
class _$SubmissionCommentCopyWithImpl<$Res>
    implements $SubmissionCommentCopyWith<$Res> {
  _$SubmissionCommentCopyWithImpl(this._self, this._then);

  final SubmissionComment _self;
  final $Res Function(SubmissionComment) _then;

/// Create a copy of SubmissionComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = null,Object? authorId = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmissionComment].
extension SubmissionCommentPatterns on SubmissionComment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmissionComment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmissionComment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmissionComment value)  $default,){
final _that = this;
switch (_that) {
case _SubmissionComment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmissionComment value)?  $default,){
final _that = this;
switch (_that) {
case _SubmissionComment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String content,  String authorId,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmissionComment() when $default != null:
return $default(_that.id,_that.content,_that.authorId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String content,  String authorId,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _SubmissionComment():
return $default(_that.id,_that.content,_that.authorId,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String content,  String authorId,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SubmissionComment() when $default != null:
return $default(_that.id,_that.content,_that.authorId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmissionComment implements SubmissionComment {
  const _SubmissionComment({this.id = '', this.content = '', this.authorId = '', required this.createdAt});
  factory _SubmissionComment.fromJson(Map<String, dynamic> json) => _$SubmissionCommentFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String content;
@override@JsonKey() final  String authorId;
@override final  DateTime createdAt;

/// Create a copy of SubmissionComment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmissionCommentCopyWith<_SubmissionComment> get copyWith => __$SubmissionCommentCopyWithImpl<_SubmissionComment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmissionCommentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmissionComment&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,authorId,createdAt);

@override
String toString() {
  return 'SubmissionComment(id: $id, content: $content, authorId: $authorId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SubmissionCommentCopyWith<$Res> implements $SubmissionCommentCopyWith<$Res> {
  factory _$SubmissionCommentCopyWith(_SubmissionComment value, $Res Function(_SubmissionComment) _then) = __$SubmissionCommentCopyWithImpl;
@override @useResult
$Res call({
 String id, String content, String authorId, DateTime createdAt
});




}
/// @nodoc
class __$SubmissionCommentCopyWithImpl<$Res>
    implements _$SubmissionCommentCopyWith<$Res> {
  __$SubmissionCommentCopyWithImpl(this._self, this._then);

  final _SubmissionComment _self;
  final $Res Function(_SubmissionComment) _then;

/// Create a copy of SubmissionComment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,Object? authorId = null,Object? createdAt = null,}) {
  return _then(_SubmissionComment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$GradeSubmissionRequest {

 double? get score; String? get feedback; Map<String, double>? get itemScores;@JsonKey(toJson: _commentToJson) String? get comment;
/// Create a copy of GradeSubmissionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GradeSubmissionRequestCopyWith<GradeSubmissionRequest> get copyWith => _$GradeSubmissionRequestCopyWithImpl<GradeSubmissionRequest>(this as GradeSubmissionRequest, _$identity);

  /// Serializes this GradeSubmissionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GradeSubmissionRequest&&(identical(other.score, score) || other.score == score)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&const DeepCollectionEquality().equals(other.itemScores, itemScores)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,score,feedback,const DeepCollectionEquality().hash(itemScores),comment);

@override
String toString() {
  return 'GradeSubmissionRequest(score: $score, feedback: $feedback, itemScores: $itemScores, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $GradeSubmissionRequestCopyWith<$Res>  {
  factory $GradeSubmissionRequestCopyWith(GradeSubmissionRequest value, $Res Function(GradeSubmissionRequest) _then) = _$GradeSubmissionRequestCopyWithImpl;
@useResult
$Res call({
 double? score, String? feedback, Map<String, double>? itemScores,@JsonKey(toJson: _commentToJson) String? comment
});




}
/// @nodoc
class _$GradeSubmissionRequestCopyWithImpl<$Res>
    implements $GradeSubmissionRequestCopyWith<$Res> {
  _$GradeSubmissionRequestCopyWithImpl(this._self, this._then);

  final GradeSubmissionRequest _self;
  final $Res Function(GradeSubmissionRequest) _then;

/// Create a copy of GradeSubmissionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? score = freezed,Object? feedback = freezed,Object? itemScores = freezed,Object? comment = freezed,}) {
  return _then(_self.copyWith(
score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,feedback: freezed == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String?,itemScores: freezed == itemScores ? _self.itemScores : itemScores // ignore: cast_nullable_to_non_nullable
as Map<String, double>?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GradeSubmissionRequest].
extension GradeSubmissionRequestPatterns on GradeSubmissionRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GradeSubmissionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GradeSubmissionRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GradeSubmissionRequest value)  $default,){
final _that = this;
switch (_that) {
case _GradeSubmissionRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GradeSubmissionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GradeSubmissionRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? score,  String? feedback,  Map<String, double>? itemScores, @JsonKey(toJson: _commentToJson)  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GradeSubmissionRequest() when $default != null:
return $default(_that.score,_that.feedback,_that.itemScores,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? score,  String? feedback,  Map<String, double>? itemScores, @JsonKey(toJson: _commentToJson)  String? comment)  $default,) {final _that = this;
switch (_that) {
case _GradeSubmissionRequest():
return $default(_that.score,_that.feedback,_that.itemScores,_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? score,  String? feedback,  Map<String, double>? itemScores, @JsonKey(toJson: _commentToJson)  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _GradeSubmissionRequest() when $default != null:
return $default(_that.score,_that.feedback,_that.itemScores,_that.comment);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _GradeSubmissionRequest implements GradeSubmissionRequest {
  const _GradeSubmissionRequest({this.score, this.feedback, final  Map<String, double>? itemScores, @JsonKey(toJson: _commentToJson) this.comment}): _itemScores = itemScores;
  factory _GradeSubmissionRequest.fromJson(Map<String, dynamic> json) => _$GradeSubmissionRequestFromJson(json);

@override final  double? score;
@override final  String? feedback;
 final  Map<String, double>? _itemScores;
@override Map<String, double>? get itemScores {
  final value = _itemScores;
  if (value == null) return null;
  if (_itemScores is EqualUnmodifiableMapView) return _itemScores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(toJson: _commentToJson) final  String? comment;

/// Create a copy of GradeSubmissionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GradeSubmissionRequestCopyWith<_GradeSubmissionRequest> get copyWith => __$GradeSubmissionRequestCopyWithImpl<_GradeSubmissionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GradeSubmissionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GradeSubmissionRequest&&(identical(other.score, score) || other.score == score)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&const DeepCollectionEquality().equals(other._itemScores, _itemScores)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,score,feedback,const DeepCollectionEquality().hash(_itemScores),comment);

@override
String toString() {
  return 'GradeSubmissionRequest(score: $score, feedback: $feedback, itemScores: $itemScores, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$GradeSubmissionRequestCopyWith<$Res> implements $GradeSubmissionRequestCopyWith<$Res> {
  factory _$GradeSubmissionRequestCopyWith(_GradeSubmissionRequest value, $Res Function(_GradeSubmissionRequest) _then) = __$GradeSubmissionRequestCopyWithImpl;
@override @useResult
$Res call({
 double? score, String? feedback, Map<String, double>? itemScores,@JsonKey(toJson: _commentToJson) String? comment
});




}
/// @nodoc
class __$GradeSubmissionRequestCopyWithImpl<$Res>
    implements _$GradeSubmissionRequestCopyWith<$Res> {
  __$GradeSubmissionRequestCopyWithImpl(this._self, this._then);

  final _GradeSubmissionRequest _self;
  final $Res Function(_GradeSubmissionRequest) _then;

/// Create a copy of GradeSubmissionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? score = freezed,Object? feedback = freezed,Object? itemScores = freezed,Object? comment = freezed,}) {
  return _then(_GradeSubmissionRequest(
score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,feedback: freezed == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String?,itemScores: freezed == itemScores ? _self._itemScores : itemScores // ignore: cast_nullable_to_non_nullable
as Map<String, double>?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateAssignmentRequest {

 String get courseId; String get teacherId; String get classId; String get type; String get title; String? get description; DateTime? get startAt; DateTime? get dueAt; double? get maxScore; bool get allowResubmit; List<CreateAssignmentQuestionInput> get questions; List<String>? get attachments;
/// Create a copy of CreateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAssignmentRequestCopyWith<CreateAssignmentRequest> get copyWith => _$CreateAssignmentRequestCopyWithImpl<CreateAssignmentRequest>(this as CreateAssignmentRequest, _$identity);

  /// Serializes this CreateAssignmentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAssignmentRequest&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.allowResubmit, allowResubmit) || other.allowResubmit == allowResubmit)&&const DeepCollectionEquality().equals(other.questions, questions)&&const DeepCollectionEquality().equals(other.attachments, attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,courseId,teacherId,classId,type,title,description,startAt,dueAt,maxScore,allowResubmit,const DeepCollectionEquality().hash(questions),const DeepCollectionEquality().hash(attachments));

@override
String toString() {
  return 'CreateAssignmentRequest(courseId: $courseId, teacherId: $teacherId, classId: $classId, type: $type, title: $title, description: $description, startAt: $startAt, dueAt: $dueAt, maxScore: $maxScore, allowResubmit: $allowResubmit, questions: $questions, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class $CreateAssignmentRequestCopyWith<$Res>  {
  factory $CreateAssignmentRequestCopyWith(CreateAssignmentRequest value, $Res Function(CreateAssignmentRequest) _then) = _$CreateAssignmentRequestCopyWithImpl;
@useResult
$Res call({
 String courseId, String teacherId, String classId, String type, String title, String? description, DateTime? startAt, DateTime? dueAt, double? maxScore, bool allowResubmit, List<CreateAssignmentQuestionInput> questions, List<String>? attachments
});




}
/// @nodoc
class _$CreateAssignmentRequestCopyWithImpl<$Res>
    implements $CreateAssignmentRequestCopyWith<$Res> {
  _$CreateAssignmentRequestCopyWithImpl(this._self, this._then);

  final CreateAssignmentRequest _self;
  final $Res Function(CreateAssignmentRequest) _then;

/// Create a copy of CreateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? courseId = null,Object? teacherId = null,Object? classId = null,Object? type = null,Object? title = null,Object? description = freezed,Object? startAt = freezed,Object? dueAt = freezed,Object? maxScore = freezed,Object? allowResubmit = null,Object? questions = null,Object? attachments = freezed,}) {
  return _then(_self.copyWith(
courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,maxScore: freezed == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as double?,allowResubmit: null == allowResubmit ? _self.allowResubmit : allowResubmit // ignore: cast_nullable_to_non_nullable
as bool,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<CreateAssignmentQuestionInput>,attachments: freezed == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateAssignmentRequest].
extension CreateAssignmentRequestPatterns on CreateAssignmentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateAssignmentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateAssignmentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateAssignmentRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateAssignmentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateAssignmentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateAssignmentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String courseId,  String teacherId,  String classId,  String type,  String title,  String? description,  DateTime? startAt,  DateTime? dueAt,  double? maxScore,  bool allowResubmit,  List<CreateAssignmentQuestionInput> questions,  List<String>? attachments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateAssignmentRequest() when $default != null:
return $default(_that.courseId,_that.teacherId,_that.classId,_that.type,_that.title,_that.description,_that.startAt,_that.dueAt,_that.maxScore,_that.allowResubmit,_that.questions,_that.attachments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String courseId,  String teacherId,  String classId,  String type,  String title,  String? description,  DateTime? startAt,  DateTime? dueAt,  double? maxScore,  bool allowResubmit,  List<CreateAssignmentQuestionInput> questions,  List<String>? attachments)  $default,) {final _that = this;
switch (_that) {
case _CreateAssignmentRequest():
return $default(_that.courseId,_that.teacherId,_that.classId,_that.type,_that.title,_that.description,_that.startAt,_that.dueAt,_that.maxScore,_that.allowResubmit,_that.questions,_that.attachments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String courseId,  String teacherId,  String classId,  String type,  String title,  String? description,  DateTime? startAt,  DateTime? dueAt,  double? maxScore,  bool allowResubmit,  List<CreateAssignmentQuestionInput> questions,  List<String>? attachments)?  $default,) {final _that = this;
switch (_that) {
case _CreateAssignmentRequest() when $default != null:
return $default(_that.courseId,_that.teacherId,_that.classId,_that.type,_that.title,_that.description,_that.startAt,_that.dueAt,_that.maxScore,_that.allowResubmit,_that.questions,_that.attachments);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _CreateAssignmentRequest implements CreateAssignmentRequest {
  const _CreateAssignmentRequest({required this.courseId, required this.teacherId, required this.classId, required this.type, required this.title, this.description, this.startAt, this.dueAt, this.maxScore, this.allowResubmit = false, required final  List<CreateAssignmentQuestionInput> questions, final  List<String>? attachments}): _questions = questions,_attachments = attachments;
  factory _CreateAssignmentRequest.fromJson(Map<String, dynamic> json) => _$CreateAssignmentRequestFromJson(json);

@override final  String courseId;
@override final  String teacherId;
@override final  String classId;
@override final  String type;
@override final  String title;
@override final  String? description;
@override final  DateTime? startAt;
@override final  DateTime? dueAt;
@override final  double? maxScore;
@override@JsonKey() final  bool allowResubmit;
 final  List<CreateAssignmentQuestionInput> _questions;
@override List<CreateAssignmentQuestionInput> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

 final  List<String>? _attachments;
@override List<String>? get attachments {
  final value = _attachments;
  if (value == null) return null;
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CreateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAssignmentRequestCopyWith<_CreateAssignmentRequest> get copyWith => __$CreateAssignmentRequestCopyWithImpl<_CreateAssignmentRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateAssignmentRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAssignmentRequest&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.allowResubmit, allowResubmit) || other.allowResubmit == allowResubmit)&&const DeepCollectionEquality().equals(other._questions, _questions)&&const DeepCollectionEquality().equals(other._attachments, _attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,courseId,teacherId,classId,type,title,description,startAt,dueAt,maxScore,allowResubmit,const DeepCollectionEquality().hash(_questions),const DeepCollectionEquality().hash(_attachments));

@override
String toString() {
  return 'CreateAssignmentRequest(courseId: $courseId, teacherId: $teacherId, classId: $classId, type: $type, title: $title, description: $description, startAt: $startAt, dueAt: $dueAt, maxScore: $maxScore, allowResubmit: $allowResubmit, questions: $questions, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class _$CreateAssignmentRequestCopyWith<$Res> implements $CreateAssignmentRequestCopyWith<$Res> {
  factory _$CreateAssignmentRequestCopyWith(_CreateAssignmentRequest value, $Res Function(_CreateAssignmentRequest) _then) = __$CreateAssignmentRequestCopyWithImpl;
@override @useResult
$Res call({
 String courseId, String teacherId, String classId, String type, String title, String? description, DateTime? startAt, DateTime? dueAt, double? maxScore, bool allowResubmit, List<CreateAssignmentQuestionInput> questions, List<String>? attachments
});




}
/// @nodoc
class __$CreateAssignmentRequestCopyWithImpl<$Res>
    implements _$CreateAssignmentRequestCopyWith<$Res> {
  __$CreateAssignmentRequestCopyWithImpl(this._self, this._then);

  final _CreateAssignmentRequest _self;
  final $Res Function(_CreateAssignmentRequest) _then;

/// Create a copy of CreateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? courseId = null,Object? teacherId = null,Object? classId = null,Object? type = null,Object? title = null,Object? description = freezed,Object? startAt = freezed,Object? dueAt = freezed,Object? maxScore = freezed,Object? allowResubmit = null,Object? questions = null,Object? attachments = freezed,}) {
  return _then(_CreateAssignmentRequest(
courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,maxScore: freezed == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as double?,allowResubmit: null == allowResubmit ? _self.allowResubmit : allowResubmit // ignore: cast_nullable_to_non_nullable
as bool,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<CreateAssignmentQuestionInput>,attachments: freezed == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$UpdateAssignmentRequest {

 String get teacherId; String? get title; String? get description; DateTime? get startAt; DateTime? get dueAt; double? get maxScore; bool? get allowResubmit;
/// Create a copy of UpdateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAssignmentRequestCopyWith<UpdateAssignmentRequest> get copyWith => _$UpdateAssignmentRequestCopyWithImpl<UpdateAssignmentRequest>(this as UpdateAssignmentRequest, _$identity);

  /// Serializes this UpdateAssignmentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAssignmentRequest&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.allowResubmit, allowResubmit) || other.allowResubmit == allowResubmit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teacherId,title,description,startAt,dueAt,maxScore,allowResubmit);

@override
String toString() {
  return 'UpdateAssignmentRequest(teacherId: $teacherId, title: $title, description: $description, startAt: $startAt, dueAt: $dueAt, maxScore: $maxScore, allowResubmit: $allowResubmit)';
}


}

/// @nodoc
abstract mixin class $UpdateAssignmentRequestCopyWith<$Res>  {
  factory $UpdateAssignmentRequestCopyWith(UpdateAssignmentRequest value, $Res Function(UpdateAssignmentRequest) _then) = _$UpdateAssignmentRequestCopyWithImpl;
@useResult
$Res call({
 String teacherId, String? title, String? description, DateTime? startAt, DateTime? dueAt, double? maxScore, bool? allowResubmit
});




}
/// @nodoc
class _$UpdateAssignmentRequestCopyWithImpl<$Res>
    implements $UpdateAssignmentRequestCopyWith<$Res> {
  _$UpdateAssignmentRequestCopyWithImpl(this._self, this._then);

  final UpdateAssignmentRequest _self;
  final $Res Function(UpdateAssignmentRequest) _then;

/// Create a copy of UpdateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? teacherId = null,Object? title = freezed,Object? description = freezed,Object? startAt = freezed,Object? dueAt = freezed,Object? maxScore = freezed,Object? allowResubmit = freezed,}) {
  return _then(_self.copyWith(
teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,maxScore: freezed == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as double?,allowResubmit: freezed == allowResubmit ? _self.allowResubmit : allowResubmit // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateAssignmentRequest].
extension UpdateAssignmentRequestPatterns on UpdateAssignmentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateAssignmentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateAssignmentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateAssignmentRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateAssignmentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateAssignmentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateAssignmentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String teacherId,  String? title,  String? description,  DateTime? startAt,  DateTime? dueAt,  double? maxScore,  bool? allowResubmit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateAssignmentRequest() when $default != null:
return $default(_that.teacherId,_that.title,_that.description,_that.startAt,_that.dueAt,_that.maxScore,_that.allowResubmit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String teacherId,  String? title,  String? description,  DateTime? startAt,  DateTime? dueAt,  double? maxScore,  bool? allowResubmit)  $default,) {final _that = this;
switch (_that) {
case _UpdateAssignmentRequest():
return $default(_that.teacherId,_that.title,_that.description,_that.startAt,_that.dueAt,_that.maxScore,_that.allowResubmit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String teacherId,  String? title,  String? description,  DateTime? startAt,  DateTime? dueAt,  double? maxScore,  bool? allowResubmit)?  $default,) {final _that = this;
switch (_that) {
case _UpdateAssignmentRequest() when $default != null:
return $default(_that.teacherId,_that.title,_that.description,_that.startAt,_that.dueAt,_that.maxScore,_that.allowResubmit);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _UpdateAssignmentRequest implements UpdateAssignmentRequest {
  const _UpdateAssignmentRequest({required this.teacherId, this.title, this.description, this.startAt, this.dueAt, this.maxScore, this.allowResubmit});
  factory _UpdateAssignmentRequest.fromJson(Map<String, dynamic> json) => _$UpdateAssignmentRequestFromJson(json);

@override final  String teacherId;
@override final  String? title;
@override final  String? description;
@override final  DateTime? startAt;
@override final  DateTime? dueAt;
@override final  double? maxScore;
@override final  bool? allowResubmit;

/// Create a copy of UpdateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAssignmentRequestCopyWith<_UpdateAssignmentRequest> get copyWith => __$UpdateAssignmentRequestCopyWithImpl<_UpdateAssignmentRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateAssignmentRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAssignmentRequest&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.allowResubmit, allowResubmit) || other.allowResubmit == allowResubmit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teacherId,title,description,startAt,dueAt,maxScore,allowResubmit);

@override
String toString() {
  return 'UpdateAssignmentRequest(teacherId: $teacherId, title: $title, description: $description, startAt: $startAt, dueAt: $dueAt, maxScore: $maxScore, allowResubmit: $allowResubmit)';
}


}

/// @nodoc
abstract mixin class _$UpdateAssignmentRequestCopyWith<$Res> implements $UpdateAssignmentRequestCopyWith<$Res> {
  factory _$UpdateAssignmentRequestCopyWith(_UpdateAssignmentRequest value, $Res Function(_UpdateAssignmentRequest) _then) = __$UpdateAssignmentRequestCopyWithImpl;
@override @useResult
$Res call({
 String teacherId, String? title, String? description, DateTime? startAt, DateTime? dueAt, double? maxScore, bool? allowResubmit
});




}
/// @nodoc
class __$UpdateAssignmentRequestCopyWithImpl<$Res>
    implements _$UpdateAssignmentRequestCopyWith<$Res> {
  __$UpdateAssignmentRequestCopyWithImpl(this._self, this._then);

  final _UpdateAssignmentRequest _self;
  final $Res Function(_UpdateAssignmentRequest) _then;

/// Create a copy of UpdateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? teacherId = null,Object? title = freezed,Object? description = freezed,Object? startAt = freezed,Object? dueAt = freezed,Object? maxScore = freezed,Object? allowResubmit = freezed,}) {
  return _then(_UpdateAssignmentRequest(
teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,maxScore: freezed == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as double?,allowResubmit: freezed == allowResubmit ? _self.allowResubmit : allowResubmit // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$CreateAssignmentQuestionInput {

 String get type; String get prompt;@JsonKey(fromJson: _parseOptions) String? get options; String? get answer; double? get score; int? get orderIndex;
/// Create a copy of CreateAssignmentQuestionInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAssignmentQuestionInputCopyWith<CreateAssignmentQuestionInput> get copyWith => _$CreateAssignmentQuestionInputCopyWithImpl<CreateAssignmentQuestionInput>(this as CreateAssignmentQuestionInput, _$identity);

  /// Serializes this CreateAssignmentQuestionInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAssignmentQuestionInput&&(identical(other.type, type) || other.type == type)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.options, options) || other.options == options)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.score, score) || other.score == score)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,prompt,options,answer,score,orderIndex);

@override
String toString() {
  return 'CreateAssignmentQuestionInput(type: $type, prompt: $prompt, options: $options, answer: $answer, score: $score, orderIndex: $orderIndex)';
}


}

/// @nodoc
abstract mixin class $CreateAssignmentQuestionInputCopyWith<$Res>  {
  factory $CreateAssignmentQuestionInputCopyWith(CreateAssignmentQuestionInput value, $Res Function(CreateAssignmentQuestionInput) _then) = _$CreateAssignmentQuestionInputCopyWithImpl;
@useResult
$Res call({
 String type, String prompt,@JsonKey(fromJson: _parseOptions) String? options, String? answer, double? score, int? orderIndex
});




}
/// @nodoc
class _$CreateAssignmentQuestionInputCopyWithImpl<$Res>
    implements $CreateAssignmentQuestionInputCopyWith<$Res> {
  _$CreateAssignmentQuestionInputCopyWithImpl(this._self, this._then);

  final CreateAssignmentQuestionInput _self;
  final $Res Function(CreateAssignmentQuestionInput) _then;

/// Create a copy of CreateAssignmentQuestionInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? prompt = null,Object? options = freezed,Object? answer = freezed,Object? score = freezed,Object? orderIndex = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as String?,answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,orderIndex: freezed == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateAssignmentQuestionInput].
extension CreateAssignmentQuestionInputPatterns on CreateAssignmentQuestionInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateAssignmentQuestionInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateAssignmentQuestionInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateAssignmentQuestionInput value)  $default,){
final _that = this;
switch (_that) {
case _CreateAssignmentQuestionInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateAssignmentQuestionInput value)?  $default,){
final _that = this;
switch (_that) {
case _CreateAssignmentQuestionInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String prompt, @JsonKey(fromJson: _parseOptions)  String? options,  String? answer,  double? score,  int? orderIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateAssignmentQuestionInput() when $default != null:
return $default(_that.type,_that.prompt,_that.options,_that.answer,_that.score,_that.orderIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String prompt, @JsonKey(fromJson: _parseOptions)  String? options,  String? answer,  double? score,  int? orderIndex)  $default,) {final _that = this;
switch (_that) {
case _CreateAssignmentQuestionInput():
return $default(_that.type,_that.prompt,_that.options,_that.answer,_that.score,_that.orderIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String prompt, @JsonKey(fromJson: _parseOptions)  String? options,  String? answer,  double? score,  int? orderIndex)?  $default,) {final _that = this;
switch (_that) {
case _CreateAssignmentQuestionInput() when $default != null:
return $default(_that.type,_that.prompt,_that.options,_that.answer,_that.score,_that.orderIndex);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _CreateAssignmentQuestionInput implements CreateAssignmentQuestionInput {
  const _CreateAssignmentQuestionInput({required this.type, required this.prompt, @JsonKey(fromJson: _parseOptions) this.options, this.answer, this.score, this.orderIndex});
  factory _CreateAssignmentQuestionInput.fromJson(Map<String, dynamic> json) => _$CreateAssignmentQuestionInputFromJson(json);

@override final  String type;
@override final  String prompt;
@override@JsonKey(fromJson: _parseOptions) final  String? options;
@override final  String? answer;
@override final  double? score;
@override final  int? orderIndex;

/// Create a copy of CreateAssignmentQuestionInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAssignmentQuestionInputCopyWith<_CreateAssignmentQuestionInput> get copyWith => __$CreateAssignmentQuestionInputCopyWithImpl<_CreateAssignmentQuestionInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateAssignmentQuestionInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAssignmentQuestionInput&&(identical(other.type, type) || other.type == type)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.options, options) || other.options == options)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.score, score) || other.score == score)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,prompt,options,answer,score,orderIndex);

@override
String toString() {
  return 'CreateAssignmentQuestionInput(type: $type, prompt: $prompt, options: $options, answer: $answer, score: $score, orderIndex: $orderIndex)';
}


}

/// @nodoc
abstract mixin class _$CreateAssignmentQuestionInputCopyWith<$Res> implements $CreateAssignmentQuestionInputCopyWith<$Res> {
  factory _$CreateAssignmentQuestionInputCopyWith(_CreateAssignmentQuestionInput value, $Res Function(_CreateAssignmentQuestionInput) _then) = __$CreateAssignmentQuestionInputCopyWithImpl;
@override @useResult
$Res call({
 String type, String prompt,@JsonKey(fromJson: _parseOptions) String? options, String? answer, double? score, int? orderIndex
});




}
/// @nodoc
class __$CreateAssignmentQuestionInputCopyWithImpl<$Res>
    implements _$CreateAssignmentQuestionInputCopyWith<$Res> {
  __$CreateAssignmentQuestionInputCopyWithImpl(this._self, this._then);

  final _CreateAssignmentQuestionInput _self;
  final $Res Function(_CreateAssignmentQuestionInput) _then;

/// Create a copy of CreateAssignmentQuestionInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? prompt = null,Object? options = freezed,Object? answer = freezed,Object? score = freezed,Object? orderIndex = freezed,}) {
  return _then(_CreateAssignmentQuestionInput(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as String?,answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,orderIndex: freezed == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
