import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/cit_generic.dart';

class CITEmail extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final bool isRegisterScreen;

  const CITEmail({
    super.key,
    this.controller,
    this.prefixIcon,
    this.isRegisterScreen = false,
  });

  @override
  _CITEmailState createState() => _CITEmailState();
}

class _CITEmailState extends State<CITEmail> {
  bool _isEmailTaken = false;
  bool _showError = false;
  bool _emailChecked = false;

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
        if (!hasFocus && widget.isRegisterScreen) {
          _checkEmailAvailability(widget.controller?.text ?? "");
        }
      },
      child: CITGeneric(
        hintText: 'E-mail aqui',
        prefixIcon: widget.prefixIcon,
        controller: widget.controller,
        validateOnFocusLost: true,
        onChanged: (value) {
          _emailChecked = false;
          _checkEmailAvailability(value);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Falta o e-mail';
          }
          if (value.isNotEmpty &&
              !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return 'E-mail inválido';
          }
          if (widget.isRegisterScreen && _showError && _isEmailTaken) {
            return 'Já existe uma conta com este e-mail.\nPor favor escolha outro.';
          }
          return null;
        },
      ),
    );
  }
}
