import 'package:flutter/material.dart';

class ThemeManager {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF161C29),
    primaryColor: const Color(0xFF242F49),
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF242F49),
      secondary: Color(0xFFDAFF08),
      surface: Color(0xFF161C29),
    ),
    iconTheme: const IconThemeData(color: Color(0xFFDAFF08)),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 20),
      bodyMedium: TextStyle(fontSize: 16),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: const Color(0xFFF5F5F5),
    colorScheme: ColorScheme.light(
      primary: Color(0xFFF5F5F5),
      secondary: Color(0xFF4C0082),
      surface: Color.fromARGB(255, 223, 220, 220),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF4C0082)),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 20),
      bodyMedium: TextStyle(fontSize: 16),
    ),
  );
}
