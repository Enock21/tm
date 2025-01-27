import 'package:flutter/material.dart';

class CustomTextInputEmail extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextInputEmail({
    Key? key,
    required this.hintText,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: const Color(0xFF322B47),
        prefixIcon: const Icon(Icons.email, color: Color(0xFFB3B3B3)),
      ),
      style: const TextStyle(color: Colors.white),
      validator: validator,
    );
  }
}
