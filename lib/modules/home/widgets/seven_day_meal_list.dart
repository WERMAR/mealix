import 'dart:ui';

import 'package:flutter/material.dart';
import '../store/model/meal_model.dart';
import 'day_meal_card.dart';

class SevenDayMealList extends StatelessWidget {
  const SevenDayMealList({super.key, required this.meals});

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final Color oddItemColor = colorScheme.secondary.withAlpha(5);
    final Color evenItemColor = colorScheme.secondary.withAlpha(15);
    final Color draggableItemColor = colorScheme.secondary;

    Widget proxyDecorator(
      Widget child,
      int index,
      Animation<double> animation,
    ) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double elevation = lerpDouble(0, 6, animValue)!;
          return Material(
            elevation: elevation,
            color: draggableItemColor,
            shadowColor: draggableItemColor,
            child: child,
          );
        },
        child: child,
      );
    }

    return Expanded(
      child: ReorderableListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          for (int i = 0; i < meals.length; i++)
            DayMealCard(
              key: ValueKey('$i'),
              date: meals[i].date,
              mealName: meals[i].recipe.title,
              isTwoDayMeal: false, // Is that what the mockup says, 2 meal day?
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          if (newIndex > oldIndex) {
            newIndex--;
          }
          //final movedItem = days.removeAt(oldIndex);
          //days.insert(newIndex, movedItem);
        },
      ),
    );
  }
}
