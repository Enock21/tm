import 'package:flutter/material.dart';
import 'package:tm_front/widgets/text_input_generic.dart';

class TextInputPassword extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;

  const TextInputPassword({Key? key, this.controller, this.prefixIcon}) : super(key: key);

  @override
  _TextInputPasswordState createState() => _TextInputPasswordState();
}

class _TextInputPasswordState extends State<TextInputPassword> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextInputGeneric(
      hintText: 'Digite a senha',
      controller: widget.controller,
      prefixIcon: widget.prefixIcon,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: Theme.of(context).primaryColor,
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