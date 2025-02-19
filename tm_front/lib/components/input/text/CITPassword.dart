import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/CITGeneric.dart';
import 'package:tm_front/components/CTheme.dart';

class CITPassword extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;

  const CITPassword(
      {super.key, this.controller, this.prefixIcon, required String hintText});

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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Falta a senha';
        }
        return null;
      },
    );
  }
}
