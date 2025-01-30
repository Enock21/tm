import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color backgroundColor = Color(0xFF1A1A1A);
  static const Color nonInteractiveMainColor = Color(0xFFBB86FC);
  static const Color interactiveMainColor = Color(0xFF7B0AAF);
  static const Color positiveColor = Color(0xFF00C925);
  static const Color negativeColor = Color(0xFFCE0000);
  static const Color neutralColor = Color(0xFFFFFFFF);
  static const Color nonInteractiveSecondColor = Color(0xFFB3B3B3);
  static const Color boxColor = Color(0xFF322B47);
}

final theme = ThemeData(
  scaffoldBackgroundColor: AppColors.backgroundColor,
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.getFont(
      'Berkshire Swash',
      color: AppColors.nonInteractiveMainColor,
      fontSize: 48,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: GoogleFonts.montserrat(
      color: AppColors.nonInteractiveMainColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: GoogleFonts.montserrat(
      color: AppColors.nonInteractiveMainColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: GoogleFonts.montserrat(
      color: AppColors.nonInteractiveMainColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: GoogleFonts.montserrat(
      color: AppColors.nonInteractiveMainColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: GoogleFonts.montserrat(
      color: AppColors.nonInteractiveMainColor,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: GoogleFonts.montserrat(
      color: AppColors.nonInteractiveSecondColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    filled: true,
    fillColor: AppColors.boxColor,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.interactiveMainColor,
      textStyle: GoogleFonts.montserrat(
        decoration: TextDecoration.underline,
        decorationColor: AppColors.interactiveMainColor,
      )
    )
  )
);