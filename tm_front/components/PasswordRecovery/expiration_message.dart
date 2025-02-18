import 'package:flutter/material.dart';

class ExpirationMessage extends StatelessWidget {
  const ExpirationMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Center(
          child: Text(
            'LINK EXPIRADO!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 32),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Retorne à tela de login e repita o\nprocesso de recuperação de senha.',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}