import 'package:flutter/material.dart';
import 'day_meal_card.dart';

class SevenDayMealList extends StatelessWidget {
  final DateTimeRange weekRange;

  const SevenDayMealList({super.key, required this.weekRange});

  @override
  Widget build(BuildContext context) {
    final days = List.generate(
      7,
      (i) => weekRange.start.add(Duration(days: i)),
    );

    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric( horizontal: 12),
        itemCount: days.length,
        itemBuilder: (context, index) {
          final date = days[index];

          // placeholder for meal – replace with API call or state later
          final meal = 'Placeholder Meal ${index + 1}';

          return DayMealCard(
            date: date,
            mealName: meal,
            isTwoDayMeal: false, // Is that what the mockup says, 2 meal day?
          );
        },
      ),
    );
  }
}
