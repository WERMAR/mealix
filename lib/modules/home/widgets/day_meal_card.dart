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
    final local = AppLocalizations.of(context)!;

    final weekday = DateFormat('EEEE', local.localeName).format(date);
    final formattedDate = DateFormat('dd.MM.yyyy', local.localeName).format(date);

    return Card(
      color: theme.colorScheme.primary.withOpacity(0.95),
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        title: Text(
          '$weekday: $formattedDate',
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Text(
              '${local.dish}: $mealName',
              style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white70),

            ),
            if (isTwoDayMeal)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.shade700,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    local.twoDayMeal,
                    style: theme.textTheme.labelSmall?.copyWith(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
        trailing: Icon(Icons.chevron_right, color: theme.colorScheme.secondary),
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('${local.dish} ($weekday)'),
              content: Text('Details for: $mealName'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(local.close),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
