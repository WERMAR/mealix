class Ingredient {
  const Ingredient({
    required this.id,
    required this.name,
    required this.groceryListGroup,
  });
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'] as String,
      name: json['name'] as String,
      groceryListGroup: GroceryListGroup.values.firstWhere(
        (e) => e.name == json['groceryListGroup'],
      ),
    );
  }
  final String id;
  final String name;
  final GroceryListGroup groceryListGroup;
}

enum GroceryListGroup {
  fruitsAndVegetables,
  dairyProducts,
  animalAndVegetableProducts,
  grainProductsAndBakedGoods,
  household,
  hygieneItems,
}
