// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sample_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdminSystemSwitch implements DiagnosticableTreeMixin {

 String get id; String get title; String get description; bool get enabled; String get lastUpdatedLabel; String get responsible; IconData get icon; List<String> get tags; String get environment;
/// Create a copy of AdminSystemSwitch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminSystemSwitchCopyWith<AdminSystemSwitch> get copyWith => _$AdminSystemSwitchCopyWithImpl<AdminSystemSwitch>(this as AdminSystemSwitch, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AdminSystemSwitch'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('enabled', enabled))..add(DiagnosticsProperty('lastUpdatedLabel', lastUpdatedLabel))..add(DiagnosticsProperty('responsible', responsible))..add(DiagnosticsProperty('icon', icon))..add(DiagnosticsProperty('tags', tags))..add(DiagnosticsProperty('environment', environment));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminSystemSwitch&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.lastUpdatedLabel, lastUpdatedLabel) || other.lastUpdatedLabel == lastUpdatedLabel)&&(identical(other.responsible, responsible) || other.responsible == responsible)&&(identical(other.icon, icon) || other.icon == icon)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.environment, environment) || other.environment == environment));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,enabled,lastUpdatedLabel,responsible,icon,const DeepCollectionEquality().hash(tags),environment);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AdminSystemSwitch(id: $id, title: $title, description: $description, enabled: $enabled, lastUpdatedLabel: $lastUpdatedLabel, responsible: $responsible, icon: $icon, tags: $tags, environment: $environment)';
}


}

/// @nodoc
abstract mixin class $AdminSystemSwitchCopyWith<$Res>  {
  factory $AdminSystemSwitchCopyWith(AdminSystemSwitch value, $Res Function(AdminSystemSwitch) _then) = _$AdminSystemSwitchCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, bool enabled, String lastUpdatedLabel, String responsible, IconData icon, List<String> tags, String environment
});




}
/// @nodoc
class _$AdminSystemSwitchCopyWithImpl<$Res>
    implements $AdminSystemSwitchCopyWith<$Res> {
  _$AdminSystemSwitchCopyWithImpl(this._self, this._then);

  final AdminSystemSwitch _self;
  final $Res Function(AdminSystemSwitch) _then;

/// Create a copy of AdminSystemSwitch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? enabled = null,Object? lastUpdatedLabel = null,Object? responsible = null,Object? icon = null,Object? tags = null,Object? environment = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,lastUpdatedLabel: null == lastUpdatedLabel ? _self.lastUpdatedLabel : lastUpdatedLabel // ignore: cast_nullable_to_non_nullable
as String,responsible: null == responsible ? _self.responsible : responsible // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminSystemSwitch].
extension AdminSystemSwitchPatterns on AdminSystemSwitch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminSystemSwitch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminSystemSwitch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminSystemSwitch value)  $default,){
final _that = this;
switch (_that) {
case _AdminSystemSwitch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminSystemSwitch value)?  $default,){
final _that = this;
switch (_that) {
case _AdminSystemSwitch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  bool enabled,  String lastUpdatedLabel,  String responsible,  IconData icon,  List<String> tags,  String environment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminSystemSwitch() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.enabled,_that.lastUpdatedLabel,_that.responsible,_that.icon,_that.tags,_that.environment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  bool enabled,  String lastUpdatedLabel,  String responsible,  IconData icon,  List<String> tags,  String environment)  $default,) {final _that = this;
switch (_that) {
case _AdminSystemSwitch():
return $default(_that.id,_that.title,_that.description,_that.enabled,_that.lastUpdatedLabel,_that.responsible,_that.icon,_that.tags,_that.environment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  bool enabled,  String lastUpdatedLabel,  String responsible,  IconData icon,  List<String> tags,  String environment)?  $default,) {final _that = this;
switch (_that) {
case _AdminSystemSwitch() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.enabled,_that.lastUpdatedLabel,_that.responsible,_that.icon,_that.tags,_that.environment);case _:
  return null;

}
}

}

/// @nodoc


