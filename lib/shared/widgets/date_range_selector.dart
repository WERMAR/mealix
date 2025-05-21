import 'package:flutter/material.dart';

class DateRangeSelector extends StatelessWidget {
  const DateRangeSelector({
    super.key,
    required this.startDate,
    required this.endDate,
    this.onPrevious,
    this.onNext,
    required this.onCalendarTap, // ✅ NEW
  });

  final DateTime startDate;
  final DateTime endDate;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final VoidCallback onCalendarTap; // ✅ NEW

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
            icon: const Icon(Icons.arrow_left, color: Colors.white),
            onPressed: onPrevious,
          ),
          Text(
            '${formatDate(startDate)} - ${formatDate(endDate)}',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_right, color: Colors.white),
            onPressed: onNext,
          ),
          const SizedBox(width: 12),
          IconButton( // ✅ Make the icon a button
            icon: const Icon(Icons.calendar_month, color: Color(0xFFDAFF08)),
            onPressed: onCalendarTap,
          ),
        ],
      ),
    );
  }
}