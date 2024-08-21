import 'package:avir_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(),
      cardColor: Colors.black.withOpacity(0.1),
      hintColor: Colors.black,
      appBarTheme: const AppBarTheme(
          color: AppColors.white,
          elevation: 0,
          centerTitle: true,
          surfaceTintColor: AppColors.white),
      textTheme: GoogleFonts.urbanistTextTheme(
        const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          bodySmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xFFF6F6F6),
        filled: true,
        hintStyle: TextStyle(color: AppColors.black, fontSize: 14),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD9D0D0))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD9D0D0))),
      ));

  static final ThemeData darkTheme = ThemeData(
      cardColor: Colors.white,
      textTheme: GoogleFonts.urbanistTextTheme(
        const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          bodySmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
        ),
      ),
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xFFF6F6F6),
        filled: true,
        hintStyle: const TextStyle(color: AppColors.black),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.black),
        ),
      ));
}
