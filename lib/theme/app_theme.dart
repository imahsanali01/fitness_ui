import 'package:flutter/material.dart';

class AppTheme {
  // Colors from the design
  static const Color backgroundBlack = Color(0xFF000000);
  static const Color cardDark = Color(0xFF1A1A1A);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textGray = Color(0xFF808080);

  // Gradient colors for mood selector
  static const Color gradientPink = Color(0xFFFF6B9D);
  static const Color gradientOrange = Color(0xFFFF9B71);
  static const Color gradientCyan = Color(0xFF71E9D9);
  static const Color gradientPurple = Color(0xFFB794F6);

  // Accent colors
  static const Color accentGreen = Color(0xFF4ECDC4);
  static const Color accentBlue = Color(0xFF6B9DFF);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundBlack,
    primaryColor: accentGreen,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundBlack,
      elevation: 0,
      iconTheme: IconThemeData(color: textWhite),
      titleTextStyle: TextStyle(
        color: textWhite,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    cardTheme: CardThemeData(
      color: cardDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: textWhite,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: textWhite,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: textWhite,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        color: textWhite,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: textWhite,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: textWhite,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: textWhite,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: textWhite,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: textGray,
        fontSize: 12,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: textWhite,
        foregroundColor: backgroundBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundBlack,
      selectedItemColor: textWhite,
      unselectedItemColor: textGray,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
  );
}
