import 'package:flutter/material.dart';

class DateRangeSelector extends StatelessWidget {
  const DateRangeSelector({
    super.key,
    required this.startDate,
    required this.endDate,
    this.onPrevious,
    this.onNext,
    required this.onCalendarTap,
  });

  final DateTime startDate;
  final DateTime endDate;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final VoidCallback onCalendarTap;

  @override
  Widget build(BuildContext context) {
    String formatDate(DateTime date) =>
        "${date.day}.${date.month}.${date.year}";

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_left,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: onPrevious,
          ),
          Text(
            '${formatDate(startDate)} - ${formatDate(endDate)}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 18,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_right,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: onNext,
          ),
          const SizedBox(width: 12),
          IconButton(
            icon: Icon(
              Icons.calendar_month,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: onCalendarTap,
          ),
        ],
      ),
    );

  }
}