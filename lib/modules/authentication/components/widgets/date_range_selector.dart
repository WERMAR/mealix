import 'package:flutter/material.dart';

class DateRangeSelector extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  const DateRangeSelector({
    super.key,
    required this.startDate,
    required this.endDate,
    this.onPrevious,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    String formatDate(DateTime date) =>
        "${date.day}.${date.month}.${date.year}";

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
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
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text("Not sure how to do this"),
                      content: const Text("Need to implement calendar."),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
              );
            },
            child: const Icon(Icons.calendar_month, color: Color(0xFFDAFF08)),
          ),
        ],
      ),
    );
  }
}
