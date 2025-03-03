import 'package:flutter/material.dart';
import 'package:tm_front/components/c_buttons.dart';
import 'package:tm_front/components/c_theme.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/components/c_header.dart';

class SPRMain extends StatefulWidget {
  const SPRMain({super.key});

  @override
  _SPRMainState createState() => _SPRMainState();
}

class _SPRMainState extends State<SPRMain> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  bool emailSent = false;
  bool emailNotFound = false;

  // Simulação de banco de dados de e-mails cadastrados
  final List<String> registeredEmails = ["user@email.com", "test@example.com"];

  void _validateEmailAndSend() {
    setState(() {
      emailNotFound = !registeredEmails.contains(emailController.text.trim());
    });

    if (formKey.currentState!.validate() && !emailNotFound) {
      setState(() {
        emailSent = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CHeader(
                title: 'Recuperação de Senha',
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
                    )),
                    const SizedBox(height: 40),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CITEmail(
                            controller: emailController,
                          ),
                          if (emailNotFound) // Exibe erro se o e-mail não estiver cadastrado
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'E-mail não encontrado',
                                style: TextStyle(color: AppColors.negativeColor),
                              ),
                            ),
                          const SizedBox(height: 30),
                          emailSent
                              ? Text(
                                  'ENVIADO!',
                                  style: AppTexts.confirmationFeedback,
                                )
                              : TMButton.positive(
                                  text: 'Enviar',
                                  onPressed: _validateEmailAndSend,
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
