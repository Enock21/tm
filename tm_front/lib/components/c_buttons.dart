import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tm_front/utils/u_theme.dart';

class TMButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const TMButton({
    required this.text,
    this.textStyle,
    required this.onPressed,
    this.backgroundColor = AppColors.neutralColor,
    this.textColor = AppColors.neutralColor,
    super.key,
  });

  const TMButton.positive({
    required this.text,
    this.textStyle,
    required this.onPressed,
    super.key,
  })  : backgroundColor = AppColors.interactiveMainColor,
        textColor = AppColors.positiveColor;

  const TMButton.negative({
    required this.text,
    this.textStyle,
    required this.onPressed,
    super.key,
  })  : backgroundColor = AppColors.negativeAreaColor,
        textColor = AppColors.negativeColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle?.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: GoogleFonts.montserrat().fontFamily,
            ) ??
            GoogleFonts.montserrat(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
      ),
    );
  }
}

class TMTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const TMTextButton({required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          color: AppColors.interactiveSecondColor,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.interactiveSecondColor,
        ),
      ),
    );
  }
}

class TMBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const TMBackButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 40,
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.interactiveSecondColor,
          iconSize: 35,
          onPressed: onPressed,
        ));
  }
}
