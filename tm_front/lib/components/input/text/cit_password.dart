import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/cit_generic.dart';
import 'package:tm_front/components/c_theme.dart';

class CITPassword extends StatefulWidget {
  static const String passwordEmptyError = 'Falta a senha';
  
  final TextEditingController? controller;
  final Widget? prefixIcon;

  const CITPassword({super.key, this.controller, this.prefixIcon});

  @override
  _CITPasswordState createState() => _CITPasswordState();
}

class _CITPasswordState extends State<CITPassword> {
  bool _obscureText = true;

  String get passwordEmptyError => CITPassword.passwordEmptyError;

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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return passwordEmptyError;
        }
        return null;
      },
    );
  }
}
