import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/model/recipe_model.dart';

part 'meal_model.freezed.dart';

@freezed
sealed class Meal with _$Meal {
  const factory Meal({
    required RecipeModel recipe,
    required DateTime date,
    required bool changeable,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Meal;

  factory Meal.fromFirestore(
    Map<String, dynamic> data,
    List<RecipeModel> recipes,
  ) {
    return Meal(
      recipe: recipes.firstWhere(
        (element) => element.id == data['recipe'] as String,
      ),
      date: (data['date'] as Timestamp).toDate(),
      changeable: false,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }
}

extension MealX on Meal {
  Map<String, dynamic> toFirestore() {
    return {
      'date': date,
      'recipe': recipe.id,
      'createdAt': DateTime.now(),
      'updatedAt': DateTime.now(),
    };
  }
}
