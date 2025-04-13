import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData get basic => ThemeData(
        fontFamily: 'GothamPro',
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColors.pink.withAlpha(90),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        scaffoldBackgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 34,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
          titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          titleSmall: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      );
}

abstract final class AppColors {
  static const pink = Color(0xFFE961FF);
  static const cyan = Color(0xFF00E5E5);
  static const blue = Color(0xFF72A5F2);
  static const purple = Color(0xFF859AF4);
  static final darkBlueWithAlpha = const Color(0xFF091522).withAlpha(200);
}
