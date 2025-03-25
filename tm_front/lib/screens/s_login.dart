import 'package:flutter/material.dart';
import 'package:tm_front/components/c_buttons.dart';
import 'package:tm_front/routes/app_routes.dart';
import 'package:tm_front/utils/u_error_msgs.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/components/input/text/cit_password.dart';
import 'package:tm_front/utils/u_theme.dart';
import 'package:tm_front/screens/s_homepage.dart';
import 'package:tm_front/screens/password_recovery/spr_main.dart';
import 'package:tm_front/screens/register/user/sru_prof.dart';

class SLogin extends StatefulWidget {
  const SLogin({super.key});

  @override
  SLoginState createState() => SLoginState();
}

class SLoginState extends State<SLogin> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? _loginError; // 🔹 Estado para armazenar erro de login

  bool _formSubmitted = false;

  void _attemptLogin() {
    if (formKey.currentState!.validate()) {
      // Simulação de credenciais válidas
      const validEmail = "user@email.com";
      const validPassword = "123456";

      if (emailController.text == validEmail &&
          passwordController.text == validPassword) {
        // 🔹 Remove mensagem de erro antes de navegar
        setState(() {
          _loginError = null;
        });

        Navigator.pushNamed(context, AppRoutes.homepage);
      } else {
        // 🔹 Exibe erro se credenciais forem inválidas
        setState(() {
          _loginError = CErrorMsgs.loginNotFound;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // 🔹 Impede que o teclado empurre o conteúdo
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
                            formSubmitted: _formSubmitted,
                          ),
                          const SizedBox(height: 16),
                          CITPassword(
                            controller: passwordController,
                            prefixIcon: Icon(Icons.lock,
                                color: AppColors.nonInteractiveGreen),
                          ),
                          const SizedBox(height: 8),

                          // 🔹 Exibe a mensagem de erro aqui
                          if (_loginError != null)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                _loginError!,
                                style: TextStyle(
                                  color: AppColors.negativeColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),

                          TMTextButton(
                            text: 'Esqueci minha senha',
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.sprMain);
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
                                      onPressed: () async {
                                        setState(() {
                                          _formSubmitted = true;
                                        });
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          _attemptLogin();
                                        });
                                      } // 🔹 Chama função de login
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
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.sr1UserProf,
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

          // 🔹 Rodapé fixo no fundo da tela
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
