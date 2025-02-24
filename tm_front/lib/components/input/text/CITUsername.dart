import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/CITGeneric.dart';

class CITUsername extends StatefulWidget {
  final TextEditingController? controller;
  final bool formSubmitted; // 🔹 Adicionado

  const CITUsername({super.key, this.controller, required this.formSubmitted});

  @override
  _CITUsernameState createState() => _CITUsernameState();
}

class _CITUsernameState extends State<CITUsername> {
  bool _isUsernameTaken = false;
  bool _showError = false;
  bool _formSubmitted = false; // 🔹 Novo: Indica se o botão foi pressionado

  void _checkUsernameAvailability(String username) {
    setState(() {
      _isUsernameTaken = username == "UsuarioExistente"; // Simulação
      _showError = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
        onFocusChange: (hasFocus) {
          if (!hasFocus) {
            setState(() { // 🔹 Garante que a interface atualiza ao perder o foco
              _checkUsernameAvailability(widget.controller?.text ?? "");
            });
          }
        },
        child: CITGeneric(
          hintText: 'Nome aqui',
          controller: widget.controller,
          validateOnFocusLost: true, // 🔹 Valida ao perder o foco
          onChanged: (value) => _checkUsernameAvailability(value), // 🔹 Agora valida enquanto digita
          validator: (value) {
            if (_formSubmitted && (value == null || value.isEmpty)) {
              return 'Falta o nome'; // 🔹 Só aparece se o form for enviado
            }
            if (value != null && value.length < 3) {
              return 'O nome deve ter pelo menos 3 caracteres';
            }
            if (_showError && _isUsernameTaken) {
              return 'Nome já escolhido. Escolha outro.';
            }
            return null;
          },
        ));
  }
}
