import 'package:flutter/material.dart';
import 'package:tm_front/utils/u_theme.dart';

class CITLong extends StatefulWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool validateOnFocusLost;

  const CITLong({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.onChanged,
    this.validateOnFocusLost = false,
  }) : super(key: key);

  @override
  _CITLongState createState() => _CITLongState();
}

class _CITLongState extends State<CITLong> {
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus && widget.validateOnFocusLost) {
          _fieldKey.currentState?.validate();
        }
      },
      // Envolvemos o TextFormField em um Container com altura fixa
      // e usamos um Scrollbar com SingleChildScrollView na direção vertical.
      child: Container(
        height: 200, // Define uma altura fixa para limitar o campo
        child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: TextFormField(
              key: _fieldKey,
              controller: widget.controller,
              onChanged: widget.onChanged,
              onFieldSubmitted: (value) {
                _fieldKey.currentState?.validate();
              },
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: AppTexts.hintText,
                filled: true,
                fillColor: AppColors.boxColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 14,
                ),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
              ),
              style: const TextStyle(color: Colors.white),
              validator: widget.validator,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              minLines: 5,
              maxLines: null, // Permite que o campo expanda conforme o conteúdo
            ),
          ),
        ),
      ),
    );
  }
}
