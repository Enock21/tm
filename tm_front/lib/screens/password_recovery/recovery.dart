import 'package:flutter/material.dart';
import 'package:tm_front/widgets/tm_buttons.dart';
import 'package:tm_front/widgets/theme.dart';
import 'package:tm_front/widgets/text_input_email.dart';
import 'package:tm_front/screens/login.dart';
import 'package:tm_front/widgets/header.dart';

class Recovery extends StatefulWidget {
  const Recovery({super.key});

  @override
  _RecoveryState createState() => _RecoveryState();
}

class _RecoveryState extends State<Recovery> {
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
              Header(
                title: 'Recuperação de Senha',
                leading: TMBackButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Align(
                      child: SizedBox(
                        
                        child: Text(
                          'Digite o e-mail da sua conta na Taverna Multiversal. Um link para alteração de senha será enviado para ele.',
                          textAlign: TextAlign.left,
                          style: AppTexts.bodyMedium,
                        ),
                      )
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
                          emailSent
                              ? Text(
                                  'ENVIADO!',
                                  style: AppTexts.confirmationFeedback,
                                )
                              : TMButton.positive(
                                  text: 'Enviar',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      // TODO: Implement logic to send email
                                      setState(() {
                                        emailSent = true;
                                      });
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
