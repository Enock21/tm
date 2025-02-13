import 'package:flutter/material.dart';
import 'package:tm_front/widgets/theme.dart';
import 'package:tm_front/widgets/tm_buttons.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Defina uma altura adequada para o cabeçalho
      child: Stack(
        children: [
          Positioned(
            left: 16,
            top: 16,
            child: TMBackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 50),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                title,
                style: AppTexts.headlineMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}