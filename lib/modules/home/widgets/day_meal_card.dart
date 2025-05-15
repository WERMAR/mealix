import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class DayMealCard extends StatelessWidget {
  DayMealCard({
    super.key,
    required DateTime date,
    required this.mealName,
    this.isTwoDayMeal = false,
  }) : dayName = DateFormat.EEEE(Platform.localeName).format(date),
       date = DateFormat.yMd(Platform.localeName).format(date);

  final String dayName;
  final String date;
  final String mealName;
  final bool isTwoDayMeal;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
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
              '${AppLocalizations.of(context)!.dish}: $mealName',
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
                child: Text(
                  AppLocalizations.of(context)!.twoDayMeal,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.white),
      ),
    );
  }
}
