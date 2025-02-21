import 'package:flutter/material.dart';

class CITUsername extends StatefulWidget {
  final TextEditingController? controller;

  const CITUsername({super.key, this.controller});

  @override
  _CITUsernameState createState() => _CITUsernameState();
}

class _CITUsernameState extends State<CITUsername> {
  bool _isUsernameTaken = false; // Simulação inicial
  bool _showError = false; // Controla exibição do erro

  final GlobalKey<FormFieldState> _usernameFieldKey = GlobalKey<FormFieldState>();

  // Simula a verificação de nome já existente
  void _checkUsernameAvailability(String username) {
    setState(() {
      _isUsernameTaken = username == "UsuarioExistente"; // Simulação local
      _showError = true;
    });

    // 🔹 Garante que a validação ocorra após a atualização do estado
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _usernameFieldKey.currentState?.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          _checkUsernameAvailability(widget.controller?.text ?? "");
        }
      },
      child: TextFormField(
        key: _usernameFieldKey, // Agora usamos a chave diretamente
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: 'Nome aqui',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
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
      ),
    );
  }
}
