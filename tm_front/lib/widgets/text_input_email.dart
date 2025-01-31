import 'package:flutter/material.dart';
import 'package:tm_front/widgets/text_input_generic.dart';

class TextInputEmail extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;

  const TextInputEmail({super.key, this.controller, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextInputGeneric(
      hintText: 'Digite o e-mail',
      controller: controller,
      prefixIcon: prefixIcon,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Falta o e-mail';
        }
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'E-mail inválido';
        }
        return null;
      },
    );
  }
}