import 'package:flutter/material.dart';
import 'package:tm_front/components/CTheme.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              if (leading != null) leading!, // Renderiza apenas se não for nulo
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTexts.headlineMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
