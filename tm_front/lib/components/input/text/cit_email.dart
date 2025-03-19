import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/cit_generic.dart';
import 'package:tm_front/utils/u_error_msgs.dart';

class CITEmail extends StatefulWidget {
  static const String registeredEmail = 'email@existente.com';

  final TextEditingController? controller;
  final Widget? prefixIcon;
  final bool isRegisterScreen;
  final bool formSubmitted;

  const CITEmail(
      {super.key,
      this.controller,
      this.prefixIcon,
      this.isRegisterScreen = false,
      required this.formSubmitted});

  @override
  _CITEmailState createState() => _CITEmailState();
}

class _CITEmailState extends State<CITEmail> {
  void _checkEmailAvailability(String email) {
    setState(() {});
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
          onChanged: (value) => _checkEmailAvailability(value),
          validator: (value) {
            if (widget.formSubmitted &&
                (value == null || value.isEmpty)) {
              return CErrorMsgs.emailEmpty;
            } else if (value != null && value.isNotEmpty) {
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return CErrorMsgs.emailInvalid;
              }
              if (widget.isRegisterScreen &&
                  value == CITEmail.registeredEmail) {
                return CErrorMsgs.emailTaken;
              }
            }
            return null;
          }), // Usa a validação ao perder o foco
    );
  }
}
