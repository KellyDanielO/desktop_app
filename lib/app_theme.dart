import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData light = ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: AppColors.mainBgLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.mainBgLight,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.mainColorLight,
      ),
    ),
  );
  static ThemeData dark = ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: AppColors.mainBgDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.mainBgDark,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.mainColorDark,
      ),
    ),
  );
}