class _AdminSystemSwitch extends AdminSystemSwitch with DiagnosticableTreeMixin {
  const _AdminSystemSwitch({required this.id, required this.title, required this.description, required this.enabled, required this.lastUpdatedLabel, required this.responsible, required this.icon, final  List<String> tags = const [], this.environment = '生产环境'}): _tags = tags,super._();
  

@override final  String id;
@override final  String title;
@override final  String description;
@override final  bool enabled;
@override final  String lastUpdatedLabel;
@override final  String responsible;
@override final  IconData icon;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  String environment;

/// Create a copy of AdminSystemSwitch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminSystemSwitchCopyWith<_AdminSystemSwitch> get copyWith => __$AdminSystemSwitchCopyWithImpl<_AdminSystemSwitch>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AdminSystemSwitch'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('enabled', enabled))..add(DiagnosticsProperty('lastUpdatedLabel', lastUpdatedLabel))..add(DiagnosticsProperty('responsible', responsible))..add(DiagnosticsProperty('icon', icon))..add(DiagnosticsProperty('tags', tags))..add(DiagnosticsProperty('environment', environment));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminSystemSwitch&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.lastUpdatedLabel, lastUpdatedLabel) || other.lastUpdatedLabel == lastUpdatedLabel)&&(identical(other.responsible, responsible) || other.responsible == responsible)&&(identical(other.icon, icon) || other.icon == icon)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.environment, environment) || other.environment == environment));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,enabled,lastUpdatedLabel,responsible,icon,const DeepCollectionEquality().hash(_tags),environment);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AdminSystemSwitch(id: $id, title: $title, description: $description, enabled: $enabled, lastUpdatedLabel: $lastUpdatedLabel, responsible: $responsible, icon: $icon, tags: $tags, environment: $environment)';
}


}

/// @nodoc
abstract mixin class _$AdminSystemSwitchCopyWith<$Res> implements $AdminSystemSwitchCopyWith<$Res> {
  factory _$AdminSystemSwitchCopyWith(_AdminSystemSwitch value, $Res Function(_AdminSystemSwitch) _then) = __$AdminSystemSwitchCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, bool enabled, String lastUpdatedLabel, String responsible, IconData icon, List<String> tags, String environment
});




}
/// @nodoc
class __$AdminSystemSwitchCopyWithImpl<$Res>
    implements _$AdminSystemSwitchCopyWith<$Res> {
  __$AdminSystemSwitchCopyWithImpl(this._self, this._then);

  final _AdminSystemSwitch _self;
  final $Res Function(_AdminSystemSwitch) _then;

/// Create a copy of AdminSystemSwitch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? enabled = null,Object? lastUpdatedLabel = null,Object? responsible = null,Object? icon = null,Object? tags = null,Object? environment = null,}) {
  return _then(_AdminSystemSwitch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,lastUpdatedLabel: null == lastUpdatedLabel ? _self.lastUpdatedLabel : lastUpdatedLabel // ignore: cast_nullable_to_non_nullable
as String,responsible: null == responsible ? _self.responsible : responsible // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AdminSystemParameter implements DiagnosticableTreeMixin {

 String get id; String get key; String get value; String get scope; String get description; String get lastUpdatedLabel; bool get locked;
/// Create a copy of AdminSystemParameter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminSystemParameterCopyWith<AdminSystemParameter> get copyWith => _$AdminSystemParameterCopyWithImpl<AdminSystemParameter>(this as AdminSystemParameter, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AdminSystemParameter'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('key', key))..add(DiagnosticsProperty('value', value))..add(DiagnosticsProperty('scope', scope))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('lastUpdatedLabel', lastUpdatedLabel))..add(DiagnosticsProperty('locked', locked));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminSystemParameter&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.description, description) || other.description == description)&&(identical(other.lastUpdatedLabel, lastUpdatedLabel) || other.lastUpdatedLabel == lastUpdatedLabel)&&(identical(other.locked, locked) || other.locked == locked));
}


@override
int get hashCode => Object.hash(runtimeType,id,key,value,scope,description,lastUpdatedLabel,locked);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AdminSystemParameter(id: $id, key: $key, value: $value, scope: $scope, description: $description, lastUpdatedLabel: $lastUpdatedLabel, locked: $locked)';
}


}

