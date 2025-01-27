import 'package:flutter/material.dart';
import 'text_input_generic.dart';

class TextInputEmail extends TextInput {
  const TextInputEmail({
    Key? key,
    required String hintText,
    String? Function(String?)? validator,
    TextEditingController? controller,
  }) : super(
          key: key,
          hintText: hintText,
          obscureText: false,
          prefixIcon: Icons.email,
          validator: validator,
          controller: controller,
        );
}