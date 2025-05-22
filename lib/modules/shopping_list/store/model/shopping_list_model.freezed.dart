// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShoppingList {

 String get id; DateTime get weekStart; DateTime get createdAt; DateTime get updatedAt; List<ShoppingListItem> get items;
/// Create a copy of ShoppingList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingListCopyWith<ShoppingList> get copyWith => _$ShoppingListCopyWithImpl<ShoppingList>(this as ShoppingList, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingList&&(identical(other.id, id) || other.id == id)&&(identical(other.weekStart, weekStart) || other.weekStart == weekStart)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,id,weekStart,createdAt,updatedAt,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ShoppingList(id: $id, weekStart: $weekStart, createdAt: $createdAt, updatedAt: $updatedAt, items: $items)';
}


}

/// @nodoc
abstract mixin class $ShoppingListCopyWith<$Res>  {
  factory $ShoppingListCopyWith(ShoppingList value, $Res Function(ShoppingList) _then) = _$ShoppingListCopyWithImpl;
@useResult
$Res call({
 String id, DateTime weekStart, DateTime createdAt, DateTime updatedAt, List<ShoppingListItem> items
});




}
/// @nodoc
class _$ShoppingListCopyWithImpl<$Res>
    implements $ShoppingListCopyWith<$Res> {
  _$ShoppingListCopyWithImpl(this._self, this._then);

  final ShoppingList _self;
  final $Res Function(ShoppingList) _then;

/// Create a copy of ShoppingList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? weekStart = null,Object? createdAt = null,Object? updatedAt = null,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,weekStart: null == weekStart ? _self.weekStart : weekStart // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ShoppingListItem>,
  ));
}

}


/// @nodoc


class _ShoppingList implements ShoppingList {
   _ShoppingList({required this.id, required this.weekStart, required this.createdAt, required this.updatedAt, required final  List<ShoppingListItem> items}): _items = items;
  

@override final  String id;
@override final  DateTime weekStart;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
 final  List<ShoppingListItem> _items;
@override List<ShoppingListItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ShoppingList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingListCopyWith<_ShoppingList> get copyWith => __$ShoppingListCopyWithImpl<_ShoppingList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingList&&(identical(other.id, id) || other.id == id)&&(identical(other.weekStart, weekStart) || other.weekStart == weekStart)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,id,weekStart,createdAt,updatedAt,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ShoppingList(id: $id, weekStart: $weekStart, createdAt: $createdAt, updatedAt: $updatedAt, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ShoppingListCopyWith<$Res> implements $ShoppingListCopyWith<$Res> {
  factory _$ShoppingListCopyWith(_ShoppingList value, $Res Function(_ShoppingList) _then) = __$ShoppingListCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime weekStart, DateTime createdAt, DateTime updatedAt, List<ShoppingListItem> items
});




}
/// @nodoc
class __$ShoppingListCopyWithImpl<$Res>
    implements _$ShoppingListCopyWith<$Res> {
  __$ShoppingListCopyWithImpl(this._self, this._then);

  final _ShoppingList _self;
  final $Res Function(_ShoppingList) _then;

/// Create a copy of ShoppingList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? weekStart = null,Object? createdAt = null,Object? updatedAt = null,Object? items = null,}) {
  return _then(_ShoppingList(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,weekStart: null == weekStart ? _self.weekStart : weekStart // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ShoppingListItem>,
  ));
}


}

/// @nodoc
mixin _$ShoppingListItem {

 String get id; GroceryListGroup get groceryListGroup; String get name; int get quantity; Unit get unit; bool get isChecked;
/// Create a copy of ShoppingListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingListItemCopyWith<ShoppingListItem> get copyWith => _$ShoppingListItemCopyWithImpl<ShoppingListItem>(this as ShoppingListItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.groceryListGroup, groceryListGroup) || other.groceryListGroup == groceryListGroup)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.isChecked, isChecked) || other.isChecked == isChecked));
}


@override
int get hashCode => Object.hash(runtimeType,id,groceryListGroup,name,quantity,unit,isChecked);

@override
String toString() {
  return 'ShoppingListItem(id: $id, groceryListGroup: $groceryListGroup, name: $name, quantity: $quantity, unit: $unit, isChecked: $isChecked)';
}


}

/// @nodoc
abstract mixin class $ShoppingListItemCopyWith<$Res>  {
  factory $ShoppingListItemCopyWith(ShoppingListItem value, $Res Function(ShoppingListItem) _then) = _$ShoppingListItemCopyWithImpl;
@useResult
$Res call({
 String id, GroceryListGroup groceryListGroup, String name, int quantity, Unit unit, bool isChecked
});




}
/// @nodoc
class _$ShoppingListItemCopyWithImpl<$Res>
    implements $ShoppingListItemCopyWith<$Res> {
  _$ShoppingListItemCopyWithImpl(this._self, this._then);

  final ShoppingListItem _self;
  final $Res Function(ShoppingListItem) _then;

/// Create a copy of ShoppingListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? groceryListGroup = null,Object? name = null,Object? quantity = null,Object? unit = null,Object? isChecked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,groceryListGroup: null == groceryListGroup ? _self.groceryListGroup : groceryListGroup // ignore: cast_nullable_to_non_nullable
as GroceryListGroup,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as Unit,isChecked: null == isChecked ? _self.isChecked : isChecked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _ShoppingListItem implements ShoppingListItem {
   _ShoppingListItem({required this.id, required this.groceryListGroup, required this.name, required this.quantity, required this.unit, required this.isChecked});
  

@override final  String id;
@override final  GroceryListGroup groceryListGroup;
@override final  String name;
@override final  int quantity;
@override final  Unit unit;
@override final  bool isChecked;

/// Create a copy of ShoppingListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingListItemCopyWith<_ShoppingListItem> get copyWith => __$ShoppingListItemCopyWithImpl<_ShoppingListItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.groceryListGroup, groceryListGroup) || other.groceryListGroup == groceryListGroup)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.isChecked, isChecked) || other.isChecked == isChecked));
}


@override
int get hashCode => Object.hash(runtimeType,id,groceryListGroup,name,quantity,unit,isChecked);

@override
String toString() {
  return 'ShoppingListItem(id: $id, groceryListGroup: $groceryListGroup, name: $name, quantity: $quantity, unit: $unit, isChecked: $isChecked)';
}


}

/// @nodoc
abstract mixin class _$ShoppingListItemCopyWith<$Res> implements $ShoppingListItemCopyWith<$Res> {
  factory _$ShoppingListItemCopyWith(_ShoppingListItem value, $Res Function(_ShoppingListItem) _then) = __$ShoppingListItemCopyWithImpl;
@override @useResult
$Res call({
 String id, GroceryListGroup groceryListGroup, String name, int quantity, Unit unit, bool isChecked
});




}
/// @nodoc
class __$ShoppingListItemCopyWithImpl<$Res>
    implements _$ShoppingListItemCopyWith<$Res> {
  __$ShoppingListItemCopyWithImpl(this._self, this._then);

  final _ShoppingListItem _self;
  final $Res Function(_ShoppingListItem) _then;

/// Create a copy of ShoppingListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? groceryListGroup = null,Object? name = null,Object? quantity = null,Object? unit = null,Object? isChecked = null,}) {
  return _then(_ShoppingListItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,groceryListGroup: null == groceryListGroup ? _self.groceryListGroup : groceryListGroup // ignore: cast_nullable_to_non_nullable
as GroceryListGroup,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as Unit,isChecked: null == isChecked ? _self.isChecked : isChecked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
