import 'package:flutter/material.dart';
import 'package:tm_front/components/c_buttons.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/components/input/text/cit_password.dart';
import 'package:tm_front/components/c_theme.dart';
import 'package:tm_front/screens/homepage.dart';
import 'package:tm_front/screens/password_recovery/spr_main.dart';
import 'package:tm_front/screens/register/sr1_userprof.dart';

class SLogin extends StatefulWidget {
  const SLogin({super.key});

  @override
  SLoginState createState() => SLoginState();
}

class SLoginState extends State<SLogin> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? loginErrorMessage;

  // 🔹 Simulação do "banco de dados"
  final Map<String, String> fakeDatabase = {
    "user@email.com": "123456", // Simulação de usuário existente
  };

  void _validateLogin() {
    setState(() {
      loginErrorMessage = null;
    });

    if (formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      if (fakeDatabase[email] == password) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        setState(() {
          loginErrorMessage = "E-mail ou senha não encontrado";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          Column(
                            children: [
                              Text(
                                'Taverna',
                                textAlign: TextAlign.center,
                                style: AppTexts.headlineLarge.copyWith(
                                    color: AppColors.nonInteractiveGreen),
                              ),
                              Text(
                                'Multiversal',
                                textAlign: TextAlign.center,
                                style: AppTexts.headlineLarge,
                              )
                            ],
                          ),
                          const SizedBox(height: 24),
                          CITEmail(
                            controller: emailController,
                            prefixIcon: Icon(Icons.email,
                                color: AppColors.nonInteractiveGreen),
                          ),
                          const SizedBox(height: 16),
                          CITPassword(
                            controller: passwordController,
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
                                ),
                              );
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
                                    onPressed: _validateLogin,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const SizedBox(width: 24),
                            ],
                          ),
                          if (loginErrorMessage != null) ...[
                            const SizedBox(height: 12),
                            Text(
                              loginErrorMessage!,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
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
                                          builder: (context) =>
                                              const SR1UserProf(),
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
            ],
          ),
          Positioned(
            bottom: 16, 
            left: 0,
            right: 0,
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
