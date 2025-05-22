import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DateHelper {
  static DateTimeRange getRangeForDate(DateTime date) {
    final startOfWeek = date.subtract(Duration(days: date.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    return DateTimeRange(start: startOfWeek, end: endOfWeek);
  }

  static String getFormattedDate(
    BuildContext context,
    String format,
    DateTime date,
  ) {
    final local = AppLocalizations.of(context)!;
    return DateFormat(format, local.localeName).format(date);
  }
}
