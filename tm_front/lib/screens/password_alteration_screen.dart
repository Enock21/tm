import 'package:flutter/material.dart';
import 'package:tm_front/widgets/tm_buttons.dart';
import 'package:tm_front/widgets/theme.dart';
import 'package:tm_front/widgets/text_input_password.dart';
import 'package:tm_front/screens/login_screen.dart';
import 'package:tm_front/widgets/header.dart';

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
              Header(title: 'Alteração de Senha'),
              const SizedBox(height: 80),
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
                              style: AppTexts.bodyMedium.copyWith(fontSize: 16),
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextInputPassword(
                            controller: newPasswordController,
                            hintText: '',
                          ),
                          const SizedBox(height: 30),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Repita a nova senha',
                              style: AppTexts.bodyMedium.copyWith(fontSize: 16),
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextInputPassword(
                            controller: confirmPasswordController,
                            hintText: '',
                          ),
                          const SizedBox(height: 30),
                          passwordChanged
    ? Column(
        children: [
          Text(
            'SENHA ALTERADA!',
            style: AppTexts.bodyLarge.copyWith(color: AppColors.positiveColor),
          ),
          const SizedBox(height: 10), // Espaço entre os textos
          Text(
            'Retorne à tela de login e utilize sua nova senha para acessar.',
            style: AppTexts.bodyMedium.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          TMButton.positive(
            text: 'Voltar ao Login',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      )
    : TMButton.positive(
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
                const SnackBar(content: Text('As senhas não correspondem')),
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