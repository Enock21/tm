import 'package:flutter/material.dart';
import 'package:tm_front/utils/u_theme.dart';

class CJustBodyMedium extends StatelessWidget {
  final String text;
  final TextAlign textAlign; // Opção para sobrescrever, se necessário
  final TextOverflow? overflow;
  final int? maxLines;

  const CJustBodyMedium({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.justify,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      overflow: overflow ?? TextOverflow.clip,
      maxLines: maxLines,
      text: TextSpan(
        style: AppTexts.bodyMedium,
        text: text,
      ),
    );
  }
}
