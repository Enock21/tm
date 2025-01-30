import 'package:flutter/material.dart';

class TextInputGeneric extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final bool obscureText;

  const TextInputGeneric({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        filled: true,
        fillColor: const Color(0xFF322B47),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 14,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Colors.white,
      ),
      validator: validator,
    );
  }
}