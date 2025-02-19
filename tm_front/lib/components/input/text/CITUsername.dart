import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/CITGeneric.dart';

class CITUsername extends StatelessWidget {
  final TextEditingController? controller;

  const CITUsername({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return CITGeneric(
      hintText: 'Nome de usuário aqui',
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Falta o nome';
        }
        if (value.length < 3) {
          return 'O nome deve ter pelo menos 3 caracteres';
        }
        return null;
      },
    );
  }
}
