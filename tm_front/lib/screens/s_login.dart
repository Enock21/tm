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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ////The following code was commented out to remove the logo from the login screen. It shall be transfered to theme.dart once the logo is defined.
                  // const CircleAvatar
                  // (
                  //   radius: 56,
                  //   backgroundColor: Color(0xFFBB86FC),
                  //   child: Text('LOGO', style: TextStyle(color: Colors.black)),
                  //),
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
                    prefixIcon:
                      Icon(Icons.email, color: AppColors.nonInteractiveGreen),
                  ),
                  const SizedBox(height: 16),
                  CITPassword(
                    controller: TextEditingController(),
                    prefixIcon:
                        Icon(Icons.lock, color: AppColors.nonInteractiveGreen),
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
                                // TODO: Implementar ação de login
                                print('Entrar');
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const SizedBox(
                          width:
                              24), // Space reserved for hidden icon, used to centralize the button.
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
                      const SizedBox(
                          width:
                              24), // Space reserved for hidden icon, used to centralize the button.
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
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
            ),
          ],
        ),
      ),
    );
  }
}