/// @nodoc
abstract mixin class $AdminSystemParameterCopyWith<$Res>  {
  factory $AdminSystemParameterCopyWith(AdminSystemParameter value, $Res Function(AdminSystemParameter) _then) = _$AdminSystemParameterCopyWithImpl;
@useResult
$Res call({
 String id, String key, String value, String scope, String description, String lastUpdatedLabel, bool locked
});




}
/// @nodoc
class _$AdminSystemParameterCopyWithImpl<$Res>
    implements $AdminSystemParameterCopyWith<$Res> {
  _$AdminSystemParameterCopyWithImpl(this._self, this._then);

  final AdminSystemParameter _self;
  final $Res Function(AdminSystemParameter) _then;

/// Create a copy of AdminSystemParameter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? key = null,Object? value = null,Object? scope = null,Object? description = null,Object? lastUpdatedLabel = null,Object? locked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,lastUpdatedLabel: null == lastUpdatedLabel ? _self.lastUpdatedLabel : lastUpdatedLabel // ignore: cast_nullable_to_non_nullable
as String,locked: null == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminSystemParameter].
extension AdminSystemParameterPatterns on AdminSystemParameter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminSystemParameter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminSystemParameter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminSystemParameter value)  $default,){
final _that = this;
switch (_that) {
case _AdminSystemParameter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminSystemParameter value)?  $default,){
final _that = this;
switch (_that) {
case _AdminSystemParameter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String key,  String value,  String scope,  String description,  String lastUpdatedLabel,  bool locked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminSystemParameter() when $default != null:
return $default(_that.id,_that.key,_that.value,_that.scope,_that.description,_that.lastUpdatedLabel,_that.locked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String key,  String value,  String scope,  String description,  String lastUpdatedLabel,  bool locked)  $default,) {final _that = this;
switch (_that) {
case _AdminSystemParameter():
return $default(_that.id,_that.key,_that.value,_that.scope,_that.description,_that.lastUpdatedLabel,_that.locked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String key,  String value,  String scope,  String description,  String lastUpdatedLabel,  bool locked)?  $default,) {final _that = this;
switch (_that) {
case _AdminSystemParameter() when $default != null:
return $default(_that.id,_that.key,_that.value,_that.scope,_that.description,_that.lastUpdatedLabel,_that.locked);case _:
  return null;

}
}

}

/// @nodoc


class _AdminSystemParameter extends AdminSystemParameter with DiagnosticableTreeMixin {
  const _AdminSystemParameter({required this.id, required this.key, required this.value, required this.scope, required this.description, required this.lastUpdatedLabel, this.locked = false}): super._();
  

@override final  String id;
@override final  String key;
@override final  String value;
@override final  String scope;
@override final  String description;
@override final  String lastUpdatedLabel;
@override@JsonKey() final  bool locked;

/// Create a copy of AdminSystemParameter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminSystemParameterCopyWith<_AdminSystemParameter> get copyWith => __$AdminSystemParameterCopyWithImpl<_AdminSystemParameter>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AdminSystemParameter'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('key', key))..add(DiagnosticsProperty('value', value))..add(DiagnosticsProperty('scope', scope))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('lastUpdatedLabel', lastUpdatedLabel))..add(DiagnosticsProperty('locked', locked));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminSystemParameter&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.description, description) || other.description == description)&&(identical(other.lastUpdatedLabel, lastUpdatedLabel) || other.lastUpdatedLabel == lastUpdatedLabel)&&(identical(other.locked, locked) || other.locked == locked));
}


@override
int get hashCode => Object.hash(runtimeType,id,key,value,scope,description,lastUpdatedLabel,locked);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AdminSystemParameter(id: $id, key: $key, value: $value, scope: $scope, description: $description, lastUpdatedLabel: $lastUpdatedLabel, locked: $locked)';
}


}

