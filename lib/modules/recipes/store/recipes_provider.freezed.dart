// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipes_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateRecipeState {

 String get title; String get onlineLink; String get description; String get imageUrl; bool get isLoading; List<CookingStep> get cookingSteps; List<Ingredient> get ingredients;
/// Create a copy of CreateRecipeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateRecipeStateCopyWith<CreateRecipeState> get copyWith => _$CreateRecipeStateCopyWithImpl<CreateRecipeState>(this as CreateRecipeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateRecipeState&&(identical(other.title, title) || other.title == title)&&(identical(other.onlineLink, onlineLink) || other.onlineLink == onlineLink)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.cookingSteps, cookingSteps)&&const DeepCollectionEquality().equals(other.ingredients, ingredients));
}


@override
int get hashCode => Object.hash(runtimeType,title,onlineLink,description,imageUrl,isLoading,const DeepCollectionEquality().hash(cookingSteps),const DeepCollectionEquality().hash(ingredients));

@override
String toString() {
  return 'CreateRecipeState(title: $title, onlineLink: $onlineLink, description: $description, imageUrl: $imageUrl, isLoading: $isLoading, cookingSteps: $cookingSteps, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class $CreateRecipeStateCopyWith<$Res>  {
  factory $CreateRecipeStateCopyWith(CreateRecipeState value, $Res Function(CreateRecipeState) _then) = _$CreateRecipeStateCopyWithImpl;
@useResult
$Res call({
 String title, String onlineLink, String description, String imageUrl, bool isLoading, List<CookingStep> cookingSteps, List<Ingredient> ingredients
});




}
/// @nodoc
class _$CreateRecipeStateCopyWithImpl<$Res>
    implements $CreateRecipeStateCopyWith<$Res> {
  _$CreateRecipeStateCopyWithImpl(this._self, this._then);

  final CreateRecipeState _self;
  final $Res Function(CreateRecipeState) _then;

/// Create a copy of CreateRecipeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? onlineLink = null,Object? description = null,Object? imageUrl = null,Object? isLoading = null,Object? cookingSteps = null,Object? ingredients = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,onlineLink: null == onlineLink ? _self.onlineLink : onlineLink // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,cookingSteps: null == cookingSteps ? _self.cookingSteps : cookingSteps // ignore: cast_nullable_to_non_nullable
as List<CookingStep>,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,
  ));
}

}


/// @nodoc


class _CreateRecipeState implements CreateRecipeState {
  const _CreateRecipeState({required this.title, required this.onlineLink, required this.description, required this.imageUrl, required this.isLoading, required final  List<CookingStep> cookingSteps, required final  List<Ingredient> ingredients}): _cookingSteps = cookingSteps,_ingredients = ingredients;
  

@override final  String title;
@override final  String onlineLink;
@override final  String description;
@override final  String imageUrl;
@override final  bool isLoading;
 final  List<CookingStep> _cookingSteps;
@override List<CookingStep> get cookingSteps {
  if (_cookingSteps is EqualUnmodifiableListView) return _cookingSteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cookingSteps);
}

 final  List<Ingredient> _ingredients;
@override List<Ingredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}


/// Create a copy of CreateRecipeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateRecipeStateCopyWith<_CreateRecipeState> get copyWith => __$CreateRecipeStateCopyWithImpl<_CreateRecipeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateRecipeState&&(identical(other.title, title) || other.title == title)&&(identical(other.onlineLink, onlineLink) || other.onlineLink == onlineLink)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._cookingSteps, _cookingSteps)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients));
}


@override
int get hashCode => Object.hash(runtimeType,title,onlineLink,description,imageUrl,isLoading,const DeepCollectionEquality().hash(_cookingSteps),const DeepCollectionEquality().hash(_ingredients));

