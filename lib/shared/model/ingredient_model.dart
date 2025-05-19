import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/v4.dart';

part 'ingredient_model.freezed.dart';
part 'ingredient_model.g.dart';

@freezed
sealed class Ingredient with _$Ingredient {
  const factory Ingredient({
    required String id,
    required String name,
    required GroceryListGroup groceryListGroup,
  }) = _Ingredient;

  factory Ingredient.initial() {
    return Ingredient(
      id: const UuidV4().generate(),
      name: '',
      groceryListGroup: GroceryListGroup.none,
    );
  }
  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}

enum GroceryListGroup {
  none,
  fruitsAndVegetables,
  dairyProducts,
  animalAndVegetableProducts,
  grainProductsAndBakedGoods,
  household,
  hygieneItems,
}
