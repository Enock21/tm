import 'package:flutter/material.dart';
import 'package:tm_front/utils/u_error_msgs.dart';
import 'package:tm_front/components/input/text/cit_generic.dart';
import 'package:tm_front/utils/u_theme.dart';

class CITPassword extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;

  const CITPassword({super.key, this.controller, this.prefixIcon, this.validator});

  @override
  _CITPasswordState createState() => _CITPasswordState();
}

class _CITPasswordState extends State<CITPassword> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CITGeneric(
      hintText: 'Senha aqui',
      controller: widget.controller,
      prefixIcon: widget.prefixIcon,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: AppColors.interactiveSecondColor,
        ),
        onPressed: _toggleVisibility,
      ),
      // Se o validator foi passado, usa-o; caso contrário, usa o padrão que checa se o campo está vazio.
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return CErrorMsgs.passwordEmpty;
            }
            return null;
          },
    );
  }
}
