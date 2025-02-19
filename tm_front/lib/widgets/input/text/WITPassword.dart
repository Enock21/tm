import 'package:flutter/material.dart';
import 'package:tm_front/widgets/input/text/WITGeneric.dart';
import 'package:tm_front/widgets/WTheme.dart';

class WITPassword extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;

  const WITPassword({super.key, this.controller, this.prefixIcon, required String hintText});

  @override
  _WITPasswordState createState() => _WITPasswordState();
}

class _WITPasswordState extends State<WITPassword> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WITGeneric(
      hintText: 'Senha aqui',
      controller: widget.controller,
      prefixIcon: widget.prefixIcon,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: AppColors.interactiveMainColor,
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