import 'package:flutter/material.dart';
import 'package:tm_front/widgets/tm_buttons.dart';
import 'package:tm_front/widgets/theme.dart';
import 'package:tm_front/widgets/text_input_email.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  PasswordRecoveryScreen({super.key});

  @override
  _PasswordRecoveryScreenState createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final formKey = GlobalKey<FormState>();
  bool emailSent = false;

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
                        opacity: 0.0, child: TMBackButton(onPressed: () {})),
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
                      key: formKey,
                      child: Column(
                        children: [
                          TextInputEmail(
                            controller: TextEditingController(),
                          ),
                          const SizedBox(height: 30),
                          emailSent ? Text(
                            'ENVIADO!',
                            style: AppTexts.bodyLarge,
                          ) : TMButton.positive(
                            text: 'Enviar',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  emailSent = true;
                                });
                                // TODO: Implement logic to send email
                              }
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
