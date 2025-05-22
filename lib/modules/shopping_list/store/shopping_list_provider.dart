import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../home/store/meal_list_provider.dart';
import '../../../shared/model/ingredient_model.dart';

/// Provider that flattens and deduplicates ingredients from the meal list
final shoppingListProvider = Provider<List<Ingredient>>((ref) {
  final mealListState = ref.watch(mealListStoreProvider).valueOrNull;

  if (mealListState == null) return [];

  final meals = mealListState.adjustedList.isNotEmpty
      ? mealListState.adjustedList
      : mealListState.initialList;

  final ingredientMap = <String, Ingredient>{};

  for (final meal in meals) {
    for (final ingredient in meal.recipe.ingredients) {
      final key = ingredient.name.toLowerCase().trim();
//need to add for multiple amounts of same ingredient
      if (!ingredientMap.containsKey(key)) {
        ingredientMap[key] = ingredient;
      } else {
      }
    }
  }

  return ingredientMap.values.toList();
});

/// Helper to group ingredients by their category (with fallback)
Map<String, List<Ingredient>> groupIngredientsByCategory(List<Ingredient> ingredients) {
  return {
    'Sonstiges': ingredients,
  };
}