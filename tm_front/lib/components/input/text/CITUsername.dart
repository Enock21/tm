import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/CITGeneric.dart';

class CITUsername extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool isUsernameTaken;

  const CITUsername({
    super.key,
    this.controller,
    this.onChanged,
    this.isUsernameTaken = false,
  });

  @override
  _CITUsernameState createState() => _CITUsernameState();
}

class _CITUsernameState extends State<CITUsername> {
  @override
  Widget build(BuildContext context) {
    return CITGeneric(
      hintText: 'Nome aqui',
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Falta o nome';
        }
        if (value.length < 3) {
          return 'O nome deve ter pelo menos 3 caracteres';
        }
        if (widget.isUsernameTaken) {
          return 'Nome já escolhido. Escolha outro.';
        }
        return null;
      },
    );
  }
}
