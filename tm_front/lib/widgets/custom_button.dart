import 'package:flutter/material.dart';
import 'package:tm_front/widgets/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton({
    required this.text,
    this.textStyle,
    required this.onPressed,
    this.backgroundColor = AppColors.interactiveMainColor,
    this.textColor = AppColors.positiveColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
      ),
      child: Text(
        text,
        style: textStyle ?? Theme.of(context).textTheme.labelLarge?.copyWith(
              fontFamily: 'Montserrat',
              color: textColor,
            ),
      ),
    );
  }
}