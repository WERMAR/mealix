// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ingredient _$IngredientFromJson(Map<String, dynamic> json) => _Ingredient(
  id: json['id'] as String,
  name: json['name'] as String,
  groceryListGroup: $enumDecode(
    _$GroceryListGroupEnumMap,
    json['groceryListGroup'],
  ),
);

Map<String, dynamic> _$IngredientToJson(_Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'groceryListGroup': _$GroceryListGroupEnumMap[instance.groceryListGroup]!,
    };

const _$GroceryListGroupEnumMap = {
  GroceryListGroup.none: 'none',
  GroceryListGroup.fruitsAndVegetables: 'fruitsAndVegetables',
  GroceryListGroup.dairyProducts: 'dairyProducts',
  GroceryListGroup.animalAndVegetableProducts: 'animalAndVegetableProducts',
  GroceryListGroup.grainProductsAndBakedGoods: 'grainProductsAndBakedGoods',
  GroceryListGroup.household: 'household',
  GroceryListGroup.hygieneItems: 'hygieneItems',
};
