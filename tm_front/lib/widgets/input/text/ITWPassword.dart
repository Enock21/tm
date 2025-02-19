import 'package:flutter/material.dart';
import 'package:tm_front/widgets/input/text/ITWGeneric.dart';
import 'package:tm_front/widgets/WTheme.dart';

class ITWPassword extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;

  const ITWPassword({super.key, this.controller, this.prefixIcon, required String hintText});

  @override
  _ITWPasswordState createState() => _ITWPasswordState();
}

class _ITWPasswordState extends State<ITWPassword> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ITWGeneric(
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