// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assignment_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssignmentQuestion implements DiagnosticableTreeMixin {

 String get id; String get prompt; QuestionType get type; double get score;@JsonKey(fromJson: _parseOptions) List<String> get options; int get orderIndex; String? get answer;
/// Create a copy of AssignmentQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignmentQuestionCopyWith<AssignmentQuestion> get copyWith => _$AssignmentQuestionCopyWithImpl<AssignmentQuestion>(this as AssignmentQuestion, _$identity);

  /// Serializes this AssignmentQuestion to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AssignmentQuestion'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('prompt', prompt))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('score', score))..add(DiagnosticsProperty('options', options))..add(DiagnosticsProperty('orderIndex', orderIndex))..add(DiagnosticsProperty('answer', answer));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignmentQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.type, type) || other.type == type)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prompt,type,score,const DeepCollectionEquality().hash(options),orderIndex,answer);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AssignmentQuestion(id: $id, prompt: $prompt, type: $type, score: $score, options: $options, orderIndex: $orderIndex, answer: $answer)';
}


}

/// @nodoc
abstract mixin class $AssignmentQuestionCopyWith<$Res>  {
  factory $AssignmentQuestionCopyWith(AssignmentQuestion value, $Res Function(AssignmentQuestion) _then) = _$AssignmentQuestionCopyWithImpl;
@useResult
$Res call({
 String id, String prompt, QuestionType type, double score,@JsonKey(fromJson: _parseOptions) List<String> options, int orderIndex, String? answer
});




}
/// @nodoc
class _$AssignmentQuestionCopyWithImpl<$Res>
    implements $AssignmentQuestionCopyWith<$Res> {
  _$AssignmentQuestionCopyWithImpl(this._self, this._then);

  final AssignmentQuestion _self;
  final $Res Function(AssignmentQuestion) _then;

/// Create a copy of AssignmentQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? prompt = null,Object? type = null,Object? score = null,Object? options = null,Object? orderIndex = null,Object? answer = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuestionType,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AssignmentQuestion].
extension AssignmentQuestionPatterns on AssignmentQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssignmentQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssignmentQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssignmentQuestion value)  $default,){
final _that = this;
switch (_that) {
case _AssignmentQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssignmentQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _AssignmentQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String prompt,  QuestionType type,  double score, @JsonKey(fromJson: _parseOptions)  List<String> options,  int orderIndex,  String? answer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignmentQuestion() when $default != null:
return $default(_that.id,_that.prompt,_that.type,_that.score,_that.options,_that.orderIndex,_that.answer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String prompt,  QuestionType type,  double score, @JsonKey(fromJson: _parseOptions)  List<String> options,  int orderIndex,  String? answer)  $default,) {final _that = this;
switch (_that) {
case _AssignmentQuestion():
return $default(_that.id,_that.prompt,_that.type,_that.score,_that.options,_that.orderIndex,_that.answer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String prompt,  QuestionType type,  double score, @JsonKey(fromJson: _parseOptions)  List<String> options,  int orderIndex,  String? answer)?  $default,) {final _that = this;
switch (_that) {
case _AssignmentQuestion() when $default != null:
return $default(_that.id,_that.prompt,_that.type,_that.score,_that.options,_that.orderIndex,_that.answer);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _AssignmentQuestion with DiagnosticableTreeMixin implements AssignmentQuestion {
  const _AssignmentQuestion({this.id = '', this.prompt = '', required this.type, this.score = 0.0, @JsonKey(fromJson: _parseOptions) final  List<String> options = const [], this.orderIndex = 0, this.answer}): _options = options;
  factory _AssignmentQuestion.fromJson(Map<String, dynamic> json) => _$AssignmentQuestionFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String prompt;
@override final  QuestionType type;
@override@JsonKey() final  double score;
 final  List<String> _options;
@override@JsonKey(fromJson: _parseOptions) List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override@JsonKey() final  int orderIndex;
@override final  String? answer;

/// Create a copy of AssignmentQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignmentQuestionCopyWith<_AssignmentQuestion> get copyWith => __$AssignmentQuestionCopyWithImpl<_AssignmentQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignmentQuestionToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AssignmentQuestion'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('prompt', prompt))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('score', score))..add(DiagnosticsProperty('options', options))..add(DiagnosticsProperty('orderIndex', orderIndex))..add(DiagnosticsProperty('answer', answer));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignmentQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.type, type) || other.type == type)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prompt,type,score,const DeepCollectionEquality().hash(_options),orderIndex,answer);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AssignmentQuestion(id: $id, prompt: $prompt, type: $type, score: $score, options: $options, orderIndex: $orderIndex, answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$AssignmentQuestionCopyWith<$Res> implements $AssignmentQuestionCopyWith<$Res> {
  factory _$AssignmentQuestionCopyWith(_AssignmentQuestion value, $Res Function(_AssignmentQuestion) _then) = __$AssignmentQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String prompt, QuestionType type, double score,@JsonKey(fromJson: _parseOptions) List<String> options, int orderIndex, String? answer
});




}
/// @nodoc
class __$AssignmentQuestionCopyWithImpl<$Res>
    implements _$AssignmentQuestionCopyWith<$Res> {
  __$AssignmentQuestionCopyWithImpl(this._self, this._then);

  final _AssignmentQuestion _self;
  final $Res Function(_AssignmentQuestion) _then;

/// Create a copy of AssignmentQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prompt = null,Object? type = null,Object? score = null,Object? options = null,Object? orderIndex = null,Object? answer = freezed,}) {
  return _then(_AssignmentQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuestionType,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AssignmentDetail implements DiagnosticableTreeMixin {

 String get id; String get title; String get description;@JsonKey(fromJson: _parseAndSortQuestions) List<AssignmentQuestion> get questions; double get maxScore; AssignmentType get type; bool get allowResubmit; DateTime? get dueAt; DateTime? get startAt; List<AssignmentAttachment> get attachments;
/// Create a copy of AssignmentDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignmentDetailCopyWith<AssignmentDetail> get copyWith => _$AssignmentDetailCopyWithImpl<AssignmentDetail>(this as AssignmentDetail, _$identity);

  /// Serializes this AssignmentDetail to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AssignmentDetail'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('questions', questions))..add(DiagnosticsProperty('maxScore', maxScore))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('allowResubmit', allowResubmit))..add(DiagnosticsProperty('dueAt', dueAt))..add(DiagnosticsProperty('startAt', startAt))..add(DiagnosticsProperty('attachments', attachments));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignmentDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.questions, questions)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.type, type) || other.type == type)&&(identical(other.allowResubmit, allowResubmit) || other.allowResubmit == allowResubmit)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&const DeepCollectionEquality().equals(other.attachments, attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,const DeepCollectionEquality().hash(questions),maxScore,type,allowResubmit,dueAt,startAt,const DeepCollectionEquality().hash(attachments));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AssignmentDetail(id: $id, title: $title, description: $description, questions: $questions, maxScore: $maxScore, type: $type, allowResubmit: $allowResubmit, dueAt: $dueAt, startAt: $startAt, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class $AssignmentDetailCopyWith<$Res>  {
  factory $AssignmentDetailCopyWith(AssignmentDetail value, $Res Function(AssignmentDetail) _then) = _$AssignmentDetailCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description,@JsonKey(fromJson: _parseAndSortQuestions) List<AssignmentQuestion> questions, double maxScore, AssignmentType type, bool allowResubmit, DateTime? dueAt, DateTime? startAt, List<AssignmentAttachment> attachments
});




}
/// @nodoc
class _$AssignmentDetailCopyWithImpl<$Res>
    implements $AssignmentDetailCopyWith<$Res> {
  _$AssignmentDetailCopyWithImpl(this._self, this._then);

  final AssignmentDetail _self;
  final $Res Function(AssignmentDetail) _then;

/// Create a copy of AssignmentDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? questions = null,Object? maxScore = null,Object? type = null,Object? allowResubmit = null,Object? dueAt = freezed,Object? startAt = freezed,Object? attachments = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<AssignmentQuestion>,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AssignmentType,allowResubmit: null == allowResubmit ? _self.allowResubmit : allowResubmit // ignore: cast_nullable_to_non_nullable
as bool,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<AssignmentAttachment>,
  ));
}

}


