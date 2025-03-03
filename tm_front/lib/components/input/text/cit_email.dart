import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/cit_generic.dart';

class CITEmail extends StatefulWidget {
  static const String emailEmptyError = 'Falta o e-mail';
  static const String emailInvalidError = 'E-mail inválido';
  static const String emailTakenError = 'Já existe uma conta com este e-mail.\nPor favor escolha outro.';

  static const String registeredEmail = 'email@existente.com';

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
  bool _emailChecked = false; //É mesmo desnecessário?
  
  String get emailEmptyError => CITEmail.emailEmptyError;
  String get emailInvalidError => CITEmail.emailInvalidError;
  String get emailTakenError => CITEmail.emailTakenError;
  String get registeredEmail => CITEmail.registeredEmail;

  void _checkEmailAvailability(String email) {
    setState(() {
      _isEmailTaken = email == registeredEmail; // Simulação de e-mail já cadastrado
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
            return emailEmptyError;
          }
          if (value.isNotEmpty &&
              !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return emailInvalidError;
          }
          if (widget.isRegisterScreen && _showError && _isEmailTaken) {
            return emailTakenError;
          }
          return null;
        },
      ),
    );
  }
}
