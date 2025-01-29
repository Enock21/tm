import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  primaryColor: const Color(0xFFBB86FC),
  scaffoldBackgroundColor: const Color(0xFF1A1A1A),
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: GoogleFonts.montserrat(
      color: const Color(0xFF00C925),
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: GoogleFonts.montserrat(
      color: const Color(0xFF878787),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),
);