/// Adds pattern-matching-related methods to [AssignmentDetail].
extension AssignmentDetailPatterns on AssignmentDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssignmentDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssignmentDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssignmentDetail value)  $default,){
final _that = this;
switch (_that) {
case _AssignmentDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssignmentDetail value)?  $default,){
final _that = this;
switch (_that) {
case _AssignmentDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description, @JsonKey(fromJson: _parseAndSortQuestions)  List<AssignmentQuestion> questions,  double maxScore,  AssignmentType type,  bool allowResubmit,  DateTime? dueAt,  DateTime? startAt,  List<AssignmentAttachment> attachments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignmentDetail() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.questions,_that.maxScore,_that.type,_that.allowResubmit,_that.dueAt,_that.startAt,_that.attachments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description, @JsonKey(fromJson: _parseAndSortQuestions)  List<AssignmentQuestion> questions,  double maxScore,  AssignmentType type,  bool allowResubmit,  DateTime? dueAt,  DateTime? startAt,  List<AssignmentAttachment> attachments)  $default,) {final _that = this;
switch (_that) {
case _AssignmentDetail():
return $default(_that.id,_that.title,_that.description,_that.questions,_that.maxScore,_that.type,_that.allowResubmit,_that.dueAt,_that.startAt,_that.attachments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description, @JsonKey(fromJson: _parseAndSortQuestions)  List<AssignmentQuestion> questions,  double maxScore,  AssignmentType type,  bool allowResubmit,  DateTime? dueAt,  DateTime? startAt,  List<AssignmentAttachment> attachments)?  $default,) {final _that = this;
switch (_that) {
case _AssignmentDetail() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.questions,_that.maxScore,_that.type,_that.allowResubmit,_that.dueAt,_that.startAt,_that.attachments);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _AssignmentDetail with DiagnosticableTreeMixin implements AssignmentDetail {
  const _AssignmentDetail({this.id = '', this.title = '', this.description = '', @JsonKey(fromJson: _parseAndSortQuestions) final  List<AssignmentQuestion> questions = const [], this.maxScore = 0.0, this.type = AssignmentType.homework, this.allowResubmit = false, this.dueAt, this.startAt, final  List<AssignmentAttachment> attachments = const []}): _questions = questions,_attachments = attachments;
  factory _AssignmentDetail.fromJson(Map<String, dynamic> json) => _$AssignmentDetailFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
 final  List<AssignmentQuestion> _questions;
@override@JsonKey(fromJson: _parseAndSortQuestions) List<AssignmentQuestion> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

@override@JsonKey() final  double maxScore;
@override@JsonKey() final  AssignmentType type;
@override@JsonKey() final  bool allowResubmit;
@override final  DateTime? dueAt;
@override final  DateTime? startAt;
 final  List<AssignmentAttachment> _attachments;
@override@JsonKey() List<AssignmentAttachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}


/// Create a copy of AssignmentDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignmentDetailCopyWith<_AssignmentDetail> get copyWith => __$AssignmentDetailCopyWithImpl<_AssignmentDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignmentDetailToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AssignmentDetail'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('questions', questions))..add(DiagnosticsProperty('maxScore', maxScore))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('allowResubmit', allowResubmit))..add(DiagnosticsProperty('dueAt', dueAt))..add(DiagnosticsProperty('startAt', startAt))..add(DiagnosticsProperty('attachments', attachments));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignmentDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._questions, _questions)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.type, type) || other.type == type)&&(identical(other.allowResubmit, allowResubmit) || other.allowResubmit == allowResubmit)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&const DeepCollectionEquality().equals(other._attachments, _attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,const DeepCollectionEquality().hash(_questions),maxScore,type,allowResubmit,dueAt,startAt,const DeepCollectionEquality().hash(_attachments));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AssignmentDetail(id: $id, title: $title, description: $description, questions: $questions, maxScore: $maxScore, type: $type, allowResubmit: $allowResubmit, dueAt: $dueAt, startAt: $startAt, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class _$AssignmentDetailCopyWith<$Res> implements $AssignmentDetailCopyWith<$Res> {
  factory _$AssignmentDetailCopyWith(_AssignmentDetail value, $Res Function(_AssignmentDetail) _then) = __$AssignmentDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description,@JsonKey(fromJson: _parseAndSortQuestions) List<AssignmentQuestion> questions, double maxScore, AssignmentType type, bool allowResubmit, DateTime? dueAt, DateTime? startAt, List<AssignmentAttachment> attachments
});




}
/// @nodoc
class __$AssignmentDetailCopyWithImpl<$Res>
    implements _$AssignmentDetailCopyWith<$Res> {
  __$AssignmentDetailCopyWithImpl(this._self, this._then);

  final _AssignmentDetail _self;
  final $Res Function(_AssignmentDetail) _then;

/// Create a copy of AssignmentDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? questions = null,Object? maxScore = null,Object? type = null,Object? allowResubmit = null,Object? dueAt = freezed,Object? startAt = freezed,Object? attachments = null,}) {
  return _then(_AssignmentDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<AssignmentQuestion>,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AssignmentType,allowResubmit: null == allowResubmit ? _self.allowResubmit : allowResubmit // ignore: cast_nullable_to_non_nullable
as bool,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<AssignmentAttachment>,
  ));
}


}


