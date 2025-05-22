import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../helper/date_helper.dart';
import '../../../shared/model/recipe_model.dart';
import '../pages/home_page.dart';
import 'model/meal_model.dart';

part 'meal_list_provider.freezed.dart';
part 'meal_list_provider.g.dart';

@freezed
sealed class MealListState with _$MealListState {
  const factory MealListState({
    @Default(false) bool creationMode,
    @Default([]) List<Meal> initialList,
    @Default([]) List<Meal> adjustedList,
  }) = _MealListState;
}

@riverpod
class MealListStore extends _$MealListStore {
  @override
  Future<MealListState> build() async {
    ref.listen(selectedWeekProvider, (previous, next) async {
      final currState = state.valueOrNull;
      if (currState == null) {
        return;
      }
      state = const AsyncLoading();
      final newState = await _fetchRecipes(next);
      state = AsyncData(newState);
    });

    // Initialize the state with empty lists
    final range = DateHelper.getRangeForDate(DateTime.now());
    return _fetchRecipes(range);
  }

  void setCreationMode() {
    final currState = state.valueOrNull;
    if (currState == null) {
      return;
    }
    state = AsyncData(currState.copyWith(creationMode: true));
  }

  Future<MealListState> _fetchRecipes(DateTimeRange range) async {
    final mealSnapshot =
        await FirebaseFirestore.instance
            .collection('mealPlan')
            .where('date', isGreaterThanOrEqualTo: range.start)
            .where('date', isLessThan: range.end)
            .get();

    if (mealSnapshot.docs.isEmpty) {
      return const MealListState();
    }

    final recipesIds =
        mealSnapshot.docs.map((doc) => doc.data()['recipe'] as String).toList();

    final recipeSnapshot =
        await FirebaseFirestore.instance
            .collection('recipes')
            .where('id', whereIn: recipesIds)
            .get();

    final recipes =
        recipeSnapshot.docs
            .map((doc) => RecipeModel.fromFirestore(doc, null))
            .toList();

    final meals =
        mealSnapshot.docs
            .map((doc) => Meal.fromFirestore(doc.data(), recipes))
            .toList();

    return MealListState(initialList: meals, adjustedList: []);
  }
}

@freezed
sealed class CreateMealListState with _$CreateMealListState {
  const factory CreateMealListState({
    @Default([]) List<Meal> createMealList,
    @Default(0) double progress,
  }) = _CreateMealListState;
}

@riverpod
class CreateMealListStore extends _$CreateMealListStore {
  final _maxItem = 7;

  @override
  CreateMealListState build() {
    return const CreateMealListState();
  }

  void setMeal(Meal meal) {
    final updatedList = List.of(state.createMealList);
    if (updatedList.length < _maxItem) {
      updatedList.add(meal);
      state = state.copyWith(
        createMealList: updatedList,
        progress: updatedList.length / _maxItem,
      );
    }
  }

  void reorderAdjustedList(int oldIndex, int newIndex) {
    final duration = ref.watch(selectedWeekProvider);
    var newIndexCopy = newIndex;
    if (newIndex > oldIndex) {
      newIndexCopy--;
    }
    final createdList = List.of(state.createMealList);
    final meal = createdList.removeAt(oldIndex);
    createdList.insert(newIndexCopy, meal);
    for (var i = 0; i < createdList.length; i++) {
      createdList[i] = createdList[i].copyWith(
        date: _createDateFromDurationAndIndex(duration, i),
      );
    }
    state = state.copyWith(createMealList: createdList);
  }

  void addRecipeToAdjustedList(RecipeModel recipe) {
    if (state.createMealList.length + 1 > _maxItem) {
      return;
    }
    final duration = ref.watch(selectedWeekProvider);
    final createdList = List.of(state.createMealList);
    final size = createdList.length;
    createdList.add(
      Meal(
        date: _createDateFromDurationAndIndex(duration, size),
        recipe: recipe,
        changeable: false,
      ),
    );
    state = state.copyWith(
      createMealList: createdList,
      progress: createdList.length / _maxItem,
    );
  }

  void removeRecipe(int index) {
    final createdList = List.of(state.createMealList);
    createdList.removeAt(index);
    state = state.copyWith(
      createMealList: createdList,
      progress: createdList.length / _maxItem,
    );
  }

  Future<void> saveMealListPlan() async {
    final mappedMealPlan =
        state.createMealList.map((e) => e.toFirestore()).toList();
    mappedMealPlan.forEach((meal) {
      print(meal['date']);
    });
    final batchRef = FirebaseFirestore.instance.batch();
    for (final meal in mappedMealPlan) {
      final docRef = FirebaseFirestore.instance.collection('mealPlan').doc();
      batchRef.set(docRef, meal);
    }
    await batchRef.commit();
  }

  DateTime _createDateFromDurationAndIndex(DateTimeRange range, int index) {
    return DateTime(
      range.start.year,
      range.start.month,
      range.start.day + index,
    );
  }
}
