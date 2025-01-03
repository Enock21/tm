import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget 
{
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton
  (
    {
      super.key, 
      required this.text,
      required this.onPressed,
      this.backgroundColor = const Color(0xFF7B0AAF),
      this.textColor = const Color(0xFF00C925)
    }
  );

  @override
  Widget build(BuildContext context) 
  {
    return ElevatedButton
    (
      onPressed: onPressed,
      style: ElevatedButton.styleFrom
      (
        backgroundColor: backgroundColor, // Cor do retângulo
        foregroundColor: textColor, // Cor do texto
      ),
      child: Text(text),
    );
  }
}