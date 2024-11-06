import 'package:flutter/material.dart';

ThemeData lightModeTheme() {
  return ThemeData(
    useMaterial3: true,
    // Light Mode Theme
    brightness: Brightness.light,
    primaryColor: const Color(0xFFFFCB05), // Bumble Yellow
    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 32,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color(0xFF2E2E2E), // Dark gray text
      ),
    ),

    buttonTheme: ButtonThemeData(
      buttonColor: const Color(0xFFFFCB05), // Bumble Yellow for buttons
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),

    cardTheme: CardTheme(
      color: const Color(0xFFF9F9F9), // Light gray for cards
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}

ThemeData darkModeTheme() {
  return ThemeData(
    useMaterial3: true,

    // Dark Mode Theme
    brightness: Brightness.dark,
    primaryColor: const Color(0xFFFFCB05), // Bumble Yellow (used sparingly)
    scaffoldBackgroundColor: const Color(0xFF121212),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF121212),
      iconTheme: IconThemeData(color: Colors.white),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 32,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color(0xFFD1D1D6), // Light gray text in dark mode
      ),
    ),

    buttonTheme: ButtonThemeData(
      buttonColor: const Color(0xFFFFCB05), // Bumble Yellow for buttons
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),

    cardTheme: CardTheme(
      color: const Color(0xFF1E1E1E), // Dark gray for cards in dark mode
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
