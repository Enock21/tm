import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/cit_generic.dart';
import 'package:tm_front/components/c_error_msgs.dart';

class CITEmail extends StatefulWidget {
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

  /// Validação ao perder o foco
  FormFieldValidator<String> get focusValidator => (value) {
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) {
          return CErrorMsgs.emailInvalid;
        }
        if (isRegisterScreen && value == registeredEmail) {
          return CErrorMsgs.emailTaken;
        }
        return null;
      };

  /// Validação ao enviar o formulário
  FormFieldValidator<String> get submitValidator => (value) {
        if (value == null || value.isEmpty) {
          return CErrorMsgs.emailEmpty;
        }
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return CErrorMsgs.emailInvalid;
        }
        if (isRegisterScreen && value == registeredEmail) {
          return CErrorMsgs.emailTaken;
        }
        return null;
      };

  @override
  _CITEmailState createState() => _CITEmailState();
}

class _CITEmailState extends State<CITEmail> {
  void _checkEmailAvailability(String email) {
    setState(() {
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
          _checkEmailAvailability(value);
        },
        validator: widget.focusValidator, // Usa a validação ao perder o foco
      ),
    );
  }
}