import 'package:music_minds/src/config.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.white,
    dividerColor: AppColors.kPrimary2,

    /// text theme
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        fontSize: 12,
        color: AppColors.kPrimaryColor,
      ),
      titleMedium: TextStyle(
        color: AppColors.kPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      bodyLarge: TextStyle(
        color: AppColors.kPrimaryColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColors.kPrimary2,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
      bodySmall: TextStyle(
        color: AppColors.kPrimaryColor,
        fontSize: 10,
      ),
      titleSmall: TextStyle(
        color: AppColors.kPrimary2,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(),
  );
}
