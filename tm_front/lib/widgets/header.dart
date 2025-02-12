import 'package:flutter/material.dart';
import 'package:tm_front/widgets/theme.dart';
import 'package:tm_front/widgets/tm_buttons.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60, // Defina uma altura adequada para o cabeçalho
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: TMBackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Center(
            child: Text(
              title,
              style: AppTexts.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}