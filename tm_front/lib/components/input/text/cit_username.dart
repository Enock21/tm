import 'package:flutter/material.dart';
import 'package:tm_front/components/c_error_msgs.dart';
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
    final regex =
        RegExp(r'^(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]{3,20}(?<![_.])$');
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
          //Obs: teste automatico nao identificou o comportamento estranho que tava dando antes aqui. Ver isso
          if (widget.formSubmitted && (value == null || value.isEmpty)) {
            return CErrorMsgs.usernameEmpty;
          } else if (value != null && value.isNotEmpty) {
            if (value.length < 3 || value.length > 20) {
              return CErrorMsgs.usernameLength;
            }
            if (!_isValidUsernameFormat(value)) {
              return CErrorMsgs.usernameInvalid;
            }
            if (_showError && _isUsernameTaken) {
              return CErrorMsgs.usernameTaken;
            }
          }
          return null;
          //Obs: pode meter um feedback positivo pro user.
        },
      ),
    );
  }
}
