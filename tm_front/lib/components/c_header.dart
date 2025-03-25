import 'package:flutter/material.dart';
import 'package:tm_front/utils/u_theme.dart';

class CHeader extends StatelessWidget {
  final String title;
  final Widget? leading;

  const CHeader({
    required this.title,
    this.leading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) //Para o ícone de backbutton
            Align(
              alignment: Alignment.centerLeft,
              child: leading!,
            ),
          const SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTexts.headlineMedium,
              children: [
                TextSpan(text: title),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
