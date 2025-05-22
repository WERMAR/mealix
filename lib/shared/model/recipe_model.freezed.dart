// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeModel {

 String get id; String get title; String get onlineLink; String get description; String get imageUrl; bool get isTwoDayMeal; List<CookingStep> get cookingSteps; List<Ingredient> get ingredients; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of RecipeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeModelCopyWith<RecipeModel> get copyWith => _$RecipeModelCopyWithImpl<RecipeModel>(this as RecipeModel, _$identity);

  /// Serializes this RecipeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.onlineLink, onlineLink) || other.onlineLink == onlineLink)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isTwoDayMeal, isTwoDayMeal) || other.isTwoDayMeal == isTwoDayMeal)&&const DeepCollectionEquality().equals(other.cookingSteps, cookingSteps)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,onlineLink,description,imageUrl,isTwoDayMeal,const DeepCollectionEquality().hash(cookingSteps),const DeepCollectionEquality().hash(ingredients),createdAt,updatedAt);

@override
String toString() {
  return 'RecipeModel(id: $id, title: $title, onlineLink: $onlineLink, description: $description, imageUrl: $imageUrl, isTwoDayMeal: $isTwoDayMeal, cookingSteps: $cookingSteps, ingredients: $ingredients, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RecipeModelCopyWith<$Res>  {
  factory $RecipeModelCopyWith(RecipeModel value, $Res Function(RecipeModel) _then) = _$RecipeModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String onlineLink, String description, String imageUrl, bool isTwoDayMeal, List<CookingStep> cookingSteps, List<Ingredient> ingredients, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$RecipeModelCopyWithImpl<$Res>
    implements $RecipeModelCopyWith<$Res> {
  _$RecipeModelCopyWithImpl(this._self, this._then);

  final RecipeModel _self;
  final $Res Function(RecipeModel) _then;

/// Create a copy of RecipeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? onlineLink = null,Object? description = null,Object? imageUrl = null,Object? isTwoDayMeal = null,Object? cookingSteps = null,Object? ingredients = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,onlineLink: null == onlineLink ? _self.onlineLink : onlineLink // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,isTwoDayMeal: null == isTwoDayMeal ? _self.isTwoDayMeal : isTwoDayMeal // ignore: cast_nullable_to_non_nullable
as bool,cookingSteps: null == cookingSteps ? _self.cookingSteps : cookingSteps // ignore: cast_nullable_to_non_nullable
as List<CookingStep>,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RecipeModel implements RecipeModel {
  const _RecipeModel({required this.id, required this.title, required this.onlineLink, required this.description, required this.imageUrl, required this.isTwoDayMeal, required final  List<CookingStep> cookingSteps, required final  List<Ingredient> ingredients, required this.createdAt, required this.updatedAt}): _cookingSteps = cookingSteps,_ingredients = ingredients;
  factory _RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String onlineLink;
@override final  String description;
@override final  String imageUrl;
@override final  bool isTwoDayMeal;
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

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of RecipeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeModelCopyWith<_RecipeModel> get copyWith => __$RecipeModelCopyWithImpl<_RecipeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.onlineLink, onlineLink) || other.onlineLink == onlineLink)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isTwoDayMeal, isTwoDayMeal) || other.isTwoDayMeal == isTwoDayMeal)&&const DeepCollectionEquality().equals(other._cookingSteps, _cookingSteps)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,onlineLink,description,imageUrl,isTwoDayMeal,const DeepCollectionEquality().hash(_cookingSteps),const DeepCollectionEquality().hash(_ingredients),createdAt,updatedAt);

@override
String toString() {
  return 'RecipeModel(id: $id, title: $title, onlineLink: $onlineLink, description: $description, imageUrl: $imageUrl, isTwoDayMeal: $isTwoDayMeal, cookingSteps: $cookingSteps, ingredients: $ingredients, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RecipeModelCopyWith<$Res> implements $RecipeModelCopyWith<$Res> {
  factory _$RecipeModelCopyWith(_RecipeModel value, $Res Function(_RecipeModel) _then) = __$RecipeModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String onlineLink, String description, String imageUrl, bool isTwoDayMeal, List<CookingStep> cookingSteps, List<Ingredient> ingredients, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$RecipeModelCopyWithImpl<$Res>
    implements _$RecipeModelCopyWith<$Res> {
  __$RecipeModelCopyWithImpl(this._self, this._then);

  final _RecipeModel _self;
  final $Res Function(_RecipeModel) _then;

/// Create a copy of RecipeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? onlineLink = null,Object? description = null,Object? imageUrl = null,Object? isTwoDayMeal = null,Object? cookingSteps = null,Object? ingredients = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_RecipeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,onlineLink: null == onlineLink ? _self.onlineLink : onlineLink // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,isTwoDayMeal: null == isTwoDayMeal ? _self.isTwoDayMeal : isTwoDayMeal // ignore: cast_nullable_to_non_nullable
as bool,cookingSteps: null == cookingSteps ? _self._cookingSteps : cookingSteps // ignore: cast_nullable_to_non_nullable
as List<CookingStep>,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
