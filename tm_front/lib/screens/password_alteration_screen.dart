import 'package:flutter/material.dart';
import 'package:tm_front/widgets/text_input_password.dart';
import 'package:tm_front/widgets/tm_buttons.dart';

class PasswordAlterationScreen extends StatelessWidget {
  const PasswordAlterationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Recuperação de\nSenha',
                style: TextStyle(
                  color: Color(0xFFBB86FC),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 179),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nova Senha',
                      style: TextStyle(
                        color: Color(0xFFBB86FC),
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextInputPassword(
                            controller: TextEditingController(),
                    ),
                    const SizedBox(height: 19),
                    const Text(
                      'Confirmação de Senha',
                      style: TextStyle(
                        color: Color(0xFFBB86FC),
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextInputPassword(
                            controller: TextEditingController(),
                    ),
                    const SizedBox(height: 26),
                    Center(
                      child: TMButton.positive(
                        text: 'Redefinir',
                        onPressed: () {
                          // Handle password reset logic here
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}