/// @nodoc
mixin _$AssignmentAttachment implements DiagnosticableTreeMixin {

 String get id; String get name; String get url; String get type;
/// Create a copy of AssignmentAttachment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignmentAttachmentCopyWith<AssignmentAttachment> get copyWith => _$AssignmentAttachmentCopyWithImpl<AssignmentAttachment>(this as AssignmentAttachment, _$identity);

  /// Serializes this AssignmentAttachment to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AssignmentAttachment'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('type', type));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignmentAttachment&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url,type);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AssignmentAttachment(id: $id, name: $name, url: $url, type: $type)';
}


}

/// @nodoc
abstract mixin class $AssignmentAttachmentCopyWith<$Res>  {
  factory $AssignmentAttachmentCopyWith(AssignmentAttachment value, $Res Function(AssignmentAttachment) _then) = _$AssignmentAttachmentCopyWithImpl;
@useResult
$Res call({
 String id, String name, String url, String type
});




}
/// @nodoc
class _$AssignmentAttachmentCopyWithImpl<$Res>
    implements $AssignmentAttachmentCopyWith<$Res> {
  _$AssignmentAttachmentCopyWithImpl(this._self, this._then);

  final AssignmentAttachment _self;
  final $Res Function(AssignmentAttachment) _then;

/// Create a copy of AssignmentAttachment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? url = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AssignmentAttachment].
extension AssignmentAttachmentPatterns on AssignmentAttachment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssignmentAttachment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssignmentAttachment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssignmentAttachment value)  $default,){
final _that = this;
switch (_that) {
case _AssignmentAttachment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssignmentAttachment value)?  $default,){
final _that = this;
switch (_that) {
case _AssignmentAttachment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String url,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignmentAttachment() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String url,  String type)  $default,) {final _that = this;
switch (_that) {
case _AssignmentAttachment():
return $default(_that.id,_that.name,_that.url,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String url,  String type)?  $default,) {final _that = this;
switch (_that) {
case _AssignmentAttachment() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.type);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _AssignmentAttachment with DiagnosticableTreeMixin implements AssignmentAttachment {
  const _AssignmentAttachment({this.id = '', this.name = '', this.url = '', this.type = ''});
  factory _AssignmentAttachment.fromJson(Map<String, dynamic> json) => _$AssignmentAttachmentFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String url;
@override@JsonKey() final  String type;

/// Create a copy of AssignmentAttachment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignmentAttachmentCopyWith<_AssignmentAttachment> get copyWith => __$AssignmentAttachmentCopyWithImpl<_AssignmentAttachment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignmentAttachmentToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AssignmentAttachment'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('type', type));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignmentAttachment&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url,type);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AssignmentAttachment(id: $id, name: $name, url: $url, type: $type)';
}


}

/// @nodoc
abstract mixin class _$AssignmentAttachmentCopyWith<$Res> implements $AssignmentAttachmentCopyWith<$Res> {
  factory _$AssignmentAttachmentCopyWith(_AssignmentAttachment value, $Res Function(_AssignmentAttachment) _then) = __$AssignmentAttachmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String url, String type
});




}
/// @nodoc
class __$AssignmentAttachmentCopyWithImpl<$Res>
    implements _$AssignmentAttachmentCopyWith<$Res> {
  __$AssignmentAttachmentCopyWithImpl(this._self, this._then);

  final _AssignmentAttachment _self;
  final $Res Function(_AssignmentAttachment) _then;

/// Create a copy of AssignmentAttachment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? url = null,Object? type = null,}) {
  return _then(_AssignmentAttachment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SubmissionResult implements DiagnosticableTreeMixin {

 String get id; double? get score; String get status; DateTime get submittedAt; String? get feedback;
/// Create a copy of SubmissionResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmissionResultCopyWith<SubmissionResult> get copyWith => _$SubmissionResultCopyWithImpl<SubmissionResult>(this as SubmissionResult, _$identity);

  /// Serializes this SubmissionResult to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SubmissionResult'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('score', score))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('submittedAt', submittedAt))..add(DiagnosticsProperty('feedback', feedback));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmissionResult&&(identical(other.id, id) || other.id == id)&&(identical(other.score, score) || other.score == score)&&(identical(other.status, status) || other.status == status)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.feedback, feedback) || other.feedback == feedback));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,score,status,submittedAt,feedback);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SubmissionResult(id: $id, score: $score, status: $status, submittedAt: $submittedAt, feedback: $feedback)';
}


}

/// @nodoc
abstract mixin class $SubmissionResultCopyWith<$Res>  {
  factory $SubmissionResultCopyWith(SubmissionResult value, $Res Function(SubmissionResult) _then) = _$SubmissionResultCopyWithImpl;
@useResult
$Res call({
 String id, double? score, String status, DateTime submittedAt, String? feedback
});




}
/// @nodoc
class _$SubmissionResultCopyWithImpl<$Res>
    implements $SubmissionResultCopyWith<$Res> {
  _$SubmissionResultCopyWithImpl(this._self, this._then);

  final SubmissionResult _self;
  final $Res Function(SubmissionResult) _then;

/// Create a copy of SubmissionResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? score = freezed,Object? status = null,Object? submittedAt = null,Object? feedback = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,submittedAt: null == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime,feedback: freezed == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmissionResult].
extension SubmissionResultPatterns on SubmissionResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmissionResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmissionResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmissionResult value)  $default,){
final _that = this;
switch (_that) {
case _SubmissionResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmissionResult value)?  $default,){
final _that = this;
switch (_that) {
case _SubmissionResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double? score,  String status,  DateTime submittedAt,  String? feedback)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmissionResult() when $default != null:
return $default(_that.id,_that.score,_that.status,_that.submittedAt,_that.feedback);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double? score,  String status,  DateTime submittedAt,  String? feedback)  $default,) {final _that = this;
switch (_that) {
case _SubmissionResult():
return $default(_that.id,_that.score,_that.status,_that.submittedAt,_that.feedback);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double? score,  String status,  DateTime submittedAt,  String? feedback)?  $default,) {final _that = this;
switch (_that) {
case _SubmissionResult() when $default != null:
return $default(_that.id,_that.score,_that.status,_that.submittedAt,_that.feedback);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _SubmissionResult with DiagnosticableTreeMixin implements SubmissionResult {
  const _SubmissionResult({this.id = '', this.score, this.status = '', required this.submittedAt, this.feedback});
  factory _SubmissionResult.fromJson(Map<String, dynamic> json) => _$SubmissionResultFromJson(json);

@override@JsonKey() final  String id;
@override final  double? score;
@override@JsonKey() final  String status;
@override final  DateTime submittedAt;
@override final  String? feedback;

/// Create a copy of SubmissionResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmissionResultCopyWith<_SubmissionResult> get copyWith => __$SubmissionResultCopyWithImpl<_SubmissionResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmissionResultToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SubmissionResult'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('score', score))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('submittedAt', submittedAt))..add(DiagnosticsProperty('feedback', feedback));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmissionResult&&(identical(other.id, id) || other.id == id)&&(identical(other.score, score) || other.score == score)&&(identical(other.status, status) || other.status == status)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.feedback, feedback) || other.feedback == feedback));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,score,status,submittedAt,feedback);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SubmissionResult(id: $id, score: $score, status: $status, submittedAt: $submittedAt, feedback: $feedback)';
}


}

/// @nodoc
abstract mixin class _$SubmissionResultCopyWith<$Res> implements $SubmissionResultCopyWith<$Res> {
  factory _$SubmissionResultCopyWith(_SubmissionResult value, $Res Function(_SubmissionResult) _then) = __$SubmissionResultCopyWithImpl;
@override @useResult
$Res call({
 String id, double? score, String status, DateTime submittedAt, String? feedback
});




}
/// @nodoc
class __$SubmissionResultCopyWithImpl<$Res>
    implements _$SubmissionResultCopyWith<$Res> {
  __$SubmissionResultCopyWithImpl(this._self, this._then);

  final _SubmissionResult _self;
  final $Res Function(_SubmissionResult) _then;

/// Create a copy of SubmissionResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? score = freezed,Object? status = null,Object? submittedAt = null,Object? feedback = freezed,}) {
  return _then(_SubmissionResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,submittedAt: null == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime,feedback: freezed == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SubmissionItem implements DiagnosticableTreeMixin {

 String get id; String get questionId; String get answer; double? get score;
/// Create a copy of SubmissionItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmissionItemCopyWith<SubmissionItem> get copyWith => _$SubmissionItemCopyWithImpl<SubmissionItem>(this as SubmissionItem, _$identity);

  /// Serializes this SubmissionItem to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SubmissionItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('questionId', questionId))..add(DiagnosticsProperty('answer', answer))..add(DiagnosticsProperty('score', score));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmissionItem&&(identical(other.id, id) || other.id == id)&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,questionId,answer,score);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SubmissionItem(id: $id, questionId: $questionId, answer: $answer, score: $score)';
}


}

/// @nodoc
abstract mixin class $SubmissionItemCopyWith<$Res>  {
  factory $SubmissionItemCopyWith(SubmissionItem value, $Res Function(SubmissionItem) _then) = _$SubmissionItemCopyWithImpl;
@useResult
$Res call({
 String id, String questionId, String answer, double? score
});




}
/// @nodoc
class _$SubmissionItemCopyWithImpl<$Res>
    implements $SubmissionItemCopyWith<$Res> {
  _$SubmissionItemCopyWithImpl(this._self, this._then);

  final SubmissionItem _self;
  final $Res Function(SubmissionItem) _then;

/// Create a copy of SubmissionItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? questionId = null,Object? answer = null,Object? score = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmissionItem].
extension SubmissionItemPatterns on SubmissionItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmissionItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmissionItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmissionItem value)  $default,){
final _that = this;
switch (_that) {
case _SubmissionItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmissionItem value)?  $default,){
final _that = this;
switch (_that) {
case _SubmissionItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String questionId,  String answer,  double? score)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmissionItem() when $default != null:
return $default(_that.id,_that.questionId,_that.answer,_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String questionId,  String answer,  double? score)  $default,) {final _that = this;
switch (_that) {
case _SubmissionItem():
return $default(_that.id,_that.questionId,_that.answer,_that.score);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String questionId,  String answer,  double? score)?  $default,) {final _that = this;
switch (_that) {
case _SubmissionItem() when $default != null:
return $default(_that.id,_that.questionId,_that.answer,_that.score);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _SubmissionItem with DiagnosticableTreeMixin implements SubmissionItem {
  const _SubmissionItem({this.id = '', this.questionId = '', this.answer = '', this.score});
  factory _SubmissionItem.fromJson(Map<String, dynamic> json) => _$SubmissionItemFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String questionId;
@override@JsonKey() final  String answer;
@override final  double? score;

/// Create a copy of SubmissionItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmissionItemCopyWith<_SubmissionItem> get copyWith => __$SubmissionItemCopyWithImpl<_SubmissionItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmissionItemToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SubmissionItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('questionId', questionId))..add(DiagnosticsProperty('answer', answer))..add(DiagnosticsProperty('score', score));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmissionItem&&(identical(other.id, id) || other.id == id)&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,questionId,answer,score);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SubmissionItem(id: $id, questionId: $questionId, answer: $answer, score: $score)';
}


}

/// @nodoc
abstract mixin class _$SubmissionItemCopyWith<$Res> implements $SubmissionItemCopyWith<$Res> {
  factory _$SubmissionItemCopyWith(_SubmissionItem value, $Res Function(_SubmissionItem) _then) = __$SubmissionItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String questionId, String answer, double? score
});




}
/// @nodoc
class __$SubmissionItemCopyWithImpl<$Res>
    implements _$SubmissionItemCopyWith<$Res> {
  __$SubmissionItemCopyWithImpl(this._self, this._then);

  final _SubmissionItem _self;
  final $Res Function(_SubmissionItem) _then;

/// Create a copy of SubmissionItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? questionId = null,Object? answer = null,Object? score = freezed,}) {
  return _then(_SubmissionItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$StudentSubmissionDetail implements DiagnosticableTreeMixin {

 AssignmentDetail get assignment; SubmissionResult get submission; List<SubmissionItem> get items;
/// Create a copy of StudentSubmissionDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentSubmissionDetailCopyWith<StudentSubmissionDetail> get copyWith => _$StudentSubmissionDetailCopyWithImpl<StudentSubmissionDetail>(this as StudentSubmissionDetail, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentSubmissionDetail'))
    ..add(DiagnosticsProperty('assignment', assignment))..add(DiagnosticsProperty('submission', submission))..add(DiagnosticsProperty('items', items));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentSubmissionDetail&&(identical(other.assignment, assignment) || other.assignment == assignment)&&(identical(other.submission, submission) || other.submission == submission)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,assignment,submission,const DeepCollectionEquality().hash(items));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentSubmissionDetail(assignment: $assignment, submission: $submission, items: $items)';
}


}

