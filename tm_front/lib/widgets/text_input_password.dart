import 'package:flutter/material.dart';
import 'package:tm_front/widgets/text_input_generic.dart';

class TextInputPassword extends StatefulWidget {
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  const TextInputPassword({
    Key? key,
    required this.hintText,
    this.validator,
    this.controller,
  }) : super(key: key);

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
    return TextInputGeneric(
      hintText: widget.hintText,
      obscureText: obscureTextVar,
      prefixIcon: Icon(Icons.lock, color: Theme.of(context).primaryColor),
      suffixIcon: IconButton(
        icon: Icon(
          obscureTextVar ? Icons.visibility_off : Icons.visibility,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: togglePasswordVisibility,
      ),
      validator: widget.validator,
      controller: widget.controller,
    );
  }
}