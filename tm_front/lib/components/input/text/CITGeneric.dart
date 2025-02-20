import 'package:flutter/material.dart';
import 'package:tm_front/components/CTheme.dart';

class CITGeneric extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final ValueChanged<String>? onChanged; // Adiciona suporte ao onChanged

  const CITGeneric({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.onChanged, // Novo parâmetro onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged, // Agora o onChanged está funcional
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTexts.hintText,
        filled: true,
        fillColor: AppColors.boxColor,
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
      style: AppTexts.bodyMedium.copyWith(
        color: AppColors.neutralColor,
      ),
      validator: validator,
    );
  }
}
