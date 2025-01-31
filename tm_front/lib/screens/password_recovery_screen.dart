import 'package:flutter/material.dart';
import 'package:tm_front/widgets/tm_buttons.dart';
import 'package:tm_front/widgets/theme.dart';
import 'package:tm_front/widgets/text_input_email.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TMBackButton(
                      onPressed: () {
                        print('Voltar'); //TODO: delete this line
                      },
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Recuperação de',
                          style: AppTexts.headlineMedium,
                        ),
                        Text(
                          'Senha',
                          style: AppTexts.headlineMedium,
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    //The following Opacity widget is used to keep the above title centralized. The icon inside it won't appear, but its space will remain.
                    Opacity(
                      opacity: 0.0,
                      child: TMBackButton(onPressed: () {})
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Digite o e-mail da sua conta na\nTaverna Multiversal. Um link para\nalteração de senha será enviado\npara ele.',
                        textAlign: TextAlign.left,
                        style: AppTexts.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Form(
                      child: Column(
                        children: [
                          TextInputEmail(),
                          const SizedBox(height: 30),
                          TMButton.positive(
                            text: 'Enviar',
                            onPressed: () {
                              // TODO: Implement logic
                              print('ENVIADO!');
                            },
                          ),
                        ],
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