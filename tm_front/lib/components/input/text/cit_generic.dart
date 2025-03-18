import 'package:flutter/material.dart';
import 'package:tm_front/components/c_theme.dart';

class CITGeneric extends StatefulWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final bool validateOnFocusLost;

  const CITGeneric({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.onChanged,
    this.validateOnFocusLost = false,
  });

  @override
  _CITGenericState createState() => _CITGenericState();
}

class _CITGenericState extends State<CITGeneric> {
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey<FormFieldState>(); // 🔹 Chave do campo

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) { //Obs: Isso aqui é realmente necessário?
        if (!hasFocus && widget.validateOnFocusLost) {
          _fieldKey.currentState?.validate();
        }
      },

      child: TextFormField(
        key: _fieldKey, // 🔹 Associa a chave ao campo
        controller: widget.controller,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        onFieldSubmitted: (value) {
            _fieldKey.currentState?.validate(); // 🔹 Valida a ser submetido
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
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
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
        ),
        style: AppTexts.bodyMedium.copyWith(
          color: AppColors.neutralColor,
        ),
        validator: widget.validator, // 🔹 Cada `CIT` pode definir sua validação
      ),
    );
  }
}
