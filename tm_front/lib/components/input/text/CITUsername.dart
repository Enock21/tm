import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/CITGeneric.dart';

class CITUsername extends StatefulWidget {
  final TextEditingController? controller;

  const CITUsername({super.key, this.controller});

  @override
  _CITUsernameState createState() => _CITUsernameState();
}

class _CITUsernameState extends State<CITUsername> {
  bool _isUsernameTaken = false;
  bool _showError = false;

  void _checkUsernameAvailability(String username) {
    setState(() {
      _isUsernameTaken = username == "UsuarioExistente"; // Simulação
      _showError = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CITGeneric(
      hintText: 'Nome aqui',
      controller: widget.controller,
      validateOnFocusLost: true, // 🔹 Agora ele valida ao perder o foco
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Falta o nome';
        }
        if (value.length < 3) {
          return 'O nome deve ter pelo menos 3 caracteres';
        }
        if (_showError && _isUsernameTaken) {
          return 'Nome já escolhido. Escolha outro.';
        }
        return null;
      },
    );
  }
}
