// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => _RecipeModel(
  title: json['title'] as String,
  onlineLink: json['onlineLink'] as String,
  description: json['description'] as String,
  imageUrl: json['imageUrl'] as String,
  isTwoDayMeal: json['isTwoDayMeal'] as bool,
  cookingSteps:
      (json['cookingSteps'] as List<dynamic>)
          .map((e) => CookingStep.fromJson(e as Map<String, dynamic>))
          .toList(),
  ingredients:
      (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$RecipeModelToJson(_RecipeModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'onlineLink': instance.onlineLink,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'isTwoDayMeal': instance.isTwoDayMeal,
      'cookingSteps': instance.cookingSteps,
      'ingredients': instance.ingredients,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
