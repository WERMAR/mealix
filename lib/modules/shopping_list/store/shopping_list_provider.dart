import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

import '../../../shared/model/ingredient_model.dart';
import '../../home/pages/home_page.dart';
import '../../home/store/model/meal_model.dart';
import 'model/shopping_list_model.dart';

part 'shopping_list_provider.g.dart';

/// Provider that flattens and deduplicates ingredients from the meal list
@riverpod
class ShoppingListStore extends _$ShoppingListStore {
  @override
  Future<ShoppingList> build() async {
    final selectedWeek = ref.watch(selectedWeekProvider);

    final dayStart = DateTime(
      selectedWeek.start.year,
      selectedWeek.start.month,
      selectedWeek.start.day,
    );
    final dayEnd = dayStart.add(const Duration(days: 1));

    final response =
        await FirebaseFirestore.instance
            .collection('shoppingList')
            .where(
              'weekStart',
              isGreaterThanOrEqualTo: Timestamp.fromDate(dayStart),
            )
            .where('weekStart', isLessThan: Timestamp.fromDate(dayEnd))
            .get();

    if (response.docs.isEmpty) {
      return ShoppingList.initial();
    }
    if (response.docs.length > 1) {
      throw Exception('Multiple shopping lists found for the same week');
    }

    final shoppingList = ShoppingList.fromFirestore(response.docs.first.data());
    state = AsyncData(shoppingList);
    return shoppingList;
  }

  Future<void> createShoppingListFromMealPlan(List<Meal> mealList) async {
    final selectedWeek = ref.watch(selectedWeekProvider);
    final ingredientList =
        mealList.expand((meal) => meal.recipe.ingredients).toList();
    final groupIngredient = groupBy(
      ingredientList,
      (ingredient) => ingredient.groceryListGroup,
    );
    final reducedMap = _reduceGroupedIngredients(groupIngredient);

    final shoppingList = ShoppingList(
      id: const UuidV4().generate(),
      weekStart: selectedWeek.start,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      items:
          reducedMap.entries
              .map((entry) {
                return entry.value
                    .map(
                      (e) => ShoppingListItem.fromIngredient(
                        id: const UuidV4().generate(),
                        groceryListGroup: entry.key,
                        ingredient: e,
                        isChecked: false,
                      ),
                    )
                    .toList();
              })
              .expand((e) => e)
              .toList(),
    );

    await FirebaseFirestore.instance
        .collection('shoppingList')
        .doc(shoppingList.id)
        .set(shoppingList.toFirestore());
  }

  Map<GroceryListGroup, List<Ingredient>> _reduceGroupedIngredients(
    Map<GroceryListGroup, List<Ingredient>> input,
  ) {
    final result = <GroceryListGroup, List<Ingredient>>{};

    for (final entry in input.entries) {
      final group = entry.key;
      final ingredients = entry.value;

      final Map<String, Ingredient> reduced = {};

      for (final ing in ingredients) {
        final key = '${ing.name}_${ing.unit}';
        if (reduced.containsKey(key)) {
          final existing = reduced[key]!;
          reduced[key] = existing.copyWith(
            quantity: existing.quantity + ing.quantity,
          );
        } else {
          reduced[key] = ing;
        }
      }

      result[group] = reduced.values.toList();
    }

    return result;
  }

  Future<void> updateItem(ShoppingListItem updatedItem) async {
    final current = state.value;
    if (current == null) {
      throw Exception('Shopping list not found');
    }

    // Copy current items and replace the matching item by ID
    final updatedItems =
        current.items.map((item) {
          return item.id == updatedItem.id ? updatedItem : item;
        }).toList();

    // Update full item list in Firestore
    await FirebaseFirestore.instance
        .collection('shoppingList')
        .doc(current.id)
        .update({'items': updatedItems.map((e) => e.toFirestore()).toList()});

    // Re-fetch updated data and update state
    final response =
        await FirebaseFirestore.instance
            .collection('shoppingList')
            .doc(current.id)
            .get();

    if (!response.exists) {
      throw Exception('Shopping list not found after update');
    }

    final updatedList = ShoppingList.fromFirestore(response.data()!);
    state = AsyncData(updatedList);
  }
}

/// Helper to group ingredients by their category (with fallback)
Map<GroceryListGroup, List<MapEntry<Ingredient, int>>>
groupIngredientsByCategory(Map<Ingredient, int> counts) {
  final groups =
      counts.keys.map((ingredient) => ingredient.groceryListGroup).toList();
  final ingredientsToCategories = groupBy(
    counts.entries,
    (count) => count.key.groceryListGroup,
  );

  print(ingredientsToCategories);

  return ingredientsToCategories;
}
