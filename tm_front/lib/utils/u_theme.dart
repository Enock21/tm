import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color backgroundColor = Color(0xFF1A1A1A);
  static const Color nonInteractiveMainColor = Color(0xFFBB86FC);
  static const Color nonInteractiveSecondColor = Color(0xFFB3B3B3);
  static const Color nonInteractiveGreen = Color(0xFF7BFF93);
  static const Color nonInteractiveRed = Color(0xFFCF6679);
  static const Color interactiveMainColor = Color(0xFF7B0AAF);
  static const Color interactiveSecondColor = Color.fromARGB(255, 183, 28, 255);
  static const Color positiveColor = Color(0xFF00C925);
  static const Color negativeColor = Color(0xFFCE0000);
  static const Color negativeAreaColor = Color(0xFF616161);
  static const Color neutralColor = Color(0xFFFFFFFF);
  static const Color boxColor = Color(0xFF322B47);
}

class AppTexts {
  static final TextStyle headlineLarge = GoogleFonts.getFont(
    'Berkshire Swash',
    color: AppColors.nonInteractiveMainColor,
    fontSize: 48,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle headlineMedium = GoogleFonts.montserrat(
    color: AppColors.nonInteractiveMainColor,
    fontSize: 20,
    height: 1.5,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle headlineSmall = GoogleFonts.montserrat(
    color: AppColors.nonInteractiveMainColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle bodyMedium = GoogleFonts.montserrat(
    color: AppColors.neutralColor,
    fontSize: 16,
    height: 1.5,
  );

  static final TextStyle bodyMediumBold = GoogleFonts.montserrat(
    color: AppColors.neutralColor,
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle bodySmall = GoogleFonts.montserrat(
    color: AppColors.neutralColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle labelLarge = GoogleFonts.montserrat(
    color: AppColors.neutralColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle hintText = GoogleFonts.montserrat(
    color: AppColors.nonInteractiveSecondColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle confirmationFeedback = GoogleFonts.montserrat(
    color: AppColors.positiveColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle denialFeedback = GoogleFonts.montserrat(
    color: AppColors.negativeColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}

class AppBoxes {
  static const SizedBox textVSeparator = SizedBox(height: 15);
  static const SizedBox rowVSeparator = SizedBox(height: 16);
  static const SizedBox bellowTitleVSeparator = SizedBox(height: 50);
  static const SizedBox fieldLableVSeparator = SizedBox(height: 5);
  static const SizedBox setVSeparator = SizedBox(height: 30);
  static const SizedBox sectionVSeparator = SizedBox(height: 50);

  static const SizedBox smallHBox = SizedBox(width: 8);
  static const SizedBox mediumHBox = SizedBox(width: 16);
  static const SizedBox largeHBox = SizedBox(width: 24);
  static const SizedBox smallVBox = SizedBox(height: 8);
  static const SizedBox mediumVBox = SizedBox(height: 16);
  static const SizedBox largeVBox = SizedBox(height: 24);
}
