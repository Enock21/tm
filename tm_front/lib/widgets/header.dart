import 'package:flutter/material.dart';
import 'package:tm_front/widgets/theme.dart';
import 'package:tm_front/widgets/tm_buttons.dart';

class Header extends StatelessWidget {
  final String title;
  //final double horizontalSpacing; // Unecessary?

  const Header({
    required this.title,
    //this.horizontalSpacing = 1.0, // Unecessary?
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(/*horizontal: horizontalSpacing*/),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinha tudo à esquerda
        mainAxisSize: MainAxisSize.min, // Mantém o tamanho necessário
        children: [
          Row(
            children: [
              TMBackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 10), // Espaçamento configurável vertical
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
