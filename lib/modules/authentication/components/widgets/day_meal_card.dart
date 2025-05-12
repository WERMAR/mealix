import 'package:flutter/material.dart';

class DayMealCard extends StatelessWidget {
  final String dayName;
  final String date;
  final String mealName;
  final bool isTwoDayMeal;

  const DayMealCard({
    super.key,
    required this.dayName,
    required this.date,
    required this.mealName,
    this.isTwoDayMeal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF242F49),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          '$dayName: $date',
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gericht: $mealName',
              style: const TextStyle(color: Colors.white70),
            ),
            if (isTwoDayMeal)
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '2-Tage-Gericht',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.white),
      ),
    );
  }
}
