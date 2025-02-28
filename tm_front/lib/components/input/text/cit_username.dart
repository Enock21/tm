import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/cit_generic.dart';

class CITUsername extends StatefulWidget {
  final TextEditingController? controller;
  final bool formSubmitted;

  const CITUsername({super.key, this.controller, required this.formSubmitted});

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

  bool _isValidUsernameFormat(String username) {
    final regex = RegExp(r'^(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]{3,20}(?<![_.])$');
    return regex.hasMatch(username);
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
            _checkUsernameAvailability(widget.controller?.text ?? "");
        }
      },
      child: CITGeneric(
        hintText: 'Nome aqui',
        controller: widget.controller,
        validateOnFocusLost: true,
        onChanged: (value) => _checkUsernameAvailability(value),
        validator: (value) {
          if (widget.formSubmitted && (value == null || value.isEmpty)) {
            return 'Falta o nome';
          }
          if (value != null) {
            if (value.length < 3 || value.length > 20) {
              return 'O nome deve ter entre 3 e 20 caracteres';
            }
            if (!_isValidUsernameFormat(value)) {
              return 'Formato inválido.';
            }
          }
          if (_showError && _isUsernameTaken) {
            return 'Nome já escolhido. Por favor escolha outro.';
          }
          return null;
        },
      ),
    );
  }
}
