import 'package:flutter/material.dart';

class TextInputPassword extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validator;
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
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureTextVar,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: const Color(0xFF322B47),
        prefixIcon: const Icon(Icons.lock, color: Color(0xFFB3B3B3)),
        suffixIcon: IconButton(
          icon: Icon(
            obscureTextVar ? Icons.visibility_off : Icons.visibility,
            color: const Color(0xFFB3B3B3),
          ),
          onPressed: togglePasswordVisibility,
        ),
      ),
      style: const TextStyle(color: Colors.white),
      validator: widget.validator,
    );
  }
}
