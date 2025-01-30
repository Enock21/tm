import 'package:flutter/material.dart';
import 'package:tm_front/widgets/text_input_generic.dart';

class TextInputPassword extends StatefulWidget {
  const TextInputPassword({
    super.key,
    required this.hintText,
    this.validator,
    this.controller,
  });

  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  _TextInputPasswordState createState() => _TextInputPasswordState();
}

class _TextInputPasswordState extends State<TextInputPassword> {
  bool obscureTextVar = true;

  void togglePasswordVisibility() {
    setState(() {
      obscureTextVar = !obscureTextVar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextInput(
      hintText: widget.hintText,
      obscureText: obscureTextVar,
      prefixIcon: Icons.lock,
      suffixIcon: obscureTextVar ? Icons.visibility_off : Icons.visibility,
      onSuffixIconPressed: togglePasswordVisibility,
      validator: widget.validator,
      controller: widget.controller,
    );
  }
}