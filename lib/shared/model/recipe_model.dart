import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/v4.dart';

import '../../modules/recipes/store/recipes_provider.dart';
import 'cooking_step_model.dart';
import 'ingredient_model.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
sealed class RecipeModel with _$RecipeModel {
  const factory RecipeModel({
    required String id,
    required String title,
    required String onlineLink,
    required String description,
    required String imageUrl,
    required bool isTwoDayMeal,
    required List<CookingStep> cookingSteps,
    required List<Ingredient> ingredients,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _RecipeModel;

  factory RecipeModel.fromState(CreateRecipeState state) {
    return RecipeModel(
      id: const UuidV4().generate(),
      title: state.title,
      onlineLink: state.onlineLink,
      description: state.description,
      imageUrl: state.imageUrl,
      isTwoDayMeal: state.isTwoDayMeal,
      cookingSteps: state.cookingSteps,
      ingredients: state.ingredients,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  factory RecipeModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    print(data);
    return RecipeModel(
      id: data?['id'] as String,
      title: data?['title'] as String,
      onlineLink: data?['onlineLink'] as String,
      description: data?['description'] as String,
      imageUrl: data?['imageUrl'] as String,
      isTwoDayMeal: data?['isTwoDayMeal'] as bool,
      cookingSteps:
          (data?['cookingSteps'] as List<dynamic>)
              .map((e) => CookingStep.fromJson(e as Map<String, dynamic>))
              .toList(),
      ingredients:
          (data?['ingredients'] as List<dynamic>)
              .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
              .toList(),
      createdAt: (data?['createdAt'] as Timestamp).toDate(),
      updatedAt: (data?['updatedAt'] as Timestamp).toDate(),
    );
  }
}

extension RecipeModelX on RecipeModel {
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'onlineLink': onlineLink,
      'description': description,
      'imageUrl': imageUrl,
      'isTwoDayMeal': isTwoDayMeal,
      'cookingSteps': cookingSteps.map((e) => e.toJson()).toList(),
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
