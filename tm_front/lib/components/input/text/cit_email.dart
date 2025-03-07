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

  /// Getter para validação do e-mail
  FormFieldValidator<String> get validator => (value) {
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
  //bool _emailChecked = false;

  void _checkEmailAvailability(String email) {
    setState(() {
      //_emailChecked = true; // Marca que já verificamos o e-mail
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
          //_emailChecked = false;
          _checkEmailAvailability(value);
        },
        validator: widget.validator, // Usa a validação incorporada ao widget
      ),
    );
  }
}
