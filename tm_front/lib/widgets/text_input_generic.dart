import 'package:flutter/material.dart';

/// This widget serves as a generic reference for creating custom text input fields.
/// It can be extended or modified to create specific types of input fields.

class TextInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Color hintTextColor;

  const TextInput({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.validator,
    this.controller,
    this.hintTextColor = const Color.fromARGB(255, 196, 196, 196),
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: hintTextColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: const Color(0xFF322B47),
        prefixIcon: Icon(prefixIcon, color: const Color(0xFFB3B3B3)),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon, color: const Color(0xFFB3B3B3)),
                onPressed: onSuffixIconPressed,
              )
            : null,
      ),
      style: const TextStyle(color: Colors.white),
      validator: validator,
    );
  }
}