/// @nodoc
abstract mixin class _$AdminSystemParameterCopyWith<$Res> implements $AdminSystemParameterCopyWith<$Res> {
  factory _$AdminSystemParameterCopyWith(_AdminSystemParameter value, $Res Function(_AdminSystemParameter) _then) = __$AdminSystemParameterCopyWithImpl;
@override @useResult
$Res call({
 String id, String key, String value, String scope, String description, String lastUpdatedLabel, bool locked
});




}
/// @nodoc
class __$AdminSystemParameterCopyWithImpl<$Res>
    implements _$AdminSystemParameterCopyWith<$Res> {
  __$AdminSystemParameterCopyWithImpl(this._self, this._then);

  final _AdminSystemParameter _self;
  final $Res Function(_AdminSystemParameter) _then;

/// Create a copy of AdminSystemParameter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? key = null,Object? value = null,Object? scope = null,Object? description = null,Object? lastUpdatedLabel = null,Object? locked = null,}) {
  return _then(_AdminSystemParameter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,lastUpdatedLabel: null == lastUpdatedLabel ? _self.lastUpdatedLabel : lastUpdatedLabel // ignore: cast_nullable_to_non_nullable
as String,locked: null == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$AdminSystemBroadcast implements DiagnosticableTreeMixin {

 String get id; String get title; String get messagePreview; AdminSystemBroadcastStatus get status; String get targetLabel; String get scheduleLabel; String get createdBy; bool get pinned;
/// Create a copy of AdminSystemBroadcast
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminSystemBroadcastCopyWith<AdminSystemBroadcast> get copyWith => _$AdminSystemBroadcastCopyWithImpl<AdminSystemBroadcast>(this as AdminSystemBroadcast, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AdminSystemBroadcast'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('messagePreview', messagePreview))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('targetLabel', targetLabel))..add(DiagnosticsProperty('scheduleLabel', scheduleLabel))..add(DiagnosticsProperty('createdBy', createdBy))..add(DiagnosticsProperty('pinned', pinned));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminSystemBroadcast&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.messagePreview, messagePreview) || other.messagePreview == messagePreview)&&(identical(other.status, status) || other.status == status)&&(identical(other.targetLabel, targetLabel) || other.targetLabel == targetLabel)&&(identical(other.scheduleLabel, scheduleLabel) || other.scheduleLabel == scheduleLabel)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.pinned, pinned) || other.pinned == pinned));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,messagePreview,status,targetLabel,scheduleLabel,createdBy,pinned);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AdminSystemBroadcast(id: $id, title: $title, messagePreview: $messagePreview, status: $status, targetLabel: $targetLabel, scheduleLabel: $scheduleLabel, createdBy: $createdBy, pinned: $pinned)';
}


}

/// @nodoc
abstract mixin class $AdminSystemBroadcastCopyWith<$Res>  {
  factory $AdminSystemBroadcastCopyWith(AdminSystemBroadcast value, $Res Function(AdminSystemBroadcast) _then) = _$AdminSystemBroadcastCopyWithImpl;
@useResult
$Res call({
 String id, String title, String messagePreview, AdminSystemBroadcastStatus status, String targetLabel, String scheduleLabel, String createdBy, bool pinned
});




}
/// @nodoc
class _$AdminSystemBroadcastCopyWithImpl<$Res>
    implements $AdminSystemBroadcastCopyWith<$Res> {
  _$AdminSystemBroadcastCopyWithImpl(this._self, this._then);

  final AdminSystemBroadcast _self;
  final $Res Function(AdminSystemBroadcast) _then;

/// Create a copy of AdminSystemBroadcast
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? messagePreview = null,Object? status = null,Object? targetLabel = null,Object? scheduleLabel = null,Object? createdBy = null,Object? pinned = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,messagePreview: null == messagePreview ? _self.messagePreview : messagePreview // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdminSystemBroadcastStatus,targetLabel: null == targetLabel ? _self.targetLabel : targetLabel // ignore: cast_nullable_to_non_nullable
as String,scheduleLabel: null == scheduleLabel ? _self.scheduleLabel : scheduleLabel // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,pinned: null == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminSystemBroadcast].
extension AdminSystemBroadcastPatterns on AdminSystemBroadcast {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminSystemBroadcast value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminSystemBroadcast() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminSystemBroadcast value)  $default,){
final _that = this;
switch (_that) {
case _AdminSystemBroadcast():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminSystemBroadcast value)?  $default,){
final _that = this;
switch (_that) {
case _AdminSystemBroadcast() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String messagePreview,  AdminSystemBroadcastStatus status,  String targetLabel,  String scheduleLabel,  String createdBy,  bool pinned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminSystemBroadcast() when $default != null:
return $default(_that.id,_that.title,_that.messagePreview,_that.status,_that.targetLabel,_that.scheduleLabel,_that.createdBy,_that.pinned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String messagePreview,  AdminSystemBroadcastStatus status,  String targetLabel,  String scheduleLabel,  String createdBy,  bool pinned)  $default,) {final _that = this;
switch (_that) {
case _AdminSystemBroadcast():
return $default(_that.id,_that.title,_that.messagePreview,_that.status,_that.targetLabel,_that.scheduleLabel,_that.createdBy,_that.pinned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String messagePreview,  AdminSystemBroadcastStatus status,  String targetLabel,  String scheduleLabel,  String createdBy,  bool pinned)?  $default,) {final _that = this;
switch (_that) {
case _AdminSystemBroadcast() when $default != null:
return $default(_that.id,_that.title,_that.messagePreview,_that.status,_that.targetLabel,_that.scheduleLabel,_that.createdBy,_that.pinned);case _:
  return null;

}
}

}

/// @nodoc


class _AdminSystemBroadcast extends AdminSystemBroadcast with DiagnosticableTreeMixin {
  const _AdminSystemBroadcast({required this.id, required this.title, required this.messagePreview, required this.status, required this.targetLabel, required this.scheduleLabel, required this.createdBy, this.pinned = false}): super._();
  

@override final  String id;
@override final  String title;
@override final  String messagePreview;
@override final  AdminSystemBroadcastStatus status;
@override final  String targetLabel;
@override final  String scheduleLabel;
@override final  String createdBy;
@override@JsonKey() final  bool pinned;

/// Create a copy of AdminSystemBroadcast
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminSystemBroadcastCopyWith<_AdminSystemBroadcast> get copyWith => __$AdminSystemBroadcastCopyWithImpl<_AdminSystemBroadcast>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AdminSystemBroadcast'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('messagePreview', messagePreview))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('targetLabel', targetLabel))..add(DiagnosticsProperty('scheduleLabel', scheduleLabel))..add(DiagnosticsProperty('createdBy', createdBy))..add(DiagnosticsProperty('pinned', pinned));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminSystemBroadcast&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.messagePreview, messagePreview) || other.messagePreview == messagePreview)&&(identical(other.status, status) || other.status == status)&&(identical(other.targetLabel, targetLabel) || other.targetLabel == targetLabel)&&(identical(other.scheduleLabel, scheduleLabel) || other.scheduleLabel == scheduleLabel)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.pinned, pinned) || other.pinned == pinned));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,messagePreview,status,targetLabel,scheduleLabel,createdBy,pinned);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AdminSystemBroadcast(id: $id, title: $title, messagePreview: $messagePreview, status: $status, targetLabel: $targetLabel, scheduleLabel: $scheduleLabel, createdBy: $createdBy, pinned: $pinned)';
}


}

/// @nodoc
abstract mixin class _$AdminSystemBroadcastCopyWith<$Res> implements $AdminSystemBroadcastCopyWith<$Res> {
  factory _$AdminSystemBroadcastCopyWith(_AdminSystemBroadcast value, $Res Function(_AdminSystemBroadcast) _then) = __$AdminSystemBroadcastCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String messagePreview, AdminSystemBroadcastStatus status, String targetLabel, String scheduleLabel, String createdBy, bool pinned
});




}
/// @nodoc
class __$AdminSystemBroadcastCopyWithImpl<$Res>
    implements _$AdminSystemBroadcastCopyWith<$Res> {
  __$AdminSystemBroadcastCopyWithImpl(this._self, this._then);

  final _AdminSystemBroadcast _self;
  final $Res Function(_AdminSystemBroadcast) _then;

/// Create a copy of AdminSystemBroadcast
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? messagePreview = null,Object? status = null,Object? targetLabel = null,Object? scheduleLabel = null,Object? createdBy = null,Object? pinned = null,}) {
  return _then(_AdminSystemBroadcast(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,messagePreview: null == messagePreview ? _self.messagePreview : messagePreview // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdminSystemBroadcastStatus,targetLabel: null == targetLabel ? _self.targetLabel : targetLabel // ignore: cast_nullable_to_non_nullable
as String,scheduleLabel: null == scheduleLabel ? _self.scheduleLabel : scheduleLabel // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,pinned: null == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
