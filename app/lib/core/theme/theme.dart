import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    // fontFamily: ,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}
