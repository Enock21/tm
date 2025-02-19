import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/CITGeneric.dart';

class CITEmail extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;

  const CITEmail({super.key, this.controller, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return CITGeneric(
      hintText: 'E-mail aqui',
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
