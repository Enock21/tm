import 'package:flutter/material.dart';
import 'text_input_generic.dart';

class TextInputEmail extends TextInput {
  const TextInputEmail({
    super.key,
    required super.hintText,
    super.validator,
    super.controller,
  }) : super(
          obscureText: false,
          prefixIcon: Icons.email,
        );
}