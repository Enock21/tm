import 'package:flutter/material.dart';
import 'package:tm_front/widgets/tm_buttons.dart';
import 'package:tm_front/widgets/theme.dart';
import 'package:tm_front/widgets/text_input_password.dart';
import 'package:tm_front/screens/login_screen.dart';

class PasswordAlterationScreen extends StatefulWidget {
  const PasswordAlterationScreen({super.key});

  @override
  _PasswordAlterationScreenState createState() => _PasswordAlterationScreenState();
}

class _PasswordAlterationScreenState extends State<PasswordAlterationScreen> {
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
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TMBackButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen()
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Alteração de',
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
                        'Digite sua nova senha abaixo.',
                        textAlign: TextAlign.left,
                        style: AppTexts.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Nova senha',
                              style: AppTexts.bodyMedium,
                            ),
                          ),
                          TextInputPassword(
                            controller: newPasswordController,
                            hintText: '',
                          ),
                          
                          const SizedBox(height: 30),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Repita a nova senha',
                              style: AppTexts.bodyMedium,
                            ),
                          ),
                          TextInputPassword(
                            controller: confirmPasswordController,
                            hintText: '',
                          ),
                          const SizedBox(height: 30),
                          passwordChanged ? Text(
                            'SENHA ALTERADA!',
                            style: AppTexts.bodyLarge
                                .copyWith(color: AppColors.positiveColor),
                          ) : TMButton.positive(
                            text: 'Alterar Senha',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if (newPasswordController.text == confirmPasswordController.text) {
                                  // TODO: Implement logic to change password
                                  setState(() {
                                    passwordChanged = true;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('As senhas não correspondem')),
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