// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_api_requests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SchoolScopedQueryPayload {

 String get schoolId;
/// Create a copy of SchoolScopedQueryPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SchoolScopedQueryPayloadCopyWith<SchoolScopedQueryPayload> get copyWith => _$SchoolScopedQueryPayloadCopyWithImpl<SchoolScopedQueryPayload>(this as SchoolScopedQueryPayload, _$identity);

  /// Serializes this SchoolScopedQueryPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SchoolScopedQueryPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId);

@override
String toString() {
  return 'SchoolScopedQueryPayload(schoolId: $schoolId)';
}


}

/// @nodoc
abstract mixin class $SchoolScopedQueryPayloadCopyWith<$Res>  {
  factory $SchoolScopedQueryPayloadCopyWith(SchoolScopedQueryPayload value, $Res Function(SchoolScopedQueryPayload) _then) = _$SchoolScopedQueryPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId
});




}
/// @nodoc
class _$SchoolScopedQueryPayloadCopyWithImpl<$Res>
    implements $SchoolScopedQueryPayloadCopyWith<$Res> {
  _$SchoolScopedQueryPayloadCopyWithImpl(this._self, this._then);

  final SchoolScopedQueryPayload _self;
  final $Res Function(SchoolScopedQueryPayload) _then;

/// Create a copy of SchoolScopedQueryPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SchoolScopedQueryPayload].
extension SchoolScopedQueryPayloadPatterns on SchoolScopedQueryPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SchoolScopedQueryPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SchoolScopedQueryPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SchoolScopedQueryPayload value)  $default,){
final _that = this;
switch (_that) {
case _SchoolScopedQueryPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SchoolScopedQueryPayload value)?  $default,){
final _that = this;
switch (_that) {
case _SchoolScopedQueryPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SchoolScopedQueryPayload() when $default != null:
return $default(_that.schoolId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId)  $default,) {final _that = this;
switch (_that) {
case _SchoolScopedQueryPayload():
return $default(_that.schoolId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId)?  $default,) {final _that = this;
switch (_that) {
case _SchoolScopedQueryPayload() when $default != null:
return $default(_that.schoolId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _SchoolScopedQueryPayload implements SchoolScopedQueryPayload {
  const _SchoolScopedQueryPayload({required this.schoolId});
  factory _SchoolScopedQueryPayload.fromJson(Map<String, dynamic> json) => _$SchoolScopedQueryPayloadFromJson(json);

@override final  String schoolId;

/// Create a copy of SchoolScopedQueryPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SchoolScopedQueryPayloadCopyWith<_SchoolScopedQueryPayload> get copyWith => __$SchoolScopedQueryPayloadCopyWithImpl<_SchoolScopedQueryPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SchoolScopedQueryPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SchoolScopedQueryPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId);

@override
String toString() {
  return 'SchoolScopedQueryPayload(schoolId: $schoolId)';
}


}

/// @nodoc
abstract mixin class _$SchoolScopedQueryPayloadCopyWith<$Res> implements $SchoolScopedQueryPayloadCopyWith<$Res> {
  factory _$SchoolScopedQueryPayloadCopyWith(_SchoolScopedQueryPayload value, $Res Function(_SchoolScopedQueryPayload) _then) = __$SchoolScopedQueryPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId
});




}
/// @nodoc
class __$SchoolScopedQueryPayloadCopyWithImpl<$Res>
    implements _$SchoolScopedQueryPayloadCopyWith<$Res> {
  __$SchoolScopedQueryPayloadCopyWithImpl(this._self, this._then);

  final _SchoolScopedQueryPayload _self;
  final $Res Function(_SchoolScopedQueryPayload) _then;

/// Create a copy of SchoolScopedQueryPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,}) {
  return _then(_SchoolScopedQueryPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SchoolScopedBodyPayload {

 String get schoolId;
/// Create a copy of SchoolScopedBodyPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SchoolScopedBodyPayloadCopyWith<SchoolScopedBodyPayload> get copyWith => _$SchoolScopedBodyPayloadCopyWithImpl<SchoolScopedBodyPayload>(this as SchoolScopedBodyPayload, _$identity);

  /// Serializes this SchoolScopedBodyPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SchoolScopedBodyPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId);

@override
String toString() {
  return 'SchoolScopedBodyPayload(schoolId: $schoolId)';
}


}

/// @nodoc
abstract mixin class $SchoolScopedBodyPayloadCopyWith<$Res>  {
  factory $SchoolScopedBodyPayloadCopyWith(SchoolScopedBodyPayload value, $Res Function(SchoolScopedBodyPayload) _then) = _$SchoolScopedBodyPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId
});




}
/// @nodoc
class _$SchoolScopedBodyPayloadCopyWithImpl<$Res>
    implements $SchoolScopedBodyPayloadCopyWith<$Res> {
  _$SchoolScopedBodyPayloadCopyWithImpl(this._self, this._then);

  final SchoolScopedBodyPayload _self;
  final $Res Function(SchoolScopedBodyPayload) _then;

/// Create a copy of SchoolScopedBodyPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SchoolScopedBodyPayload].
extension SchoolScopedBodyPayloadPatterns on SchoolScopedBodyPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SchoolScopedBodyPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SchoolScopedBodyPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SchoolScopedBodyPayload value)  $default,){
final _that = this;
switch (_that) {
case _SchoolScopedBodyPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SchoolScopedBodyPayload value)?  $default,){
final _that = this;
switch (_that) {
case _SchoolScopedBodyPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SchoolScopedBodyPayload() when $default != null:
return $default(_that.schoolId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId)  $default,) {final _that = this;
switch (_that) {
case _SchoolScopedBodyPayload():
return $default(_that.schoolId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId)?  $default,) {final _that = this;
switch (_that) {
case _SchoolScopedBodyPayload() when $default != null:
return $default(_that.schoolId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _SchoolScopedBodyPayload implements SchoolScopedBodyPayload {
  const _SchoolScopedBodyPayload({required this.schoolId});
  factory _SchoolScopedBodyPayload.fromJson(Map<String, dynamic> json) => _$SchoolScopedBodyPayloadFromJson(json);

@override final  String schoolId;

/// Create a copy of SchoolScopedBodyPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SchoolScopedBodyPayloadCopyWith<_SchoolScopedBodyPayload> get copyWith => __$SchoolScopedBodyPayloadCopyWithImpl<_SchoolScopedBodyPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SchoolScopedBodyPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SchoolScopedBodyPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId);

@override
String toString() {
  return 'SchoolScopedBodyPayload(schoolId: $schoolId)';
}


}

/// @nodoc
abstract mixin class _$SchoolScopedBodyPayloadCopyWith<$Res> implements $SchoolScopedBodyPayloadCopyWith<$Res> {
  factory _$SchoolScopedBodyPayloadCopyWith(_SchoolScopedBodyPayload value, $Res Function(_SchoolScopedBodyPayload) _then) = __$SchoolScopedBodyPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId
});




}
/// @nodoc
class __$SchoolScopedBodyPayloadCopyWithImpl<$Res>
    implements _$SchoolScopedBodyPayloadCopyWith<$Res> {
  __$SchoolScopedBodyPayloadCopyWithImpl(this._self, this._then);

  final _SchoolScopedBodyPayload _self;
  final $Res Function(_SchoolScopedBodyPayload) _then;

/// Create a copy of SchoolScopedBodyPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,}) {
  return _then(_SchoolScopedBodyPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DepartmentsResult {

 List<Department> get departments;
/// Create a copy of DepartmentsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentsResultCopyWith<DepartmentsResult> get copyWith => _$DepartmentsResultCopyWithImpl<DepartmentsResult>(this as DepartmentsResult, _$identity);

  /// Serializes this DepartmentsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentsResult&&const DeepCollectionEquality().equals(other.departments, departments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(departments));

@override
String toString() {
  return 'DepartmentsResult(departments: $departments)';
}


}

/// @nodoc
abstract mixin class $DepartmentsResultCopyWith<$Res>  {
  factory $DepartmentsResultCopyWith(DepartmentsResult value, $Res Function(DepartmentsResult) _then) = _$DepartmentsResultCopyWithImpl;
@useResult
$Res call({
 List<Department> departments
});




}
/// @nodoc
class _$DepartmentsResultCopyWithImpl<$Res>
    implements $DepartmentsResultCopyWith<$Res> {
  _$DepartmentsResultCopyWithImpl(this._self, this._then);

  final DepartmentsResult _self;
  final $Res Function(DepartmentsResult) _then;

/// Create a copy of DepartmentsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? departments = null,}) {
  return _then(_self.copyWith(
departments: null == departments ? _self.departments : departments // ignore: cast_nullable_to_non_nullable
as List<Department>,
  ));
}

}


/// Adds pattern-matching-related methods to [DepartmentsResult].
extension DepartmentsResultPatterns on DepartmentsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepartmentsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepartmentsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepartmentsResult value)  $default,){
final _that = this;
switch (_that) {
case _DepartmentsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepartmentsResult value)?  $default,){
final _that = this;
switch (_that) {
case _DepartmentsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Department> departments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepartmentsResult() when $default != null:
return $default(_that.departments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Department> departments)  $default,) {final _that = this;
switch (_that) {
case _DepartmentsResult():
return $default(_that.departments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Department> departments)?  $default,) {final _that = this;
switch (_that) {
case _DepartmentsResult() when $default != null:
return $default(_that.departments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DepartmentsResult implements DepartmentsResult {
  const _DepartmentsResult({final  List<Department> departments = const <Department>[]}): _departments = departments;
  factory _DepartmentsResult.fromJson(Map<String, dynamic> json) => _$DepartmentsResultFromJson(json);

 final  List<Department> _departments;
@override@JsonKey() List<Department> get departments {
  if (_departments is EqualUnmodifiableListView) return _departments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departments);
}


/// Create a copy of DepartmentsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentsResultCopyWith<_DepartmentsResult> get copyWith => __$DepartmentsResultCopyWithImpl<_DepartmentsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartmentsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartmentsResult&&const DeepCollectionEquality().equals(other._departments, _departments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_departments));

@override
String toString() {
  return 'DepartmentsResult(departments: $departments)';
}


}

/// @nodoc
abstract mixin class _$DepartmentsResultCopyWith<$Res> implements $DepartmentsResultCopyWith<$Res> {
  factory _$DepartmentsResultCopyWith(_DepartmentsResult value, $Res Function(_DepartmentsResult) _then) = __$DepartmentsResultCopyWithImpl;
@override @useResult
$Res call({
 List<Department> departments
});




}
/// @nodoc
class __$DepartmentsResultCopyWithImpl<$Res>
    implements _$DepartmentsResultCopyWith<$Res> {
  __$DepartmentsResultCopyWithImpl(this._self, this._then);

  final _DepartmentsResult _self;
  final $Res Function(_DepartmentsResult) _then;

/// Create a copy of DepartmentsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? departments = null,}) {
  return _then(_DepartmentsResult(
departments: null == departments ? _self._departments : departments // ignore: cast_nullable_to_non_nullable
as List<Department>,
  ));
}


}


/// @nodoc
mixin _$AISettingsResult {

 AIAgentSetting? get setting;
/// Create a copy of AISettingsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AISettingsResultCopyWith<AISettingsResult> get copyWith => _$AISettingsResultCopyWithImpl<AISettingsResult>(this as AISettingsResult, _$identity);

  /// Serializes this AISettingsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AISettingsResult&&(identical(other.setting, setting) || other.setting == setting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,setting);

@override
String toString() {
  return 'AISettingsResult(setting: $setting)';
}


}

/// @nodoc
abstract mixin class $AISettingsResultCopyWith<$Res>  {
  factory $AISettingsResultCopyWith(AISettingsResult value, $Res Function(AISettingsResult) _then) = _$AISettingsResultCopyWithImpl;
@useResult
$Res call({
 AIAgentSetting? setting
});


$AIAgentSettingCopyWith<$Res>? get setting;

}
/// @nodoc
class _$AISettingsResultCopyWithImpl<$Res>
    implements $AISettingsResultCopyWith<$Res> {
  _$AISettingsResultCopyWithImpl(this._self, this._then);

  final AISettingsResult _self;
  final $Res Function(AISettingsResult) _then;

/// Create a copy of AISettingsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? setting = freezed,}) {
  return _then(_self.copyWith(
setting: freezed == setting ? _self.setting : setting // ignore: cast_nullable_to_non_nullable
as AIAgentSetting?,
  ));
}
/// Create a copy of AISettingsResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AIAgentSettingCopyWith<$Res>? get setting {
    if (_self.setting == null) {
    return null;
  }

  return $AIAgentSettingCopyWith<$Res>(_self.setting!, (value) {
    return _then(_self.copyWith(setting: value));
  });
}
}


/// Adds pattern-matching-related methods to [AISettingsResult].
extension AISettingsResultPatterns on AISettingsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AISettingsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AISettingsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AISettingsResult value)  $default,){
final _that = this;
switch (_that) {
case _AISettingsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AISettingsResult value)?  $default,){
final _that = this;
switch (_that) {
case _AISettingsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AIAgentSetting? setting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AISettingsResult() when $default != null:
return $default(_that.setting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AIAgentSetting? setting)  $default,) {final _that = this;
switch (_that) {
case _AISettingsResult():
return $default(_that.setting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AIAgentSetting? setting)?  $default,) {final _that = this;
switch (_that) {
case _AISettingsResult() when $default != null:
return $default(_that.setting);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AISettingsResult implements AISettingsResult {
  const _AISettingsResult({this.setting});
  factory _AISettingsResult.fromJson(Map<String, dynamic> json) => _$AISettingsResultFromJson(json);

@override final  AIAgentSetting? setting;

/// Create a copy of AISettingsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AISettingsResultCopyWith<_AISettingsResult> get copyWith => __$AISettingsResultCopyWithImpl<_AISettingsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AISettingsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AISettingsResult&&(identical(other.setting, setting) || other.setting == setting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,setting);

@override
String toString() {
  return 'AISettingsResult(setting: $setting)';
}


}

/// @nodoc
abstract mixin class _$AISettingsResultCopyWith<$Res> implements $AISettingsResultCopyWith<$Res> {
  factory _$AISettingsResultCopyWith(_AISettingsResult value, $Res Function(_AISettingsResult) _then) = __$AISettingsResultCopyWithImpl;
@override @useResult
$Res call({
 AIAgentSetting? setting
});


@override $AIAgentSettingCopyWith<$Res>? get setting;

}
/// @nodoc
class __$AISettingsResultCopyWithImpl<$Res>
    implements _$AISettingsResultCopyWith<$Res> {
  __$AISettingsResultCopyWithImpl(this._self, this._then);

  final _AISettingsResult _self;
  final $Res Function(_AISettingsResult) _then;

/// Create a copy of AISettingsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? setting = freezed,}) {
  return _then(_AISettingsResult(
setting: freezed == setting ? _self.setting : setting // ignore: cast_nullable_to_non_nullable
as AIAgentSetting?,
  ));
}

/// Create a copy of AISettingsResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AIAgentSettingCopyWith<$Res>? get setting {
    if (_self.setting == null) {
    return null;
  }

  return $AIAgentSettingCopyWith<$Res>(_self.setting!, (value) {
    return _then(_self.copyWith(setting: value));
  });
}
}


/// @nodoc
mixin _$UpdateAISettingsPayload {

 AIAgentSetting get setting;
/// Create a copy of UpdateAISettingsPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAISettingsPayloadCopyWith<UpdateAISettingsPayload> get copyWith => _$UpdateAISettingsPayloadCopyWithImpl<UpdateAISettingsPayload>(this as UpdateAISettingsPayload, _$identity);

  /// Serializes this UpdateAISettingsPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAISettingsPayload&&(identical(other.setting, setting) || other.setting == setting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,setting);

@override
String toString() {
  return 'UpdateAISettingsPayload(setting: $setting)';
}


}

/// @nodoc
abstract mixin class $UpdateAISettingsPayloadCopyWith<$Res>  {
  factory $UpdateAISettingsPayloadCopyWith(UpdateAISettingsPayload value, $Res Function(UpdateAISettingsPayload) _then) = _$UpdateAISettingsPayloadCopyWithImpl;
@useResult
$Res call({
 AIAgentSetting setting
});


$AIAgentSettingCopyWith<$Res> get setting;

}
/// @nodoc
class _$UpdateAISettingsPayloadCopyWithImpl<$Res>
    implements $UpdateAISettingsPayloadCopyWith<$Res> {
  _$UpdateAISettingsPayloadCopyWithImpl(this._self, this._then);

  final UpdateAISettingsPayload _self;
  final $Res Function(UpdateAISettingsPayload) _then;

/// Create a copy of UpdateAISettingsPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? setting = null,}) {
  return _then(_self.copyWith(
setting: null == setting ? _self.setting : setting // ignore: cast_nullable_to_non_nullable
as AIAgentSetting,
  ));
}
/// Create a copy of UpdateAISettingsPayload
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AIAgentSettingCopyWith<$Res> get setting {
  
  return $AIAgentSettingCopyWith<$Res>(_self.setting, (value) {
    return _then(_self.copyWith(setting: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateAISettingsPayload].
extension UpdateAISettingsPayloadPatterns on UpdateAISettingsPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateAISettingsPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateAISettingsPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateAISettingsPayload value)  $default,){
final _that = this;
switch (_that) {
case _UpdateAISettingsPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateAISettingsPayload value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateAISettingsPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AIAgentSetting setting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateAISettingsPayload() when $default != null:
return $default(_that.setting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AIAgentSetting setting)  $default,) {final _that = this;
switch (_that) {
case _UpdateAISettingsPayload():
return $default(_that.setting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AIAgentSetting setting)?  $default,) {final _that = this;
switch (_that) {
case _UpdateAISettingsPayload() when $default != null:
return $default(_that.setting);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _UpdateAISettingsPayload implements UpdateAISettingsPayload {
  const _UpdateAISettingsPayload({required this.setting});
  factory _UpdateAISettingsPayload.fromJson(Map<String, dynamic> json) => _$UpdateAISettingsPayloadFromJson(json);

@override final  AIAgentSetting setting;

/// Create a copy of UpdateAISettingsPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAISettingsPayloadCopyWith<_UpdateAISettingsPayload> get copyWith => __$UpdateAISettingsPayloadCopyWithImpl<_UpdateAISettingsPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateAISettingsPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAISettingsPayload&&(identical(other.setting, setting) || other.setting == setting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,setting);

@override
String toString() {
  return 'UpdateAISettingsPayload(setting: $setting)';
}


}

/// @nodoc
abstract mixin class _$UpdateAISettingsPayloadCopyWith<$Res> implements $UpdateAISettingsPayloadCopyWith<$Res> {
  factory _$UpdateAISettingsPayloadCopyWith(_UpdateAISettingsPayload value, $Res Function(_UpdateAISettingsPayload) _then) = __$UpdateAISettingsPayloadCopyWithImpl;
@override @useResult
$Res call({
 AIAgentSetting setting
});


@override $AIAgentSettingCopyWith<$Res> get setting;

}
/// @nodoc
class __$UpdateAISettingsPayloadCopyWithImpl<$Res>
    implements _$UpdateAISettingsPayloadCopyWith<$Res> {
  __$UpdateAISettingsPayloadCopyWithImpl(this._self, this._then);

  final _UpdateAISettingsPayload _self;
  final $Res Function(_UpdateAISettingsPayload) _then;

/// Create a copy of UpdateAISettingsPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? setting = null,}) {
  return _then(_UpdateAISettingsPayload(
setting: null == setting ? _self.setting : setting // ignore: cast_nullable_to_non_nullable
as AIAgentSetting,
  ));
}

/// Create a copy of UpdateAISettingsPayload
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AIAgentSettingCopyWith<$Res> get setting {
  
  return $AIAgentSettingCopyWith<$Res>(_self.setting, (value) {
    return _then(_self.copyWith(setting: value));
  });
}
}


/// @nodoc
mixin _$ClassesByDepartmentResult {

 List<ClassInfo> get classes;
/// Create a copy of ClassesByDepartmentResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClassesByDepartmentResultCopyWith<ClassesByDepartmentResult> get copyWith => _$ClassesByDepartmentResultCopyWithImpl<ClassesByDepartmentResult>(this as ClassesByDepartmentResult, _$identity);

  /// Serializes this ClassesByDepartmentResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClassesByDepartmentResult&&const DeepCollectionEquality().equals(other.classes, classes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(classes));

@override
String toString() {
  return 'ClassesByDepartmentResult(classes: $classes)';
}


}

/// @nodoc
abstract mixin class $ClassesByDepartmentResultCopyWith<$Res>  {
  factory $ClassesByDepartmentResultCopyWith(ClassesByDepartmentResult value, $Res Function(ClassesByDepartmentResult) _then) = _$ClassesByDepartmentResultCopyWithImpl;
@useResult
$Res call({
 List<ClassInfo> classes
});




}
/// @nodoc
class _$ClassesByDepartmentResultCopyWithImpl<$Res>
    implements $ClassesByDepartmentResultCopyWith<$Res> {
  _$ClassesByDepartmentResultCopyWithImpl(this._self, this._then);

  final ClassesByDepartmentResult _self;
  final $Res Function(ClassesByDepartmentResult) _then;

/// Create a copy of ClassesByDepartmentResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? classes = null,}) {
  return _then(_self.copyWith(
classes: null == classes ? _self.classes : classes // ignore: cast_nullable_to_non_nullable
as List<ClassInfo>,
  ));
}

}


/// Adds pattern-matching-related methods to [ClassesByDepartmentResult].
extension ClassesByDepartmentResultPatterns on ClassesByDepartmentResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClassesByDepartmentResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClassesByDepartmentResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClassesByDepartmentResult value)  $default,){
final _that = this;
switch (_that) {
case _ClassesByDepartmentResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClassesByDepartmentResult value)?  $default,){
final _that = this;
switch (_that) {
case _ClassesByDepartmentResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ClassInfo> classes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClassesByDepartmentResult() when $default != null:
return $default(_that.classes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ClassInfo> classes)  $default,) {final _that = this;
switch (_that) {
case _ClassesByDepartmentResult():
return $default(_that.classes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ClassInfo> classes)?  $default,) {final _that = this;
switch (_that) {
case _ClassesByDepartmentResult() when $default != null:
return $default(_that.classes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClassesByDepartmentResult implements ClassesByDepartmentResult {
  const _ClassesByDepartmentResult({final  List<ClassInfo> classes = const <ClassInfo>[]}): _classes = classes;
  factory _ClassesByDepartmentResult.fromJson(Map<String, dynamic> json) => _$ClassesByDepartmentResultFromJson(json);

 final  List<ClassInfo> _classes;
@override@JsonKey() List<ClassInfo> get classes {
  if (_classes is EqualUnmodifiableListView) return _classes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_classes);
}


/// Create a copy of ClassesByDepartmentResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClassesByDepartmentResultCopyWith<_ClassesByDepartmentResult> get copyWith => __$ClassesByDepartmentResultCopyWithImpl<_ClassesByDepartmentResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClassesByDepartmentResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClassesByDepartmentResult&&const DeepCollectionEquality().equals(other._classes, _classes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_classes));

@override
String toString() {
  return 'ClassesByDepartmentResult(classes: $classes)';
}


}

/// @nodoc
abstract mixin class _$ClassesByDepartmentResultCopyWith<$Res> implements $ClassesByDepartmentResultCopyWith<$Res> {
  factory _$ClassesByDepartmentResultCopyWith(_ClassesByDepartmentResult value, $Res Function(_ClassesByDepartmentResult) _then) = __$ClassesByDepartmentResultCopyWithImpl;
@override @useResult
$Res call({
 List<ClassInfo> classes
});




}
/// @nodoc
class __$ClassesByDepartmentResultCopyWithImpl<$Res>
    implements _$ClassesByDepartmentResultCopyWith<$Res> {
  __$ClassesByDepartmentResultCopyWithImpl(this._self, this._then);

  final _ClassesByDepartmentResult _self;
  final $Res Function(_ClassesByDepartmentResult) _then;

/// Create a copy of ClassesByDepartmentResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? classes = null,}) {
  return _then(_ClassesByDepartmentResult(
classes: null == classes ? _self._classes : classes // ignore: cast_nullable_to_non_nullable
as List<ClassInfo>,
  ));
}


}


/// @nodoc
mixin _$FetchAccountsPayload {

 String get schoolId; AdminAccountRole? get role; AdminAccountStatus? get status; String? get departmentId; String? get departmentScope; String? get classId; String? get classScope; String? get courseId; int get page; int get pageSize; String get query;
/// Create a copy of FetchAccountsPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchAccountsPayloadCopyWith<FetchAccountsPayload> get copyWith => _$FetchAccountsPayloadCopyWithImpl<FetchAccountsPayload>(this as FetchAccountsPayload, _$identity);

  /// Serializes this FetchAccountsPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchAccountsPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.departmentScope, departmentScope) || other.departmentScope == departmentScope)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.classScope, classScope) || other.classScope == classScope)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.query, query) || other.query == query));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,role,status,departmentId,departmentScope,classId,classScope,courseId,page,pageSize,query);

@override
String toString() {
  return 'FetchAccountsPayload(schoolId: $schoolId, role: $role, status: $status, departmentId: $departmentId, departmentScope: $departmentScope, classId: $classId, classScope: $classScope, courseId: $courseId, page: $page, pageSize: $pageSize, query: $query)';
}


}

/// @nodoc
abstract mixin class $FetchAccountsPayloadCopyWith<$Res>  {
  factory $FetchAccountsPayloadCopyWith(FetchAccountsPayload value, $Res Function(FetchAccountsPayload) _then) = _$FetchAccountsPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, AdminAccountRole? role, AdminAccountStatus? status, String? departmentId, String? departmentScope, String? classId, String? classScope, String? courseId, int page, int pageSize, String query
});




}
/// @nodoc
class _$FetchAccountsPayloadCopyWithImpl<$Res>
    implements $FetchAccountsPayloadCopyWith<$Res> {
  _$FetchAccountsPayloadCopyWithImpl(this._self, this._then);

  final FetchAccountsPayload _self;
  final $Res Function(FetchAccountsPayload) _then;

/// Create a copy of FetchAccountsPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? role = freezed,Object? status = freezed,Object? departmentId = freezed,Object? departmentScope = freezed,Object? classId = freezed,Object? classScope = freezed,Object? courseId = freezed,Object? page = null,Object? pageSize = null,Object? query = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AdminAccountRole?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdminAccountStatus?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,departmentScope: freezed == departmentScope ? _self.departmentScope : departmentScope // ignore: cast_nullable_to_non_nullable
as String?,classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,classScope: freezed == classScope ? _self.classScope : classScope // ignore: cast_nullable_to_non_nullable
as String?,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FetchAccountsPayload].
extension FetchAccountsPayloadPatterns on FetchAccountsPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FetchAccountsPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchAccountsPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FetchAccountsPayload value)  $default,){
final _that = this;
switch (_that) {
case _FetchAccountsPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FetchAccountsPayload value)?  $default,){
final _that = this;
switch (_that) {
case _FetchAccountsPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  AdminAccountRole? role,  AdminAccountStatus? status,  String? departmentId,  String? departmentScope,  String? classId,  String? classScope,  String? courseId,  int page,  int pageSize,  String query)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchAccountsPayload() when $default != null:
return $default(_that.schoolId,_that.role,_that.status,_that.departmentId,_that.departmentScope,_that.classId,_that.classScope,_that.courseId,_that.page,_that.pageSize,_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  AdminAccountRole? role,  AdminAccountStatus? status,  String? departmentId,  String? departmentScope,  String? classId,  String? classScope,  String? courseId,  int page,  int pageSize,  String query)  $default,) {final _that = this;
switch (_that) {
case _FetchAccountsPayload():
return $default(_that.schoolId,_that.role,_that.status,_that.departmentId,_that.departmentScope,_that.classId,_that.classScope,_that.courseId,_that.page,_that.pageSize,_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  AdminAccountRole? role,  AdminAccountStatus? status,  String? departmentId,  String? departmentScope,  String? classId,  String? classScope,  String? courseId,  int page,  int pageSize,  String query)?  $default,) {final _that = this;
switch (_that) {
case _FetchAccountsPayload() when $default != null:
return $default(_that.schoolId,_that.role,_that.status,_that.departmentId,_that.departmentScope,_that.classId,_that.classScope,_that.courseId,_that.page,_that.pageSize,_that.query);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _FetchAccountsPayload implements FetchAccountsPayload {
  const _FetchAccountsPayload({required this.schoolId, this.role, this.status, this.departmentId, this.departmentScope, this.classId, this.classScope, this.courseId, this.page = 1, this.pageSize = 50, this.query = ''});
  factory _FetchAccountsPayload.fromJson(Map<String, dynamic> json) => _$FetchAccountsPayloadFromJson(json);

@override final  String schoolId;
@override final  AdminAccountRole? role;
@override final  AdminAccountStatus? status;
@override final  String? departmentId;
@override final  String? departmentScope;
@override final  String? classId;
@override final  String? classScope;
@override final  String? courseId;
@override@JsonKey() final  int page;
@override@JsonKey() final  int pageSize;
@override@JsonKey() final  String query;

/// Create a copy of FetchAccountsPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchAccountsPayloadCopyWith<_FetchAccountsPayload> get copyWith => __$FetchAccountsPayloadCopyWithImpl<_FetchAccountsPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FetchAccountsPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchAccountsPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.departmentScope, departmentScope) || other.departmentScope == departmentScope)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.classScope, classScope) || other.classScope == classScope)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.query, query) || other.query == query));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,role,status,departmentId,departmentScope,classId,classScope,courseId,page,pageSize,query);

@override
String toString() {
  return 'FetchAccountsPayload(schoolId: $schoolId, role: $role, status: $status, departmentId: $departmentId, departmentScope: $departmentScope, classId: $classId, classScope: $classScope, courseId: $courseId, page: $page, pageSize: $pageSize, query: $query)';
}


}

/// @nodoc
abstract mixin class _$FetchAccountsPayloadCopyWith<$Res> implements $FetchAccountsPayloadCopyWith<$Res> {
  factory _$FetchAccountsPayloadCopyWith(_FetchAccountsPayload value, $Res Function(_FetchAccountsPayload) _then) = __$FetchAccountsPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, AdminAccountRole? role, AdminAccountStatus? status, String? departmentId, String? departmentScope, String? classId, String? classScope, String? courseId, int page, int pageSize, String query
});




}
/// @nodoc
class __$FetchAccountsPayloadCopyWithImpl<$Res>
    implements _$FetchAccountsPayloadCopyWith<$Res> {
  __$FetchAccountsPayloadCopyWithImpl(this._self, this._then);

  final _FetchAccountsPayload _self;
  final $Res Function(_FetchAccountsPayload) _then;

/// Create a copy of FetchAccountsPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? role = freezed,Object? status = freezed,Object? departmentId = freezed,Object? departmentScope = freezed,Object? classId = freezed,Object? classScope = freezed,Object? courseId = freezed,Object? page = null,Object? pageSize = null,Object? query = null,}) {
  return _then(_FetchAccountsPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AdminAccountRole?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdminAccountStatus?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,departmentScope: freezed == departmentScope ? _self.departmentScope : departmentScope // ignore: cast_nullable_to_non_nullable
as String?,classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,classScope: freezed == classScope ? _self.classScope : classScope // ignore: cast_nullable_to_non_nullable
as String?,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CreateTeacherPayload {

 String get schoolId; String get number; String get name; String get email; String? get phone; String get defaultPassword;
/// Create a copy of CreateTeacherPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTeacherPayloadCopyWith<CreateTeacherPayload> get copyWith => _$CreateTeacherPayloadCopyWithImpl<CreateTeacherPayload>(this as CreateTeacherPayload, _$identity);

  /// Serializes this CreateTeacherPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTeacherPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.number, number) || other.number == number)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.defaultPassword, defaultPassword) || other.defaultPassword == defaultPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,number,name,email,phone,defaultPassword);

@override
String toString() {
  return 'CreateTeacherPayload(schoolId: $schoolId, number: $number, name: $name, email: $email, phone: $phone, defaultPassword: $defaultPassword)';
}


}

/// @nodoc
abstract mixin class $CreateTeacherPayloadCopyWith<$Res>  {
  factory $CreateTeacherPayloadCopyWith(CreateTeacherPayload value, $Res Function(CreateTeacherPayload) _then) = _$CreateTeacherPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String number, String name, String email, String? phone, String defaultPassword
});




}
/// @nodoc
class _$CreateTeacherPayloadCopyWithImpl<$Res>
    implements $CreateTeacherPayloadCopyWith<$Res> {
  _$CreateTeacherPayloadCopyWithImpl(this._self, this._then);

  final CreateTeacherPayload _self;
  final $Res Function(CreateTeacherPayload) _then;

/// Create a copy of CreateTeacherPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? number = null,Object? name = null,Object? email = null,Object? phone = freezed,Object? defaultPassword = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,defaultPassword: null == defaultPassword ? _self.defaultPassword : defaultPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTeacherPayload].
extension CreateTeacherPayloadPatterns on CreateTeacherPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTeacherPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTeacherPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTeacherPayload value)  $default,){
final _that = this;
switch (_that) {
case _CreateTeacherPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTeacherPayload value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTeacherPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String number,  String name,  String email,  String? phone,  String defaultPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTeacherPayload() when $default != null:
return $default(_that.schoolId,_that.number,_that.name,_that.email,_that.phone,_that.defaultPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String number,  String name,  String email,  String? phone,  String defaultPassword)  $default,) {final _that = this;
switch (_that) {
case _CreateTeacherPayload():
return $default(_that.schoolId,_that.number,_that.name,_that.email,_that.phone,_that.defaultPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String number,  String name,  String email,  String? phone,  String defaultPassword)?  $default,) {final _that = this;
switch (_that) {
case _CreateTeacherPayload() when $default != null:
return $default(_that.schoolId,_that.number,_that.name,_that.email,_that.phone,_that.defaultPassword);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _CreateTeacherPayload implements CreateTeacherPayload {
  const _CreateTeacherPayload({required this.schoolId, required this.number, required this.name, required this.email, this.phone, required this.defaultPassword});
  factory _CreateTeacherPayload.fromJson(Map<String, dynamic> json) => _$CreateTeacherPayloadFromJson(json);

@override final  String schoolId;
@override final  String number;
@override final  String name;
@override final  String email;
@override final  String? phone;
@override final  String defaultPassword;

/// Create a copy of CreateTeacherPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTeacherPayloadCopyWith<_CreateTeacherPayload> get copyWith => __$CreateTeacherPayloadCopyWithImpl<_CreateTeacherPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTeacherPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTeacherPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.number, number) || other.number == number)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.defaultPassword, defaultPassword) || other.defaultPassword == defaultPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,number,name,email,phone,defaultPassword);

@override
String toString() {
  return 'CreateTeacherPayload(schoolId: $schoolId, number: $number, name: $name, email: $email, phone: $phone, defaultPassword: $defaultPassword)';
}


}

/// @nodoc
abstract mixin class _$CreateTeacherPayloadCopyWith<$Res> implements $CreateTeacherPayloadCopyWith<$Res> {
  factory _$CreateTeacherPayloadCopyWith(_CreateTeacherPayload value, $Res Function(_CreateTeacherPayload) _then) = __$CreateTeacherPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String number, String name, String email, String? phone, String defaultPassword
});




}
/// @nodoc
class __$CreateTeacherPayloadCopyWithImpl<$Res>
    implements _$CreateTeacherPayloadCopyWith<$Res> {
  __$CreateTeacherPayloadCopyWithImpl(this._self, this._then);

  final _CreateTeacherPayload _self;
  final $Res Function(_CreateTeacherPayload) _then;

/// Create a copy of CreateTeacherPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? number = null,Object? name = null,Object? email = null,Object? phone = freezed,Object? defaultPassword = null,}) {
  return _then(_CreateTeacherPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,defaultPassword: null == defaultPassword ? _self.defaultPassword : defaultPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CreateStudentPayload {

 String get schoolId; String get number; String get name; String get email; String? get phone; String get classId; String get defaultPassword;
/// Create a copy of CreateStudentPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateStudentPayloadCopyWith<CreateStudentPayload> get copyWith => _$CreateStudentPayloadCopyWithImpl<CreateStudentPayload>(this as CreateStudentPayload, _$identity);

  /// Serializes this CreateStudentPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateStudentPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.number, number) || other.number == number)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.defaultPassword, defaultPassword) || other.defaultPassword == defaultPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,number,name,email,phone,classId,defaultPassword);

@override
String toString() {
  return 'CreateStudentPayload(schoolId: $schoolId, number: $number, name: $name, email: $email, phone: $phone, classId: $classId, defaultPassword: $defaultPassword)';
}


}

/// @nodoc
abstract mixin class $CreateStudentPayloadCopyWith<$Res>  {
  factory $CreateStudentPayloadCopyWith(CreateStudentPayload value, $Res Function(CreateStudentPayload) _then) = _$CreateStudentPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String number, String name, String email, String? phone, String classId, String defaultPassword
});




}
/// @nodoc
class _$CreateStudentPayloadCopyWithImpl<$Res>
    implements $CreateStudentPayloadCopyWith<$Res> {
  _$CreateStudentPayloadCopyWithImpl(this._self, this._then);

  final CreateStudentPayload _self;
  final $Res Function(CreateStudentPayload) _then;

/// Create a copy of CreateStudentPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? number = null,Object? name = null,Object? email = null,Object? phone = freezed,Object? classId = null,Object? defaultPassword = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,defaultPassword: null == defaultPassword ? _self.defaultPassword : defaultPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateStudentPayload].
extension CreateStudentPayloadPatterns on CreateStudentPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateStudentPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateStudentPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateStudentPayload value)  $default,){
final _that = this;
switch (_that) {
case _CreateStudentPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateStudentPayload value)?  $default,){
final _that = this;
switch (_that) {
case _CreateStudentPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String number,  String name,  String email,  String? phone,  String classId,  String defaultPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateStudentPayload() when $default != null:
return $default(_that.schoolId,_that.number,_that.name,_that.email,_that.phone,_that.classId,_that.defaultPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String number,  String name,  String email,  String? phone,  String classId,  String defaultPassword)  $default,) {final _that = this;
switch (_that) {
case _CreateStudentPayload():
return $default(_that.schoolId,_that.number,_that.name,_that.email,_that.phone,_that.classId,_that.defaultPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String number,  String name,  String email,  String? phone,  String classId,  String defaultPassword)?  $default,) {final _that = this;
switch (_that) {
case _CreateStudentPayload() when $default != null:
return $default(_that.schoolId,_that.number,_that.name,_that.email,_that.phone,_that.classId,_that.defaultPassword);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _CreateStudentPayload implements CreateStudentPayload {
  const _CreateStudentPayload({required this.schoolId, required this.number, required this.name, required this.email, this.phone, required this.classId, required this.defaultPassword});
  factory _CreateStudentPayload.fromJson(Map<String, dynamic> json) => _$CreateStudentPayloadFromJson(json);

@override final  String schoolId;
@override final  String number;
@override final  String name;
@override final  String email;
@override final  String? phone;
@override final  String classId;
@override final  String defaultPassword;

/// Create a copy of CreateStudentPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateStudentPayloadCopyWith<_CreateStudentPayload> get copyWith => __$CreateStudentPayloadCopyWithImpl<_CreateStudentPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateStudentPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateStudentPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.number, number) || other.number == number)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.defaultPassword, defaultPassword) || other.defaultPassword == defaultPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,number,name,email,phone,classId,defaultPassword);

@override
String toString() {
  return 'CreateStudentPayload(schoolId: $schoolId, number: $number, name: $name, email: $email, phone: $phone, classId: $classId, defaultPassword: $defaultPassword)';
}


}

/// @nodoc
abstract mixin class _$CreateStudentPayloadCopyWith<$Res> implements $CreateStudentPayloadCopyWith<$Res> {
  factory _$CreateStudentPayloadCopyWith(_CreateStudentPayload value, $Res Function(_CreateStudentPayload) _then) = __$CreateStudentPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String number, String name, String email, String? phone, String classId, String defaultPassword
});




}
/// @nodoc
class __$CreateStudentPayloadCopyWithImpl<$Res>
    implements _$CreateStudentPayloadCopyWith<$Res> {
  __$CreateStudentPayloadCopyWithImpl(this._self, this._then);

  final _CreateStudentPayload _self;
  final $Res Function(_CreateStudentPayload) _then;

/// Create a copy of CreateStudentPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? number = null,Object? name = null,Object? email = null,Object? phone = freezed,Object? classId = null,Object? defaultPassword = null,}) {
  return _then(_CreateStudentPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,defaultPassword: null == defaultPassword ? _self.defaultPassword : defaultPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UpdateAccountPayload {

 String get schoolId; String? get name; String? get number; String? get email; String? get phone;
/// Create a copy of UpdateAccountPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAccountPayloadCopyWith<UpdateAccountPayload> get copyWith => _$UpdateAccountPayloadCopyWithImpl<UpdateAccountPayload>(this as UpdateAccountPayload, _$identity);

  /// Serializes this UpdateAccountPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAccountPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name,number,email,phone);

@override
String toString() {
  return 'UpdateAccountPayload(schoolId: $schoolId, name: $name, number: $number, email: $email, phone: $phone)';
}


}

/// @nodoc
abstract mixin class $UpdateAccountPayloadCopyWith<$Res>  {
  factory $UpdateAccountPayloadCopyWith(UpdateAccountPayload value, $Res Function(UpdateAccountPayload) _then) = _$UpdateAccountPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String? name, String? number, String? email, String? phone
});




}
/// @nodoc
class _$UpdateAccountPayloadCopyWithImpl<$Res>
    implements $UpdateAccountPayloadCopyWith<$Res> {
  _$UpdateAccountPayloadCopyWithImpl(this._self, this._then);

  final UpdateAccountPayload _self;
  final $Res Function(UpdateAccountPayload) _then;

/// Create a copy of UpdateAccountPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? name = freezed,Object? number = freezed,Object? email = freezed,Object? phone = freezed,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateAccountPayload].
extension UpdateAccountPayloadPatterns on UpdateAccountPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateAccountPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateAccountPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateAccountPayload value)  $default,){
final _that = this;
switch (_that) {
case _UpdateAccountPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateAccountPayload value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateAccountPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String? name,  String? number,  String? email,  String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateAccountPayload() when $default != null:
return $default(_that.schoolId,_that.name,_that.number,_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String? name,  String? number,  String? email,  String? phone)  $default,) {final _that = this;
switch (_that) {
case _UpdateAccountPayload():
return $default(_that.schoolId,_that.name,_that.number,_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String? name,  String? number,  String? email,  String? phone)?  $default,) {final _that = this;
switch (_that) {
case _UpdateAccountPayload() when $default != null:
return $default(_that.schoolId,_that.name,_that.number,_that.email,_that.phone);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _UpdateAccountPayload implements UpdateAccountPayload {
  const _UpdateAccountPayload({required this.schoolId, this.name, this.number, this.email, this.phone});
  factory _UpdateAccountPayload.fromJson(Map<String, dynamic> json) => _$UpdateAccountPayloadFromJson(json);

@override final  String schoolId;
@override final  String? name;
@override final  String? number;
@override final  String? email;
@override final  String? phone;

/// Create a copy of UpdateAccountPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAccountPayloadCopyWith<_UpdateAccountPayload> get copyWith => __$UpdateAccountPayloadCopyWithImpl<_UpdateAccountPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateAccountPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAccountPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name,number,email,phone);

@override
String toString() {
  return 'UpdateAccountPayload(schoolId: $schoolId, name: $name, number: $number, email: $email, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$UpdateAccountPayloadCopyWith<$Res> implements $UpdateAccountPayloadCopyWith<$Res> {
  factory _$UpdateAccountPayloadCopyWith(_UpdateAccountPayload value, $Res Function(_UpdateAccountPayload) _then) = __$UpdateAccountPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String? name, String? number, String? email, String? phone
});




}
/// @nodoc
class __$UpdateAccountPayloadCopyWithImpl<$Res>
    implements _$UpdateAccountPayloadCopyWith<$Res> {
  __$UpdateAccountPayloadCopyWithImpl(this._self, this._then);

  final _UpdateAccountPayload _self;
  final $Res Function(_UpdateAccountPayload) _then;

/// Create a copy of UpdateAccountPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? name = freezed,Object? number = freezed,Object? email = freezed,Object? phone = freezed,}) {
  return _then(_UpdateAccountPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UpdateAccountStructurePayload {

 String get schoolId; String? get departmentId; String? get classId;
/// Create a copy of UpdateAccountStructurePayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAccountStructurePayloadCopyWith<UpdateAccountStructurePayload> get copyWith => _$UpdateAccountStructurePayloadCopyWithImpl<UpdateAccountStructurePayload>(this as UpdateAccountStructurePayload, _$identity);

  /// Serializes this UpdateAccountStructurePayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAccountStructurePayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.classId, classId) || other.classId == classId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,departmentId,classId);

@override
String toString() {
  return 'UpdateAccountStructurePayload(schoolId: $schoolId, departmentId: $departmentId, classId: $classId)';
}


}

/// @nodoc
abstract mixin class $UpdateAccountStructurePayloadCopyWith<$Res>  {
  factory $UpdateAccountStructurePayloadCopyWith(UpdateAccountStructurePayload value, $Res Function(UpdateAccountStructurePayload) _then) = _$UpdateAccountStructurePayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String? departmentId, String? classId
});




}
/// @nodoc
class _$UpdateAccountStructurePayloadCopyWithImpl<$Res>
    implements $UpdateAccountStructurePayloadCopyWith<$Res> {
  _$UpdateAccountStructurePayloadCopyWithImpl(this._self, this._then);

  final UpdateAccountStructurePayload _self;
  final $Res Function(UpdateAccountStructurePayload) _then;

/// Create a copy of UpdateAccountStructurePayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? departmentId = freezed,Object? classId = freezed,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateAccountStructurePayload].
extension UpdateAccountStructurePayloadPatterns on UpdateAccountStructurePayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateAccountStructurePayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateAccountStructurePayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateAccountStructurePayload value)  $default,){
final _that = this;
switch (_that) {
case _UpdateAccountStructurePayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateAccountStructurePayload value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateAccountStructurePayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String? departmentId,  String? classId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateAccountStructurePayload() when $default != null:
return $default(_that.schoolId,_that.departmentId,_that.classId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String? departmentId,  String? classId)  $default,) {final _that = this;
switch (_that) {
case _UpdateAccountStructurePayload():
return $default(_that.schoolId,_that.departmentId,_that.classId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String? departmentId,  String? classId)?  $default,) {final _that = this;
switch (_that) {
case _UpdateAccountStructurePayload() when $default != null:
return $default(_that.schoolId,_that.departmentId,_that.classId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _UpdateAccountStructurePayload implements UpdateAccountStructurePayload {
  const _UpdateAccountStructurePayload({required this.schoolId, this.departmentId, this.classId});
  factory _UpdateAccountStructurePayload.fromJson(Map<String, dynamic> json) => _$UpdateAccountStructurePayloadFromJson(json);

@override final  String schoolId;
@override final  String? departmentId;
@override final  String? classId;

/// Create a copy of UpdateAccountStructurePayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAccountStructurePayloadCopyWith<_UpdateAccountStructurePayload> get copyWith => __$UpdateAccountStructurePayloadCopyWithImpl<_UpdateAccountStructurePayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateAccountStructurePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAccountStructurePayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.classId, classId) || other.classId == classId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,departmentId,classId);

@override
String toString() {
  return 'UpdateAccountStructurePayload(schoolId: $schoolId, departmentId: $departmentId, classId: $classId)';
}


}

/// @nodoc
abstract mixin class _$UpdateAccountStructurePayloadCopyWith<$Res> implements $UpdateAccountStructurePayloadCopyWith<$Res> {
  factory _$UpdateAccountStructurePayloadCopyWith(_UpdateAccountStructurePayload value, $Res Function(_UpdateAccountStructurePayload) _then) = __$UpdateAccountStructurePayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String? departmentId, String? classId
});




}
/// @nodoc
class __$UpdateAccountStructurePayloadCopyWithImpl<$Res>
    implements _$UpdateAccountStructurePayloadCopyWith<$Res> {
  __$UpdateAccountStructurePayloadCopyWithImpl(this._self, this._then);

  final _UpdateAccountStructurePayload _self;
  final $Res Function(_UpdateAccountStructurePayload) _then;

/// Create a copy of UpdateAccountStructurePayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? departmentId = freezed,Object? classId = freezed,}) {
  return _then(_UpdateAccountStructurePayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AddTeacherToClassPayload {

 String get schoolId; String get accountId;
/// Create a copy of AddTeacherToClassPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddTeacherToClassPayloadCopyWith<AddTeacherToClassPayload> get copyWith => _$AddTeacherToClassPayloadCopyWithImpl<AddTeacherToClassPayload>(this as AddTeacherToClassPayload, _$identity);

  /// Serializes this AddTeacherToClassPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddTeacherToClassPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,accountId);

@override
String toString() {
  return 'AddTeacherToClassPayload(schoolId: $schoolId, accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class $AddTeacherToClassPayloadCopyWith<$Res>  {
  factory $AddTeacherToClassPayloadCopyWith(AddTeacherToClassPayload value, $Res Function(AddTeacherToClassPayload) _then) = _$AddTeacherToClassPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String accountId
});




}
/// @nodoc
class _$AddTeacherToClassPayloadCopyWithImpl<$Res>
    implements $AddTeacherToClassPayloadCopyWith<$Res> {
  _$AddTeacherToClassPayloadCopyWithImpl(this._self, this._then);

  final AddTeacherToClassPayload _self;
  final $Res Function(AddTeacherToClassPayload) _then;

/// Create a copy of AddTeacherToClassPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? accountId = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AddTeacherToClassPayload].
extension AddTeacherToClassPayloadPatterns on AddTeacherToClassPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddTeacherToClassPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddTeacherToClassPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddTeacherToClassPayload value)  $default,){
final _that = this;
switch (_that) {
case _AddTeacherToClassPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddTeacherToClassPayload value)?  $default,){
final _that = this;
switch (_that) {
case _AddTeacherToClassPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String accountId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddTeacherToClassPayload() when $default != null:
return $default(_that.schoolId,_that.accountId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String accountId)  $default,) {final _that = this;
switch (_that) {
case _AddTeacherToClassPayload():
return $default(_that.schoolId,_that.accountId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String accountId)?  $default,) {final _that = this;
switch (_that) {
case _AddTeacherToClassPayload() when $default != null:
return $default(_that.schoolId,_that.accountId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _AddTeacherToClassPayload implements AddTeacherToClassPayload {
  const _AddTeacherToClassPayload({required this.schoolId, required this.accountId});
  factory _AddTeacherToClassPayload.fromJson(Map<String, dynamic> json) => _$AddTeacherToClassPayloadFromJson(json);

@override final  String schoolId;
@override final  String accountId;

/// Create a copy of AddTeacherToClassPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddTeacherToClassPayloadCopyWith<_AddTeacherToClassPayload> get copyWith => __$AddTeacherToClassPayloadCopyWithImpl<_AddTeacherToClassPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddTeacherToClassPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddTeacherToClassPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,accountId);

@override
String toString() {
  return 'AddTeacherToClassPayload(schoolId: $schoolId, accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class _$AddTeacherToClassPayloadCopyWith<$Res> implements $AddTeacherToClassPayloadCopyWith<$Res> {
  factory _$AddTeacherToClassPayloadCopyWith(_AddTeacherToClassPayload value, $Res Function(_AddTeacherToClassPayload) _then) = __$AddTeacherToClassPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String accountId
});




}
/// @nodoc
class __$AddTeacherToClassPayloadCopyWithImpl<$Res>
    implements _$AddTeacherToClassPayloadCopyWith<$Res> {
  __$AddTeacherToClassPayloadCopyWithImpl(this._self, this._then);

  final _AddTeacherToClassPayload _self;
  final $Res Function(_AddTeacherToClassPayload) _then;

/// Create a copy of AddTeacherToClassPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? accountId = null,}) {
  return _then(_AddTeacherToClassPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BatchOperateAccountsPayload {

 String get schoolId; List<String> get accountIds; String get action;
/// Create a copy of BatchOperateAccountsPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatchOperateAccountsPayloadCopyWith<BatchOperateAccountsPayload> get copyWith => _$BatchOperateAccountsPayloadCopyWithImpl<BatchOperateAccountsPayload>(this as BatchOperateAccountsPayload, _$identity);

  /// Serializes this BatchOperateAccountsPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatchOperateAccountsPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&const DeepCollectionEquality().equals(other.accountIds, accountIds)&&(identical(other.action, action) || other.action == action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,const DeepCollectionEquality().hash(accountIds),action);

@override
String toString() {
  return 'BatchOperateAccountsPayload(schoolId: $schoolId, accountIds: $accountIds, action: $action)';
}


}

/// @nodoc
abstract mixin class $BatchOperateAccountsPayloadCopyWith<$Res>  {
  factory $BatchOperateAccountsPayloadCopyWith(BatchOperateAccountsPayload value, $Res Function(BatchOperateAccountsPayload) _then) = _$BatchOperateAccountsPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, List<String> accountIds, String action
});




}
/// @nodoc
class _$BatchOperateAccountsPayloadCopyWithImpl<$Res>
    implements $BatchOperateAccountsPayloadCopyWith<$Res> {
  _$BatchOperateAccountsPayloadCopyWithImpl(this._self, this._then);

  final BatchOperateAccountsPayload _self;
  final $Res Function(BatchOperateAccountsPayload) _then;

/// Create a copy of BatchOperateAccountsPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? accountIds = null,Object? action = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,accountIds: null == accountIds ? _self.accountIds : accountIds // ignore: cast_nullable_to_non_nullable
as List<String>,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BatchOperateAccountsPayload].
extension BatchOperateAccountsPayloadPatterns on BatchOperateAccountsPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BatchOperateAccountsPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BatchOperateAccountsPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BatchOperateAccountsPayload value)  $default,){
final _that = this;
switch (_that) {
case _BatchOperateAccountsPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BatchOperateAccountsPayload value)?  $default,){
final _that = this;
switch (_that) {
case _BatchOperateAccountsPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  List<String> accountIds,  String action)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BatchOperateAccountsPayload() when $default != null:
return $default(_that.schoolId,_that.accountIds,_that.action);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  List<String> accountIds,  String action)  $default,) {final _that = this;
switch (_that) {
case _BatchOperateAccountsPayload():
return $default(_that.schoolId,_that.accountIds,_that.action);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  List<String> accountIds,  String action)?  $default,) {final _that = this;
switch (_that) {
case _BatchOperateAccountsPayload() when $default != null:
return $default(_that.schoolId,_that.accountIds,_that.action);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _BatchOperateAccountsPayload implements BatchOperateAccountsPayload {
  const _BatchOperateAccountsPayload({required this.schoolId, required final  List<String> accountIds, required this.action}): _accountIds = accountIds;
  factory _BatchOperateAccountsPayload.fromJson(Map<String, dynamic> json) => _$BatchOperateAccountsPayloadFromJson(json);

@override final  String schoolId;
 final  List<String> _accountIds;
@override List<String> get accountIds {
  if (_accountIds is EqualUnmodifiableListView) return _accountIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accountIds);
}

@override final  String action;

/// Create a copy of BatchOperateAccountsPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BatchOperateAccountsPayloadCopyWith<_BatchOperateAccountsPayload> get copyWith => __$BatchOperateAccountsPayloadCopyWithImpl<_BatchOperateAccountsPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BatchOperateAccountsPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BatchOperateAccountsPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&const DeepCollectionEquality().equals(other._accountIds, _accountIds)&&(identical(other.action, action) || other.action == action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,const DeepCollectionEquality().hash(_accountIds),action);

@override
String toString() {
  return 'BatchOperateAccountsPayload(schoolId: $schoolId, accountIds: $accountIds, action: $action)';
}


}

/// @nodoc
abstract mixin class _$BatchOperateAccountsPayloadCopyWith<$Res> implements $BatchOperateAccountsPayloadCopyWith<$Res> {
  factory _$BatchOperateAccountsPayloadCopyWith(_BatchOperateAccountsPayload value, $Res Function(_BatchOperateAccountsPayload) _then) = __$BatchOperateAccountsPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, List<String> accountIds, String action
});




}
/// @nodoc
class __$BatchOperateAccountsPayloadCopyWithImpl<$Res>
    implements _$BatchOperateAccountsPayloadCopyWith<$Res> {
  __$BatchOperateAccountsPayloadCopyWithImpl(this._self, this._then);

  final _BatchOperateAccountsPayload _self;
  final $Res Function(_BatchOperateAccountsPayload) _then;

/// Create a copy of BatchOperateAccountsPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? accountIds = null,Object? action = null,}) {
  return _then(_BatchOperateAccountsPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,accountIds: null == accountIds ? _self._accountIds : accountIds // ignore: cast_nullable_to_non_nullable
as List<String>,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OssCredentialsResult {

 List<AdminOssCredential> get credentials;
/// Create a copy of OssCredentialsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OssCredentialsResultCopyWith<OssCredentialsResult> get copyWith => _$OssCredentialsResultCopyWithImpl<OssCredentialsResult>(this as OssCredentialsResult, _$identity);

  /// Serializes this OssCredentialsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OssCredentialsResult&&const DeepCollectionEquality().equals(other.credentials, credentials));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(credentials));

@override
String toString() {
  return 'OssCredentialsResult(credentials: $credentials)';
}


}

/// @nodoc
abstract mixin class $OssCredentialsResultCopyWith<$Res>  {
  factory $OssCredentialsResultCopyWith(OssCredentialsResult value, $Res Function(OssCredentialsResult) _then) = _$OssCredentialsResultCopyWithImpl;
@useResult
$Res call({
 List<AdminOssCredential> credentials
});




}
/// @nodoc
class _$OssCredentialsResultCopyWithImpl<$Res>
    implements $OssCredentialsResultCopyWith<$Res> {
  _$OssCredentialsResultCopyWithImpl(this._self, this._then);

  final OssCredentialsResult _self;
  final $Res Function(OssCredentialsResult) _then;

/// Create a copy of OssCredentialsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? credentials = null,}) {
  return _then(_self.copyWith(
credentials: null == credentials ? _self.credentials : credentials // ignore: cast_nullable_to_non_nullable
as List<AdminOssCredential>,
  ));
}

}


/// Adds pattern-matching-related methods to [OssCredentialsResult].
extension OssCredentialsResultPatterns on OssCredentialsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OssCredentialsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OssCredentialsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OssCredentialsResult value)  $default,){
final _that = this;
switch (_that) {
case _OssCredentialsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OssCredentialsResult value)?  $default,){
final _that = this;
switch (_that) {
case _OssCredentialsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AdminOssCredential> credentials)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OssCredentialsResult() when $default != null:
return $default(_that.credentials);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AdminOssCredential> credentials)  $default,) {final _that = this;
switch (_that) {
case _OssCredentialsResult():
return $default(_that.credentials);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AdminOssCredential> credentials)?  $default,) {final _that = this;
switch (_that) {
case _OssCredentialsResult() when $default != null:
return $default(_that.credentials);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OssCredentialsResult implements OssCredentialsResult {
  const _OssCredentialsResult({final  List<AdminOssCredential> credentials = const <AdminOssCredential>[]}): _credentials = credentials;
  factory _OssCredentialsResult.fromJson(Map<String, dynamic> json) => _$OssCredentialsResultFromJson(json);

 final  List<AdminOssCredential> _credentials;
@override@JsonKey() List<AdminOssCredential> get credentials {
  if (_credentials is EqualUnmodifiableListView) return _credentials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_credentials);
}


/// Create a copy of OssCredentialsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OssCredentialsResultCopyWith<_OssCredentialsResult> get copyWith => __$OssCredentialsResultCopyWithImpl<_OssCredentialsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OssCredentialsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OssCredentialsResult&&const DeepCollectionEquality().equals(other._credentials, _credentials));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_credentials));

@override
String toString() {
  return 'OssCredentialsResult(credentials: $credentials)';
}


}

/// @nodoc
abstract mixin class _$OssCredentialsResultCopyWith<$Res> implements $OssCredentialsResultCopyWith<$Res> {
  factory _$OssCredentialsResultCopyWith(_OssCredentialsResult value, $Res Function(_OssCredentialsResult) _then) = __$OssCredentialsResultCopyWithImpl;
@override @useResult
$Res call({
 List<AdminOssCredential> credentials
});




}
/// @nodoc
class __$OssCredentialsResultCopyWithImpl<$Res>
    implements _$OssCredentialsResultCopyWith<$Res> {
  __$OssCredentialsResultCopyWithImpl(this._self, this._then);

  final _OssCredentialsResult _self;
  final $Res Function(_OssCredentialsResult) _then;

/// Create a copy of OssCredentialsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? credentials = null,}) {
  return _then(_OssCredentialsResult(
credentials: null == credentials ? _self._credentials : credentials // ignore: cast_nullable_to_non_nullable
as List<AdminOssCredential>,
  ));
}


}


/// @nodoc
mixin _$OssPoliciesResult {

 List<AdminOssPolicy> get policies;
/// Create a copy of OssPoliciesResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OssPoliciesResultCopyWith<OssPoliciesResult> get copyWith => _$OssPoliciesResultCopyWithImpl<OssPoliciesResult>(this as OssPoliciesResult, _$identity);

  /// Serializes this OssPoliciesResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OssPoliciesResult&&const DeepCollectionEquality().equals(other.policies, policies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(policies));

@override
String toString() {
  return 'OssPoliciesResult(policies: $policies)';
}


}

/// @nodoc
abstract mixin class $OssPoliciesResultCopyWith<$Res>  {
  factory $OssPoliciesResultCopyWith(OssPoliciesResult value, $Res Function(OssPoliciesResult) _then) = _$OssPoliciesResultCopyWithImpl;
@useResult
$Res call({
 List<AdminOssPolicy> policies
});




}
/// @nodoc
class _$OssPoliciesResultCopyWithImpl<$Res>
    implements $OssPoliciesResultCopyWith<$Res> {
  _$OssPoliciesResultCopyWithImpl(this._self, this._then);

  final OssPoliciesResult _self;
  final $Res Function(OssPoliciesResult) _then;

/// Create a copy of OssPoliciesResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? policies = null,}) {
  return _then(_self.copyWith(
policies: null == policies ? _self.policies : policies // ignore: cast_nullable_to_non_nullable
as List<AdminOssPolicy>,
  ));
}

}


/// Adds pattern-matching-related methods to [OssPoliciesResult].
extension OssPoliciesResultPatterns on OssPoliciesResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OssPoliciesResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OssPoliciesResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OssPoliciesResult value)  $default,){
final _that = this;
switch (_that) {
case _OssPoliciesResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OssPoliciesResult value)?  $default,){
final _that = this;
switch (_that) {
case _OssPoliciesResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AdminOssPolicy> policies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OssPoliciesResult() when $default != null:
return $default(_that.policies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AdminOssPolicy> policies)  $default,) {final _that = this;
switch (_that) {
case _OssPoliciesResult():
return $default(_that.policies);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AdminOssPolicy> policies)?  $default,) {final _that = this;
switch (_that) {
case _OssPoliciesResult() when $default != null:
return $default(_that.policies);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OssPoliciesResult implements OssPoliciesResult {
  const _OssPoliciesResult({final  List<AdminOssPolicy> policies = const <AdminOssPolicy>[]}): _policies = policies;
  factory _OssPoliciesResult.fromJson(Map<String, dynamic> json) => _$OssPoliciesResultFromJson(json);

 final  List<AdminOssPolicy> _policies;
@override@JsonKey() List<AdminOssPolicy> get policies {
  if (_policies is EqualUnmodifiableListView) return _policies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_policies);
}


/// Create a copy of OssPoliciesResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OssPoliciesResultCopyWith<_OssPoliciesResult> get copyWith => __$OssPoliciesResultCopyWithImpl<_OssPoliciesResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OssPoliciesResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OssPoliciesResult&&const DeepCollectionEquality().equals(other._policies, _policies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_policies));

@override
String toString() {
  return 'OssPoliciesResult(policies: $policies)';
}


}

/// @nodoc
abstract mixin class _$OssPoliciesResultCopyWith<$Res> implements $OssPoliciesResultCopyWith<$Res> {
  factory _$OssPoliciesResultCopyWith(_OssPoliciesResult value, $Res Function(_OssPoliciesResult) _then) = __$OssPoliciesResultCopyWithImpl;
@override @useResult
$Res call({
 List<AdminOssPolicy> policies
});




}
/// @nodoc
class __$OssPoliciesResultCopyWithImpl<$Res>
    implements _$OssPoliciesResultCopyWith<$Res> {
  __$OssPoliciesResultCopyWithImpl(this._self, this._then);

  final _OssPoliciesResult _self;
  final $Res Function(_OssPoliciesResult) _then;

/// Create a copy of OssPoliciesResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? policies = null,}) {
  return _then(_OssPoliciesResult(
policies: null == policies ? _self._policies : policies // ignore: cast_nullable_to_non_nullable
as List<AdminOssPolicy>,
  ));
}


}


/// @nodoc
mixin _$FetchOssAuditLogsPayload {

 String get schoolId; int get limit;
/// Create a copy of FetchOssAuditLogsPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchOssAuditLogsPayloadCopyWith<FetchOssAuditLogsPayload> get copyWith => _$FetchOssAuditLogsPayloadCopyWithImpl<FetchOssAuditLogsPayload>(this as FetchOssAuditLogsPayload, _$identity);

  /// Serializes this FetchOssAuditLogsPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchOssAuditLogsPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,limit);

@override
String toString() {
  return 'FetchOssAuditLogsPayload(schoolId: $schoolId, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $FetchOssAuditLogsPayloadCopyWith<$Res>  {
  factory $FetchOssAuditLogsPayloadCopyWith(FetchOssAuditLogsPayload value, $Res Function(FetchOssAuditLogsPayload) _then) = _$FetchOssAuditLogsPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, int limit
});




}
/// @nodoc
class _$FetchOssAuditLogsPayloadCopyWithImpl<$Res>
    implements $FetchOssAuditLogsPayloadCopyWith<$Res> {
  _$FetchOssAuditLogsPayloadCopyWithImpl(this._self, this._then);

  final FetchOssAuditLogsPayload _self;
  final $Res Function(FetchOssAuditLogsPayload) _then;

/// Create a copy of FetchOssAuditLogsPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? limit = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FetchOssAuditLogsPayload].
extension FetchOssAuditLogsPayloadPatterns on FetchOssAuditLogsPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FetchOssAuditLogsPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchOssAuditLogsPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FetchOssAuditLogsPayload value)  $default,){
final _that = this;
switch (_that) {
case _FetchOssAuditLogsPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FetchOssAuditLogsPayload value)?  $default,){
final _that = this;
switch (_that) {
case _FetchOssAuditLogsPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchOssAuditLogsPayload() when $default != null:
return $default(_that.schoolId,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  int limit)  $default,) {final _that = this;
switch (_that) {
case _FetchOssAuditLogsPayload():
return $default(_that.schoolId,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _FetchOssAuditLogsPayload() when $default != null:
return $default(_that.schoolId,_that.limit);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _FetchOssAuditLogsPayload implements FetchOssAuditLogsPayload {
  const _FetchOssAuditLogsPayload({required this.schoolId, this.limit = 20});
  factory _FetchOssAuditLogsPayload.fromJson(Map<String, dynamic> json) => _$FetchOssAuditLogsPayloadFromJson(json);

@override final  String schoolId;
@override@JsonKey() final  int limit;

/// Create a copy of FetchOssAuditLogsPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchOssAuditLogsPayloadCopyWith<_FetchOssAuditLogsPayload> get copyWith => __$FetchOssAuditLogsPayloadCopyWithImpl<_FetchOssAuditLogsPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FetchOssAuditLogsPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchOssAuditLogsPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,limit);

@override
String toString() {
  return 'FetchOssAuditLogsPayload(schoolId: $schoolId, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$FetchOssAuditLogsPayloadCopyWith<$Res> implements $FetchOssAuditLogsPayloadCopyWith<$Res> {
  factory _$FetchOssAuditLogsPayloadCopyWith(_FetchOssAuditLogsPayload value, $Res Function(_FetchOssAuditLogsPayload) _then) = __$FetchOssAuditLogsPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, int limit
});




}
/// @nodoc
class __$FetchOssAuditLogsPayloadCopyWithImpl<$Res>
    implements _$FetchOssAuditLogsPayloadCopyWith<$Res> {
  __$FetchOssAuditLogsPayloadCopyWithImpl(this._self, this._then);

  final _FetchOssAuditLogsPayload _self;
  final $Res Function(_FetchOssAuditLogsPayload) _then;

/// Create a copy of FetchOssAuditLogsPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? limit = null,}) {
  return _then(_FetchOssAuditLogsPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$OssAuditLogsResult {

 List<AdminOssAuditLog> get logs;
/// Create a copy of OssAuditLogsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OssAuditLogsResultCopyWith<OssAuditLogsResult> get copyWith => _$OssAuditLogsResultCopyWithImpl<OssAuditLogsResult>(this as OssAuditLogsResult, _$identity);

  /// Serializes this OssAuditLogsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OssAuditLogsResult&&const DeepCollectionEquality().equals(other.logs, logs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(logs));

@override
String toString() {
  return 'OssAuditLogsResult(logs: $logs)';
}


}

/// @nodoc
abstract mixin class $OssAuditLogsResultCopyWith<$Res>  {
  factory $OssAuditLogsResultCopyWith(OssAuditLogsResult value, $Res Function(OssAuditLogsResult) _then) = _$OssAuditLogsResultCopyWithImpl;
@useResult
$Res call({
 List<AdminOssAuditLog> logs
});




}
/// @nodoc
class _$OssAuditLogsResultCopyWithImpl<$Res>
    implements $OssAuditLogsResultCopyWith<$Res> {
  _$OssAuditLogsResultCopyWithImpl(this._self, this._then);

  final OssAuditLogsResult _self;
  final $Res Function(OssAuditLogsResult) _then;

/// Create a copy of OssAuditLogsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? logs = null,}) {
  return _then(_self.copyWith(
logs: null == logs ? _self.logs : logs // ignore: cast_nullable_to_non_nullable
as List<AdminOssAuditLog>,
  ));
}

}


/// Adds pattern-matching-related methods to [OssAuditLogsResult].
extension OssAuditLogsResultPatterns on OssAuditLogsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OssAuditLogsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OssAuditLogsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OssAuditLogsResult value)  $default,){
final _that = this;
switch (_that) {
case _OssAuditLogsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OssAuditLogsResult value)?  $default,){
final _that = this;
switch (_that) {
case _OssAuditLogsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AdminOssAuditLog> logs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OssAuditLogsResult() when $default != null:
return $default(_that.logs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AdminOssAuditLog> logs)  $default,) {final _that = this;
switch (_that) {
case _OssAuditLogsResult():
return $default(_that.logs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AdminOssAuditLog> logs)?  $default,) {final _that = this;
switch (_that) {
case _OssAuditLogsResult() when $default != null:
return $default(_that.logs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OssAuditLogsResult implements OssAuditLogsResult {
  const _OssAuditLogsResult({final  List<AdminOssAuditLog> logs = const <AdminOssAuditLog>[]}): _logs = logs;
  factory _OssAuditLogsResult.fromJson(Map<String, dynamic> json) => _$OssAuditLogsResultFromJson(json);

 final  List<AdminOssAuditLog> _logs;
@override@JsonKey() List<AdminOssAuditLog> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}


/// Create a copy of OssAuditLogsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OssAuditLogsResultCopyWith<_OssAuditLogsResult> get copyWith => __$OssAuditLogsResultCopyWithImpl<_OssAuditLogsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OssAuditLogsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OssAuditLogsResult&&const DeepCollectionEquality().equals(other._logs, _logs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_logs));

@override
String toString() {
  return 'OssAuditLogsResult(logs: $logs)';
}


}

/// @nodoc
abstract mixin class _$OssAuditLogsResultCopyWith<$Res> implements $OssAuditLogsResultCopyWith<$Res> {
  factory _$OssAuditLogsResultCopyWith(_OssAuditLogsResult value, $Res Function(_OssAuditLogsResult) _then) = __$OssAuditLogsResultCopyWithImpl;
@override @useResult
$Res call({
 List<AdminOssAuditLog> logs
});




}
/// @nodoc
class __$OssAuditLogsResultCopyWithImpl<$Res>
    implements _$OssAuditLogsResultCopyWith<$Res> {
  __$OssAuditLogsResultCopyWithImpl(this._self, this._then);

  final _OssAuditLogsResult _self;
  final $Res Function(_OssAuditLogsResult) _then;

/// Create a copy of OssAuditLogsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? logs = null,}) {
  return _then(_OssAuditLogsResult(
logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<AdminOssAuditLog>,
  ));
}


}


/// @nodoc
mixin _$SystemSwitchesResult {

 List<AdminSystemSwitch> get switches;
/// Create a copy of SystemSwitchesResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SystemSwitchesResultCopyWith<SystemSwitchesResult> get copyWith => _$SystemSwitchesResultCopyWithImpl<SystemSwitchesResult>(this as SystemSwitchesResult, _$identity);

  /// Serializes this SystemSwitchesResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SystemSwitchesResult&&const DeepCollectionEquality().equals(other.switches, switches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(switches));

@override
String toString() {
  return 'SystemSwitchesResult(switches: $switches)';
}


}

/// @nodoc
abstract mixin class $SystemSwitchesResultCopyWith<$Res>  {
  factory $SystemSwitchesResultCopyWith(SystemSwitchesResult value, $Res Function(SystemSwitchesResult) _then) = _$SystemSwitchesResultCopyWithImpl;
@useResult
$Res call({
 List<AdminSystemSwitch> switches
});




}
/// @nodoc
class _$SystemSwitchesResultCopyWithImpl<$Res>
    implements $SystemSwitchesResultCopyWith<$Res> {
  _$SystemSwitchesResultCopyWithImpl(this._self, this._then);

  final SystemSwitchesResult _self;
  final $Res Function(SystemSwitchesResult) _then;

/// Create a copy of SystemSwitchesResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? switches = null,}) {
  return _then(_self.copyWith(
switches: null == switches ? _self.switches : switches // ignore: cast_nullable_to_non_nullable
as List<AdminSystemSwitch>,
  ));
}

}


/// Adds pattern-matching-related methods to [SystemSwitchesResult].
extension SystemSwitchesResultPatterns on SystemSwitchesResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SystemSwitchesResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SystemSwitchesResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SystemSwitchesResult value)  $default,){
final _that = this;
switch (_that) {
case _SystemSwitchesResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SystemSwitchesResult value)?  $default,){
final _that = this;
switch (_that) {
case _SystemSwitchesResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AdminSystemSwitch> switches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SystemSwitchesResult() when $default != null:
return $default(_that.switches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AdminSystemSwitch> switches)  $default,) {final _that = this;
switch (_that) {
case _SystemSwitchesResult():
return $default(_that.switches);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AdminSystemSwitch> switches)?  $default,) {final _that = this;
switch (_that) {
case _SystemSwitchesResult() when $default != null:
return $default(_that.switches);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SystemSwitchesResult implements SystemSwitchesResult {
  const _SystemSwitchesResult({final  List<AdminSystemSwitch> switches = const <AdminSystemSwitch>[]}): _switches = switches;
  factory _SystemSwitchesResult.fromJson(Map<String, dynamic> json) => _$SystemSwitchesResultFromJson(json);

 final  List<AdminSystemSwitch> _switches;
@override@JsonKey() List<AdminSystemSwitch> get switches {
  if (_switches is EqualUnmodifiableListView) return _switches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_switches);
}


/// Create a copy of SystemSwitchesResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SystemSwitchesResultCopyWith<_SystemSwitchesResult> get copyWith => __$SystemSwitchesResultCopyWithImpl<_SystemSwitchesResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SystemSwitchesResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SystemSwitchesResult&&const DeepCollectionEquality().equals(other._switches, _switches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_switches));

@override
String toString() {
  return 'SystemSwitchesResult(switches: $switches)';
}


}

/// @nodoc
abstract mixin class _$SystemSwitchesResultCopyWith<$Res> implements $SystemSwitchesResultCopyWith<$Res> {
  factory _$SystemSwitchesResultCopyWith(_SystemSwitchesResult value, $Res Function(_SystemSwitchesResult) _then) = __$SystemSwitchesResultCopyWithImpl;
@override @useResult
$Res call({
 List<AdminSystemSwitch> switches
});




}
/// @nodoc
class __$SystemSwitchesResultCopyWithImpl<$Res>
    implements _$SystemSwitchesResultCopyWith<$Res> {
  __$SystemSwitchesResultCopyWithImpl(this._self, this._then);

  final _SystemSwitchesResult _self;
  final $Res Function(_SystemSwitchesResult) _then;

/// Create a copy of SystemSwitchesResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? switches = null,}) {
  return _then(_SystemSwitchesResult(
switches: null == switches ? _self._switches : switches // ignore: cast_nullable_to_non_nullable
as List<AdminSystemSwitch>,
  ));
}


}


/// @nodoc
mixin _$UpdateSystemSwitchPayload {

 String get schoolId; bool get enabled;
/// Create a copy of UpdateSystemSwitchPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateSystemSwitchPayloadCopyWith<UpdateSystemSwitchPayload> get copyWith => _$UpdateSystemSwitchPayloadCopyWithImpl<UpdateSystemSwitchPayload>(this as UpdateSystemSwitchPayload, _$identity);

  /// Serializes this UpdateSystemSwitchPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSystemSwitchPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,enabled);

@override
String toString() {
  return 'UpdateSystemSwitchPayload(schoolId: $schoolId, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class $UpdateSystemSwitchPayloadCopyWith<$Res>  {
  factory $UpdateSystemSwitchPayloadCopyWith(UpdateSystemSwitchPayload value, $Res Function(UpdateSystemSwitchPayload) _then) = _$UpdateSystemSwitchPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, bool enabled
});




}
/// @nodoc
class _$UpdateSystemSwitchPayloadCopyWithImpl<$Res>
    implements $UpdateSystemSwitchPayloadCopyWith<$Res> {
  _$UpdateSystemSwitchPayloadCopyWithImpl(this._self, this._then);

  final UpdateSystemSwitchPayload _self;
  final $Res Function(UpdateSystemSwitchPayload) _then;

/// Create a copy of UpdateSystemSwitchPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? enabled = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateSystemSwitchPayload].
extension UpdateSystemSwitchPayloadPatterns on UpdateSystemSwitchPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateSystemSwitchPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateSystemSwitchPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateSystemSwitchPayload value)  $default,){
final _that = this;
switch (_that) {
case _UpdateSystemSwitchPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateSystemSwitchPayload value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateSystemSwitchPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  bool enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateSystemSwitchPayload() when $default != null:
return $default(_that.schoolId,_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  bool enabled)  $default,) {final _that = this;
switch (_that) {
case _UpdateSystemSwitchPayload():
return $default(_that.schoolId,_that.enabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  bool enabled)?  $default,) {final _that = this;
switch (_that) {
case _UpdateSystemSwitchPayload() when $default != null:
return $default(_that.schoolId,_that.enabled);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _UpdateSystemSwitchPayload implements UpdateSystemSwitchPayload {
  const _UpdateSystemSwitchPayload({required this.schoolId, required this.enabled});
  factory _UpdateSystemSwitchPayload.fromJson(Map<String, dynamic> json) => _$UpdateSystemSwitchPayloadFromJson(json);

@override final  String schoolId;
@override final  bool enabled;

/// Create a copy of UpdateSystemSwitchPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSystemSwitchPayloadCopyWith<_UpdateSystemSwitchPayload> get copyWith => __$UpdateSystemSwitchPayloadCopyWithImpl<_UpdateSystemSwitchPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateSystemSwitchPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSystemSwitchPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,enabled);

@override
String toString() {
  return 'UpdateSystemSwitchPayload(schoolId: $schoolId, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$UpdateSystemSwitchPayloadCopyWith<$Res> implements $UpdateSystemSwitchPayloadCopyWith<$Res> {
  factory _$UpdateSystemSwitchPayloadCopyWith(_UpdateSystemSwitchPayload value, $Res Function(_UpdateSystemSwitchPayload) _then) = __$UpdateSystemSwitchPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, bool enabled
});




}
/// @nodoc
class __$UpdateSystemSwitchPayloadCopyWithImpl<$Res>
    implements _$UpdateSystemSwitchPayloadCopyWith<$Res> {
  __$UpdateSystemSwitchPayloadCopyWithImpl(this._self, this._then);

  final _UpdateSystemSwitchPayload _self;
  final $Res Function(_UpdateSystemSwitchPayload) _then;

/// Create a copy of UpdateSystemSwitchPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? enabled = null,}) {
  return _then(_UpdateSystemSwitchPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SystemParametersResult {

 List<AdminSystemParameter> get parameters;
/// Create a copy of SystemParametersResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SystemParametersResultCopyWith<SystemParametersResult> get copyWith => _$SystemParametersResultCopyWithImpl<SystemParametersResult>(this as SystemParametersResult, _$identity);

  /// Serializes this SystemParametersResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SystemParametersResult&&const DeepCollectionEquality().equals(other.parameters, parameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(parameters));

@override
String toString() {
  return 'SystemParametersResult(parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class $SystemParametersResultCopyWith<$Res>  {
  factory $SystemParametersResultCopyWith(SystemParametersResult value, $Res Function(SystemParametersResult) _then) = _$SystemParametersResultCopyWithImpl;
@useResult
$Res call({
 List<AdminSystemParameter> parameters
});




}
/// @nodoc
class _$SystemParametersResultCopyWithImpl<$Res>
    implements $SystemParametersResultCopyWith<$Res> {
  _$SystemParametersResultCopyWithImpl(this._self, this._then);

  final SystemParametersResult _self;
  final $Res Function(SystemParametersResult) _then;

/// Create a copy of SystemParametersResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parameters = null,}) {
  return _then(_self.copyWith(
parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as List<AdminSystemParameter>,
  ));
}

}


/// Adds pattern-matching-related methods to [SystemParametersResult].
extension SystemParametersResultPatterns on SystemParametersResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SystemParametersResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SystemParametersResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SystemParametersResult value)  $default,){
final _that = this;
switch (_that) {
case _SystemParametersResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SystemParametersResult value)?  $default,){
final _that = this;
switch (_that) {
case _SystemParametersResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AdminSystemParameter> parameters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SystemParametersResult() when $default != null:
return $default(_that.parameters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AdminSystemParameter> parameters)  $default,) {final _that = this;
switch (_that) {
case _SystemParametersResult():
return $default(_that.parameters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AdminSystemParameter> parameters)?  $default,) {final _that = this;
switch (_that) {
case _SystemParametersResult() when $default != null:
return $default(_that.parameters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SystemParametersResult implements SystemParametersResult {
  const _SystemParametersResult({final  List<AdminSystemParameter> parameters = const <AdminSystemParameter>[]}): _parameters = parameters;
  factory _SystemParametersResult.fromJson(Map<String, dynamic> json) => _$SystemParametersResultFromJson(json);

 final  List<AdminSystemParameter> _parameters;
@override@JsonKey() List<AdminSystemParameter> get parameters {
  if (_parameters is EqualUnmodifiableListView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parameters);
}


/// Create a copy of SystemParametersResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SystemParametersResultCopyWith<_SystemParametersResult> get copyWith => __$SystemParametersResultCopyWithImpl<_SystemParametersResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SystemParametersResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SystemParametersResult&&const DeepCollectionEquality().equals(other._parameters, _parameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_parameters));

@override
String toString() {
  return 'SystemParametersResult(parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class _$SystemParametersResultCopyWith<$Res> implements $SystemParametersResultCopyWith<$Res> {
  factory _$SystemParametersResultCopyWith(_SystemParametersResult value, $Res Function(_SystemParametersResult) _then) = __$SystemParametersResultCopyWithImpl;
@override @useResult
$Res call({
 List<AdminSystemParameter> parameters
});




}
/// @nodoc
class __$SystemParametersResultCopyWithImpl<$Res>
    implements _$SystemParametersResultCopyWith<$Res> {
  __$SystemParametersResultCopyWithImpl(this._self, this._then);

  final _SystemParametersResult _self;
  final $Res Function(_SystemParametersResult) _then;

/// Create a copy of SystemParametersResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? parameters = null,}) {
  return _then(_SystemParametersResult(
parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as List<AdminSystemParameter>,
  ));
}


}


/// @nodoc
mixin _$UpdateSystemParameterPayload {

 String get schoolId; String get value;
/// Create a copy of UpdateSystemParameterPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateSystemParameterPayloadCopyWith<UpdateSystemParameterPayload> get copyWith => _$UpdateSystemParameterPayloadCopyWithImpl<UpdateSystemParameterPayload>(this as UpdateSystemParameterPayload, _$identity);

  /// Serializes this UpdateSystemParameterPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSystemParameterPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,value);

@override
String toString() {
  return 'UpdateSystemParameterPayload(schoolId: $schoolId, value: $value)';
}


}

/// @nodoc
abstract mixin class $UpdateSystemParameterPayloadCopyWith<$Res>  {
  factory $UpdateSystemParameterPayloadCopyWith(UpdateSystemParameterPayload value, $Res Function(UpdateSystemParameterPayload) _then) = _$UpdateSystemParameterPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String value
});




}
/// @nodoc
class _$UpdateSystemParameterPayloadCopyWithImpl<$Res>
    implements $UpdateSystemParameterPayloadCopyWith<$Res> {
  _$UpdateSystemParameterPayloadCopyWithImpl(this._self, this._then);

  final UpdateSystemParameterPayload _self;
  final $Res Function(UpdateSystemParameterPayload) _then;

/// Create a copy of UpdateSystemParameterPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? value = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateSystemParameterPayload].
extension UpdateSystemParameterPayloadPatterns on UpdateSystemParameterPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateSystemParameterPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateSystemParameterPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateSystemParameterPayload value)  $default,){
final _that = this;
switch (_that) {
case _UpdateSystemParameterPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateSystemParameterPayload value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateSystemParameterPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateSystemParameterPayload() when $default != null:
return $default(_that.schoolId,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String value)  $default,) {final _that = this;
switch (_that) {
case _UpdateSystemParameterPayload():
return $default(_that.schoolId,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String value)?  $default,) {final _that = this;
switch (_that) {
case _UpdateSystemParameterPayload() when $default != null:
return $default(_that.schoolId,_that.value);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _UpdateSystemParameterPayload implements UpdateSystemParameterPayload {
  const _UpdateSystemParameterPayload({required this.schoolId, required this.value});
  factory _UpdateSystemParameterPayload.fromJson(Map<String, dynamic> json) => _$UpdateSystemParameterPayloadFromJson(json);

@override final  String schoolId;
@override final  String value;

/// Create a copy of UpdateSystemParameterPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSystemParameterPayloadCopyWith<_UpdateSystemParameterPayload> get copyWith => __$UpdateSystemParameterPayloadCopyWithImpl<_UpdateSystemParameterPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateSystemParameterPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSystemParameterPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,value);

@override
String toString() {
  return 'UpdateSystemParameterPayload(schoolId: $schoolId, value: $value)';
}


}

/// @nodoc
abstract mixin class _$UpdateSystemParameterPayloadCopyWith<$Res> implements $UpdateSystemParameterPayloadCopyWith<$Res> {
  factory _$UpdateSystemParameterPayloadCopyWith(_UpdateSystemParameterPayload value, $Res Function(_UpdateSystemParameterPayload) _then) = __$UpdateSystemParameterPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String value
});




}
/// @nodoc
class __$UpdateSystemParameterPayloadCopyWithImpl<$Res>
    implements _$UpdateSystemParameterPayloadCopyWith<$Res> {
  __$UpdateSystemParameterPayloadCopyWithImpl(this._self, this._then);

  final _UpdateSystemParameterPayload _self;
  final $Res Function(_UpdateSystemParameterPayload) _then;

/// Create a copy of UpdateSystemParameterPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? value = null,}) {
  return _then(_UpdateSystemParameterPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SystemBroadcastsResult {

 List<AdminSystemBroadcast> get broadcasts;
/// Create a copy of SystemBroadcastsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SystemBroadcastsResultCopyWith<SystemBroadcastsResult> get copyWith => _$SystemBroadcastsResultCopyWithImpl<SystemBroadcastsResult>(this as SystemBroadcastsResult, _$identity);

  /// Serializes this SystemBroadcastsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SystemBroadcastsResult&&const DeepCollectionEquality().equals(other.broadcasts, broadcasts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(broadcasts));

@override
String toString() {
  return 'SystemBroadcastsResult(broadcasts: $broadcasts)';
}


}

/// @nodoc
abstract mixin class $SystemBroadcastsResultCopyWith<$Res>  {
  factory $SystemBroadcastsResultCopyWith(SystemBroadcastsResult value, $Res Function(SystemBroadcastsResult) _then) = _$SystemBroadcastsResultCopyWithImpl;
@useResult
$Res call({
 List<AdminSystemBroadcast> broadcasts
});




}
/// @nodoc
class _$SystemBroadcastsResultCopyWithImpl<$Res>
    implements $SystemBroadcastsResultCopyWith<$Res> {
  _$SystemBroadcastsResultCopyWithImpl(this._self, this._then);

  final SystemBroadcastsResult _self;
  final $Res Function(SystemBroadcastsResult) _then;

/// Create a copy of SystemBroadcastsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? broadcasts = null,}) {
  return _then(_self.copyWith(
broadcasts: null == broadcasts ? _self.broadcasts : broadcasts // ignore: cast_nullable_to_non_nullable
as List<AdminSystemBroadcast>,
  ));
}

}


/// Adds pattern-matching-related methods to [SystemBroadcastsResult].
extension SystemBroadcastsResultPatterns on SystemBroadcastsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SystemBroadcastsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SystemBroadcastsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SystemBroadcastsResult value)  $default,){
final _that = this;
switch (_that) {
case _SystemBroadcastsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SystemBroadcastsResult value)?  $default,){
final _that = this;
switch (_that) {
case _SystemBroadcastsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AdminSystemBroadcast> broadcasts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SystemBroadcastsResult() when $default != null:
return $default(_that.broadcasts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AdminSystemBroadcast> broadcasts)  $default,) {final _that = this;
switch (_that) {
case _SystemBroadcastsResult():
return $default(_that.broadcasts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AdminSystemBroadcast> broadcasts)?  $default,) {final _that = this;
switch (_that) {
case _SystemBroadcastsResult() when $default != null:
return $default(_that.broadcasts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SystemBroadcastsResult implements SystemBroadcastsResult {
  const _SystemBroadcastsResult({final  List<AdminSystemBroadcast> broadcasts = const <AdminSystemBroadcast>[]}): _broadcasts = broadcasts;
  factory _SystemBroadcastsResult.fromJson(Map<String, dynamic> json) => _$SystemBroadcastsResultFromJson(json);

 final  List<AdminSystemBroadcast> _broadcasts;
@override@JsonKey() List<AdminSystemBroadcast> get broadcasts {
  if (_broadcasts is EqualUnmodifiableListView) return _broadcasts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_broadcasts);
}


/// Create a copy of SystemBroadcastsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SystemBroadcastsResultCopyWith<_SystemBroadcastsResult> get copyWith => __$SystemBroadcastsResultCopyWithImpl<_SystemBroadcastsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SystemBroadcastsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SystemBroadcastsResult&&const DeepCollectionEquality().equals(other._broadcasts, _broadcasts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_broadcasts));

@override
String toString() {
  return 'SystemBroadcastsResult(broadcasts: $broadcasts)';
}


}

/// @nodoc
abstract mixin class _$SystemBroadcastsResultCopyWith<$Res> implements $SystemBroadcastsResultCopyWith<$Res> {
  factory _$SystemBroadcastsResultCopyWith(_SystemBroadcastsResult value, $Res Function(_SystemBroadcastsResult) _then) = __$SystemBroadcastsResultCopyWithImpl;
@override @useResult
$Res call({
 List<AdminSystemBroadcast> broadcasts
});




}
/// @nodoc
class __$SystemBroadcastsResultCopyWithImpl<$Res>
    implements _$SystemBroadcastsResultCopyWith<$Res> {
  __$SystemBroadcastsResultCopyWithImpl(this._self, this._then);

  final _SystemBroadcastsResult _self;
  final $Res Function(_SystemBroadcastsResult) _then;

/// Create a copy of SystemBroadcastsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? broadcasts = null,}) {
  return _then(_SystemBroadcastsResult(
broadcasts: null == broadcasts ? _self._broadcasts : broadcasts // ignore: cast_nullable_to_non_nullable
as List<AdminSystemBroadcast>,
  ));
}


}


/// @nodoc
mixin _$UpdateSystemBroadcastPayload {

 String get schoolId; AdminSystemBroadcastStatus? get status; bool? get pinned;
/// Create a copy of UpdateSystemBroadcastPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateSystemBroadcastPayloadCopyWith<UpdateSystemBroadcastPayload> get copyWith => _$UpdateSystemBroadcastPayloadCopyWithImpl<UpdateSystemBroadcastPayload>(this as UpdateSystemBroadcastPayload, _$identity);

  /// Serializes this UpdateSystemBroadcastPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSystemBroadcastPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.status, status) || other.status == status)&&(identical(other.pinned, pinned) || other.pinned == pinned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,status,pinned);

@override
String toString() {
  return 'UpdateSystemBroadcastPayload(schoolId: $schoolId, status: $status, pinned: $pinned)';
}


}

/// @nodoc
abstract mixin class $UpdateSystemBroadcastPayloadCopyWith<$Res>  {
  factory $UpdateSystemBroadcastPayloadCopyWith(UpdateSystemBroadcastPayload value, $Res Function(UpdateSystemBroadcastPayload) _then) = _$UpdateSystemBroadcastPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, AdminSystemBroadcastStatus? status, bool? pinned
});




}
/// @nodoc
class _$UpdateSystemBroadcastPayloadCopyWithImpl<$Res>
    implements $UpdateSystemBroadcastPayloadCopyWith<$Res> {
  _$UpdateSystemBroadcastPayloadCopyWithImpl(this._self, this._then);

  final UpdateSystemBroadcastPayload _self;
  final $Res Function(UpdateSystemBroadcastPayload) _then;

/// Create a copy of UpdateSystemBroadcastPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? status = freezed,Object? pinned = freezed,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdminSystemBroadcastStatus?,pinned: freezed == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateSystemBroadcastPayload].
extension UpdateSystemBroadcastPayloadPatterns on UpdateSystemBroadcastPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateSystemBroadcastPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateSystemBroadcastPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateSystemBroadcastPayload value)  $default,){
final _that = this;
switch (_that) {
case _UpdateSystemBroadcastPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateSystemBroadcastPayload value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateSystemBroadcastPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  AdminSystemBroadcastStatus? status,  bool? pinned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateSystemBroadcastPayload() when $default != null:
return $default(_that.schoolId,_that.status,_that.pinned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  AdminSystemBroadcastStatus? status,  bool? pinned)  $default,) {final _that = this;
switch (_that) {
case _UpdateSystemBroadcastPayload():
return $default(_that.schoolId,_that.status,_that.pinned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  AdminSystemBroadcastStatus? status,  bool? pinned)?  $default,) {final _that = this;
switch (_that) {
case _UpdateSystemBroadcastPayload() when $default != null:
return $default(_that.schoolId,_that.status,_that.pinned);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _UpdateSystemBroadcastPayload implements UpdateSystemBroadcastPayload {
  const _UpdateSystemBroadcastPayload({required this.schoolId, this.status, this.pinned});
  factory _UpdateSystemBroadcastPayload.fromJson(Map<String, dynamic> json) => _$UpdateSystemBroadcastPayloadFromJson(json);

@override final  String schoolId;
@override final  AdminSystemBroadcastStatus? status;
@override final  bool? pinned;

/// Create a copy of UpdateSystemBroadcastPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSystemBroadcastPayloadCopyWith<_UpdateSystemBroadcastPayload> get copyWith => __$UpdateSystemBroadcastPayloadCopyWithImpl<_UpdateSystemBroadcastPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateSystemBroadcastPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSystemBroadcastPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.status, status) || other.status == status)&&(identical(other.pinned, pinned) || other.pinned == pinned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,status,pinned);

@override
String toString() {
  return 'UpdateSystemBroadcastPayload(schoolId: $schoolId, status: $status, pinned: $pinned)';
}


}

/// @nodoc
abstract mixin class _$UpdateSystemBroadcastPayloadCopyWith<$Res> implements $UpdateSystemBroadcastPayloadCopyWith<$Res> {
  factory _$UpdateSystemBroadcastPayloadCopyWith(_UpdateSystemBroadcastPayload value, $Res Function(_UpdateSystemBroadcastPayload) _then) = __$UpdateSystemBroadcastPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, AdminSystemBroadcastStatus? status, bool? pinned
});




}
/// @nodoc
class __$UpdateSystemBroadcastPayloadCopyWithImpl<$Res>
    implements _$UpdateSystemBroadcastPayloadCopyWith<$Res> {
  __$UpdateSystemBroadcastPayloadCopyWithImpl(this._self, this._then);

  final _UpdateSystemBroadcastPayload _self;
  final $Res Function(_UpdateSystemBroadcastPayload) _then;

/// Create a copy of UpdateSystemBroadcastPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? status = freezed,Object? pinned = freezed,}) {
  return _then(_UpdateSystemBroadcastPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdminSystemBroadcastStatus?,pinned: freezed == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$FetchSystemAuditLogsPayload {

 String get schoolId; int get limit;
/// Create a copy of FetchSystemAuditLogsPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchSystemAuditLogsPayloadCopyWith<FetchSystemAuditLogsPayload> get copyWith => _$FetchSystemAuditLogsPayloadCopyWithImpl<FetchSystemAuditLogsPayload>(this as FetchSystemAuditLogsPayload, _$identity);

  /// Serializes this FetchSystemAuditLogsPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchSystemAuditLogsPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,limit);

@override
String toString() {
  return 'FetchSystemAuditLogsPayload(schoolId: $schoolId, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $FetchSystemAuditLogsPayloadCopyWith<$Res>  {
  factory $FetchSystemAuditLogsPayloadCopyWith(FetchSystemAuditLogsPayload value, $Res Function(FetchSystemAuditLogsPayload) _then) = _$FetchSystemAuditLogsPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, int limit
});




}
/// @nodoc
class _$FetchSystemAuditLogsPayloadCopyWithImpl<$Res>
    implements $FetchSystemAuditLogsPayloadCopyWith<$Res> {
  _$FetchSystemAuditLogsPayloadCopyWithImpl(this._self, this._then);

  final FetchSystemAuditLogsPayload _self;
  final $Res Function(FetchSystemAuditLogsPayload) _then;

/// Create a copy of FetchSystemAuditLogsPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? limit = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FetchSystemAuditLogsPayload].
extension FetchSystemAuditLogsPayloadPatterns on FetchSystemAuditLogsPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FetchSystemAuditLogsPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchSystemAuditLogsPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FetchSystemAuditLogsPayload value)  $default,){
final _that = this;
switch (_that) {
case _FetchSystemAuditLogsPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FetchSystemAuditLogsPayload value)?  $default,){
final _that = this;
switch (_that) {
case _FetchSystemAuditLogsPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchSystemAuditLogsPayload() when $default != null:
return $default(_that.schoolId,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  int limit)  $default,) {final _that = this;
switch (_that) {
case _FetchSystemAuditLogsPayload():
return $default(_that.schoolId,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _FetchSystemAuditLogsPayload() when $default != null:
return $default(_that.schoolId,_that.limit);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _FetchSystemAuditLogsPayload implements FetchSystemAuditLogsPayload {
  const _FetchSystemAuditLogsPayload({required this.schoolId, this.limit = 50});
  factory _FetchSystemAuditLogsPayload.fromJson(Map<String, dynamic> json) => _$FetchSystemAuditLogsPayloadFromJson(json);

@override final  String schoolId;
@override@JsonKey() final  int limit;

/// Create a copy of FetchSystemAuditLogsPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchSystemAuditLogsPayloadCopyWith<_FetchSystemAuditLogsPayload> get copyWith => __$FetchSystemAuditLogsPayloadCopyWithImpl<_FetchSystemAuditLogsPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FetchSystemAuditLogsPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchSystemAuditLogsPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,limit);

@override
String toString() {
  return 'FetchSystemAuditLogsPayload(schoolId: $schoolId, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$FetchSystemAuditLogsPayloadCopyWith<$Res> implements $FetchSystemAuditLogsPayloadCopyWith<$Res> {
  factory _$FetchSystemAuditLogsPayloadCopyWith(_FetchSystemAuditLogsPayload value, $Res Function(_FetchSystemAuditLogsPayload) _then) = __$FetchSystemAuditLogsPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, int limit
});




}
/// @nodoc
class __$FetchSystemAuditLogsPayloadCopyWithImpl<$Res>
    implements _$FetchSystemAuditLogsPayloadCopyWith<$Res> {
  __$FetchSystemAuditLogsPayloadCopyWithImpl(this._self, this._then);

  final _FetchSystemAuditLogsPayload _self;
  final $Res Function(_FetchSystemAuditLogsPayload) _then;

/// Create a copy of FetchSystemAuditLogsPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? limit = null,}) {
  return _then(_FetchSystemAuditLogsPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CreateOssCredentialPayload {

 String get schoolId; String get name; String get endpoint; String get internalEndpoint; String get region; String get bucket; String get accessKeyId; String get accessKeySecret; String get directoryPrefix; String get accessKeyDisplay; bool get allowPublicRead; bool get allowMultipartUpload; bool get useRelayUpload; bool get active; bool get isPrimary;
/// Create a copy of CreateOssCredentialPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOssCredentialPayloadCopyWith<CreateOssCredentialPayload> get copyWith => _$CreateOssCredentialPayloadCopyWithImpl<CreateOssCredentialPayload>(this as CreateOssCredentialPayload, _$identity);

  /// Serializes this CreateOssCredentialPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOssCredentialPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.endpoint, endpoint) || other.endpoint == endpoint)&&(identical(other.internalEndpoint, internalEndpoint) || other.internalEndpoint == internalEndpoint)&&(identical(other.region, region) || other.region == region)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.accessKeyId, accessKeyId) || other.accessKeyId == accessKeyId)&&(identical(other.accessKeySecret, accessKeySecret) || other.accessKeySecret == accessKeySecret)&&(identical(other.directoryPrefix, directoryPrefix) || other.directoryPrefix == directoryPrefix)&&(identical(other.accessKeyDisplay, accessKeyDisplay) || other.accessKeyDisplay == accessKeyDisplay)&&(identical(other.allowPublicRead, allowPublicRead) || other.allowPublicRead == allowPublicRead)&&(identical(other.allowMultipartUpload, allowMultipartUpload) || other.allowMultipartUpload == allowMultipartUpload)&&(identical(other.useRelayUpload, useRelayUpload) || other.useRelayUpload == useRelayUpload)&&(identical(other.active, active) || other.active == active)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name,endpoint,internalEndpoint,region,bucket,accessKeyId,accessKeySecret,directoryPrefix,accessKeyDisplay,allowPublicRead,allowMultipartUpload,useRelayUpload,active,isPrimary);

@override
String toString() {
  return 'CreateOssCredentialPayload(schoolId: $schoolId, name: $name, endpoint: $endpoint, internalEndpoint: $internalEndpoint, region: $region, bucket: $bucket, accessKeyId: $accessKeyId, accessKeySecret: $accessKeySecret, directoryPrefix: $directoryPrefix, accessKeyDisplay: $accessKeyDisplay, allowPublicRead: $allowPublicRead, allowMultipartUpload: $allowMultipartUpload, useRelayUpload: $useRelayUpload, active: $active, isPrimary: $isPrimary)';
}


}

/// @nodoc
abstract mixin class $CreateOssCredentialPayloadCopyWith<$Res>  {
  factory $CreateOssCredentialPayloadCopyWith(CreateOssCredentialPayload value, $Res Function(CreateOssCredentialPayload) _then) = _$CreateOssCredentialPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String name, String endpoint, String internalEndpoint, String region, String bucket, String accessKeyId, String accessKeySecret, String directoryPrefix, String accessKeyDisplay, bool allowPublicRead, bool allowMultipartUpload, bool useRelayUpload, bool active, bool isPrimary
});




}
/// @nodoc
class _$CreateOssCredentialPayloadCopyWithImpl<$Res>
    implements $CreateOssCredentialPayloadCopyWith<$Res> {
  _$CreateOssCredentialPayloadCopyWithImpl(this._self, this._then);

  final CreateOssCredentialPayload _self;
  final $Res Function(CreateOssCredentialPayload) _then;

/// Create a copy of CreateOssCredentialPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? name = null,Object? endpoint = null,Object? internalEndpoint = null,Object? region = null,Object? bucket = null,Object? accessKeyId = null,Object? accessKeySecret = null,Object? directoryPrefix = null,Object? accessKeyDisplay = null,Object? allowPublicRead = null,Object? allowMultipartUpload = null,Object? useRelayUpload = null,Object? active = null,Object? isPrimary = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,endpoint: null == endpoint ? _self.endpoint : endpoint // ignore: cast_nullable_to_non_nullable
as String,internalEndpoint: null == internalEndpoint ? _self.internalEndpoint : internalEndpoint // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as String,accessKeyId: null == accessKeyId ? _self.accessKeyId : accessKeyId // ignore: cast_nullable_to_non_nullable
as String,accessKeySecret: null == accessKeySecret ? _self.accessKeySecret : accessKeySecret // ignore: cast_nullable_to_non_nullable
as String,directoryPrefix: null == directoryPrefix ? _self.directoryPrefix : directoryPrefix // ignore: cast_nullable_to_non_nullable
as String,accessKeyDisplay: null == accessKeyDisplay ? _self.accessKeyDisplay : accessKeyDisplay // ignore: cast_nullable_to_non_nullable
as String,allowPublicRead: null == allowPublicRead ? _self.allowPublicRead : allowPublicRead // ignore: cast_nullable_to_non_nullable
as bool,allowMultipartUpload: null == allowMultipartUpload ? _self.allowMultipartUpload : allowMultipartUpload // ignore: cast_nullable_to_non_nullable
as bool,useRelayUpload: null == useRelayUpload ? _self.useRelayUpload : useRelayUpload // ignore: cast_nullable_to_non_nullable
as bool,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateOssCredentialPayload].
extension CreateOssCredentialPayloadPatterns on CreateOssCredentialPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateOssCredentialPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateOssCredentialPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateOssCredentialPayload value)  $default,){
final _that = this;
switch (_that) {
case _CreateOssCredentialPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateOssCredentialPayload value)?  $default,){
final _that = this;
switch (_that) {
case _CreateOssCredentialPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String name,  String endpoint,  String internalEndpoint,  String region,  String bucket,  String accessKeyId,  String accessKeySecret,  String directoryPrefix,  String accessKeyDisplay,  bool allowPublicRead,  bool allowMultipartUpload,  bool useRelayUpload,  bool active,  bool isPrimary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateOssCredentialPayload() when $default != null:
return $default(_that.schoolId,_that.name,_that.endpoint,_that.internalEndpoint,_that.region,_that.bucket,_that.accessKeyId,_that.accessKeySecret,_that.directoryPrefix,_that.accessKeyDisplay,_that.allowPublicRead,_that.allowMultipartUpload,_that.useRelayUpload,_that.active,_that.isPrimary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String name,  String endpoint,  String internalEndpoint,  String region,  String bucket,  String accessKeyId,  String accessKeySecret,  String directoryPrefix,  String accessKeyDisplay,  bool allowPublicRead,  bool allowMultipartUpload,  bool useRelayUpload,  bool active,  bool isPrimary)  $default,) {final _that = this;
switch (_that) {
case _CreateOssCredentialPayload():
return $default(_that.schoolId,_that.name,_that.endpoint,_that.internalEndpoint,_that.region,_that.bucket,_that.accessKeyId,_that.accessKeySecret,_that.directoryPrefix,_that.accessKeyDisplay,_that.allowPublicRead,_that.allowMultipartUpload,_that.useRelayUpload,_that.active,_that.isPrimary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String name,  String endpoint,  String internalEndpoint,  String region,  String bucket,  String accessKeyId,  String accessKeySecret,  String directoryPrefix,  String accessKeyDisplay,  bool allowPublicRead,  bool allowMultipartUpload,  bool useRelayUpload,  bool active,  bool isPrimary)?  $default,) {final _that = this;
switch (_that) {
case _CreateOssCredentialPayload() when $default != null:
return $default(_that.schoolId,_that.name,_that.endpoint,_that.internalEndpoint,_that.region,_that.bucket,_that.accessKeyId,_that.accessKeySecret,_that.directoryPrefix,_that.accessKeyDisplay,_that.allowPublicRead,_that.allowMultipartUpload,_that.useRelayUpload,_that.active,_that.isPrimary);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _CreateOssCredentialPayload implements CreateOssCredentialPayload {
  const _CreateOssCredentialPayload({required this.schoolId, required this.name, required this.endpoint, this.internalEndpoint = '', required this.region, required this.bucket, required this.accessKeyId, required this.accessKeySecret, this.directoryPrefix = '', this.accessKeyDisplay = '', this.allowPublicRead = false, this.allowMultipartUpload = false, this.useRelayUpload = false, this.active = true, this.isPrimary = false});
  factory _CreateOssCredentialPayload.fromJson(Map<String, dynamic> json) => _$CreateOssCredentialPayloadFromJson(json);

@override final  String schoolId;
@override final  String name;
@override final  String endpoint;
@override@JsonKey() final  String internalEndpoint;
@override final  String region;
@override final  String bucket;
@override final  String accessKeyId;
@override final  String accessKeySecret;
@override@JsonKey() final  String directoryPrefix;
@override@JsonKey() final  String accessKeyDisplay;
@override@JsonKey() final  bool allowPublicRead;
@override@JsonKey() final  bool allowMultipartUpload;
@override@JsonKey() final  bool useRelayUpload;
@override@JsonKey() final  bool active;
@override@JsonKey() final  bool isPrimary;

/// Create a copy of CreateOssCredentialPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateOssCredentialPayloadCopyWith<_CreateOssCredentialPayload> get copyWith => __$CreateOssCredentialPayloadCopyWithImpl<_CreateOssCredentialPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateOssCredentialPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateOssCredentialPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.endpoint, endpoint) || other.endpoint == endpoint)&&(identical(other.internalEndpoint, internalEndpoint) || other.internalEndpoint == internalEndpoint)&&(identical(other.region, region) || other.region == region)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.accessKeyId, accessKeyId) || other.accessKeyId == accessKeyId)&&(identical(other.accessKeySecret, accessKeySecret) || other.accessKeySecret == accessKeySecret)&&(identical(other.directoryPrefix, directoryPrefix) || other.directoryPrefix == directoryPrefix)&&(identical(other.accessKeyDisplay, accessKeyDisplay) || other.accessKeyDisplay == accessKeyDisplay)&&(identical(other.allowPublicRead, allowPublicRead) || other.allowPublicRead == allowPublicRead)&&(identical(other.allowMultipartUpload, allowMultipartUpload) || other.allowMultipartUpload == allowMultipartUpload)&&(identical(other.useRelayUpload, useRelayUpload) || other.useRelayUpload == useRelayUpload)&&(identical(other.active, active) || other.active == active)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name,endpoint,internalEndpoint,region,bucket,accessKeyId,accessKeySecret,directoryPrefix,accessKeyDisplay,allowPublicRead,allowMultipartUpload,useRelayUpload,active,isPrimary);

@override
String toString() {
  return 'CreateOssCredentialPayload(schoolId: $schoolId, name: $name, endpoint: $endpoint, internalEndpoint: $internalEndpoint, region: $region, bucket: $bucket, accessKeyId: $accessKeyId, accessKeySecret: $accessKeySecret, directoryPrefix: $directoryPrefix, accessKeyDisplay: $accessKeyDisplay, allowPublicRead: $allowPublicRead, allowMultipartUpload: $allowMultipartUpload, useRelayUpload: $useRelayUpload, active: $active, isPrimary: $isPrimary)';
}


}

/// @nodoc
abstract mixin class _$CreateOssCredentialPayloadCopyWith<$Res> implements $CreateOssCredentialPayloadCopyWith<$Res> {
  factory _$CreateOssCredentialPayloadCopyWith(_CreateOssCredentialPayload value, $Res Function(_CreateOssCredentialPayload) _then) = __$CreateOssCredentialPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String name, String endpoint, String internalEndpoint, String region, String bucket, String accessKeyId, String accessKeySecret, String directoryPrefix, String accessKeyDisplay, bool allowPublicRead, bool allowMultipartUpload, bool useRelayUpload, bool active, bool isPrimary
});




}
/// @nodoc
class __$CreateOssCredentialPayloadCopyWithImpl<$Res>
    implements _$CreateOssCredentialPayloadCopyWith<$Res> {
  __$CreateOssCredentialPayloadCopyWithImpl(this._self, this._then);

  final _CreateOssCredentialPayload _self;
  final $Res Function(_CreateOssCredentialPayload) _then;

/// Create a copy of CreateOssCredentialPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? name = null,Object? endpoint = null,Object? internalEndpoint = null,Object? region = null,Object? bucket = null,Object? accessKeyId = null,Object? accessKeySecret = null,Object? directoryPrefix = null,Object? accessKeyDisplay = null,Object? allowPublicRead = null,Object? allowMultipartUpload = null,Object? useRelayUpload = null,Object? active = null,Object? isPrimary = null,}) {
  return _then(_CreateOssCredentialPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,endpoint: null == endpoint ? _self.endpoint : endpoint // ignore: cast_nullable_to_non_nullable
as String,internalEndpoint: null == internalEndpoint ? _self.internalEndpoint : internalEndpoint // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as String,accessKeyId: null == accessKeyId ? _self.accessKeyId : accessKeyId // ignore: cast_nullable_to_non_nullable
as String,accessKeySecret: null == accessKeySecret ? _self.accessKeySecret : accessKeySecret // ignore: cast_nullable_to_non_nullable
as String,directoryPrefix: null == directoryPrefix ? _self.directoryPrefix : directoryPrefix // ignore: cast_nullable_to_non_nullable
as String,accessKeyDisplay: null == accessKeyDisplay ? _self.accessKeyDisplay : accessKeyDisplay // ignore: cast_nullable_to_non_nullable
as String,allowPublicRead: null == allowPublicRead ? _self.allowPublicRead : allowPublicRead // ignore: cast_nullable_to_non_nullable
as bool,allowMultipartUpload: null == allowMultipartUpload ? _self.allowMultipartUpload : allowMultipartUpload // ignore: cast_nullable_to_non_nullable
as bool,useRelayUpload: null == useRelayUpload ? _self.useRelayUpload : useRelayUpload // ignore: cast_nullable_to_non_nullable
as bool,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$UpdateOssCredentialPayload {

 String get schoolId; String? get name; String? get endpoint; String? get internalEndpoint; String? get region; String? get bucket; String? get directoryPrefix; String? get accessKeyId; String? get accessKeySecret; String? get accessKeyDisplay; bool? get allowPublicRead; bool? get allowMultipartUpload; bool? get useRelayUpload; bool? get active; bool? get isPrimary;
/// Create a copy of UpdateOssCredentialPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateOssCredentialPayloadCopyWith<UpdateOssCredentialPayload> get copyWith => _$UpdateOssCredentialPayloadCopyWithImpl<UpdateOssCredentialPayload>(this as UpdateOssCredentialPayload, _$identity);

  /// Serializes this UpdateOssCredentialPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateOssCredentialPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.endpoint, endpoint) || other.endpoint == endpoint)&&(identical(other.internalEndpoint, internalEndpoint) || other.internalEndpoint == internalEndpoint)&&(identical(other.region, region) || other.region == region)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.directoryPrefix, directoryPrefix) || other.directoryPrefix == directoryPrefix)&&(identical(other.accessKeyId, accessKeyId) || other.accessKeyId == accessKeyId)&&(identical(other.accessKeySecret, accessKeySecret) || other.accessKeySecret == accessKeySecret)&&(identical(other.accessKeyDisplay, accessKeyDisplay) || other.accessKeyDisplay == accessKeyDisplay)&&(identical(other.allowPublicRead, allowPublicRead) || other.allowPublicRead == allowPublicRead)&&(identical(other.allowMultipartUpload, allowMultipartUpload) || other.allowMultipartUpload == allowMultipartUpload)&&(identical(other.useRelayUpload, useRelayUpload) || other.useRelayUpload == useRelayUpload)&&(identical(other.active, active) || other.active == active)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name,endpoint,internalEndpoint,region,bucket,directoryPrefix,accessKeyId,accessKeySecret,accessKeyDisplay,allowPublicRead,allowMultipartUpload,useRelayUpload,active,isPrimary);

@override
String toString() {
  return 'UpdateOssCredentialPayload(schoolId: $schoolId, name: $name, endpoint: $endpoint, internalEndpoint: $internalEndpoint, region: $region, bucket: $bucket, directoryPrefix: $directoryPrefix, accessKeyId: $accessKeyId, accessKeySecret: $accessKeySecret, accessKeyDisplay: $accessKeyDisplay, allowPublicRead: $allowPublicRead, allowMultipartUpload: $allowMultipartUpload, useRelayUpload: $useRelayUpload, active: $active, isPrimary: $isPrimary)';
}


}

/// @nodoc
abstract mixin class $UpdateOssCredentialPayloadCopyWith<$Res>  {
  factory $UpdateOssCredentialPayloadCopyWith(UpdateOssCredentialPayload value, $Res Function(UpdateOssCredentialPayload) _then) = _$UpdateOssCredentialPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String? name, String? endpoint, String? internalEndpoint, String? region, String? bucket, String? directoryPrefix, String? accessKeyId, String? accessKeySecret, String? accessKeyDisplay, bool? allowPublicRead, bool? allowMultipartUpload, bool? useRelayUpload, bool? active, bool? isPrimary
});




}
/// @nodoc
class _$UpdateOssCredentialPayloadCopyWithImpl<$Res>
    implements $UpdateOssCredentialPayloadCopyWith<$Res> {
  _$UpdateOssCredentialPayloadCopyWithImpl(this._self, this._then);

  final UpdateOssCredentialPayload _self;
  final $Res Function(UpdateOssCredentialPayload) _then;

/// Create a copy of UpdateOssCredentialPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? name = freezed,Object? endpoint = freezed,Object? internalEndpoint = freezed,Object? region = freezed,Object? bucket = freezed,Object? directoryPrefix = freezed,Object? accessKeyId = freezed,Object? accessKeySecret = freezed,Object? accessKeyDisplay = freezed,Object? allowPublicRead = freezed,Object? allowMultipartUpload = freezed,Object? useRelayUpload = freezed,Object? active = freezed,Object? isPrimary = freezed,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,endpoint: freezed == endpoint ? _self.endpoint : endpoint // ignore: cast_nullable_to_non_nullable
as String?,internalEndpoint: freezed == internalEndpoint ? _self.internalEndpoint : internalEndpoint // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,bucket: freezed == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as String?,directoryPrefix: freezed == directoryPrefix ? _self.directoryPrefix : directoryPrefix // ignore: cast_nullable_to_non_nullable
as String?,accessKeyId: freezed == accessKeyId ? _self.accessKeyId : accessKeyId // ignore: cast_nullable_to_non_nullable
as String?,accessKeySecret: freezed == accessKeySecret ? _self.accessKeySecret : accessKeySecret // ignore: cast_nullable_to_non_nullable
as String?,accessKeyDisplay: freezed == accessKeyDisplay ? _self.accessKeyDisplay : accessKeyDisplay // ignore: cast_nullable_to_non_nullable
as String?,allowPublicRead: freezed == allowPublicRead ? _self.allowPublicRead : allowPublicRead // ignore: cast_nullable_to_non_nullable
as bool?,allowMultipartUpload: freezed == allowMultipartUpload ? _self.allowMultipartUpload : allowMultipartUpload // ignore: cast_nullable_to_non_nullable
as bool?,useRelayUpload: freezed == useRelayUpload ? _self.useRelayUpload : useRelayUpload // ignore: cast_nullable_to_non_nullable
as bool?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,isPrimary: freezed == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateOssCredentialPayload].
extension UpdateOssCredentialPayloadPatterns on UpdateOssCredentialPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateOssCredentialPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateOssCredentialPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateOssCredentialPayload value)  $default,){
final _that = this;
switch (_that) {
case _UpdateOssCredentialPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateOssCredentialPayload value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateOssCredentialPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String? name,  String? endpoint,  String? internalEndpoint,  String? region,  String? bucket,  String? directoryPrefix,  String? accessKeyId,  String? accessKeySecret,  String? accessKeyDisplay,  bool? allowPublicRead,  bool? allowMultipartUpload,  bool? useRelayUpload,  bool? active,  bool? isPrimary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateOssCredentialPayload() when $default != null:
return $default(_that.schoolId,_that.name,_that.endpoint,_that.internalEndpoint,_that.region,_that.bucket,_that.directoryPrefix,_that.accessKeyId,_that.accessKeySecret,_that.accessKeyDisplay,_that.allowPublicRead,_that.allowMultipartUpload,_that.useRelayUpload,_that.active,_that.isPrimary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String? name,  String? endpoint,  String? internalEndpoint,  String? region,  String? bucket,  String? directoryPrefix,  String? accessKeyId,  String? accessKeySecret,  String? accessKeyDisplay,  bool? allowPublicRead,  bool? allowMultipartUpload,  bool? useRelayUpload,  bool? active,  bool? isPrimary)  $default,) {final _that = this;
switch (_that) {
case _UpdateOssCredentialPayload():
return $default(_that.schoolId,_that.name,_that.endpoint,_that.internalEndpoint,_that.region,_that.bucket,_that.directoryPrefix,_that.accessKeyId,_that.accessKeySecret,_that.accessKeyDisplay,_that.allowPublicRead,_that.allowMultipartUpload,_that.useRelayUpload,_that.active,_that.isPrimary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String? name,  String? endpoint,  String? internalEndpoint,  String? region,  String? bucket,  String? directoryPrefix,  String? accessKeyId,  String? accessKeySecret,  String? accessKeyDisplay,  bool? allowPublicRead,  bool? allowMultipartUpload,  bool? useRelayUpload,  bool? active,  bool? isPrimary)?  $default,) {final _that = this;
switch (_that) {
case _UpdateOssCredentialPayload() when $default != null:
return $default(_that.schoolId,_that.name,_that.endpoint,_that.internalEndpoint,_that.region,_that.bucket,_that.directoryPrefix,_that.accessKeyId,_that.accessKeySecret,_that.accessKeyDisplay,_that.allowPublicRead,_that.allowMultipartUpload,_that.useRelayUpload,_that.active,_that.isPrimary);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _UpdateOssCredentialPayload implements UpdateOssCredentialPayload {
  const _UpdateOssCredentialPayload({required this.schoolId, this.name, this.endpoint, this.internalEndpoint, this.region, this.bucket, this.directoryPrefix, this.accessKeyId, this.accessKeySecret, this.accessKeyDisplay, this.allowPublicRead, this.allowMultipartUpload, this.useRelayUpload, this.active, this.isPrimary});
  factory _UpdateOssCredentialPayload.fromJson(Map<String, dynamic> json) => _$UpdateOssCredentialPayloadFromJson(json);

@override final  String schoolId;
@override final  String? name;
@override final  String? endpoint;
@override final  String? internalEndpoint;
@override final  String? region;
@override final  String? bucket;
@override final  String? directoryPrefix;
@override final  String? accessKeyId;
@override final  String? accessKeySecret;
@override final  String? accessKeyDisplay;
@override final  bool? allowPublicRead;
@override final  bool? allowMultipartUpload;
@override final  bool? useRelayUpload;
@override final  bool? active;
@override final  bool? isPrimary;

/// Create a copy of UpdateOssCredentialPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateOssCredentialPayloadCopyWith<_UpdateOssCredentialPayload> get copyWith => __$UpdateOssCredentialPayloadCopyWithImpl<_UpdateOssCredentialPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateOssCredentialPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateOssCredentialPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.endpoint, endpoint) || other.endpoint == endpoint)&&(identical(other.internalEndpoint, internalEndpoint) || other.internalEndpoint == internalEndpoint)&&(identical(other.region, region) || other.region == region)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.directoryPrefix, directoryPrefix) || other.directoryPrefix == directoryPrefix)&&(identical(other.accessKeyId, accessKeyId) || other.accessKeyId == accessKeyId)&&(identical(other.accessKeySecret, accessKeySecret) || other.accessKeySecret == accessKeySecret)&&(identical(other.accessKeyDisplay, accessKeyDisplay) || other.accessKeyDisplay == accessKeyDisplay)&&(identical(other.allowPublicRead, allowPublicRead) || other.allowPublicRead == allowPublicRead)&&(identical(other.allowMultipartUpload, allowMultipartUpload) || other.allowMultipartUpload == allowMultipartUpload)&&(identical(other.useRelayUpload, useRelayUpload) || other.useRelayUpload == useRelayUpload)&&(identical(other.active, active) || other.active == active)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name,endpoint,internalEndpoint,region,bucket,directoryPrefix,accessKeyId,accessKeySecret,accessKeyDisplay,allowPublicRead,allowMultipartUpload,useRelayUpload,active,isPrimary);

@override
String toString() {
  return 'UpdateOssCredentialPayload(schoolId: $schoolId, name: $name, endpoint: $endpoint, internalEndpoint: $internalEndpoint, region: $region, bucket: $bucket, directoryPrefix: $directoryPrefix, accessKeyId: $accessKeyId, accessKeySecret: $accessKeySecret, accessKeyDisplay: $accessKeyDisplay, allowPublicRead: $allowPublicRead, allowMultipartUpload: $allowMultipartUpload, useRelayUpload: $useRelayUpload, active: $active, isPrimary: $isPrimary)';
}


}

/// @nodoc
abstract mixin class _$UpdateOssCredentialPayloadCopyWith<$Res> implements $UpdateOssCredentialPayloadCopyWith<$Res> {
  factory _$UpdateOssCredentialPayloadCopyWith(_UpdateOssCredentialPayload value, $Res Function(_UpdateOssCredentialPayload) _then) = __$UpdateOssCredentialPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String? name, String? endpoint, String? internalEndpoint, String? region, String? bucket, String? directoryPrefix, String? accessKeyId, String? accessKeySecret, String? accessKeyDisplay, bool? allowPublicRead, bool? allowMultipartUpload, bool? useRelayUpload, bool? active, bool? isPrimary
});




}
/// @nodoc
class __$UpdateOssCredentialPayloadCopyWithImpl<$Res>
    implements _$UpdateOssCredentialPayloadCopyWith<$Res> {
  __$UpdateOssCredentialPayloadCopyWithImpl(this._self, this._then);

  final _UpdateOssCredentialPayload _self;
  final $Res Function(_UpdateOssCredentialPayload) _then;

/// Create a copy of UpdateOssCredentialPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? name = freezed,Object? endpoint = freezed,Object? internalEndpoint = freezed,Object? region = freezed,Object? bucket = freezed,Object? directoryPrefix = freezed,Object? accessKeyId = freezed,Object? accessKeySecret = freezed,Object? accessKeyDisplay = freezed,Object? allowPublicRead = freezed,Object? allowMultipartUpload = freezed,Object? useRelayUpload = freezed,Object? active = freezed,Object? isPrimary = freezed,}) {
  return _then(_UpdateOssCredentialPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,endpoint: freezed == endpoint ? _self.endpoint : endpoint // ignore: cast_nullable_to_non_nullable
as String?,internalEndpoint: freezed == internalEndpoint ? _self.internalEndpoint : internalEndpoint // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,bucket: freezed == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as String?,directoryPrefix: freezed == directoryPrefix ? _self.directoryPrefix : directoryPrefix // ignore: cast_nullable_to_non_nullable
as String?,accessKeyId: freezed == accessKeyId ? _self.accessKeyId : accessKeyId // ignore: cast_nullable_to_non_nullable
as String?,accessKeySecret: freezed == accessKeySecret ? _self.accessKeySecret : accessKeySecret // ignore: cast_nullable_to_non_nullable
as String?,accessKeyDisplay: freezed == accessKeyDisplay ? _self.accessKeyDisplay : accessKeyDisplay // ignore: cast_nullable_to_non_nullable
as String?,allowPublicRead: freezed == allowPublicRead ? _self.allowPublicRead : allowPublicRead // ignore: cast_nullable_to_non_nullable
as bool?,allowMultipartUpload: freezed == allowMultipartUpload ? _self.allowMultipartUpload : allowMultipartUpload // ignore: cast_nullable_to_non_nullable
as bool?,useRelayUpload: freezed == useRelayUpload ? _self.useRelayUpload : useRelayUpload // ignore: cast_nullable_to_non_nullable
as bool?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,isPrimary: freezed == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$CreateOssPolicyPayload {

 String get schoolId; String get name; String get appliesTo; String get description; AdminOssPolicyStatus get status;
/// Create a copy of CreateOssPolicyPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOssPolicyPayloadCopyWith<CreateOssPolicyPayload> get copyWith => _$CreateOssPolicyPayloadCopyWithImpl<CreateOssPolicyPayload>(this as CreateOssPolicyPayload, _$identity);

  /// Serializes this CreateOssPolicyPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOssPolicyPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name,appliesTo,description,status);

@override
String toString() {
  return 'CreateOssPolicyPayload(schoolId: $schoolId, name: $name, appliesTo: $appliesTo, description: $description, status: $status)';
}


}

/// @nodoc
abstract mixin class $CreateOssPolicyPayloadCopyWith<$Res>  {
  factory $CreateOssPolicyPayloadCopyWith(CreateOssPolicyPayload value, $Res Function(CreateOssPolicyPayload) _then) = _$CreateOssPolicyPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String name, String appliesTo, String description, AdminOssPolicyStatus status
});




}
/// @nodoc
class _$CreateOssPolicyPayloadCopyWithImpl<$Res>
    implements $CreateOssPolicyPayloadCopyWith<$Res> {
  _$CreateOssPolicyPayloadCopyWithImpl(this._self, this._then);

  final CreateOssPolicyPayload _self;
  final $Res Function(CreateOssPolicyPayload) _then;

/// Create a copy of CreateOssPolicyPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? name = null,Object? appliesTo = null,Object? description = null,Object? status = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,appliesTo: null == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdminOssPolicyStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateOssPolicyPayload].
extension CreateOssPolicyPayloadPatterns on CreateOssPolicyPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateOssPolicyPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateOssPolicyPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateOssPolicyPayload value)  $default,){
final _that = this;
switch (_that) {
case _CreateOssPolicyPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateOssPolicyPayload value)?  $default,){
final _that = this;
switch (_that) {
case _CreateOssPolicyPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String name,  String appliesTo,  String description,  AdminOssPolicyStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateOssPolicyPayload() when $default != null:
return $default(_that.schoolId,_that.name,_that.appliesTo,_that.description,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String name,  String appliesTo,  String description,  AdminOssPolicyStatus status)  $default,) {final _that = this;
switch (_that) {
case _CreateOssPolicyPayload():
return $default(_that.schoolId,_that.name,_that.appliesTo,_that.description,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String name,  String appliesTo,  String description,  AdminOssPolicyStatus status)?  $default,) {final _that = this;
switch (_that) {
case _CreateOssPolicyPayload() when $default != null:
return $default(_that.schoolId,_that.name,_that.appliesTo,_that.description,_that.status);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _CreateOssPolicyPayload implements CreateOssPolicyPayload {
  const _CreateOssPolicyPayload({required this.schoolId, required this.name, required this.appliesTo, this.description = '', this.status = AdminOssPolicyStatus.enabled});
  factory _CreateOssPolicyPayload.fromJson(Map<String, dynamic> json) => _$CreateOssPolicyPayloadFromJson(json);

@override final  String schoolId;
@override final  String name;
@override final  String appliesTo;
@override@JsonKey() final  String description;
@override@JsonKey() final  AdminOssPolicyStatus status;

/// Create a copy of CreateOssPolicyPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateOssPolicyPayloadCopyWith<_CreateOssPolicyPayload> get copyWith => __$CreateOssPolicyPayloadCopyWithImpl<_CreateOssPolicyPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateOssPolicyPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateOssPolicyPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name,appliesTo,description,status);

@override
String toString() {
  return 'CreateOssPolicyPayload(schoolId: $schoolId, name: $name, appliesTo: $appliesTo, description: $description, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CreateOssPolicyPayloadCopyWith<$Res> implements $CreateOssPolicyPayloadCopyWith<$Res> {
  factory _$CreateOssPolicyPayloadCopyWith(_CreateOssPolicyPayload value, $Res Function(_CreateOssPolicyPayload) _then) = __$CreateOssPolicyPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String name, String appliesTo, String description, AdminOssPolicyStatus status
});




}
/// @nodoc
class __$CreateOssPolicyPayloadCopyWithImpl<$Res>
    implements _$CreateOssPolicyPayloadCopyWith<$Res> {
  __$CreateOssPolicyPayloadCopyWithImpl(this._self, this._then);

  final _CreateOssPolicyPayload _self;
  final $Res Function(_CreateOssPolicyPayload) _then;

/// Create a copy of CreateOssPolicyPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? name = null,Object? appliesTo = null,Object? description = null,Object? status = null,}) {
  return _then(_CreateOssPolicyPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,appliesTo: null == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdminOssPolicyStatus,
  ));
}


}


/// @nodoc
mixin _$UpdateOssPolicyStatusPayload {

 String get schoolId; AdminOssPolicyStatus get status;
/// Create a copy of UpdateOssPolicyStatusPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateOssPolicyStatusPayloadCopyWith<UpdateOssPolicyStatusPayload> get copyWith => _$UpdateOssPolicyStatusPayloadCopyWithImpl<UpdateOssPolicyStatusPayload>(this as UpdateOssPolicyStatusPayload, _$identity);

  /// Serializes this UpdateOssPolicyStatusPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateOssPolicyStatusPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,status);

@override
String toString() {
  return 'UpdateOssPolicyStatusPayload(schoolId: $schoolId, status: $status)';
}


}

/// @nodoc
abstract mixin class $UpdateOssPolicyStatusPayloadCopyWith<$Res>  {
  factory $UpdateOssPolicyStatusPayloadCopyWith(UpdateOssPolicyStatusPayload value, $Res Function(UpdateOssPolicyStatusPayload) _then) = _$UpdateOssPolicyStatusPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, AdminOssPolicyStatus status
});




}
/// @nodoc
class _$UpdateOssPolicyStatusPayloadCopyWithImpl<$Res>
    implements $UpdateOssPolicyStatusPayloadCopyWith<$Res> {
  _$UpdateOssPolicyStatusPayloadCopyWithImpl(this._self, this._then);

  final UpdateOssPolicyStatusPayload _self;
  final $Res Function(UpdateOssPolicyStatusPayload) _then;

/// Create a copy of UpdateOssPolicyStatusPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? status = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdminOssPolicyStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateOssPolicyStatusPayload].
extension UpdateOssPolicyStatusPayloadPatterns on UpdateOssPolicyStatusPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateOssPolicyStatusPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateOssPolicyStatusPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateOssPolicyStatusPayload value)  $default,){
final _that = this;
switch (_that) {
case _UpdateOssPolicyStatusPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateOssPolicyStatusPayload value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateOssPolicyStatusPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  AdminOssPolicyStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateOssPolicyStatusPayload() when $default != null:
return $default(_that.schoolId,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  AdminOssPolicyStatus status)  $default,) {final _that = this;
switch (_that) {
case _UpdateOssPolicyStatusPayload():
return $default(_that.schoolId,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  AdminOssPolicyStatus status)?  $default,) {final _that = this;
switch (_that) {
case _UpdateOssPolicyStatusPayload() when $default != null:
return $default(_that.schoolId,_that.status);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _UpdateOssPolicyStatusPayload implements UpdateOssPolicyStatusPayload {
  const _UpdateOssPolicyStatusPayload({required this.schoolId, required this.status});
  factory _UpdateOssPolicyStatusPayload.fromJson(Map<String, dynamic> json) => _$UpdateOssPolicyStatusPayloadFromJson(json);

@override final  String schoolId;
@override final  AdminOssPolicyStatus status;

/// Create a copy of UpdateOssPolicyStatusPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateOssPolicyStatusPayloadCopyWith<_UpdateOssPolicyStatusPayload> get copyWith => __$UpdateOssPolicyStatusPayloadCopyWithImpl<_UpdateOssPolicyStatusPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateOssPolicyStatusPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateOssPolicyStatusPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,status);

@override
String toString() {
  return 'UpdateOssPolicyStatusPayload(schoolId: $schoolId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$UpdateOssPolicyStatusPayloadCopyWith<$Res> implements $UpdateOssPolicyStatusPayloadCopyWith<$Res> {
  factory _$UpdateOssPolicyStatusPayloadCopyWith(_UpdateOssPolicyStatusPayload value, $Res Function(_UpdateOssPolicyStatusPayload) _then) = __$UpdateOssPolicyStatusPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, AdminOssPolicyStatus status
});




}
/// @nodoc
class __$UpdateOssPolicyStatusPayloadCopyWithImpl<$Res>
    implements _$UpdateOssPolicyStatusPayloadCopyWith<$Res> {
  __$UpdateOssPolicyStatusPayloadCopyWithImpl(this._self, this._then);

  final _UpdateOssPolicyStatusPayload _self;
  final $Res Function(_UpdateOssPolicyStatusPayload) _then;

/// Create a copy of UpdateOssPolicyStatusPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? status = null,}) {
  return _then(_UpdateOssPolicyStatusPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdminOssPolicyStatus,
  ));
}


}


/// @nodoc
mixin _$CreateDepartmentPayload {

 String get schoolId; String get name;
/// Create a copy of CreateDepartmentPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDepartmentPayloadCopyWith<CreateDepartmentPayload> get copyWith => _$CreateDepartmentPayloadCopyWithImpl<CreateDepartmentPayload>(this as CreateDepartmentPayload, _$identity);

  /// Serializes this CreateDepartmentPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDepartmentPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name);

@override
String toString() {
  return 'CreateDepartmentPayload(schoolId: $schoolId, name: $name)';
}


}

/// @nodoc
abstract mixin class $CreateDepartmentPayloadCopyWith<$Res>  {
  factory $CreateDepartmentPayloadCopyWith(CreateDepartmentPayload value, $Res Function(CreateDepartmentPayload) _then) = _$CreateDepartmentPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String name
});




}
/// @nodoc
class _$CreateDepartmentPayloadCopyWithImpl<$Res>
    implements $CreateDepartmentPayloadCopyWith<$Res> {
  _$CreateDepartmentPayloadCopyWithImpl(this._self, this._then);

  final CreateDepartmentPayload _self;
  final $Res Function(CreateDepartmentPayload) _then;

/// Create a copy of CreateDepartmentPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? name = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateDepartmentPayload].
extension CreateDepartmentPayloadPatterns on CreateDepartmentPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateDepartmentPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateDepartmentPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateDepartmentPayload value)  $default,){
final _that = this;
switch (_that) {
case _CreateDepartmentPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateDepartmentPayload value)?  $default,){
final _that = this;
switch (_that) {
case _CreateDepartmentPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateDepartmentPayload() when $default != null:
return $default(_that.schoolId,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String name)  $default,) {final _that = this;
switch (_that) {
case _CreateDepartmentPayload():
return $default(_that.schoolId,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String name)?  $default,) {final _that = this;
switch (_that) {
case _CreateDepartmentPayload() when $default != null:
return $default(_that.schoolId,_that.name);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _CreateDepartmentPayload implements CreateDepartmentPayload {
  const _CreateDepartmentPayload({required this.schoolId, required this.name});
  factory _CreateDepartmentPayload.fromJson(Map<String, dynamic> json) => _$CreateDepartmentPayloadFromJson(json);

@override final  String schoolId;
@override final  String name;

/// Create a copy of CreateDepartmentPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDepartmentPayloadCopyWith<_CreateDepartmentPayload> get copyWith => __$CreateDepartmentPayloadCopyWithImpl<_CreateDepartmentPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateDepartmentPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDepartmentPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name);

@override
String toString() {
  return 'CreateDepartmentPayload(schoolId: $schoolId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CreateDepartmentPayloadCopyWith<$Res> implements $CreateDepartmentPayloadCopyWith<$Res> {
  factory _$CreateDepartmentPayloadCopyWith(_CreateDepartmentPayload value, $Res Function(_CreateDepartmentPayload) _then) = __$CreateDepartmentPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String name
});




}
/// @nodoc
class __$CreateDepartmentPayloadCopyWithImpl<$Res>
    implements _$CreateDepartmentPayloadCopyWith<$Res> {
  __$CreateDepartmentPayloadCopyWithImpl(this._self, this._then);

  final _CreateDepartmentPayload _self;
  final $Res Function(_CreateDepartmentPayload) _then;

/// Create a copy of CreateDepartmentPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? name = null,}) {
  return _then(_CreateDepartmentPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CreateDepartmentResult {

 String? get departmentId;
/// Create a copy of CreateDepartmentResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDepartmentResultCopyWith<CreateDepartmentResult> get copyWith => _$CreateDepartmentResultCopyWithImpl<CreateDepartmentResult>(this as CreateDepartmentResult, _$identity);

  /// Serializes this CreateDepartmentResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDepartmentResult&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,departmentId);

@override
String toString() {
  return 'CreateDepartmentResult(departmentId: $departmentId)';
}


}

/// @nodoc
abstract mixin class $CreateDepartmentResultCopyWith<$Res>  {
  factory $CreateDepartmentResultCopyWith(CreateDepartmentResult value, $Res Function(CreateDepartmentResult) _then) = _$CreateDepartmentResultCopyWithImpl;
@useResult
$Res call({
 String? departmentId
});




}
/// @nodoc
class _$CreateDepartmentResultCopyWithImpl<$Res>
    implements $CreateDepartmentResultCopyWith<$Res> {
  _$CreateDepartmentResultCopyWithImpl(this._self, this._then);

  final CreateDepartmentResult _self;
  final $Res Function(CreateDepartmentResult) _then;

/// Create a copy of CreateDepartmentResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? departmentId = freezed,}) {
  return _then(_self.copyWith(
departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateDepartmentResult].
extension CreateDepartmentResultPatterns on CreateDepartmentResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateDepartmentResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateDepartmentResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateDepartmentResult value)  $default,){
final _that = this;
switch (_that) {
case _CreateDepartmentResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateDepartmentResult value)?  $default,){
final _that = this;
switch (_that) {
case _CreateDepartmentResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? departmentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateDepartmentResult() when $default != null:
return $default(_that.departmentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? departmentId)  $default,) {final _that = this;
switch (_that) {
case _CreateDepartmentResult():
return $default(_that.departmentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? departmentId)?  $default,) {final _that = this;
switch (_that) {
case _CreateDepartmentResult() when $default != null:
return $default(_that.departmentId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _CreateDepartmentResult implements CreateDepartmentResult {
  const _CreateDepartmentResult({this.departmentId});
  factory _CreateDepartmentResult.fromJson(Map<String, dynamic> json) => _$CreateDepartmentResultFromJson(json);

@override final  String? departmentId;

/// Create a copy of CreateDepartmentResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDepartmentResultCopyWith<_CreateDepartmentResult> get copyWith => __$CreateDepartmentResultCopyWithImpl<_CreateDepartmentResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateDepartmentResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDepartmentResult&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,departmentId);

@override
String toString() {
  return 'CreateDepartmentResult(departmentId: $departmentId)';
}


}

/// @nodoc
abstract mixin class _$CreateDepartmentResultCopyWith<$Res> implements $CreateDepartmentResultCopyWith<$Res> {
  factory _$CreateDepartmentResultCopyWith(_CreateDepartmentResult value, $Res Function(_CreateDepartmentResult) _then) = __$CreateDepartmentResultCopyWithImpl;
@override @useResult
$Res call({
 String? departmentId
});




}
/// @nodoc
class __$CreateDepartmentResultCopyWithImpl<$Res>
    implements _$CreateDepartmentResultCopyWith<$Res> {
  __$CreateDepartmentResultCopyWithImpl(this._self, this._then);

  final _CreateDepartmentResult _self;
  final $Res Function(_CreateDepartmentResult) _then;

/// Create a copy of CreateDepartmentResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? departmentId = freezed,}) {
  return _then(_CreateDepartmentResult(
departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateClassPayload {

 String get schoolId; String get departmentId; String get name;
/// Create a copy of CreateClassPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateClassPayloadCopyWith<CreateClassPayload> get copyWith => _$CreateClassPayloadCopyWithImpl<CreateClassPayload>(this as CreateClassPayload, _$identity);

  /// Serializes this CreateClassPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateClassPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,departmentId,name);

@override
String toString() {
  return 'CreateClassPayload(schoolId: $schoolId, departmentId: $departmentId, name: $name)';
}


}

/// @nodoc
abstract mixin class $CreateClassPayloadCopyWith<$Res>  {
  factory $CreateClassPayloadCopyWith(CreateClassPayload value, $Res Function(CreateClassPayload) _then) = _$CreateClassPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String departmentId, String name
});




}
/// @nodoc
class _$CreateClassPayloadCopyWithImpl<$Res>
    implements $CreateClassPayloadCopyWith<$Res> {
  _$CreateClassPayloadCopyWithImpl(this._self, this._then);

  final CreateClassPayload _self;
  final $Res Function(CreateClassPayload) _then;

/// Create a copy of CreateClassPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? departmentId = null,Object? name = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateClassPayload].
extension CreateClassPayloadPatterns on CreateClassPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateClassPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateClassPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateClassPayload value)  $default,){
final _that = this;
switch (_that) {
case _CreateClassPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateClassPayload value)?  $default,){
final _that = this;
switch (_that) {
case _CreateClassPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String departmentId,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateClassPayload() when $default != null:
return $default(_that.schoolId,_that.departmentId,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String departmentId,  String name)  $default,) {final _that = this;
switch (_that) {
case _CreateClassPayload():
return $default(_that.schoolId,_that.departmentId,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String departmentId,  String name)?  $default,) {final _that = this;
switch (_that) {
case _CreateClassPayload() when $default != null:
return $default(_that.schoolId,_that.departmentId,_that.name);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _CreateClassPayload implements CreateClassPayload {
  const _CreateClassPayload({required this.schoolId, required this.departmentId, required this.name});
  factory _CreateClassPayload.fromJson(Map<String, dynamic> json) => _$CreateClassPayloadFromJson(json);

@override final  String schoolId;
@override final  String departmentId;
@override final  String name;

/// Create a copy of CreateClassPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateClassPayloadCopyWith<_CreateClassPayload> get copyWith => __$CreateClassPayloadCopyWithImpl<_CreateClassPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateClassPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateClassPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,departmentId,name);

@override
String toString() {
  return 'CreateClassPayload(schoolId: $schoolId, departmentId: $departmentId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CreateClassPayloadCopyWith<$Res> implements $CreateClassPayloadCopyWith<$Res> {
  factory _$CreateClassPayloadCopyWith(_CreateClassPayload value, $Res Function(_CreateClassPayload) _then) = __$CreateClassPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String departmentId, String name
});




}
/// @nodoc
class __$CreateClassPayloadCopyWithImpl<$Res>
    implements _$CreateClassPayloadCopyWith<$Res> {
  __$CreateClassPayloadCopyWithImpl(this._self, this._then);

  final _CreateClassPayload _self;
  final $Res Function(_CreateClassPayload) _then;

/// Create a copy of CreateClassPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? departmentId = null,Object? name = null,}) {
  return _then(_CreateClassPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CreateClassResult {

 String? get classId;
/// Create a copy of CreateClassResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateClassResultCopyWith<CreateClassResult> get copyWith => _$CreateClassResultCopyWithImpl<CreateClassResult>(this as CreateClassResult, _$identity);

  /// Serializes this CreateClassResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateClassResult&&(identical(other.classId, classId) || other.classId == classId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,classId);

@override
String toString() {
  return 'CreateClassResult(classId: $classId)';
}


}

/// @nodoc
abstract mixin class $CreateClassResultCopyWith<$Res>  {
  factory $CreateClassResultCopyWith(CreateClassResult value, $Res Function(CreateClassResult) _then) = _$CreateClassResultCopyWithImpl;
@useResult
$Res call({
 String? classId
});




}
/// @nodoc
class _$CreateClassResultCopyWithImpl<$Res>
    implements $CreateClassResultCopyWith<$Res> {
  _$CreateClassResultCopyWithImpl(this._self, this._then);

  final CreateClassResult _self;
  final $Res Function(CreateClassResult) _then;

/// Create a copy of CreateClassResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? classId = freezed,}) {
  return _then(_self.copyWith(
classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateClassResult].
extension CreateClassResultPatterns on CreateClassResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateClassResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateClassResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateClassResult value)  $default,){
final _that = this;
switch (_that) {
case _CreateClassResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateClassResult value)?  $default,){
final _that = this;
switch (_that) {
case _CreateClassResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? classId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateClassResult() when $default != null:
return $default(_that.classId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? classId)  $default,) {final _that = this;
switch (_that) {
case _CreateClassResult():
return $default(_that.classId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? classId)?  $default,) {final _that = this;
switch (_that) {
case _CreateClassResult() when $default != null:
return $default(_that.classId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _CreateClassResult implements CreateClassResult {
  const _CreateClassResult({this.classId});
  factory _CreateClassResult.fromJson(Map<String, dynamic> json) => _$CreateClassResultFromJson(json);

@override final  String? classId;

/// Create a copy of CreateClassResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateClassResultCopyWith<_CreateClassResult> get copyWith => __$CreateClassResultCopyWithImpl<_CreateClassResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateClassResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateClassResult&&(identical(other.classId, classId) || other.classId == classId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,classId);

@override
String toString() {
  return 'CreateClassResult(classId: $classId)';
}


}

/// @nodoc
abstract mixin class _$CreateClassResultCopyWith<$Res> implements $CreateClassResultCopyWith<$Res> {
  factory _$CreateClassResultCopyWith(_CreateClassResult value, $Res Function(_CreateClassResult) _then) = __$CreateClassResultCopyWithImpl;
@override @useResult
$Res call({
 String? classId
});




}
/// @nodoc
class __$CreateClassResultCopyWithImpl<$Res>
    implements _$CreateClassResultCopyWith<$Res> {
  __$CreateClassResultCopyWithImpl(this._self, this._then);

  final _CreateClassResult _self;
  final $Res Function(_CreateClassResult) _then;

/// Create a copy of CreateClassResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? classId = freezed,}) {
  return _then(_CreateClassResult(
classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UpdateDepartmentPayload {

 String get schoolId; String get name;
/// Create a copy of UpdateDepartmentPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateDepartmentPayloadCopyWith<UpdateDepartmentPayload> get copyWith => _$UpdateDepartmentPayloadCopyWithImpl<UpdateDepartmentPayload>(this as UpdateDepartmentPayload, _$identity);

  /// Serializes this UpdateDepartmentPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateDepartmentPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name);

@override
String toString() {
  return 'UpdateDepartmentPayload(schoolId: $schoolId, name: $name)';
}


}

/// @nodoc
abstract mixin class $UpdateDepartmentPayloadCopyWith<$Res>  {
  factory $UpdateDepartmentPayloadCopyWith(UpdateDepartmentPayload value, $Res Function(UpdateDepartmentPayload) _then) = _$UpdateDepartmentPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String name
});




}
/// @nodoc
class _$UpdateDepartmentPayloadCopyWithImpl<$Res>
    implements $UpdateDepartmentPayloadCopyWith<$Res> {
  _$UpdateDepartmentPayloadCopyWithImpl(this._self, this._then);

  final UpdateDepartmentPayload _self;
  final $Res Function(UpdateDepartmentPayload) _then;

/// Create a copy of UpdateDepartmentPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? name = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateDepartmentPayload].
extension UpdateDepartmentPayloadPatterns on UpdateDepartmentPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateDepartmentPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateDepartmentPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateDepartmentPayload value)  $default,){
final _that = this;
switch (_that) {
case _UpdateDepartmentPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateDepartmentPayload value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateDepartmentPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateDepartmentPayload() when $default != null:
return $default(_that.schoolId,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String name)  $default,) {final _that = this;
switch (_that) {
case _UpdateDepartmentPayload():
return $default(_that.schoolId,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String name)?  $default,) {final _that = this;
switch (_that) {
case _UpdateDepartmentPayload() when $default != null:
return $default(_that.schoolId,_that.name);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _UpdateDepartmentPayload implements UpdateDepartmentPayload {
  const _UpdateDepartmentPayload({required this.schoolId, required this.name});
  factory _UpdateDepartmentPayload.fromJson(Map<String, dynamic> json) => _$UpdateDepartmentPayloadFromJson(json);

@override final  String schoolId;
@override final  String name;

/// Create a copy of UpdateDepartmentPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateDepartmentPayloadCopyWith<_UpdateDepartmentPayload> get copyWith => __$UpdateDepartmentPayloadCopyWithImpl<_UpdateDepartmentPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateDepartmentPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateDepartmentPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name);

@override
String toString() {
  return 'UpdateDepartmentPayload(schoolId: $schoolId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$UpdateDepartmentPayloadCopyWith<$Res> implements $UpdateDepartmentPayloadCopyWith<$Res> {
  factory _$UpdateDepartmentPayloadCopyWith(_UpdateDepartmentPayload value, $Res Function(_UpdateDepartmentPayload) _then) = __$UpdateDepartmentPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String name
});




}
/// @nodoc
class __$UpdateDepartmentPayloadCopyWithImpl<$Res>
    implements _$UpdateDepartmentPayloadCopyWith<$Res> {
  __$UpdateDepartmentPayloadCopyWithImpl(this._self, this._then);

  final _UpdateDepartmentPayload _self;
  final $Res Function(_UpdateDepartmentPayload) _then;

/// Create a copy of UpdateDepartmentPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? name = null,}) {
  return _then(_UpdateDepartmentPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UpdateDepartmentResult {

 Department get department;
/// Create a copy of UpdateDepartmentResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateDepartmentResultCopyWith<UpdateDepartmentResult> get copyWith => _$UpdateDepartmentResultCopyWithImpl<UpdateDepartmentResult>(this as UpdateDepartmentResult, _$identity);

  /// Serializes this UpdateDepartmentResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateDepartmentResult&&(identical(other.department, department) || other.department == department));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,department);

@override
String toString() {
  return 'UpdateDepartmentResult(department: $department)';
}


}

/// @nodoc
abstract mixin class $UpdateDepartmentResultCopyWith<$Res>  {
  factory $UpdateDepartmentResultCopyWith(UpdateDepartmentResult value, $Res Function(UpdateDepartmentResult) _then) = _$UpdateDepartmentResultCopyWithImpl;
@useResult
$Res call({
 Department department
});


$DepartmentCopyWith<$Res> get department;

}
/// @nodoc
class _$UpdateDepartmentResultCopyWithImpl<$Res>
    implements $UpdateDepartmentResultCopyWith<$Res> {
  _$UpdateDepartmentResultCopyWithImpl(this._self, this._then);

  final UpdateDepartmentResult _self;
  final $Res Function(UpdateDepartmentResult) _then;

/// Create a copy of UpdateDepartmentResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? department = null,}) {
  return _then(_self.copyWith(
department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as Department,
  ));
}
/// Create a copy of UpdateDepartmentResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DepartmentCopyWith<$Res> get department {
  
  return $DepartmentCopyWith<$Res>(_self.department, (value) {
    return _then(_self.copyWith(department: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateDepartmentResult].
extension UpdateDepartmentResultPatterns on UpdateDepartmentResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateDepartmentResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateDepartmentResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateDepartmentResult value)  $default,){
final _that = this;
switch (_that) {
case _UpdateDepartmentResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateDepartmentResult value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateDepartmentResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Department department)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateDepartmentResult() when $default != null:
return $default(_that.department);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Department department)  $default,) {final _that = this;
switch (_that) {
case _UpdateDepartmentResult():
return $default(_that.department);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Department department)?  $default,) {final _that = this;
switch (_that) {
case _UpdateDepartmentResult() when $default != null:
return $default(_that.department);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateDepartmentResult implements UpdateDepartmentResult {
  const _UpdateDepartmentResult({required this.department});
  factory _UpdateDepartmentResult.fromJson(Map<String, dynamic> json) => _$UpdateDepartmentResultFromJson(json);

@override final  Department department;

/// Create a copy of UpdateDepartmentResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateDepartmentResultCopyWith<_UpdateDepartmentResult> get copyWith => __$UpdateDepartmentResultCopyWithImpl<_UpdateDepartmentResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateDepartmentResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateDepartmentResult&&(identical(other.department, department) || other.department == department));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,department);

@override
String toString() {
  return 'UpdateDepartmentResult(department: $department)';
}


}

/// @nodoc
abstract mixin class _$UpdateDepartmentResultCopyWith<$Res> implements $UpdateDepartmentResultCopyWith<$Res> {
  factory _$UpdateDepartmentResultCopyWith(_UpdateDepartmentResult value, $Res Function(_UpdateDepartmentResult) _then) = __$UpdateDepartmentResultCopyWithImpl;
@override @useResult
$Res call({
 Department department
});


@override $DepartmentCopyWith<$Res> get department;

}
/// @nodoc
class __$UpdateDepartmentResultCopyWithImpl<$Res>
    implements _$UpdateDepartmentResultCopyWith<$Res> {
  __$UpdateDepartmentResultCopyWithImpl(this._self, this._then);

  final _UpdateDepartmentResult _self;
  final $Res Function(_UpdateDepartmentResult) _then;

/// Create a copy of UpdateDepartmentResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? department = null,}) {
  return _then(_UpdateDepartmentResult(
department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as Department,
  ));
}

/// Create a copy of UpdateDepartmentResult
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
mixin _$UpdateClassPayload {

 String get schoolId; String get name;
/// Create a copy of UpdateClassPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateClassPayloadCopyWith<UpdateClassPayload> get copyWith => _$UpdateClassPayloadCopyWithImpl<UpdateClassPayload>(this as UpdateClassPayload, _$identity);

  /// Serializes this UpdateClassPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateClassPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name);

@override
String toString() {
  return 'UpdateClassPayload(schoolId: $schoolId, name: $name)';
}


}

/// @nodoc
abstract mixin class $UpdateClassPayloadCopyWith<$Res>  {
  factory $UpdateClassPayloadCopyWith(UpdateClassPayload value, $Res Function(UpdateClassPayload) _then) = _$UpdateClassPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String name
});




}
/// @nodoc
class _$UpdateClassPayloadCopyWithImpl<$Res>
    implements $UpdateClassPayloadCopyWith<$Res> {
  _$UpdateClassPayloadCopyWithImpl(this._self, this._then);

  final UpdateClassPayload _self;
  final $Res Function(UpdateClassPayload) _then;

/// Create a copy of UpdateClassPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? name = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateClassPayload].
extension UpdateClassPayloadPatterns on UpdateClassPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateClassPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateClassPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateClassPayload value)  $default,){
final _that = this;
switch (_that) {
case _UpdateClassPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateClassPayload value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateClassPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateClassPayload() when $default != null:
return $default(_that.schoolId,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String name)  $default,) {final _that = this;
switch (_that) {
case _UpdateClassPayload():
return $default(_that.schoolId,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String name)?  $default,) {final _that = this;
switch (_that) {
case _UpdateClassPayload() when $default != null:
return $default(_that.schoolId,_that.name);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _UpdateClassPayload implements UpdateClassPayload {
  const _UpdateClassPayload({required this.schoolId, required this.name});
  factory _UpdateClassPayload.fromJson(Map<String, dynamic> json) => _$UpdateClassPayloadFromJson(json);

@override final  String schoolId;
@override final  String name;

/// Create a copy of UpdateClassPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateClassPayloadCopyWith<_UpdateClassPayload> get copyWith => __$UpdateClassPayloadCopyWithImpl<_UpdateClassPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateClassPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateClassPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name);

@override
String toString() {
  return 'UpdateClassPayload(schoolId: $schoolId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$UpdateClassPayloadCopyWith<$Res> implements $UpdateClassPayloadCopyWith<$Res> {
  factory _$UpdateClassPayloadCopyWith(_UpdateClassPayload value, $Res Function(_UpdateClassPayload) _then) = __$UpdateClassPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String name
});




}
/// @nodoc
class __$UpdateClassPayloadCopyWithImpl<$Res>
    implements _$UpdateClassPayloadCopyWith<$Res> {
  __$UpdateClassPayloadCopyWithImpl(this._self, this._then);

  final _UpdateClassPayload _self;
  final $Res Function(_UpdateClassPayload) _then;

/// Create a copy of UpdateClassPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? name = null,}) {
  return _then(_UpdateClassPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UpdateClassResult {

 ClassInfo get classInfo;
/// Create a copy of UpdateClassResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateClassResultCopyWith<UpdateClassResult> get copyWith => _$UpdateClassResultCopyWithImpl<UpdateClassResult>(this as UpdateClassResult, _$identity);

  /// Serializes this UpdateClassResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateClassResult&&(identical(other.classInfo, classInfo) || other.classInfo == classInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,classInfo);

@override
String toString() {
  return 'UpdateClassResult(classInfo: $classInfo)';
}


}

/// @nodoc
abstract mixin class $UpdateClassResultCopyWith<$Res>  {
  factory $UpdateClassResultCopyWith(UpdateClassResult value, $Res Function(UpdateClassResult) _then) = _$UpdateClassResultCopyWithImpl;
@useResult
$Res call({
 ClassInfo classInfo
});


$ClassInfoCopyWith<$Res> get classInfo;

}
/// @nodoc
class _$UpdateClassResultCopyWithImpl<$Res>
    implements $UpdateClassResultCopyWith<$Res> {
  _$UpdateClassResultCopyWithImpl(this._self, this._then);

  final UpdateClassResult _self;
  final $Res Function(UpdateClassResult) _then;

/// Create a copy of UpdateClassResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? classInfo = null,}) {
  return _then(_self.copyWith(
classInfo: null == classInfo ? _self.classInfo : classInfo // ignore: cast_nullable_to_non_nullable
as ClassInfo,
  ));
}
/// Create a copy of UpdateClassResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClassInfoCopyWith<$Res> get classInfo {
  
  return $ClassInfoCopyWith<$Res>(_self.classInfo, (value) {
    return _then(_self.copyWith(classInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateClassResult].
extension UpdateClassResultPatterns on UpdateClassResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateClassResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateClassResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateClassResult value)  $default,){
final _that = this;
switch (_that) {
case _UpdateClassResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateClassResult value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateClassResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ClassInfo classInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateClassResult() when $default != null:
return $default(_that.classInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ClassInfo classInfo)  $default,) {final _that = this;
switch (_that) {
case _UpdateClassResult():
return $default(_that.classInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ClassInfo classInfo)?  $default,) {final _that = this;
switch (_that) {
case _UpdateClassResult() when $default != null:
return $default(_that.classInfo);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _UpdateClassResult implements UpdateClassResult {
  const _UpdateClassResult({required this.classInfo});
  factory _UpdateClassResult.fromJson(Map<String, dynamic> json) => _$UpdateClassResultFromJson(json);

@override final  ClassInfo classInfo;

/// Create a copy of UpdateClassResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateClassResultCopyWith<_UpdateClassResult> get copyWith => __$UpdateClassResultCopyWithImpl<_UpdateClassResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateClassResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateClassResult&&(identical(other.classInfo, classInfo) || other.classInfo == classInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,classInfo);

@override
String toString() {
  return 'UpdateClassResult(classInfo: $classInfo)';
}


}

/// @nodoc
abstract mixin class _$UpdateClassResultCopyWith<$Res> implements $UpdateClassResultCopyWith<$Res> {
  factory _$UpdateClassResultCopyWith(_UpdateClassResult value, $Res Function(_UpdateClassResult) _then) = __$UpdateClassResultCopyWithImpl;
@override @useResult
$Res call({
 ClassInfo classInfo
});


@override $ClassInfoCopyWith<$Res> get classInfo;

}
/// @nodoc
class __$UpdateClassResultCopyWithImpl<$Res>
    implements _$UpdateClassResultCopyWith<$Res> {
  __$UpdateClassResultCopyWithImpl(this._self, this._then);

  final _UpdateClassResult _self;
  final $Res Function(_UpdateClassResult) _then;

/// Create a copy of UpdateClassResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? classInfo = null,}) {
  return _then(_UpdateClassResult(
classInfo: null == classInfo ? _self.classInfo : classInfo // ignore: cast_nullable_to_non_nullable
as ClassInfo,
  ));
}

/// Create a copy of UpdateClassResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClassInfoCopyWith<$Res> get classInfo {
  
  return $ClassInfoCopyWith<$Res>(_self.classInfo, (value) {
    return _then(_self.copyWith(classInfo: value));
  });
}
}


/// @nodoc
mixin _$FetchCoursesPayload {

 String get schoolId; String? get departmentId; String? get classId; int get page; int get size;
/// Create a copy of FetchCoursesPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchCoursesPayloadCopyWith<FetchCoursesPayload> get copyWith => _$FetchCoursesPayloadCopyWithImpl<FetchCoursesPayload>(this as FetchCoursesPayload, _$identity);

  /// Serializes this FetchCoursesPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchCoursesPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,departmentId,classId,page,size);

@override
String toString() {
  return 'FetchCoursesPayload(schoolId: $schoolId, departmentId: $departmentId, classId: $classId, page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class $FetchCoursesPayloadCopyWith<$Res>  {
  factory $FetchCoursesPayloadCopyWith(FetchCoursesPayload value, $Res Function(FetchCoursesPayload) _then) = _$FetchCoursesPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String? departmentId, String? classId, int page, int size
});




}
/// @nodoc
class _$FetchCoursesPayloadCopyWithImpl<$Res>
    implements $FetchCoursesPayloadCopyWith<$Res> {
  _$FetchCoursesPayloadCopyWithImpl(this._self, this._then);

  final FetchCoursesPayload _self;
  final $Res Function(FetchCoursesPayload) _then;

/// Create a copy of FetchCoursesPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? departmentId = freezed,Object? classId = freezed,Object? page = null,Object? size = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FetchCoursesPayload].
extension FetchCoursesPayloadPatterns on FetchCoursesPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FetchCoursesPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchCoursesPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FetchCoursesPayload value)  $default,){
final _that = this;
switch (_that) {
case _FetchCoursesPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FetchCoursesPayload value)?  $default,){
final _that = this;
switch (_that) {
case _FetchCoursesPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String? departmentId,  String? classId,  int page,  int size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchCoursesPayload() when $default != null:
return $default(_that.schoolId,_that.departmentId,_that.classId,_that.page,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String? departmentId,  String? classId,  int page,  int size)  $default,) {final _that = this;
switch (_that) {
case _FetchCoursesPayload():
return $default(_that.schoolId,_that.departmentId,_that.classId,_that.page,_that.size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String? departmentId,  String? classId,  int page,  int size)?  $default,) {final _that = this;
switch (_that) {
case _FetchCoursesPayload() when $default != null:
return $default(_that.schoolId,_that.departmentId,_that.classId,_that.page,_that.size);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _FetchCoursesPayload implements FetchCoursesPayload {
  const _FetchCoursesPayload({required this.schoolId, this.departmentId, this.classId, this.page = 1, this.size = 20});
  factory _FetchCoursesPayload.fromJson(Map<String, dynamic> json) => _$FetchCoursesPayloadFromJson(json);

@override final  String schoolId;
@override final  String? departmentId;
@override final  String? classId;
@override@JsonKey() final  int page;
@override@JsonKey() final  int size;

/// Create a copy of FetchCoursesPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchCoursesPayloadCopyWith<_FetchCoursesPayload> get copyWith => __$FetchCoursesPayloadCopyWithImpl<_FetchCoursesPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FetchCoursesPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchCoursesPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,departmentId,classId,page,size);

@override
String toString() {
  return 'FetchCoursesPayload(schoolId: $schoolId, departmentId: $departmentId, classId: $classId, page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class _$FetchCoursesPayloadCopyWith<$Res> implements $FetchCoursesPayloadCopyWith<$Res> {
  factory _$FetchCoursesPayloadCopyWith(_FetchCoursesPayload value, $Res Function(_FetchCoursesPayload) _then) = __$FetchCoursesPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String? departmentId, String? classId, int page, int size
});




}
/// @nodoc
class __$FetchCoursesPayloadCopyWithImpl<$Res>
    implements _$FetchCoursesPayloadCopyWith<$Res> {
  __$FetchCoursesPayloadCopyWithImpl(this._self, this._then);

  final _FetchCoursesPayload _self;
  final $Res Function(_FetchCoursesPayload) _then;

/// Create a copy of FetchCoursesPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? departmentId = freezed,Object? classId = freezed,Object? page = null,Object? size = null,}) {
  return _then(_FetchCoursesPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CreateCoursePayload {

 String get schoolId; String get name; String? get description;
/// Create a copy of CreateCoursePayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCoursePayloadCopyWith<CreateCoursePayload> get copyWith => _$CreateCoursePayloadCopyWithImpl<CreateCoursePayload>(this as CreateCoursePayload, _$identity);

  /// Serializes this CreateCoursePayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCoursePayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name,description);

@override
String toString() {
  return 'CreateCoursePayload(schoolId: $schoolId, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $CreateCoursePayloadCopyWith<$Res>  {
  factory $CreateCoursePayloadCopyWith(CreateCoursePayload value, $Res Function(CreateCoursePayload) _then) = _$CreateCoursePayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String name, String? description
});




}
/// @nodoc
class _$CreateCoursePayloadCopyWithImpl<$Res>
    implements $CreateCoursePayloadCopyWith<$Res> {
  _$CreateCoursePayloadCopyWithImpl(this._self, this._then);

  final CreateCoursePayload _self;
  final $Res Function(CreateCoursePayload) _then;

/// Create a copy of CreateCoursePayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? name = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateCoursePayload].
extension CreateCoursePayloadPatterns on CreateCoursePayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateCoursePayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateCoursePayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateCoursePayload value)  $default,){
final _that = this;
switch (_that) {
case _CreateCoursePayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateCoursePayload value)?  $default,){
final _that = this;
switch (_that) {
case _CreateCoursePayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String name,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCoursePayload() when $default != null:
return $default(_that.schoolId,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String name,  String? description)  $default,) {final _that = this;
switch (_that) {
case _CreateCoursePayload():
return $default(_that.schoolId,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String name,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _CreateCoursePayload() when $default != null:
return $default(_that.schoolId,_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _CreateCoursePayload implements CreateCoursePayload {
  const _CreateCoursePayload({required this.schoolId, required this.name, this.description});
  factory _CreateCoursePayload.fromJson(Map<String, dynamic> json) => _$CreateCoursePayloadFromJson(json);

@override final  String schoolId;
@override final  String name;
@override final  String? description;

/// Create a copy of CreateCoursePayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCoursePayloadCopyWith<_CreateCoursePayload> get copyWith => __$CreateCoursePayloadCopyWithImpl<_CreateCoursePayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateCoursePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCoursePayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name,description);

@override
String toString() {
  return 'CreateCoursePayload(schoolId: $schoolId, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CreateCoursePayloadCopyWith<$Res> implements $CreateCoursePayloadCopyWith<$Res> {
  factory _$CreateCoursePayloadCopyWith(_CreateCoursePayload value, $Res Function(_CreateCoursePayload) _then) = __$CreateCoursePayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String name, String? description
});




}
/// @nodoc
class __$CreateCoursePayloadCopyWithImpl<$Res>
    implements _$CreateCoursePayloadCopyWith<$Res> {
  __$CreateCoursePayloadCopyWithImpl(this._self, this._then);

  final _CreateCoursePayload _self;
  final $Res Function(_CreateCoursePayload) _then;

/// Create a copy of CreateCoursePayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? name = null,Object? description = freezed,}) {
  return _then(_CreateCoursePayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UpdateCoursePayload {

 String? get name; String? get description;
/// Create a copy of UpdateCoursePayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCoursePayloadCopyWith<UpdateCoursePayload> get copyWith => _$UpdateCoursePayloadCopyWithImpl<UpdateCoursePayload>(this as UpdateCoursePayload, _$identity);

  /// Serializes this UpdateCoursePayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCoursePayload&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description);

@override
String toString() {
  return 'UpdateCoursePayload(name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $UpdateCoursePayloadCopyWith<$Res>  {
  factory $UpdateCoursePayloadCopyWith(UpdateCoursePayload value, $Res Function(UpdateCoursePayload) _then) = _$UpdateCoursePayloadCopyWithImpl;
@useResult
$Res call({
 String? name, String? description
});




}
/// @nodoc
class _$UpdateCoursePayloadCopyWithImpl<$Res>
    implements $UpdateCoursePayloadCopyWith<$Res> {
  _$UpdateCoursePayloadCopyWithImpl(this._self, this._then);

  final UpdateCoursePayload _self;
  final $Res Function(UpdateCoursePayload) _then;

/// Create a copy of UpdateCoursePayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateCoursePayload].
extension UpdateCoursePayloadPatterns on UpdateCoursePayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateCoursePayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateCoursePayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateCoursePayload value)  $default,){
final _that = this;
switch (_that) {
case _UpdateCoursePayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateCoursePayload value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateCoursePayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateCoursePayload() when $default != null:
return $default(_that.name,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? description)  $default,) {final _that = this;
switch (_that) {
case _UpdateCoursePayload():
return $default(_that.name,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _UpdateCoursePayload() when $default != null:
return $default(_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _UpdateCoursePayload implements UpdateCoursePayload {
  const _UpdateCoursePayload({this.name, this.description});
  factory _UpdateCoursePayload.fromJson(Map<String, dynamic> json) => _$UpdateCoursePayloadFromJson(json);

@override final  String? name;
@override final  String? description;

/// Create a copy of UpdateCoursePayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCoursePayloadCopyWith<_UpdateCoursePayload> get copyWith => __$UpdateCoursePayloadCopyWithImpl<_UpdateCoursePayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateCoursePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateCoursePayload&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description);

@override
String toString() {
  return 'UpdateCoursePayload(name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$UpdateCoursePayloadCopyWith<$Res> implements $UpdateCoursePayloadCopyWith<$Res> {
  factory _$UpdateCoursePayloadCopyWith(_UpdateCoursePayload value, $Res Function(_UpdateCoursePayload) _then) = __$UpdateCoursePayloadCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? description
});




}
/// @nodoc
class __$UpdateCoursePayloadCopyWithImpl<$Res>
    implements _$UpdateCoursePayloadCopyWith<$Res> {
  __$UpdateCoursePayloadCopyWithImpl(this._self, this._then);

  final _UpdateCoursePayload _self;
  final $Res Function(_UpdateCoursePayload) _then;

/// Create a copy of UpdateCoursePayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? description = freezed,}) {
  return _then(_UpdateCoursePayload(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UpdateAssignmentPayload {

 String get teacherId; String get classId;
/// Create a copy of UpdateAssignmentPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAssignmentPayloadCopyWith<UpdateAssignmentPayload> get copyWith => _$UpdateAssignmentPayloadCopyWithImpl<UpdateAssignmentPayload>(this as UpdateAssignmentPayload, _$identity);

  /// Serializes this UpdateAssignmentPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAssignmentPayload&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.classId, classId) || other.classId == classId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teacherId,classId);

@override
String toString() {
  return 'UpdateAssignmentPayload(teacherId: $teacherId, classId: $classId)';
}


}

/// @nodoc
abstract mixin class $UpdateAssignmentPayloadCopyWith<$Res>  {
  factory $UpdateAssignmentPayloadCopyWith(UpdateAssignmentPayload value, $Res Function(UpdateAssignmentPayload) _then) = _$UpdateAssignmentPayloadCopyWithImpl;
@useResult
$Res call({
 String teacherId, String classId
});




}
/// @nodoc
class _$UpdateAssignmentPayloadCopyWithImpl<$Res>
    implements $UpdateAssignmentPayloadCopyWith<$Res> {
  _$UpdateAssignmentPayloadCopyWithImpl(this._self, this._then);

  final UpdateAssignmentPayload _self;
  final $Res Function(UpdateAssignmentPayload) _then;

/// Create a copy of UpdateAssignmentPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? teacherId = null,Object? classId = null,}) {
  return _then(_self.copyWith(
teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateAssignmentPayload].
extension UpdateAssignmentPayloadPatterns on UpdateAssignmentPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateAssignmentPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateAssignmentPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateAssignmentPayload value)  $default,){
final _that = this;
switch (_that) {
case _UpdateAssignmentPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateAssignmentPayload value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateAssignmentPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String teacherId,  String classId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateAssignmentPayload() when $default != null:
return $default(_that.teacherId,_that.classId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String teacherId,  String classId)  $default,) {final _that = this;
switch (_that) {
case _UpdateAssignmentPayload():
return $default(_that.teacherId,_that.classId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String teacherId,  String classId)?  $default,) {final _that = this;
switch (_that) {
case _UpdateAssignmentPayload() when $default != null:
return $default(_that.teacherId,_that.classId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _UpdateAssignmentPayload implements UpdateAssignmentPayload {
  const _UpdateAssignmentPayload({required this.teacherId, required this.classId});
  factory _UpdateAssignmentPayload.fromJson(Map<String, dynamic> json) => _$UpdateAssignmentPayloadFromJson(json);

@override final  String teacherId;
@override final  String classId;

/// Create a copy of UpdateAssignmentPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAssignmentPayloadCopyWith<_UpdateAssignmentPayload> get copyWith => __$UpdateAssignmentPayloadCopyWithImpl<_UpdateAssignmentPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateAssignmentPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAssignmentPayload&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.classId, classId) || other.classId == classId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teacherId,classId);

@override
String toString() {
  return 'UpdateAssignmentPayload(teacherId: $teacherId, classId: $classId)';
}


}

/// @nodoc
abstract mixin class _$UpdateAssignmentPayloadCopyWith<$Res> implements $UpdateAssignmentPayloadCopyWith<$Res> {
  factory _$UpdateAssignmentPayloadCopyWith(_UpdateAssignmentPayload value, $Res Function(_UpdateAssignmentPayload) _then) = __$UpdateAssignmentPayloadCopyWithImpl;
@override @useResult
$Res call({
 String teacherId, String classId
});




}
/// @nodoc
class __$UpdateAssignmentPayloadCopyWithImpl<$Res>
    implements _$UpdateAssignmentPayloadCopyWith<$Res> {
  __$UpdateAssignmentPayloadCopyWithImpl(this._self, this._then);

  final _UpdateAssignmentPayload _self;
  final $Res Function(_UpdateAssignmentPayload) _then;

/// Create a copy of UpdateAssignmentPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? teacherId = null,Object? classId = null,}) {
  return _then(_UpdateAssignmentPayload(
teacherId: null == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FetchCourseAssignmentsPayload {

 String get schoolId; String? get courseId; String? get departmentId; String? get classId; int get page; int get pageSize;
/// Create a copy of FetchCourseAssignmentsPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchCourseAssignmentsPayloadCopyWith<FetchCourseAssignmentsPayload> get copyWith => _$FetchCourseAssignmentsPayloadCopyWithImpl<FetchCourseAssignmentsPayload>(this as FetchCourseAssignmentsPayload, _$identity);

  /// Serializes this FetchCourseAssignmentsPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchCourseAssignmentsPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,courseId,departmentId,classId,page,pageSize);

@override
String toString() {
  return 'FetchCourseAssignmentsPayload(schoolId: $schoolId, courseId: $courseId, departmentId: $departmentId, classId: $classId, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $FetchCourseAssignmentsPayloadCopyWith<$Res>  {
  factory $FetchCourseAssignmentsPayloadCopyWith(FetchCourseAssignmentsPayload value, $Res Function(FetchCourseAssignmentsPayload) _then) = _$FetchCourseAssignmentsPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String? courseId, String? departmentId, String? classId, int page, int pageSize
});




}
/// @nodoc
class _$FetchCourseAssignmentsPayloadCopyWithImpl<$Res>
    implements $FetchCourseAssignmentsPayloadCopyWith<$Res> {
  _$FetchCourseAssignmentsPayloadCopyWithImpl(this._self, this._then);

  final FetchCourseAssignmentsPayload _self;
  final $Res Function(FetchCourseAssignmentsPayload) _then;

/// Create a copy of FetchCourseAssignmentsPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? courseId = freezed,Object? departmentId = freezed,Object? classId = freezed,Object? page = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FetchCourseAssignmentsPayload].
extension FetchCourseAssignmentsPayloadPatterns on FetchCourseAssignmentsPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FetchCourseAssignmentsPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchCourseAssignmentsPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FetchCourseAssignmentsPayload value)  $default,){
final _that = this;
switch (_that) {
case _FetchCourseAssignmentsPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FetchCourseAssignmentsPayload value)?  $default,){
final _that = this;
switch (_that) {
case _FetchCourseAssignmentsPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String? courseId,  String? departmentId,  String? classId,  int page,  int pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchCourseAssignmentsPayload() when $default != null:
return $default(_that.schoolId,_that.courseId,_that.departmentId,_that.classId,_that.page,_that.pageSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String? courseId,  String? departmentId,  String? classId,  int page,  int pageSize)  $default,) {final _that = this;
switch (_that) {
case _FetchCourseAssignmentsPayload():
return $default(_that.schoolId,_that.courseId,_that.departmentId,_that.classId,_that.page,_that.pageSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String? courseId,  String? departmentId,  String? classId,  int page,  int pageSize)?  $default,) {final _that = this;
switch (_that) {
case _FetchCourseAssignmentsPayload() when $default != null:
return $default(_that.schoolId,_that.courseId,_that.departmentId,_that.classId,_that.page,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _FetchCourseAssignmentsPayload implements FetchCourseAssignmentsPayload {
  const _FetchCourseAssignmentsPayload({required this.schoolId, this.courseId, this.departmentId, this.classId, this.page = 1, this.pageSize = 20});
  factory _FetchCourseAssignmentsPayload.fromJson(Map<String, dynamic> json) => _$FetchCourseAssignmentsPayloadFromJson(json);

@override final  String schoolId;
@override final  String? courseId;
@override final  String? departmentId;
@override final  String? classId;
@override@JsonKey() final  int page;
@override@JsonKey() final  int pageSize;

/// Create a copy of FetchCourseAssignmentsPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchCourseAssignmentsPayloadCopyWith<_FetchCourseAssignmentsPayload> get copyWith => __$FetchCourseAssignmentsPayloadCopyWithImpl<_FetchCourseAssignmentsPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FetchCourseAssignmentsPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchCourseAssignmentsPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,courseId,departmentId,classId,page,pageSize);

@override
String toString() {
  return 'FetchCourseAssignmentsPayload(schoolId: $schoolId, courseId: $courseId, departmentId: $departmentId, classId: $classId, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$FetchCourseAssignmentsPayloadCopyWith<$Res> implements $FetchCourseAssignmentsPayloadCopyWith<$Res> {
  factory _$FetchCourseAssignmentsPayloadCopyWith(_FetchCourseAssignmentsPayload value, $Res Function(_FetchCourseAssignmentsPayload) _then) = __$FetchCourseAssignmentsPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String? courseId, String? departmentId, String? classId, int page, int pageSize
});




}
/// @nodoc
class __$FetchCourseAssignmentsPayloadCopyWithImpl<$Res>
    implements _$FetchCourseAssignmentsPayloadCopyWith<$Res> {
  __$FetchCourseAssignmentsPayloadCopyWithImpl(this._self, this._then);

  final _FetchCourseAssignmentsPayload _self;
  final $Res Function(_FetchCourseAssignmentsPayload) _then;

/// Create a copy of FetchCourseAssignmentsPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? courseId = freezed,Object? departmentId = freezed,Object? classId = freezed,Object? page = null,Object? pageSize = null,}) {
  return _then(_FetchCourseAssignmentsPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AssignStudentsPayload {

 List<String>? get studentIds; String? get classId; String? get departmentId;
/// Create a copy of AssignStudentsPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignStudentsPayloadCopyWith<AssignStudentsPayload> get copyWith => _$AssignStudentsPayloadCopyWithImpl<AssignStudentsPayload>(this as AssignStudentsPayload, _$identity);

  /// Serializes this AssignStudentsPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignStudentsPayload&&const DeepCollectionEquality().equals(other.studentIds, studentIds)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(studentIds),classId,departmentId);

@override
String toString() {
  return 'AssignStudentsPayload(studentIds: $studentIds, classId: $classId, departmentId: $departmentId)';
}


}

/// @nodoc
abstract mixin class $AssignStudentsPayloadCopyWith<$Res>  {
  factory $AssignStudentsPayloadCopyWith(AssignStudentsPayload value, $Res Function(AssignStudentsPayload) _then) = _$AssignStudentsPayloadCopyWithImpl;
@useResult
$Res call({
 List<String>? studentIds, String? classId, String? departmentId
});




}
/// @nodoc
class _$AssignStudentsPayloadCopyWithImpl<$Res>
    implements $AssignStudentsPayloadCopyWith<$Res> {
  _$AssignStudentsPayloadCopyWithImpl(this._self, this._then);

  final AssignStudentsPayload _self;
  final $Res Function(AssignStudentsPayload) _then;

/// Create a copy of AssignStudentsPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? studentIds = freezed,Object? classId = freezed,Object? departmentId = freezed,}) {
  return _then(_self.copyWith(
studentIds: freezed == studentIds ? _self.studentIds : studentIds // ignore: cast_nullable_to_non_nullable
as List<String>?,classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AssignStudentsPayload].
extension AssignStudentsPayloadPatterns on AssignStudentsPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssignStudentsPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssignStudentsPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssignStudentsPayload value)  $default,){
final _that = this;
switch (_that) {
case _AssignStudentsPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssignStudentsPayload value)?  $default,){
final _that = this;
switch (_that) {
case _AssignStudentsPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String>? studentIds,  String? classId,  String? departmentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignStudentsPayload() when $default != null:
return $default(_that.studentIds,_that.classId,_that.departmentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String>? studentIds,  String? classId,  String? departmentId)  $default,) {final _that = this;
switch (_that) {
case _AssignStudentsPayload():
return $default(_that.studentIds,_that.classId,_that.departmentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String>? studentIds,  String? classId,  String? departmentId)?  $default,) {final _that = this;
switch (_that) {
case _AssignStudentsPayload() when $default != null:
return $default(_that.studentIds,_that.classId,_that.departmentId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _AssignStudentsPayload implements AssignStudentsPayload {
  const _AssignStudentsPayload({final  List<String>? studentIds, this.classId, this.departmentId}): _studentIds = studentIds;
  factory _AssignStudentsPayload.fromJson(Map<String, dynamic> json) => _$AssignStudentsPayloadFromJson(json);

 final  List<String>? _studentIds;
@override List<String>? get studentIds {
  final value = _studentIds;
  if (value == null) return null;
  if (_studentIds is EqualUnmodifiableListView) return _studentIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? classId;
@override final  String? departmentId;

/// Create a copy of AssignStudentsPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignStudentsPayloadCopyWith<_AssignStudentsPayload> get copyWith => __$AssignStudentsPayloadCopyWithImpl<_AssignStudentsPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignStudentsPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignStudentsPayload&&const DeepCollectionEquality().equals(other._studentIds, _studentIds)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_studentIds),classId,departmentId);

@override
String toString() {
  return 'AssignStudentsPayload(studentIds: $studentIds, classId: $classId, departmentId: $departmentId)';
}


}

/// @nodoc
abstract mixin class _$AssignStudentsPayloadCopyWith<$Res> implements $AssignStudentsPayloadCopyWith<$Res> {
  factory _$AssignStudentsPayloadCopyWith(_AssignStudentsPayload value, $Res Function(_AssignStudentsPayload) _then) = __$AssignStudentsPayloadCopyWithImpl;
@override @useResult
$Res call({
 List<String>? studentIds, String? classId, String? departmentId
});




}
/// @nodoc
class __$AssignStudentsPayloadCopyWithImpl<$Res>
    implements _$AssignStudentsPayloadCopyWith<$Res> {
  __$AssignStudentsPayloadCopyWithImpl(this._self, this._then);

  final _AssignStudentsPayload _self;
  final $Res Function(_AssignStudentsPayload) _then;

/// Create a copy of AssignStudentsPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? studentIds = freezed,Object? classId = freezed,Object? departmentId = freezed,}) {
  return _then(_AssignStudentsPayload(
studentIds: freezed == studentIds ? _self._studentIds : studentIds // ignore: cast_nullable_to_non_nullable
as List<String>?,classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateTimeSlotPayload {

 String get schoolId; String get name; String get startTime; String get endTime;
/// Create a copy of CreateTimeSlotPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTimeSlotPayloadCopyWith<CreateTimeSlotPayload> get copyWith => _$CreateTimeSlotPayloadCopyWithImpl<CreateTimeSlotPayload>(this as CreateTimeSlotPayload, _$identity);

  /// Serializes this CreateTimeSlotPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTimeSlotPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name,startTime,endTime);

@override
String toString() {
  return 'CreateTimeSlotPayload(schoolId: $schoolId, name: $name, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class $CreateTimeSlotPayloadCopyWith<$Res>  {
  factory $CreateTimeSlotPayloadCopyWith(CreateTimeSlotPayload value, $Res Function(CreateTimeSlotPayload) _then) = _$CreateTimeSlotPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String name, String startTime, String endTime
});




}
/// @nodoc
class _$CreateTimeSlotPayloadCopyWithImpl<$Res>
    implements $CreateTimeSlotPayloadCopyWith<$Res> {
  _$CreateTimeSlotPayloadCopyWithImpl(this._self, this._then);

  final CreateTimeSlotPayload _self;
  final $Res Function(CreateTimeSlotPayload) _then;

/// Create a copy of CreateTimeSlotPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? name = null,Object? startTime = null,Object? endTime = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTimeSlotPayload].
extension CreateTimeSlotPayloadPatterns on CreateTimeSlotPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTimeSlotPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTimeSlotPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTimeSlotPayload value)  $default,){
final _that = this;
switch (_that) {
case _CreateTimeSlotPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTimeSlotPayload value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTimeSlotPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String name,  String startTime,  String endTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTimeSlotPayload() when $default != null:
return $default(_that.schoolId,_that.name,_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String name,  String startTime,  String endTime)  $default,) {final _that = this;
switch (_that) {
case _CreateTimeSlotPayload():
return $default(_that.schoolId,_that.name,_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String name,  String startTime,  String endTime)?  $default,) {final _that = this;
switch (_that) {
case _CreateTimeSlotPayload() when $default != null:
return $default(_that.schoolId,_that.name,_that.startTime,_that.endTime);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _CreateTimeSlotPayload implements CreateTimeSlotPayload {
  const _CreateTimeSlotPayload({required this.schoolId, required this.name, required this.startTime, required this.endTime});
  factory _CreateTimeSlotPayload.fromJson(Map<String, dynamic> json) => _$CreateTimeSlotPayloadFromJson(json);

@override final  String schoolId;
@override final  String name;
@override final  String startTime;
@override final  String endTime;

/// Create a copy of CreateTimeSlotPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTimeSlotPayloadCopyWith<_CreateTimeSlotPayload> get copyWith => __$CreateTimeSlotPayloadCopyWithImpl<_CreateTimeSlotPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTimeSlotPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTimeSlotPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.name, name) || other.name == name)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,name,startTime,endTime);

@override
String toString() {
  return 'CreateTimeSlotPayload(schoolId: $schoolId, name: $name, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class _$CreateTimeSlotPayloadCopyWith<$Res> implements $CreateTimeSlotPayloadCopyWith<$Res> {
  factory _$CreateTimeSlotPayloadCopyWith(_CreateTimeSlotPayload value, $Res Function(_CreateTimeSlotPayload) _then) = __$CreateTimeSlotPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String name, String startTime, String endTime
});




}
/// @nodoc
class __$CreateTimeSlotPayloadCopyWithImpl<$Res>
    implements _$CreateTimeSlotPayloadCopyWith<$Res> {
  __$CreateTimeSlotPayloadCopyWithImpl(this._self, this._then);

  final _CreateTimeSlotPayload _self;
  final $Res Function(_CreateTimeSlotPayload) _then;

/// Create a copy of CreateTimeSlotPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? name = null,Object? startTime = null,Object? endTime = null,}) {
  return _then(_CreateTimeSlotPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UpdateTimeSlotPayload {

 String get name; String get startTime; String get endTime;
/// Create a copy of UpdateTimeSlotPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateTimeSlotPayloadCopyWith<UpdateTimeSlotPayload> get copyWith => _$UpdateTimeSlotPayloadCopyWithImpl<UpdateTimeSlotPayload>(this as UpdateTimeSlotPayload, _$identity);

  /// Serializes this UpdateTimeSlotPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateTimeSlotPayload&&(identical(other.name, name) || other.name == name)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,startTime,endTime);

@override
String toString() {
  return 'UpdateTimeSlotPayload(name: $name, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class $UpdateTimeSlotPayloadCopyWith<$Res>  {
  factory $UpdateTimeSlotPayloadCopyWith(UpdateTimeSlotPayload value, $Res Function(UpdateTimeSlotPayload) _then) = _$UpdateTimeSlotPayloadCopyWithImpl;
@useResult
$Res call({
 String name, String startTime, String endTime
});




}
/// @nodoc
class _$UpdateTimeSlotPayloadCopyWithImpl<$Res>
    implements $UpdateTimeSlotPayloadCopyWith<$Res> {
  _$UpdateTimeSlotPayloadCopyWithImpl(this._self, this._then);

  final UpdateTimeSlotPayload _self;
  final $Res Function(UpdateTimeSlotPayload) _then;

/// Create a copy of UpdateTimeSlotPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? startTime = null,Object? endTime = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateTimeSlotPayload].
extension UpdateTimeSlotPayloadPatterns on UpdateTimeSlotPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateTimeSlotPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateTimeSlotPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateTimeSlotPayload value)  $default,){
final _that = this;
switch (_that) {
case _UpdateTimeSlotPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateTimeSlotPayload value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateTimeSlotPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String startTime,  String endTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateTimeSlotPayload() when $default != null:
return $default(_that.name,_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String startTime,  String endTime)  $default,) {final _that = this;
switch (_that) {
case _UpdateTimeSlotPayload():
return $default(_that.name,_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String startTime,  String endTime)?  $default,) {final _that = this;
switch (_that) {
case _UpdateTimeSlotPayload() when $default != null:
return $default(_that.name,_that.startTime,_that.endTime);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _UpdateTimeSlotPayload implements UpdateTimeSlotPayload {
  const _UpdateTimeSlotPayload({required this.name, required this.startTime, required this.endTime});
  factory _UpdateTimeSlotPayload.fromJson(Map<String, dynamic> json) => _$UpdateTimeSlotPayloadFromJson(json);

@override final  String name;
@override final  String startTime;
@override final  String endTime;

/// Create a copy of UpdateTimeSlotPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTimeSlotPayloadCopyWith<_UpdateTimeSlotPayload> get copyWith => __$UpdateTimeSlotPayloadCopyWithImpl<_UpdateTimeSlotPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateTimeSlotPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTimeSlotPayload&&(identical(other.name, name) || other.name == name)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,startTime,endTime);

@override
String toString() {
  return 'UpdateTimeSlotPayload(name: $name, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class _$UpdateTimeSlotPayloadCopyWith<$Res> implements $UpdateTimeSlotPayloadCopyWith<$Res> {
  factory _$UpdateTimeSlotPayloadCopyWith(_UpdateTimeSlotPayload value, $Res Function(_UpdateTimeSlotPayload) _then) = __$UpdateTimeSlotPayloadCopyWithImpl;
@override @useResult
$Res call({
 String name, String startTime, String endTime
});




}
/// @nodoc
class __$UpdateTimeSlotPayloadCopyWithImpl<$Res>
    implements _$UpdateTimeSlotPayloadCopyWith<$Res> {
  __$UpdateTimeSlotPayloadCopyWithImpl(this._self, this._then);

  final _UpdateTimeSlotPayload _self;
  final $Res Function(_UpdateTimeSlotPayload) _then;

/// Create a copy of UpdateTimeSlotPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? startTime = null,Object? endTime = null,}) {
  return _then(_UpdateTimeSlotPayload(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CreateScheduleRulePayload {

 String get schoolId; String get courseId; String get classId; String? get teacherId; String get slotId; int get dayOfWeek; String get location; String? get classroomId; String get startDate; String get endDate;
/// Create a copy of CreateScheduleRulePayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateScheduleRulePayloadCopyWith<CreateScheduleRulePayload> get copyWith => _$CreateScheduleRulePayloadCopyWithImpl<CreateScheduleRulePayload>(this as CreateScheduleRulePayload, _$identity);

  /// Serializes this CreateScheduleRulePayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateScheduleRulePayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.location, location) || other.location == location)&&(identical(other.classroomId, classroomId) || other.classroomId == classroomId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,courseId,classId,teacherId,slotId,dayOfWeek,location,classroomId,startDate,endDate);

@override
String toString() {
  return 'CreateScheduleRulePayload(schoolId: $schoolId, courseId: $courseId, classId: $classId, teacherId: $teacherId, slotId: $slotId, dayOfWeek: $dayOfWeek, location: $location, classroomId: $classroomId, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $CreateScheduleRulePayloadCopyWith<$Res>  {
  factory $CreateScheduleRulePayloadCopyWith(CreateScheduleRulePayload value, $Res Function(CreateScheduleRulePayload) _then) = _$CreateScheduleRulePayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String courseId, String classId, String? teacherId, String slotId, int dayOfWeek, String location, String? classroomId, String startDate, String endDate
});




}
/// @nodoc
class _$CreateScheduleRulePayloadCopyWithImpl<$Res>
    implements $CreateScheduleRulePayloadCopyWith<$Res> {
  _$CreateScheduleRulePayloadCopyWithImpl(this._self, this._then);

  final CreateScheduleRulePayload _self;
  final $Res Function(CreateScheduleRulePayload) _then;

/// Create a copy of CreateScheduleRulePayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? courseId = null,Object? classId = null,Object? teacherId = freezed,Object? slotId = null,Object? dayOfWeek = null,Object? location = null,Object? classroomId = freezed,Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,teacherId: freezed == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String?,slotId: null == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,classroomId: freezed == classroomId ? _self.classroomId : classroomId // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateScheduleRulePayload].
extension CreateScheduleRulePayloadPatterns on CreateScheduleRulePayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateScheduleRulePayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateScheduleRulePayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateScheduleRulePayload value)  $default,){
final _that = this;
switch (_that) {
case _CreateScheduleRulePayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateScheduleRulePayload value)?  $default,){
final _that = this;
switch (_that) {
case _CreateScheduleRulePayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String courseId,  String classId,  String? teacherId,  String slotId,  int dayOfWeek,  String location,  String? classroomId,  String startDate,  String endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateScheduleRulePayload() when $default != null:
return $default(_that.schoolId,_that.courseId,_that.classId,_that.teacherId,_that.slotId,_that.dayOfWeek,_that.location,_that.classroomId,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String courseId,  String classId,  String? teacherId,  String slotId,  int dayOfWeek,  String location,  String? classroomId,  String startDate,  String endDate)  $default,) {final _that = this;
switch (_that) {
case _CreateScheduleRulePayload():
return $default(_that.schoolId,_that.courseId,_that.classId,_that.teacherId,_that.slotId,_that.dayOfWeek,_that.location,_that.classroomId,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String courseId,  String classId,  String? teacherId,  String slotId,  int dayOfWeek,  String location,  String? classroomId,  String startDate,  String endDate)?  $default,) {final _that = this;
switch (_that) {
case _CreateScheduleRulePayload() when $default != null:
return $default(_that.schoolId,_that.courseId,_that.classId,_that.teacherId,_that.slotId,_that.dayOfWeek,_that.location,_that.classroomId,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _CreateScheduleRulePayload implements CreateScheduleRulePayload {
  const _CreateScheduleRulePayload({required this.schoolId, required this.courseId, required this.classId, this.teacherId, required this.slotId, required this.dayOfWeek, required this.location, this.classroomId, required this.startDate, required this.endDate});
  factory _CreateScheduleRulePayload.fromJson(Map<String, dynamic> json) => _$CreateScheduleRulePayloadFromJson(json);

@override final  String schoolId;
@override final  String courseId;
@override final  String classId;
@override final  String? teacherId;
@override final  String slotId;
@override final  int dayOfWeek;
@override final  String location;
@override final  String? classroomId;
@override final  String startDate;
@override final  String endDate;

/// Create a copy of CreateScheduleRulePayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateScheduleRulePayloadCopyWith<_CreateScheduleRulePayload> get copyWith => __$CreateScheduleRulePayloadCopyWithImpl<_CreateScheduleRulePayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateScheduleRulePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateScheduleRulePayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.teacherId, teacherId) || other.teacherId == teacherId)&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.location, location) || other.location == location)&&(identical(other.classroomId, classroomId) || other.classroomId == classroomId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,courseId,classId,teacherId,slotId,dayOfWeek,location,classroomId,startDate,endDate);

@override
String toString() {
  return 'CreateScheduleRulePayload(schoolId: $schoolId, courseId: $courseId, classId: $classId, teacherId: $teacherId, slotId: $slotId, dayOfWeek: $dayOfWeek, location: $location, classroomId: $classroomId, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$CreateScheduleRulePayloadCopyWith<$Res> implements $CreateScheduleRulePayloadCopyWith<$Res> {
  factory _$CreateScheduleRulePayloadCopyWith(_CreateScheduleRulePayload value, $Res Function(_CreateScheduleRulePayload) _then) = __$CreateScheduleRulePayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String courseId, String classId, String? teacherId, String slotId, int dayOfWeek, String location, String? classroomId, String startDate, String endDate
});




}
/// @nodoc
class __$CreateScheduleRulePayloadCopyWithImpl<$Res>
    implements _$CreateScheduleRulePayloadCopyWith<$Res> {
  __$CreateScheduleRulePayloadCopyWithImpl(this._self, this._then);

  final _CreateScheduleRulePayload _self;
  final $Res Function(_CreateScheduleRulePayload) _then;

/// Create a copy of CreateScheduleRulePayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? courseId = null,Object? classId = null,Object? teacherId = freezed,Object? slotId = null,Object? dayOfWeek = null,Object? location = null,Object? classroomId = freezed,Object? startDate = null,Object? endDate = null,}) {
  return _then(_CreateScheduleRulePayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,teacherId: freezed == teacherId ? _self.teacherId : teacherId // ignore: cast_nullable_to_non_nullable
as String?,slotId: null == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,classroomId: freezed == classroomId ? _self.classroomId : classroomId // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ListScheduleRulesPayload {

 String get schoolId; String? get courseId;
/// Create a copy of ListScheduleRulesPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListScheduleRulesPayloadCopyWith<ListScheduleRulesPayload> get copyWith => _$ListScheduleRulesPayloadCopyWithImpl<ListScheduleRulesPayload>(this as ListScheduleRulesPayload, _$identity);

  /// Serializes this ListScheduleRulesPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListScheduleRulesPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.courseId, courseId) || other.courseId == courseId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,courseId);

@override
String toString() {
  return 'ListScheduleRulesPayload(schoolId: $schoolId, courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class $ListScheduleRulesPayloadCopyWith<$Res>  {
  factory $ListScheduleRulesPayloadCopyWith(ListScheduleRulesPayload value, $Res Function(ListScheduleRulesPayload) _then) = _$ListScheduleRulesPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String? courseId
});




}
/// @nodoc
class _$ListScheduleRulesPayloadCopyWithImpl<$Res>
    implements $ListScheduleRulesPayloadCopyWith<$Res> {
  _$ListScheduleRulesPayloadCopyWithImpl(this._self, this._then);

  final ListScheduleRulesPayload _self;
  final $Res Function(ListScheduleRulesPayload) _then;

/// Create a copy of ListScheduleRulesPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? courseId = freezed,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListScheduleRulesPayload].
extension ListScheduleRulesPayloadPatterns on ListScheduleRulesPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListScheduleRulesPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListScheduleRulesPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListScheduleRulesPayload value)  $default,){
final _that = this;
switch (_that) {
case _ListScheduleRulesPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListScheduleRulesPayload value)?  $default,){
final _that = this;
switch (_that) {
case _ListScheduleRulesPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String? courseId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListScheduleRulesPayload() when $default != null:
return $default(_that.schoolId,_that.courseId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String? courseId)  $default,) {final _that = this;
switch (_that) {
case _ListScheduleRulesPayload():
return $default(_that.schoolId,_that.courseId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String? courseId)?  $default,) {final _that = this;
switch (_that) {
case _ListScheduleRulesPayload() when $default != null:
return $default(_that.schoolId,_that.courseId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _ListScheduleRulesPayload implements ListScheduleRulesPayload {
  const _ListScheduleRulesPayload({required this.schoolId, this.courseId});
  factory _ListScheduleRulesPayload.fromJson(Map<String, dynamic> json) => _$ListScheduleRulesPayloadFromJson(json);

@override final  String schoolId;
@override final  String? courseId;

/// Create a copy of ListScheduleRulesPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListScheduleRulesPayloadCopyWith<_ListScheduleRulesPayload> get copyWith => __$ListScheduleRulesPayloadCopyWithImpl<_ListScheduleRulesPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListScheduleRulesPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListScheduleRulesPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.courseId, courseId) || other.courseId == courseId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,courseId);

@override
String toString() {
  return 'ListScheduleRulesPayload(schoolId: $schoolId, courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class _$ListScheduleRulesPayloadCopyWith<$Res> implements $ListScheduleRulesPayloadCopyWith<$Res> {
  factory _$ListScheduleRulesPayloadCopyWith(_ListScheduleRulesPayload value, $Res Function(_ListScheduleRulesPayload) _then) = __$ListScheduleRulesPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String? courseId
});




}
/// @nodoc
class __$ListScheduleRulesPayloadCopyWithImpl<$Res>
    implements _$ListScheduleRulesPayloadCopyWith<$Res> {
  __$ListScheduleRulesPayloadCopyWithImpl(this._self, this._then);

  final _ListScheduleRulesPayload _self;
  final $Res Function(_ListScheduleRulesPayload) _then;

/// Create a copy of ListScheduleRulesPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? courseId = freezed,}) {
  return _then(_ListScheduleRulesPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GenerateSessionsPayload {

 String get schoolId; String get start; String get end;
/// Create a copy of GenerateSessionsPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateSessionsPayloadCopyWith<GenerateSessionsPayload> get copyWith => _$GenerateSessionsPayloadCopyWithImpl<GenerateSessionsPayload>(this as GenerateSessionsPayload, _$identity);

  /// Serializes this GenerateSessionsPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateSessionsPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,start,end);

@override
String toString() {
  return 'GenerateSessionsPayload(schoolId: $schoolId, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $GenerateSessionsPayloadCopyWith<$Res>  {
  factory $GenerateSessionsPayloadCopyWith(GenerateSessionsPayload value, $Res Function(GenerateSessionsPayload) _then) = _$GenerateSessionsPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String start, String end
});




}
/// @nodoc
class _$GenerateSessionsPayloadCopyWithImpl<$Res>
    implements $GenerateSessionsPayloadCopyWith<$Res> {
  _$GenerateSessionsPayloadCopyWithImpl(this._self, this._then);

  final GenerateSessionsPayload _self;
  final $Res Function(GenerateSessionsPayload) _then;

/// Create a copy of GenerateSessionsPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GenerateSessionsPayload].
extension GenerateSessionsPayloadPatterns on GenerateSessionsPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenerateSessionsPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenerateSessionsPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenerateSessionsPayload value)  $default,){
final _that = this;
switch (_that) {
case _GenerateSessionsPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenerateSessionsPayload value)?  $default,){
final _that = this;
switch (_that) {
case _GenerateSessionsPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String start,  String end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenerateSessionsPayload() when $default != null:
return $default(_that.schoolId,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String start,  String end)  $default,) {final _that = this;
switch (_that) {
case _GenerateSessionsPayload():
return $default(_that.schoolId,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String start,  String end)?  $default,) {final _that = this;
switch (_that) {
case _GenerateSessionsPayload() when $default != null:
return $default(_that.schoolId,_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _GenerateSessionsPayload implements GenerateSessionsPayload {
  const _GenerateSessionsPayload({required this.schoolId, required this.start, required this.end});
  factory _GenerateSessionsPayload.fromJson(Map<String, dynamic> json) => _$GenerateSessionsPayloadFromJson(json);

@override final  String schoolId;
@override final  String start;
@override final  String end;

/// Create a copy of GenerateSessionsPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateSessionsPayloadCopyWith<_GenerateSessionsPayload> get copyWith => __$GenerateSessionsPayloadCopyWithImpl<_GenerateSessionsPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateSessionsPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateSessionsPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,start,end);

@override
String toString() {
  return 'GenerateSessionsPayload(schoolId: $schoolId, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$GenerateSessionsPayloadCopyWith<$Res> implements $GenerateSessionsPayloadCopyWith<$Res> {
  factory _$GenerateSessionsPayloadCopyWith(_GenerateSessionsPayload value, $Res Function(_GenerateSessionsPayload) _then) = __$GenerateSessionsPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String start, String end
});




}
/// @nodoc
class __$GenerateSessionsPayloadCopyWithImpl<$Res>
    implements _$GenerateSessionsPayloadCopyWith<$Res> {
  __$GenerateSessionsPayloadCopyWithImpl(this._self, this._then);

  final _GenerateSessionsPayload _self;
  final $Res Function(_GenerateSessionsPayload) _then;

/// Create a copy of GenerateSessionsPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? start = null,Object? end = null,}) {
  return _then(_GenerateSessionsPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FetchClassroomsPayload {

 String get schoolId; int get page; int get size;
/// Create a copy of FetchClassroomsPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchClassroomsPayloadCopyWith<FetchClassroomsPayload> get copyWith => _$FetchClassroomsPayloadCopyWithImpl<FetchClassroomsPayload>(this as FetchClassroomsPayload, _$identity);

  /// Serializes this FetchClassroomsPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchClassroomsPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,page,size);

@override
String toString() {
  return 'FetchClassroomsPayload(schoolId: $schoolId, page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class $FetchClassroomsPayloadCopyWith<$Res>  {
  factory $FetchClassroomsPayloadCopyWith(FetchClassroomsPayload value, $Res Function(FetchClassroomsPayload) _then) = _$FetchClassroomsPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, int page, int size
});




}
/// @nodoc
class _$FetchClassroomsPayloadCopyWithImpl<$Res>
    implements $FetchClassroomsPayloadCopyWith<$Res> {
  _$FetchClassroomsPayloadCopyWithImpl(this._self, this._then);

  final FetchClassroomsPayload _self;
  final $Res Function(FetchClassroomsPayload) _then;

/// Create a copy of FetchClassroomsPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? page = null,Object? size = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FetchClassroomsPayload].
extension FetchClassroomsPayloadPatterns on FetchClassroomsPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FetchClassroomsPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchClassroomsPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FetchClassroomsPayload value)  $default,){
final _that = this;
switch (_that) {
case _FetchClassroomsPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FetchClassroomsPayload value)?  $default,){
final _that = this;
switch (_that) {
case _FetchClassroomsPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  int page,  int size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchClassroomsPayload() when $default != null:
return $default(_that.schoolId,_that.page,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  int page,  int size)  $default,) {final _that = this;
switch (_that) {
case _FetchClassroomsPayload():
return $default(_that.schoolId,_that.page,_that.size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  int page,  int size)?  $default,) {final _that = this;
switch (_that) {
case _FetchClassroomsPayload() when $default != null:
return $default(_that.schoolId,_that.page,_that.size);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _FetchClassroomsPayload implements FetchClassroomsPayload {
  const _FetchClassroomsPayload({required this.schoolId, this.page = 1, this.size = 20});
  factory _FetchClassroomsPayload.fromJson(Map<String, dynamic> json) => _$FetchClassroomsPayloadFromJson(json);

@override final  String schoolId;
@override@JsonKey() final  int page;
@override@JsonKey() final  int size;

/// Create a copy of FetchClassroomsPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchClassroomsPayloadCopyWith<_FetchClassroomsPayload> get copyWith => __$FetchClassroomsPayloadCopyWithImpl<_FetchClassroomsPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FetchClassroomsPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchClassroomsPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,page,size);

@override
String toString() {
  return 'FetchClassroomsPayload(schoolId: $schoolId, page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class _$FetchClassroomsPayloadCopyWith<$Res> implements $FetchClassroomsPayloadCopyWith<$Res> {
  factory _$FetchClassroomsPayloadCopyWith(_FetchClassroomsPayload value, $Res Function(_FetchClassroomsPayload) _then) = __$FetchClassroomsPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, int page, int size
});




}
/// @nodoc
class __$FetchClassroomsPayloadCopyWithImpl<$Res>
    implements _$FetchClassroomsPayloadCopyWith<$Res> {
  __$FetchClassroomsPayloadCopyWithImpl(this._self, this._then);

  final _FetchClassroomsPayload _self;
  final $Res Function(_FetchClassroomsPayload) _then;

/// Create a copy of FetchClassroomsPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? page = null,Object? size = null,}) {
  return _then(_FetchClassroomsPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CreateClassroomPayload {

 String get schoolId; String get location;
/// Create a copy of CreateClassroomPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateClassroomPayloadCopyWith<CreateClassroomPayload> get copyWith => _$CreateClassroomPayloadCopyWithImpl<CreateClassroomPayload>(this as CreateClassroomPayload, _$identity);

  /// Serializes this CreateClassroomPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateClassroomPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,location);

@override
String toString() {
  return 'CreateClassroomPayload(schoolId: $schoolId, location: $location)';
}


}

/// @nodoc
abstract mixin class $CreateClassroomPayloadCopyWith<$Res>  {
  factory $CreateClassroomPayloadCopyWith(CreateClassroomPayload value, $Res Function(CreateClassroomPayload) _then) = _$CreateClassroomPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String location
});




}
/// @nodoc
class _$CreateClassroomPayloadCopyWithImpl<$Res>
    implements $CreateClassroomPayloadCopyWith<$Res> {
  _$CreateClassroomPayloadCopyWithImpl(this._self, this._then);

  final CreateClassroomPayload _self;
  final $Res Function(CreateClassroomPayload) _then;

/// Create a copy of CreateClassroomPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? location = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateClassroomPayload].
extension CreateClassroomPayloadPatterns on CreateClassroomPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateClassroomPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateClassroomPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateClassroomPayload value)  $default,){
final _that = this;
switch (_that) {
case _CreateClassroomPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateClassroomPayload value)?  $default,){
final _that = this;
switch (_that) {
case _CreateClassroomPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateClassroomPayload() when $default != null:
return $default(_that.schoolId,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String location)  $default,) {final _that = this;
switch (_that) {
case _CreateClassroomPayload():
return $default(_that.schoolId,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String location)?  $default,) {final _that = this;
switch (_that) {
case _CreateClassroomPayload() when $default != null:
return $default(_that.schoolId,_that.location);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _CreateClassroomPayload implements CreateClassroomPayload {
  const _CreateClassroomPayload({required this.schoolId, required this.location});
  factory _CreateClassroomPayload.fromJson(Map<String, dynamic> json) => _$CreateClassroomPayloadFromJson(json);

@override final  String schoolId;
@override final  String location;

/// Create a copy of CreateClassroomPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateClassroomPayloadCopyWith<_CreateClassroomPayload> get copyWith => __$CreateClassroomPayloadCopyWithImpl<_CreateClassroomPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateClassroomPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateClassroomPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,location);

@override
String toString() {
  return 'CreateClassroomPayload(schoolId: $schoolId, location: $location)';
}


}

/// @nodoc
abstract mixin class _$CreateClassroomPayloadCopyWith<$Res> implements $CreateClassroomPayloadCopyWith<$Res> {
  factory _$CreateClassroomPayloadCopyWith(_CreateClassroomPayload value, $Res Function(_CreateClassroomPayload) _then) = __$CreateClassroomPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String location
});




}
/// @nodoc
class __$CreateClassroomPayloadCopyWithImpl<$Res>
    implements _$CreateClassroomPayloadCopyWith<$Res> {
  __$CreateClassroomPayloadCopyWithImpl(this._self, this._then);

  final _CreateClassroomPayload _self;
  final $Res Function(_CreateClassroomPayload) _then;

/// Create a copy of CreateClassroomPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? location = null,}) {
  return _then(_CreateClassroomPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UpdateClassroomPayload {

 String get location;
/// Create a copy of UpdateClassroomPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateClassroomPayloadCopyWith<UpdateClassroomPayload> get copyWith => _$UpdateClassroomPayloadCopyWithImpl<UpdateClassroomPayload>(this as UpdateClassroomPayload, _$identity);

  /// Serializes this UpdateClassroomPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateClassroomPayload&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,location);

@override
String toString() {
  return 'UpdateClassroomPayload(location: $location)';
}


}

/// @nodoc
abstract mixin class $UpdateClassroomPayloadCopyWith<$Res>  {
  factory $UpdateClassroomPayloadCopyWith(UpdateClassroomPayload value, $Res Function(UpdateClassroomPayload) _then) = _$UpdateClassroomPayloadCopyWithImpl;
@useResult
$Res call({
 String location
});




}
/// @nodoc
class _$UpdateClassroomPayloadCopyWithImpl<$Res>
    implements $UpdateClassroomPayloadCopyWith<$Res> {
  _$UpdateClassroomPayloadCopyWithImpl(this._self, this._then);

  final UpdateClassroomPayload _self;
  final $Res Function(UpdateClassroomPayload) _then;

/// Create a copy of UpdateClassroomPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? location = null,}) {
  return _then(_self.copyWith(
location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateClassroomPayload].
extension UpdateClassroomPayloadPatterns on UpdateClassroomPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateClassroomPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateClassroomPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateClassroomPayload value)  $default,){
final _that = this;
switch (_that) {
case _UpdateClassroomPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateClassroomPayload value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateClassroomPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateClassroomPayload() when $default != null:
return $default(_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String location)  $default,) {final _that = this;
switch (_that) {
case _UpdateClassroomPayload():
return $default(_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String location)?  $default,) {final _that = this;
switch (_that) {
case _UpdateClassroomPayload() when $default != null:
return $default(_that.location);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _UpdateClassroomPayload implements UpdateClassroomPayload {
  const _UpdateClassroomPayload({required this.location});
  factory _UpdateClassroomPayload.fromJson(Map<String, dynamic> json) => _$UpdateClassroomPayloadFromJson(json);

@override final  String location;

/// Create a copy of UpdateClassroomPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateClassroomPayloadCopyWith<_UpdateClassroomPayload> get copyWith => __$UpdateClassroomPayloadCopyWithImpl<_UpdateClassroomPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateClassroomPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateClassroomPayload&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,location);

@override
String toString() {
  return 'UpdateClassroomPayload(location: $location)';
}


}

/// @nodoc
abstract mixin class _$UpdateClassroomPayloadCopyWith<$Res> implements $UpdateClassroomPayloadCopyWith<$Res> {
  factory _$UpdateClassroomPayloadCopyWith(_UpdateClassroomPayload value, $Res Function(_UpdateClassroomPayload) _then) = __$UpdateClassroomPayloadCopyWithImpl;
@override @useResult
$Res call({
 String location
});




}
/// @nodoc
class __$UpdateClassroomPayloadCopyWithImpl<$Res>
    implements _$UpdateClassroomPayloadCopyWith<$Res> {
  __$UpdateClassroomPayloadCopyWithImpl(this._self, this._then);

  final _UpdateClassroomPayload _self;
  final $Res Function(_UpdateClassroomPayload) _then;

/// Create a copy of UpdateClassroomPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? location = null,}) {
  return _then(_UpdateClassroomPayload(
location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AnalyzeBatchOperationPayload {

 String get schoolId; String get instruction;
/// Create a copy of AnalyzeBatchOperationPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyzeBatchOperationPayloadCopyWith<AnalyzeBatchOperationPayload> get copyWith => _$AnalyzeBatchOperationPayloadCopyWithImpl<AnalyzeBatchOperationPayload>(this as AnalyzeBatchOperationPayload, _$identity);

  /// Serializes this AnalyzeBatchOperationPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyzeBatchOperationPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.instruction, instruction) || other.instruction == instruction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,instruction);

@override
String toString() {
  return 'AnalyzeBatchOperationPayload(schoolId: $schoolId, instruction: $instruction)';
}


}

/// @nodoc
abstract mixin class $AnalyzeBatchOperationPayloadCopyWith<$Res>  {
  factory $AnalyzeBatchOperationPayloadCopyWith(AnalyzeBatchOperationPayload value, $Res Function(AnalyzeBatchOperationPayload) _then) = _$AnalyzeBatchOperationPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, String instruction
});




}
/// @nodoc
class _$AnalyzeBatchOperationPayloadCopyWithImpl<$Res>
    implements $AnalyzeBatchOperationPayloadCopyWith<$Res> {
  _$AnalyzeBatchOperationPayloadCopyWithImpl(this._self, this._then);

  final AnalyzeBatchOperationPayload _self;
  final $Res Function(AnalyzeBatchOperationPayload) _then;

/// Create a copy of AnalyzeBatchOperationPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? instruction = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyzeBatchOperationPayload].
extension AnalyzeBatchOperationPayloadPatterns on AnalyzeBatchOperationPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyzeBatchOperationPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyzeBatchOperationPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyzeBatchOperationPayload value)  $default,){
final _that = this;
switch (_that) {
case _AnalyzeBatchOperationPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyzeBatchOperationPayload value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyzeBatchOperationPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  String instruction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyzeBatchOperationPayload() when $default != null:
return $default(_that.schoolId,_that.instruction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  String instruction)  $default,) {final _that = this;
switch (_that) {
case _AnalyzeBatchOperationPayload():
return $default(_that.schoolId,_that.instruction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  String instruction)?  $default,) {final _that = this;
switch (_that) {
case _AnalyzeBatchOperationPayload() when $default != null:
return $default(_that.schoolId,_that.instruction);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _AnalyzeBatchOperationPayload implements AnalyzeBatchOperationPayload {
  const _AnalyzeBatchOperationPayload({required this.schoolId, required this.instruction});
  factory _AnalyzeBatchOperationPayload.fromJson(Map<String, dynamic> json) => _$AnalyzeBatchOperationPayloadFromJson(json);

@override final  String schoolId;
@override final  String instruction;

/// Create a copy of AnalyzeBatchOperationPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyzeBatchOperationPayloadCopyWith<_AnalyzeBatchOperationPayload> get copyWith => __$AnalyzeBatchOperationPayloadCopyWithImpl<_AnalyzeBatchOperationPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalyzeBatchOperationPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyzeBatchOperationPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.instruction, instruction) || other.instruction == instruction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,instruction);

@override
String toString() {
  return 'AnalyzeBatchOperationPayload(schoolId: $schoolId, instruction: $instruction)';
}


}

/// @nodoc
abstract mixin class _$AnalyzeBatchOperationPayloadCopyWith<$Res> implements $AnalyzeBatchOperationPayloadCopyWith<$Res> {
  factory _$AnalyzeBatchOperationPayloadCopyWith(_AnalyzeBatchOperationPayload value, $Res Function(_AnalyzeBatchOperationPayload) _then) = __$AnalyzeBatchOperationPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, String instruction
});




}
/// @nodoc
class __$AnalyzeBatchOperationPayloadCopyWithImpl<$Res>
    implements _$AnalyzeBatchOperationPayloadCopyWith<$Res> {
  __$AnalyzeBatchOperationPayloadCopyWithImpl(this._self, this._then);

  final _AnalyzeBatchOperationPayload _self;
  final $Res Function(_AnalyzeBatchOperationPayload) _then;

/// Create a copy of AnalyzeBatchOperationPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? instruction = null,}) {
  return _then(_AnalyzeBatchOperationPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AnalyzeBatchOperationResult {

 String get analysis; List<AIOperation> get operations;
/// Create a copy of AnalyzeBatchOperationResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyzeBatchOperationResultCopyWith<AnalyzeBatchOperationResult> get copyWith => _$AnalyzeBatchOperationResultCopyWithImpl<AnalyzeBatchOperationResult>(this as AnalyzeBatchOperationResult, _$identity);

  /// Serializes this AnalyzeBatchOperationResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyzeBatchOperationResult&&(identical(other.analysis, analysis) || other.analysis == analysis)&&const DeepCollectionEquality().equals(other.operations, operations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,analysis,const DeepCollectionEquality().hash(operations));

@override
String toString() {
  return 'AnalyzeBatchOperationResult(analysis: $analysis, operations: $operations)';
}


}

/// @nodoc
abstract mixin class $AnalyzeBatchOperationResultCopyWith<$Res>  {
  factory $AnalyzeBatchOperationResultCopyWith(AnalyzeBatchOperationResult value, $Res Function(AnalyzeBatchOperationResult) _then) = _$AnalyzeBatchOperationResultCopyWithImpl;
@useResult
$Res call({
 String analysis, List<AIOperation> operations
});




}
/// @nodoc
class _$AnalyzeBatchOperationResultCopyWithImpl<$Res>
    implements $AnalyzeBatchOperationResultCopyWith<$Res> {
  _$AnalyzeBatchOperationResultCopyWithImpl(this._self, this._then);

  final AnalyzeBatchOperationResult _self;
  final $Res Function(AnalyzeBatchOperationResult) _then;

/// Create a copy of AnalyzeBatchOperationResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? analysis = null,Object? operations = null,}) {
  return _then(_self.copyWith(
analysis: null == analysis ? _self.analysis : analysis // ignore: cast_nullable_to_non_nullable
as String,operations: null == operations ? _self.operations : operations // ignore: cast_nullable_to_non_nullable
as List<AIOperation>,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyzeBatchOperationResult].
extension AnalyzeBatchOperationResultPatterns on AnalyzeBatchOperationResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyzeBatchOperationResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyzeBatchOperationResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyzeBatchOperationResult value)  $default,){
final _that = this;
switch (_that) {
case _AnalyzeBatchOperationResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyzeBatchOperationResult value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyzeBatchOperationResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String analysis,  List<AIOperation> operations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyzeBatchOperationResult() when $default != null:
return $default(_that.analysis,_that.operations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String analysis,  List<AIOperation> operations)  $default,) {final _that = this;
switch (_that) {
case _AnalyzeBatchOperationResult():
return $default(_that.analysis,_that.operations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String analysis,  List<AIOperation> operations)?  $default,) {final _that = this;
switch (_that) {
case _AnalyzeBatchOperationResult() when $default != null:
return $default(_that.analysis,_that.operations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnalyzeBatchOperationResult implements AnalyzeBatchOperationResult {
  const _AnalyzeBatchOperationResult({this.analysis = '', final  List<AIOperation> operations = const <AIOperation>[]}): _operations = operations;
  factory _AnalyzeBatchOperationResult.fromJson(Map<String, dynamic> json) => _$AnalyzeBatchOperationResultFromJson(json);

@override@JsonKey() final  String analysis;
 final  List<AIOperation> _operations;
@override@JsonKey() List<AIOperation> get operations {
  if (_operations is EqualUnmodifiableListView) return _operations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_operations);
}


/// Create a copy of AnalyzeBatchOperationResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyzeBatchOperationResultCopyWith<_AnalyzeBatchOperationResult> get copyWith => __$AnalyzeBatchOperationResultCopyWithImpl<_AnalyzeBatchOperationResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalyzeBatchOperationResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyzeBatchOperationResult&&(identical(other.analysis, analysis) || other.analysis == analysis)&&const DeepCollectionEquality().equals(other._operations, _operations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,analysis,const DeepCollectionEquality().hash(_operations));

@override
String toString() {
  return 'AnalyzeBatchOperationResult(analysis: $analysis, operations: $operations)';
}


}

/// @nodoc
abstract mixin class _$AnalyzeBatchOperationResultCopyWith<$Res> implements $AnalyzeBatchOperationResultCopyWith<$Res> {
  factory _$AnalyzeBatchOperationResultCopyWith(_AnalyzeBatchOperationResult value, $Res Function(_AnalyzeBatchOperationResult) _then) = __$AnalyzeBatchOperationResultCopyWithImpl;
@override @useResult
$Res call({
 String analysis, List<AIOperation> operations
});




}
/// @nodoc
class __$AnalyzeBatchOperationResultCopyWithImpl<$Res>
    implements _$AnalyzeBatchOperationResultCopyWith<$Res> {
  __$AnalyzeBatchOperationResultCopyWithImpl(this._self, this._then);

  final _AnalyzeBatchOperationResult _self;
  final $Res Function(_AnalyzeBatchOperationResult) _then;

/// Create a copy of AnalyzeBatchOperationResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? analysis = null,Object? operations = null,}) {
  return _then(_AnalyzeBatchOperationResult(
analysis: null == analysis ? _self.analysis : analysis // ignore: cast_nullable_to_non_nullable
as String,operations: null == operations ? _self._operations : operations // ignore: cast_nullable_to_non_nullable
as List<AIOperation>,
  ));
}


}


/// @nodoc
mixin _$ExecuteBatchOperationsPayload {

 String get schoolId; List<AIOperation> get operations;
/// Create a copy of ExecuteBatchOperationsPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecuteBatchOperationsPayloadCopyWith<ExecuteBatchOperationsPayload> get copyWith => _$ExecuteBatchOperationsPayloadCopyWithImpl<ExecuteBatchOperationsPayload>(this as ExecuteBatchOperationsPayload, _$identity);

  /// Serializes this ExecuteBatchOperationsPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecuteBatchOperationsPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&const DeepCollectionEquality().equals(other.operations, operations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,const DeepCollectionEquality().hash(operations));

@override
String toString() {
  return 'ExecuteBatchOperationsPayload(schoolId: $schoolId, operations: $operations)';
}


}

/// @nodoc
abstract mixin class $ExecuteBatchOperationsPayloadCopyWith<$Res>  {
  factory $ExecuteBatchOperationsPayloadCopyWith(ExecuteBatchOperationsPayload value, $Res Function(ExecuteBatchOperationsPayload) _then) = _$ExecuteBatchOperationsPayloadCopyWithImpl;
@useResult
$Res call({
 String schoolId, List<AIOperation> operations
});




}
/// @nodoc
class _$ExecuteBatchOperationsPayloadCopyWithImpl<$Res>
    implements $ExecuteBatchOperationsPayloadCopyWith<$Res> {
  _$ExecuteBatchOperationsPayloadCopyWithImpl(this._self, this._then);

  final ExecuteBatchOperationsPayload _self;
  final $Res Function(ExecuteBatchOperationsPayload) _then;

/// Create a copy of ExecuteBatchOperationsPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolId = null,Object? operations = null,}) {
  return _then(_self.copyWith(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,operations: null == operations ? _self.operations : operations // ignore: cast_nullable_to_non_nullable
as List<AIOperation>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExecuteBatchOperationsPayload].
extension ExecuteBatchOperationsPayloadPatterns on ExecuteBatchOperationsPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExecuteBatchOperationsPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExecuteBatchOperationsPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExecuteBatchOperationsPayload value)  $default,){
final _that = this;
switch (_that) {
case _ExecuteBatchOperationsPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExecuteBatchOperationsPayload value)?  $default,){
final _that = this;
switch (_that) {
case _ExecuteBatchOperationsPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schoolId,  List<AIOperation> operations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExecuteBatchOperationsPayload() when $default != null:
return $default(_that.schoolId,_that.operations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schoolId,  List<AIOperation> operations)  $default,) {final _that = this;
switch (_that) {
case _ExecuteBatchOperationsPayload():
return $default(_that.schoolId,_that.operations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schoolId,  List<AIOperation> operations)?  $default,) {final _that = this;
switch (_that) {
case _ExecuteBatchOperationsPayload() when $default != null:
return $default(_that.schoolId,_that.operations);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _ExecuteBatchOperationsPayload implements ExecuteBatchOperationsPayload {
  const _ExecuteBatchOperationsPayload({required this.schoolId, required final  List<AIOperation> operations}): _operations = operations;
  factory _ExecuteBatchOperationsPayload.fromJson(Map<String, dynamic> json) => _$ExecuteBatchOperationsPayloadFromJson(json);

@override final  String schoolId;
 final  List<AIOperation> _operations;
@override List<AIOperation> get operations {
  if (_operations is EqualUnmodifiableListView) return _operations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_operations);
}


/// Create a copy of ExecuteBatchOperationsPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExecuteBatchOperationsPayloadCopyWith<_ExecuteBatchOperationsPayload> get copyWith => __$ExecuteBatchOperationsPayloadCopyWithImpl<_ExecuteBatchOperationsPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExecuteBatchOperationsPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExecuteBatchOperationsPayload&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&const DeepCollectionEquality().equals(other._operations, _operations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolId,const DeepCollectionEquality().hash(_operations));

@override
String toString() {
  return 'ExecuteBatchOperationsPayload(schoolId: $schoolId, operations: $operations)';
}


}

/// @nodoc
abstract mixin class _$ExecuteBatchOperationsPayloadCopyWith<$Res> implements $ExecuteBatchOperationsPayloadCopyWith<$Res> {
  factory _$ExecuteBatchOperationsPayloadCopyWith(_ExecuteBatchOperationsPayload value, $Res Function(_ExecuteBatchOperationsPayload) _then) = __$ExecuteBatchOperationsPayloadCopyWithImpl;
@override @useResult
$Res call({
 String schoolId, List<AIOperation> operations
});




}
/// @nodoc
class __$ExecuteBatchOperationsPayloadCopyWithImpl<$Res>
    implements _$ExecuteBatchOperationsPayloadCopyWith<$Res> {
  __$ExecuteBatchOperationsPayloadCopyWithImpl(this._self, this._then);

  final _ExecuteBatchOperationsPayload _self;
  final $Res Function(_ExecuteBatchOperationsPayload) _then;

/// Create a copy of ExecuteBatchOperationsPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolId = null,Object? operations = null,}) {
  return _then(_ExecuteBatchOperationsPayload(
schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,operations: null == operations ? _self._operations : operations // ignore: cast_nullable_to_non_nullable
as List<AIOperation>,
  ));
}


}


/// @nodoc
mixin _$ExecuteBatchOperationsResult {

 List<String> get results;
/// Create a copy of ExecuteBatchOperationsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecuteBatchOperationsResultCopyWith<ExecuteBatchOperationsResult> get copyWith => _$ExecuteBatchOperationsResultCopyWithImpl<ExecuteBatchOperationsResult>(this as ExecuteBatchOperationsResult, _$identity);

  /// Serializes this ExecuteBatchOperationsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecuteBatchOperationsResult&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'ExecuteBatchOperationsResult(results: $results)';
}


}

/// @nodoc
abstract mixin class $ExecuteBatchOperationsResultCopyWith<$Res>  {
  factory $ExecuteBatchOperationsResultCopyWith(ExecuteBatchOperationsResult value, $Res Function(ExecuteBatchOperationsResult) _then) = _$ExecuteBatchOperationsResultCopyWithImpl;
@useResult
$Res call({
 List<String> results
});




}
/// @nodoc
class _$ExecuteBatchOperationsResultCopyWithImpl<$Res>
    implements $ExecuteBatchOperationsResultCopyWith<$Res> {
  _$ExecuteBatchOperationsResultCopyWithImpl(this._self, this._then);

  final ExecuteBatchOperationsResult _self;
  final $Res Function(ExecuteBatchOperationsResult) _then;

/// Create a copy of ExecuteBatchOperationsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,}) {
  return _then(_self.copyWith(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExecuteBatchOperationsResult].
extension ExecuteBatchOperationsResultPatterns on ExecuteBatchOperationsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExecuteBatchOperationsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExecuteBatchOperationsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExecuteBatchOperationsResult value)  $default,){
final _that = this;
switch (_that) {
case _ExecuteBatchOperationsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExecuteBatchOperationsResult value)?  $default,){
final _that = this;
switch (_that) {
case _ExecuteBatchOperationsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExecuteBatchOperationsResult() when $default != null:
return $default(_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> results)  $default,) {final _that = this;
switch (_that) {
case _ExecuteBatchOperationsResult():
return $default(_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> results)?  $default,) {final _that = this;
switch (_that) {
case _ExecuteBatchOperationsResult() when $default != null:
return $default(_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExecuteBatchOperationsResult implements ExecuteBatchOperationsResult {
  const _ExecuteBatchOperationsResult({final  List<String> results = const <String>[]}): _results = results;
  factory _ExecuteBatchOperationsResult.fromJson(Map<String, dynamic> json) => _$ExecuteBatchOperationsResultFromJson(json);

 final  List<String> _results;
@override@JsonKey() List<String> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of ExecuteBatchOperationsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExecuteBatchOperationsResultCopyWith<_ExecuteBatchOperationsResult> get copyWith => __$ExecuteBatchOperationsResultCopyWithImpl<_ExecuteBatchOperationsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExecuteBatchOperationsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExecuteBatchOperationsResult&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'ExecuteBatchOperationsResult(results: $results)';
}


}

/// @nodoc
abstract mixin class _$ExecuteBatchOperationsResultCopyWith<$Res> implements $ExecuteBatchOperationsResultCopyWith<$Res> {
  factory _$ExecuteBatchOperationsResultCopyWith(_ExecuteBatchOperationsResult value, $Res Function(_ExecuteBatchOperationsResult) _then) = __$ExecuteBatchOperationsResultCopyWithImpl;
@override @useResult
$Res call({
 List<String> results
});




}
/// @nodoc
class __$ExecuteBatchOperationsResultCopyWithImpl<$Res>
    implements _$ExecuteBatchOperationsResultCopyWith<$Res> {
  __$ExecuteBatchOperationsResultCopyWithImpl(this._self, this._then);

  final _ExecuteBatchOperationsResult _self;
  final $Res Function(_ExecuteBatchOperationsResult) _then;

/// Create a copy of ExecuteBatchOperationsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(_ExecuteBatchOperationsResult(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
