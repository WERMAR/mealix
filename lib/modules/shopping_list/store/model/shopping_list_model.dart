import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/v4.dart';

import '../../../../shared/model/ingredient_model.dart';

part 'shopping_list_model.freezed.dart';

@freezed
sealed class ShoppingList with _$ShoppingList {
  factory ShoppingList({
    required String id,
    required DateTime weekStart,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<ShoppingListItem> items,
  }) = _ShoppingList;

  factory ShoppingList.initial() => ShoppingList(
    id: '',
    weekStart: DateTime.now(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    items: [],
  );

  factory ShoppingList.fromFirestore(Map<String, dynamic> data) {
    return ShoppingList(
      id: data['id'] as String,
      weekStart: (data['weekStart'] as Timestamp).toDate(),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
      items:
          (data['items'] as List)
              .map(
                (item) => ShoppingListItem.fromFirestore(
                  item as Map<String, dynamic>,
                ),
              )
              .toList(),
    );
  }
}

@freezed
sealed class ShoppingListItem with _$ShoppingListItem {
  factory ShoppingListItem({
    required String id,
    required GroceryListGroup groceryListGroup,
    required String name,
    required int quantity,
    required Unit unit,
    required bool isChecked,
  }) = _ShoppingListItem;

  factory ShoppingListItem.empty() => ShoppingListItem(
    id: const UuidV4().generate(),
    name: '',
    groceryListGroup: GroceryListGroup.none,
    quantity: 0,
    unit: Unit.piece,
    isChecked: false,
  );

  factory ShoppingListItem.fromIngredient({
    required String id,
    required GroceryListGroup groceryListGroup,
    required Ingredient ingredient,
    required bool isChecked,
  }) {
    return ShoppingListItem(
      id: id,
      groceryListGroup: groceryListGroup,
      name: ingredient.name,
      quantity: ingredient.quantity,
      unit: ingredient.unit,
      isChecked: isChecked,
    );
  }

  factory ShoppingListItem.fromFirestore(Map<String, dynamic> data) {
    return ShoppingListItem(
      id: data['id'] as String,
      groceryListGroup: GroceryListGroup.values.firstWhere(
        (element) => element.name == data['groceryListGroup'] as String,
      ),
      name: data['name'] as String,
      quantity: data['quantity'] as int,
      unit: Unit.values.firstWhere(
        (element) => element.name == data['unit'] as String,
      ),
      isChecked: data['isChecked'] as bool,
    );
  }
}

enum Unit { g, kg, l, ml, piece }

extension ShppingListItemX on ShoppingListItem {
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'groceryListGroup': groceryListGroup.name,
      'quantity': quantity,
      'unit': unit.name,
      'isChecked': isChecked,
    };
  }
}

extension ShoppingListX on ShoppingList {
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'weekStart': weekStart,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'items': items.map((item) => item.toFirestore()).toList(),
    };
  }
}