@override
String toString() {
  return 'CreateRecipeState(title: $title, onlineLink: $onlineLink, description: $description, imageUrl: $imageUrl, isLoading: $isLoading, cookingSteps: $cookingSteps, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class _$CreateRecipeStateCopyWith<$Res> implements $CreateRecipeStateCopyWith<$Res> {
  factory _$CreateRecipeStateCopyWith(_CreateRecipeState value, $Res Function(_CreateRecipeState) _then) = __$CreateRecipeStateCopyWithImpl;
@override @useResult
$Res call({
 String title, String onlineLink, String description, String imageUrl, bool isLoading, List<CookingStep> cookingSteps, List<Ingredient> ingredients
});




}
/// @nodoc
class __$CreateRecipeStateCopyWithImpl<$Res>
    implements _$CreateRecipeStateCopyWith<$Res> {
  __$CreateRecipeStateCopyWithImpl(this._self, this._then);

  final _CreateRecipeState _self;
  final $Res Function(_CreateRecipeState) _then;

/// Create a copy of CreateRecipeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? onlineLink = null,Object? description = null,Object? imageUrl = null,Object? isLoading = null,Object? cookingSteps = null,Object? ingredients = null,}) {
  return _then(_CreateRecipeState(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,onlineLink: null == onlineLink ? _self.onlineLink : onlineLink // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,cookingSteps: null == cookingSteps ? _self._cookingSteps : cookingSteps // ignore: cast_nullable_to_non_nullable
as List<CookingStep>,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,
  ));
}


}

/// @nodoc
mixin _$FieldValidationResult {

 String get fieldName; bool get isValid; String get errorMessage;
/// Create a copy of FieldValidationResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FieldValidationResultCopyWith<FieldValidationResult> get copyWith => _$FieldValidationResultCopyWithImpl<FieldValidationResult>(this as FieldValidationResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FieldValidationResult&&(identical(other.fieldName, fieldName) || other.fieldName == fieldName)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,fieldName,isValid,errorMessage);

@override
String toString() {
  return 'FieldValidationResult(fieldName: $fieldName, isValid: $isValid, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $FieldValidationResultCopyWith<$Res>  {
  factory $FieldValidationResultCopyWith(FieldValidationResult value, $Res Function(FieldValidationResult) _then) = _$FieldValidationResultCopyWithImpl;
@useResult
$Res call({
 String fieldName, bool isValid, String errorMessage
});




}
/// @nodoc
class _$FieldValidationResultCopyWithImpl<$Res>
    implements $FieldValidationResultCopyWith<$Res> {
  _$FieldValidationResultCopyWithImpl(this._self, this._then);

  final FieldValidationResult _self;
  final $Res Function(FieldValidationResult) _then;

/// Create a copy of FieldValidationResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fieldName = null,Object? isValid = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
fieldName: null == fieldName ? _self.fieldName : fieldName // ignore: cast_nullable_to_non_nullable
as String,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _FieldValidationResult implements FieldValidationResult {
  const _FieldValidationResult({required this.fieldName, required this.isValid, required this.errorMessage});
  

@override final  String fieldName;
@override final  bool isValid;
@override final  String errorMessage;

/// Create a copy of FieldValidationResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FieldValidationResultCopyWith<_FieldValidationResult> get copyWith => __$FieldValidationResultCopyWithImpl<_FieldValidationResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FieldValidationResult&&(identical(other.fieldName, fieldName) || other.fieldName == fieldName)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,fieldName,isValid,errorMessage);

@override
String toString() {
  return 'FieldValidationResult(fieldName: $fieldName, isValid: $isValid, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$FieldValidationResultCopyWith<$Res> implements $FieldValidationResultCopyWith<$Res> {
  factory _$FieldValidationResultCopyWith(_FieldValidationResult value, $Res Function(_FieldValidationResult) _then) = __$FieldValidationResultCopyWithImpl;
@override @useResult
$Res call({
 String fieldName, bool isValid, String errorMessage
});




}
/// @nodoc
class __$FieldValidationResultCopyWithImpl<$Res>
    implements _$FieldValidationResultCopyWith<$Res> {
  __$FieldValidationResultCopyWithImpl(this._self, this._then);

  final _FieldValidationResult _self;
  final $Res Function(_FieldValidationResult) _then;

/// Create a copy of FieldValidationResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fieldName = null,Object? isValid = null,Object? errorMessage = null,}) {
  return _then(_FieldValidationResult(
fieldName: null == fieldName ? _self.fieldName : fieldName // ignore: cast_nullable_to_non_nullable
as String,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
