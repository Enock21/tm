import 'package:flutter/material.dart';
import 'package:tm_front/widgets/tm_buttons.dart';
import 'package:tm_front/widgets/theme.dart';

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
                    //The following Opacity widget is used to keep the above title centralized. The icon won't appear, but its space will remain.
                    Opacity(
                      opacity: 0.0,
                      child: TMBackButton(
                        onPressed: () {
                          print('Voltar'); //TODO: delete this line
                        },
                      )
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      'Digite o e-mail da sua conta na\nTaverna Multiversal. Um link para\nalteração de senha será enviado\npara ele.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            height: 1.5,
                          ),
                    ),
                    const SizedBox(height: 40),
                    Form(
                      child: Column(
                        children: [
                          Semantics(
                            label: 'Email input field',
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Seu e-mail aqui',
                                hintStyle: Theme.of(context)
                                    .inputDecorationTheme
                                    .hintStyle,
                                filled: true,
                                fillColor: const Color(0xFF322B47),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                  horizontal: 14,
                                ),
                              ),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          const SizedBox(height: 30),
                          TMButton.positive(
                            text: 'Enviar',
                            textStyle: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
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
