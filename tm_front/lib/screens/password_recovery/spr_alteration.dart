import 'package:flutter/material.dart';
import 'package:tm_front/components/c_buttons.dart';
import 'package:tm_front/components/c_error_msgs.dart';
import 'package:tm_front/components/c_theme.dart';
import 'package:tm_front/components/input/text/cit_password.dart';
import 'package:tm_front/screens/s_login.dart';
import 'package:tm_front/components/c_header.dart';

class SPRAlteration extends StatefulWidget {
  const SPRAlteration({super.key});

  @override
  _SPRAlterationState createState() => _SPRAlterationState();
}

class _SPRAlterationState extends State<SPRAlteration> {
  final formKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool passwordChanged = false;

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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
              CHeader(title: 'Alteração de Senha'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Nova senha',
                              style: AppTexts.headlineSmall,
                            ),
                          ),
                          const SizedBox(height: 5),
                          CITPassword(
                            controller: newPasswordController,
                          ),
                          const SizedBox(height: 30),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Repita a nova senha',
                              style: AppTexts.headlineSmall,
                            ),
                          ),
                          const SizedBox(height: 5),
                          CITPassword(
                            controller: confirmPasswordController,
                          ),
                          const SizedBox(height: 30),
                          passwordChanged
                              ? Column(
                                  children: [
                                    Text(
                                      'SENHA ALTERADA!',
                                      style: AppTexts.confirmationFeedback,
                                    ),
                                    const SizedBox(
                                        height: 10), // Espaço entre os textos
                                    Align(
                                      child: Text(
                                        'Retorne à tela de login e utilize sua nova senha para acessar.',
                                        style: AppTexts.bodyMedium,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    TMButton.positive(
                                      text: 'Voltar ao Login',
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SLogin()),
                                        );
                                      },
                                    ),
                                  ],
                                )
                              : TMButton.positive(
                                  text: 'Alterar Senha',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      if (newPasswordController.text ==
                                          confirmPasswordController.text) {
                                        // TODO: Implement logic to change password
                                        setState(() {
                                          passwordChanged = true;
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              CErrorMsgs.passwordMismatch,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: AppColors.negativeColor,
                                              ),
                                            ),
                                            behavior: SnackBarBehavior.floating,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                          ),
                                        );
                                      }
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
