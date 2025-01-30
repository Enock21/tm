import 'package:flutter/material.dart';

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
    this.backgroundColor = const Color(0xFF7B0AAF),
    this.textColor = const Color(0xFF00C925),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // Cor de fundo
        foregroundColor: textColor, // Cor do texto
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