import 'package:flutter/material.dart';

class AppTheme {
  static const verticalGap10 = SizedBox(height: 10);
  static const verticalGap20 = SizedBox(height: 20);
  static const verticalGap30 = SizedBox(height: 30);
  static const verticalGap50 = SizedBox(height: 50);
  static const verticalGap100 = SizedBox(height: 100);
  static const horizontalGap10 = SizedBox(width: 10);
  static const horizontalGap20 = SizedBox(width: 20);
  static const horizontalGap30 = SizedBox(width: 30);
  static const horizontalGap50 = SizedBox(width: 50);
  static const horizontalGap100 = SizedBox(width: 100);

// border decoration
  static InputDecoration inputDecoration({required Text label}) {
    return InputDecoration(
        label: label,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(width: 1, color: Colors.blue)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(width: 1, color: Colors.blue)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(width: 1, color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(width: 1, color: Colors.red)),
        contentPadding: const EdgeInsets.all(10));
  }

// main theme
  static ThemeData lightThemeData = ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black54),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green))),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.green));

  static ThemeData darkThemeData = ThemeData(
      drawerTheme: DrawerThemeData(
        backgroundColor: Colors.grey.shade700,
      ),
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      dividerColor: Colors.black54,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey, unselectedItemColor: Colors.white),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.grey),
      )));
}
