import 'package:flutter/material.dart';
import 'package:tm_front/utils/u_theme.dart';

class CHeader extends StatelessWidget {
  final String title;
  final Widget?
      leading; // Permite definir um widget opcional no início do header

  const CHeader({
    required this.title,
    this.leading, // Pode ser nulo
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              if (leading != null) leading!, // Renderiza apenas se não for nulo. Servia pro ícone do backbutton.
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTexts.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