/// @nodoc
abstract mixin class $StudentSubmissionDetailCopyWith<$Res>  {
  factory $StudentSubmissionDetailCopyWith(StudentSubmissionDetail value, $Res Function(StudentSubmissionDetail) _then) = _$StudentSubmissionDetailCopyWithImpl;
@useResult
$Res call({
 AssignmentDetail assignment, SubmissionResult submission, List<SubmissionItem> items
});


$AssignmentDetailCopyWith<$Res> get assignment;$SubmissionResultCopyWith<$Res> get submission;

}
/// @nodoc
class _$StudentSubmissionDetailCopyWithImpl<$Res>
    implements $StudentSubmissionDetailCopyWith<$Res> {
  _$StudentSubmissionDetailCopyWithImpl(this._self, this._then);

  final StudentSubmissionDetail _self;
  final $Res Function(StudentSubmissionDetail) _then;

/// Create a copy of StudentSubmissionDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assignment = null,Object? submission = null,Object? items = null,}) {
  return _then(_self.copyWith(
assignment: null == assignment ? _self.assignment : assignment // ignore: cast_nullable_to_non_nullable
as AssignmentDetail,submission: null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as SubmissionResult,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SubmissionItem>,
  ));
}
/// Create a copy of StudentSubmissionDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssignmentDetailCopyWith<$Res> get assignment {
  
  return $AssignmentDetailCopyWith<$Res>(_self.assignment, (value) {
    return _then(_self.copyWith(assignment: value));
  });
}/// Create a copy of StudentSubmissionDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubmissionResultCopyWith<$Res> get submission {
  
  return $SubmissionResultCopyWith<$Res>(_self.submission, (value) {
    return _then(_self.copyWith(submission: value));
  });
}
}


