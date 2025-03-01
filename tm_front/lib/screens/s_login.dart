import 'package:flutter/material.dart';
import 'package:tm_front/components/c_buttons.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/components/input/text/cit_password.dart';
import 'package:tm_front/components/c_theme.dart';
import 'package:tm_front/screens/password_recovery/spr_main.dart';
import 'package:tm_front/screens/register/sr1_userprof.dart';

class SLogin extends StatefulWidget {
  const SLogin({super.key});

  @override
  SLoginState createState() => SLoginState();
}

class SLoginState extends State<SLogin> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        // 🔹 Mantém a estrutura para alinhamento correto
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // 🔹 Garante espaçamento adequado
        children: [
          Expanded(
            // 🔹 Permite que o conteúdo ocupe o espaço disponível
            child: SingleChildScrollView(
              // 🔹 Evita overflow
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      Column(children: [
                        Text(
                          'Taverna',
                          textAlign: TextAlign.center,
                          style: AppTexts.headlineLarge
                              .copyWith(color: AppColors.nonInteractiveGreen),
                        ),
                        Text(
                          'Multiversal',
                          textAlign: TextAlign.center,
                          style: AppTexts.headlineLarge,
                        )
                      ]),
                      const SizedBox(height: 24),
                      CITEmail(
                        controller: TextEditingController(),
                        prefixIcon: Icon(Icons.email,
                            color: AppColors.nonInteractiveGreen),
                      ),
                      const SizedBox(height: 16),
                      CITPassword(
                        controller: TextEditingController(),
                        prefixIcon: Icon(Icons.lock,
                            color: AppColors.nonInteractiveGreen),
                      ),
                      const SizedBox(height: 8),
                      TMTextButton(
                        text: 'Esqueci minha senha',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SPRMain(),
                              ));
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(Icons.login,
                              color: AppColors.nonInteractiveGreen),
                          const SizedBox(width: 8),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: TMButton.positive(
                                text: 'Entrar',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    print('Entrar');
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const SizedBox(width: 24),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          const Icon(Icons.person,
                              color: AppColors.nonInteractiveGreen),
                          const SizedBox(width: 8),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: TMButton.positive(
                                text: 'Criar conta',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SR1UserProf(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const SizedBox(width: 24),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            // 🔹 Mantém o rodapé no final da tela
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              children: [
                Text(
                  '© 2024 Taverna Multiversal.',
                  style: AppTexts.bodySmall,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Todos os direitos reservados.',
                  style: AppTexts.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
