import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekViewCalendar extends StatelessWidget {
  final DateTimeRange selectedWeek;
  final VoidCallback onPreviousWeek;
  final VoidCallback onNextWeek;
  final VoidCallback onCalendarTap;

  const WeekViewCalendar({
    super.key,
    required this.selectedWeek,
    required this.onPreviousWeek,
    required this.onNextWeek,
    required this.onCalendarTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryColor = theme.colorScheme.secondary;
    final formatter = DateFormat('dd.MM.yyyy');

    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_left, color: theme.iconTheme.color),
            onPressed: onPreviousWeek,
          ),
          GestureDetector(
            onTap: onCalendarTap,
            child: Text(
              '${formatter.format(selectedWeek.start)} - ${formatter.format(selectedWeek.end)}',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_right, color: theme.iconTheme.color),
            onPressed: onNextWeek,
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.calendar_month, size: 22),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: onCalendarTap,
          ),

        ],
      ),
    );
  }
}