/// Adds pattern-matching-related methods to [StudentSubmissionDetail].
extension StudentSubmissionDetailPatterns on StudentSubmissionDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentSubmissionDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentSubmissionDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentSubmissionDetail value)  $default,){
final _that = this;
switch (_that) {
case _StudentSubmissionDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentSubmissionDetail value)?  $default,){
final _that = this;
switch (_that) {
case _StudentSubmissionDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AssignmentDetail assignment,  SubmissionResult submission,  List<SubmissionItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentSubmissionDetail() when $default != null:
return $default(_that.assignment,_that.submission,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AssignmentDetail assignment,  SubmissionResult submission,  List<SubmissionItem> items)  $default,) {final _that = this;
switch (_that) {
case _StudentSubmissionDetail():
return $default(_that.assignment,_that.submission,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AssignmentDetail assignment,  SubmissionResult submission,  List<SubmissionItem> items)?  $default,) {final _that = this;
switch (_that) {
case _StudentSubmissionDetail() when $default != null:
return $default(_that.assignment,_that.submission,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _StudentSubmissionDetail with DiagnosticableTreeMixin implements StudentSubmissionDetail {
  const _StudentSubmissionDetail({required this.assignment, required this.submission, required final  List<SubmissionItem> items}): _items = items;
  

@override final  AssignmentDetail assignment;
@override final  SubmissionResult submission;
 final  List<SubmissionItem> _items;
@override List<SubmissionItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of StudentSubmissionDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentSubmissionDetailCopyWith<_StudentSubmissionDetail> get copyWith => __$StudentSubmissionDetailCopyWithImpl<_StudentSubmissionDetail>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentSubmissionDetail'))
    ..add(DiagnosticsProperty('assignment', assignment))..add(DiagnosticsProperty('submission', submission))..add(DiagnosticsProperty('items', items));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentSubmissionDetail&&(identical(other.assignment, assignment) || other.assignment == assignment)&&(identical(other.submission, submission) || other.submission == submission)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,assignment,submission,const DeepCollectionEquality().hash(_items));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentSubmissionDetail(assignment: $assignment, submission: $submission, items: $items)';
}


}

/// @nodoc
abstract mixin class _$StudentSubmissionDetailCopyWith<$Res> implements $StudentSubmissionDetailCopyWith<$Res> {
  factory _$StudentSubmissionDetailCopyWith(_StudentSubmissionDetail value, $Res Function(_StudentSubmissionDetail) _then) = __$StudentSubmissionDetailCopyWithImpl;
@override @useResult
$Res call({
 AssignmentDetail assignment, SubmissionResult submission, List<SubmissionItem> items
});


@override $AssignmentDetailCopyWith<$Res> get assignment;@override $SubmissionResultCopyWith<$Res> get submission;

}
/// @nodoc
class __$StudentSubmissionDetailCopyWithImpl<$Res>
    implements _$StudentSubmissionDetailCopyWith<$Res> {
  __$StudentSubmissionDetailCopyWithImpl(this._self, this._then);

  final _StudentSubmissionDetail _self;
  final $Res Function(_StudentSubmissionDetail) _then;

/// Create a copy of StudentSubmissionDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assignment = null,Object? submission = null,Object? items = null,}) {
  return _then(_StudentSubmissionDetail(
assignment: null == assignment ? _self.assignment : assignment // ignore: cast_nullable_to_non_nullable
as AssignmentDetail,submission: null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as SubmissionResult,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SubmissionItem>,
  ));
}

/// Create a copy of StudentSubmissionDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssignmentDetailCopyWith<$Res> get assignment {
  
  return $AssignmentDetailCopyWith<$Res>(_self.assignment, (value) {
    return _then(_self.copyWith(assignment: value));
  });
}/// Create a copy of StudentSubmissionDetail
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
mixin _$ExplainQuestionResult implements DiagnosticableTreeMixin {

 String get analysis; List<String> get steps; List<String> get keyPoints; List<String> get pitfalls; List<String> get checklist;
/// Create a copy of ExplainQuestionResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExplainQuestionResultCopyWith<ExplainQuestionResult> get copyWith => _$ExplainQuestionResultCopyWithImpl<ExplainQuestionResult>(this as ExplainQuestionResult, _$identity);

  /// Serializes this ExplainQuestionResult to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ExplainQuestionResult'))
    ..add(DiagnosticsProperty('analysis', analysis))..add(DiagnosticsProperty('steps', steps))..add(DiagnosticsProperty('keyPoints', keyPoints))..add(DiagnosticsProperty('pitfalls', pitfalls))..add(DiagnosticsProperty('checklist', checklist));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExplainQuestionResult&&(identical(other.analysis, analysis) || other.analysis == analysis)&&const DeepCollectionEquality().equals(other.steps, steps)&&const DeepCollectionEquality().equals(other.keyPoints, keyPoints)&&const DeepCollectionEquality().equals(other.pitfalls, pitfalls)&&const DeepCollectionEquality().equals(other.checklist, checklist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,analysis,const DeepCollectionEquality().hash(steps),const DeepCollectionEquality().hash(keyPoints),const DeepCollectionEquality().hash(pitfalls),const DeepCollectionEquality().hash(checklist));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ExplainQuestionResult(analysis: $analysis, steps: $steps, keyPoints: $keyPoints, pitfalls: $pitfalls, checklist: $checklist)';
}


}

/// @nodoc
abstract mixin class $ExplainQuestionResultCopyWith<$Res>  {
  factory $ExplainQuestionResultCopyWith(ExplainQuestionResult value, $Res Function(ExplainQuestionResult) _then) = _$ExplainQuestionResultCopyWithImpl;
@useResult
$Res call({
 String analysis, List<String> steps, List<String> keyPoints, List<String> pitfalls, List<String> checklist
});




}
/// @nodoc
class _$ExplainQuestionResultCopyWithImpl<$Res>
    implements $ExplainQuestionResultCopyWith<$Res> {
  _$ExplainQuestionResultCopyWithImpl(this._self, this._then);

  final ExplainQuestionResult _self;
  final $Res Function(ExplainQuestionResult) _then;

/// Create a copy of ExplainQuestionResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? analysis = null,Object? steps = null,Object? keyPoints = null,Object? pitfalls = null,Object? checklist = null,}) {
  return _then(_self.copyWith(
analysis: null == analysis ? _self.analysis : analysis // ignore: cast_nullable_to_non_nullable
as String,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<String>,keyPoints: null == keyPoints ? _self.keyPoints : keyPoints // ignore: cast_nullable_to_non_nullable
as List<String>,pitfalls: null == pitfalls ? _self.pitfalls : pitfalls // ignore: cast_nullable_to_non_nullable
as List<String>,checklist: null == checklist ? _self.checklist : checklist // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExplainQuestionResult].
extension ExplainQuestionResultPatterns on ExplainQuestionResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExplainQuestionResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExplainQuestionResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExplainQuestionResult value)  $default,){
final _that = this;
switch (_that) {
case _ExplainQuestionResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExplainQuestionResult value)?  $default,){
final _that = this;
switch (_that) {
case _ExplainQuestionResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String analysis,  List<String> steps,  List<String> keyPoints,  List<String> pitfalls,  List<String> checklist)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExplainQuestionResult() when $default != null:
return $default(_that.analysis,_that.steps,_that.keyPoints,_that.pitfalls,_that.checklist);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String analysis,  List<String> steps,  List<String> keyPoints,  List<String> pitfalls,  List<String> checklist)  $default,) {final _that = this;
switch (_that) {
case _ExplainQuestionResult():
return $default(_that.analysis,_that.steps,_that.keyPoints,_that.pitfalls,_that.checklist);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String analysis,  List<String> steps,  List<String> keyPoints,  List<String> pitfalls,  List<String> checklist)?  $default,) {final _that = this;
switch (_that) {
case _ExplainQuestionResult() when $default != null:
return $default(_that.analysis,_that.steps,_that.keyPoints,_that.pitfalls,_that.checklist);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ExplainQuestionResult with DiagnosticableTreeMixin implements ExplainQuestionResult {
  const _ExplainQuestionResult({this.analysis = '', final  List<String> steps = const [], final  List<String> keyPoints = const [], final  List<String> pitfalls = const [], final  List<String> checklist = const []}): _steps = steps,_keyPoints = keyPoints,_pitfalls = pitfalls,_checklist = checklist;
  factory _ExplainQuestionResult.fromJson(Map<String, dynamic> json) => _$ExplainQuestionResultFromJson(json);

@override@JsonKey() final  String analysis;
 final  List<String> _steps;
@override@JsonKey() List<String> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

 final  List<String> _keyPoints;
@override@JsonKey() List<String> get keyPoints {
  if (_keyPoints is EqualUnmodifiableListView) return _keyPoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keyPoints);
}

 final  List<String> _pitfalls;
@override@JsonKey() List<String> get pitfalls {
  if (_pitfalls is EqualUnmodifiableListView) return _pitfalls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pitfalls);
}

 final  List<String> _checklist;
@override@JsonKey() List<String> get checklist {
  if (_checklist is EqualUnmodifiableListView) return _checklist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checklist);
}


/// Create a copy of ExplainQuestionResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExplainQuestionResultCopyWith<_ExplainQuestionResult> get copyWith => __$ExplainQuestionResultCopyWithImpl<_ExplainQuestionResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExplainQuestionResultToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ExplainQuestionResult'))
    ..add(DiagnosticsProperty('analysis', analysis))..add(DiagnosticsProperty('steps', steps))..add(DiagnosticsProperty('keyPoints', keyPoints))..add(DiagnosticsProperty('pitfalls', pitfalls))..add(DiagnosticsProperty('checklist', checklist));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExplainQuestionResult&&(identical(other.analysis, analysis) || other.analysis == analysis)&&const DeepCollectionEquality().equals(other._steps, _steps)&&const DeepCollectionEquality().equals(other._keyPoints, _keyPoints)&&const DeepCollectionEquality().equals(other._pitfalls, _pitfalls)&&const DeepCollectionEquality().equals(other._checklist, _checklist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,analysis,const DeepCollectionEquality().hash(_steps),const DeepCollectionEquality().hash(_keyPoints),const DeepCollectionEquality().hash(_pitfalls),const DeepCollectionEquality().hash(_checklist));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ExplainQuestionResult(analysis: $analysis, steps: $steps, keyPoints: $keyPoints, pitfalls: $pitfalls, checklist: $checklist)';
}


}

