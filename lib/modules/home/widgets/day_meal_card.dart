import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class DayMealCard extends StatelessWidget {
  final DateTime date;
  final String mealName;
  final bool isTwoDayMeal;

  const DayMealCard({
    super.key,
    required this.date,
    required this.mealName,
    this.isTwoDayMeal = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final weekday = DateFormat('EEEE').format(date); //auto, should change weekday to german etc
    final formattedDate = DateFormat('dd.MM.yyyy').format(date);

    return Card(
      color: theme.colorScheme.primary,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          '$weekday: $formattedDate',
          style: theme.textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('${AppLocalizations.of(context)!.dish}: $mealName', style: theme.textTheme.bodySmall),
            if (isTwoDayMeal)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.shade700,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.twoDayMeal,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
        trailing: Icon(Icons.chevron_right, color: theme.iconTheme.color),
        onTap: () {
          showDialog(
            context: context,
            builder:
                (_) => AlertDialog(
              title: Text('Meal for $weekday'),
              content: Text('Details for: $mealName'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(AppLocalizations.of(context)!.close),

                ),
              ],
            ),
          );
        },
      ),
    );
  }
}