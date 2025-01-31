import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tm_front/widgets/theme.dart';

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

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle?.copyWith(color: textColor) ?? TextStyle(color: textColor),
      ),
    );
  }
}

class TMTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const TMTextButton({required this.text, required this.onPressed, Key? key}) : super(key: key);

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