/// @nodoc
abstract mixin class _$ExplainQuestionResultCopyWith<$Res> implements $ExplainQuestionResultCopyWith<$Res> {
  factory _$ExplainQuestionResultCopyWith(_ExplainQuestionResult value, $Res Function(_ExplainQuestionResult) _then) = __$ExplainQuestionResultCopyWithImpl;
@override @useResult
$Res call({
 String analysis, List<String> steps, List<String> keyPoints, List<String> pitfalls, List<String> checklist
});




}
/// @nodoc
class __$ExplainQuestionResultCopyWithImpl<$Res>
    implements _$ExplainQuestionResultCopyWith<$Res> {
  __$ExplainQuestionResultCopyWithImpl(this._self, this._then);

  final _ExplainQuestionResult _self;
  final $Res Function(_ExplainQuestionResult) _then;

/// Create a copy of ExplainQuestionResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? analysis = null,Object? steps = null,Object? keyPoints = null,Object? pitfalls = null,Object? checklist = null,}) {
  return _then(_ExplainQuestionResult(
analysis: null == analysis ? _self.analysis : analysis // ignore: cast_nullable_to_non_nullable
as String,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<String>,keyPoints: null == keyPoints ? _self._keyPoints : keyPoints // ignore: cast_nullable_to_non_nullable
as List<String>,pitfalls: null == pitfalls ? _self._pitfalls : pitfalls // ignore: cast_nullable_to_non_nullable
as List<String>,checklist: null == checklist ? _self._checklist : checklist // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$GradeAssignmentResult implements DiagnosticableTreeMixin {

 int get score; String get summary; List<String> get suggestions; List<int> get itemScores;
/// Create a copy of GradeAssignmentResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GradeAssignmentResultCopyWith<GradeAssignmentResult> get copyWith => _$GradeAssignmentResultCopyWithImpl<GradeAssignmentResult>(this as GradeAssignmentResult, _$identity);

  /// Serializes this GradeAssignmentResult to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GradeAssignmentResult'))
    ..add(DiagnosticsProperty('score', score))..add(DiagnosticsProperty('summary', summary))..add(DiagnosticsProperty('suggestions', suggestions))..add(DiagnosticsProperty('itemScores', itemScores));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GradeAssignmentResult&&(identical(other.score, score) || other.score == score)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.suggestions, suggestions)&&const DeepCollectionEquality().equals(other.itemScores, itemScores));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,score,summary,const DeepCollectionEquality().hash(suggestions),const DeepCollectionEquality().hash(itemScores));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GradeAssignmentResult(score: $score, summary: $summary, suggestions: $suggestions, itemScores: $itemScores)';
}


}

