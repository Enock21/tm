import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/CITGeneric.dart';

class CITEmail extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final bool isLoginMode;
  final bool formSubmitted;

  const CITEmail({
    super.key,
    this.controller,
    this.prefixIcon,
    this.isLoginMode = false,
    required this.formSubmitted,
  });

  @override
  _CITEmailState createState() => _CITEmailState();
}

class _CITEmailState extends State<CITEmail> {
  bool _isEmailTaken = false;
  bool _showError = false;

  void _checkEmailAvailability(String email) {
    setState(() {
      _isEmailTaken = email == "email@existente.com"; // Simulação
      _showError = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus && !widget.isLoginMode) {
          _checkEmailAvailability(widget.controller?.text ?? "");
        }
      },
      child: CITGeneric(
        hintText: 'E-mail aqui',
        prefixIcon: widget.prefixIcon,
        controller: widget.controller,
        validateOnFocusLost: true,
        onChanged: (value) => _checkEmailAvailability(value),
        validator: (value) {
          if (widget.formSubmitted && (value == null || value.isEmpty)) {
            return 'Falta o e-mail';
          }
          if (value != null &&
              value.isNotEmpty &&
              !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            print(value);
            print('TEST');
            return 'E-mail inválido';
          }
          if (!widget.isLoginMode && _showError && _isEmailTaken) {
            return 'Já existe uma conta com este e-mail.\nPor favor escolha outro.';
          }
          return null;
        },
      ),
    );
  }
}
