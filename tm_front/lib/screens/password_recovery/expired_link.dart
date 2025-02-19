import 'package:flutter/material.dart';
import 'package:tm_front/widgets/tm_buttons.dart';
import 'package:tm_front/widgets/theme.dart';
import 'package:tm_front/screens/login.dart';
import 'package:tm_front/widgets/header.dart';

class ExpiredLink extends StatelessWidget {
  const ExpiredLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Cabeçalho com botão de retorno
              Header(
                title: 'Alteração de Senha',
              ),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Mensagem de link expirado
                    Text(
                      'LINK EXPIRADO!',
                      style: AppTexts.denialFeedback,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      child: SizedBox(
                        width: double.infinity, // Garante que o texto ocupe toda a largura disponível
                        child: Text(
                          'Retorne à tela de login e gere um novo.',
                          style: AppTexts.bodyMedium,
                          textAlign: TextAlign.left, // Alinha o texto à esquerda
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Botão de retorno ao login
                    TMButton.positive(
                      text: 'Voltar ao Login',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
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