/// @nodoc
abstract mixin class $GradeAssignmentResultCopyWith<$Res>  {
  factory $GradeAssignmentResultCopyWith(GradeAssignmentResult value, $Res Function(GradeAssignmentResult) _then) = _$GradeAssignmentResultCopyWithImpl;
@useResult
$Res call({
 int score, String summary, List<String> suggestions, List<int> itemScores
});




}
/// @nodoc
class _$GradeAssignmentResultCopyWithImpl<$Res>
    implements $GradeAssignmentResultCopyWith<$Res> {
  _$GradeAssignmentResultCopyWithImpl(this._self, this._then);

  final GradeAssignmentResult _self;
  final $Res Function(GradeAssignmentResult) _then;

/// Create a copy of GradeAssignmentResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? score = null,Object? summary = null,Object? suggestions = null,Object? itemScores = null,}) {
  return _then(_self.copyWith(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,suggestions: null == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String>,itemScores: null == itemScores ? _self.itemScores : itemScores // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [GradeAssignmentResult].
extension GradeAssignmentResultPatterns on GradeAssignmentResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GradeAssignmentResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GradeAssignmentResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GradeAssignmentResult value)  $default,){
final _that = this;
switch (_that) {
case _GradeAssignmentResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GradeAssignmentResult value)?  $default,){
final _that = this;
switch (_that) {
case _GradeAssignmentResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int score,  String summary,  List<String> suggestions,  List<int> itemScores)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GradeAssignmentResult() when $default != null:
return $default(_that.score,_that.summary,_that.suggestions,_that.itemScores);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int score,  String summary,  List<String> suggestions,  List<int> itemScores)  $default,) {final _that = this;
switch (_that) {
case _GradeAssignmentResult():
return $default(_that.score,_that.summary,_that.suggestions,_that.itemScores);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int score,  String summary,  List<String> suggestions,  List<int> itemScores)?  $default,) {final _that = this;
switch (_that) {
case _GradeAssignmentResult() when $default != null:
return $default(_that.score,_that.summary,_that.suggestions,_that.itemScores);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _GradeAssignmentResult with DiagnosticableTreeMixin implements GradeAssignmentResult {
  const _GradeAssignmentResult({this.score = 0, this.summary = '', final  List<String> suggestions = const [], final  List<int> itemScores = const []}): _suggestions = suggestions,_itemScores = itemScores;
  factory _GradeAssignmentResult.fromJson(Map<String, dynamic> json) => _$GradeAssignmentResultFromJson(json);

@override@JsonKey() final  int score;
@override@JsonKey() final  String summary;
 final  List<String> _suggestions;
@override@JsonKey() List<String> get suggestions {
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestions);
}

 final  List<int> _itemScores;
@override@JsonKey() List<int> get itemScores {
  if (_itemScores is EqualUnmodifiableListView) return _itemScores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itemScores);
}


/// Create a copy of GradeAssignmentResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GradeAssignmentResultCopyWith<_GradeAssignmentResult> get copyWith => __$GradeAssignmentResultCopyWithImpl<_GradeAssignmentResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GradeAssignmentResultToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GradeAssignmentResult'))
    ..add(DiagnosticsProperty('score', score))..add(DiagnosticsProperty('summary', summary))..add(DiagnosticsProperty('suggestions', suggestions))..add(DiagnosticsProperty('itemScores', itemScores));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GradeAssignmentResult&&(identical(other.score, score) || other.score == score)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._suggestions, _suggestions)&&const DeepCollectionEquality().equals(other._itemScores, _itemScores));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,score,summary,const DeepCollectionEquality().hash(_suggestions),const DeepCollectionEquality().hash(_itemScores));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GradeAssignmentResult(score: $score, summary: $summary, suggestions: $suggestions, itemScores: $itemScores)';
}


}

/// @nodoc
abstract mixin class _$GradeAssignmentResultCopyWith<$Res> implements $GradeAssignmentResultCopyWith<$Res> {
  factory _$GradeAssignmentResultCopyWith(_GradeAssignmentResult value, $Res Function(_GradeAssignmentResult) _then) = __$GradeAssignmentResultCopyWithImpl;
@override @useResult
$Res call({
 int score, String summary, List<String> suggestions, List<int> itemScores
});




}
/// @nodoc
class __$GradeAssignmentResultCopyWithImpl<$Res>
    implements _$GradeAssignmentResultCopyWith<$Res> {
  __$GradeAssignmentResultCopyWithImpl(this._self, this._then);

  final _GradeAssignmentResult _self;
  final $Res Function(_GradeAssignmentResult) _then;

/// Create a copy of GradeAssignmentResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? score = null,Object? summary = null,Object? suggestions = null,Object? itemScores = null,}) {
  return _then(_GradeAssignmentResult(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,suggestions: null == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String>,itemScores: null == itemScores ? _self._itemScores : itemScores // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
