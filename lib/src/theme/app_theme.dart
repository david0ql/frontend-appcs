import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0XFF1e471b);
  static final themeData = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(color: primaryColor),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(selectedItemColor: primaryColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: primaryColor)));
}
