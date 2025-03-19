import 'package:flutter/material.dart';
import 'package:tm_front/utils/u_error_msgs.dart';
import 'package:tm_front/utils/u_theme.dart';
import 'package:tm_front/components/c_buttons.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/components/input/text/cit_password.dart';
import 'package:tm_front/components/c_header.dart';
import 'package:tm_front/components/input/ci_date.dart';
import 'package:tm_front/components/input/text/cit_username.dart';

class SR1UserProf extends StatefulWidget {
  const SR1UserProf({super.key});

  @override
  _SR1UserProfState createState() => _SR1UserProfState();
}

class _SR1UserProfState extends State<SR1UserProf> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final birthdateController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _formSubmitted = false;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    birthdateController.dispose();
    passwordController.dispose();
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Cabeçalho
                const CHeader(title: 'Bem Vindo(a) à\nTaverna Multiversal!'),

                const SizedBox(height: 24),

                Text(
                  'Seu Avatar',
                  style: AppTexts.headlineSmall,
                ),

                const SizedBox(height: 29),

                // PLACEHOLDER PARA UPLOAD DE IMAGEM DO AVATAR

                const SizedBox(height: 29),

                // Formulário
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text('Nome de Usuário',
                            style: AppTexts.headlineSmall),
                      ),
                      const SizedBox(height: 10),
                      CITUsername(
                          controller: usernameController,
                          formSubmitted: _formSubmitted),
                      const SizedBox(height: 25),
                      Align(
                        alignment: Alignment.center,
                        child: Text('E-mail', style: AppTexts.headlineSmall),
                      ),
                      const SizedBox(height: 10),
                      CITEmail(
                          controller: emailController,
                          isRegisterScreen: true,
                          formSubmitted: _formSubmitted),
                      const SizedBox(height: 25),
                      Align(
                        alignment: Alignment.center,
                        child: Text('Data de Nascimento',
                            style: AppTexts.headlineSmall),
                      ),
                      const SizedBox(height: 10),
                      CIDate(controller: birthdateController),
                      const SizedBox(height: 25),
                      Align(
                        alignment: Alignment.center,
                        child: Text('Senha', style: AppTexts.headlineSmall),
                      ),
                      const SizedBox(height: 10),
                      CITPassword(controller: passwordController),
                      const SizedBox(height: 25),
                      Align(
                        alignment: Alignment.center,
                        child: Text('Confirmação de Senha',
                            style: AppTexts.headlineSmall),
                      ),
                      const SizedBox(height: 10),
                      CITPassword(
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return CErrorMsgs.passwordEmpty;
                          }
                          if (value != passwordController.text) {
                            return CErrorMsgs.passwordMismatch;
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTexts.bodySmall,
                    children: [
                      const TextSpan(
                          text:
                              'Ao criar uma conta, você concorda com nossos\n'),
                      TextSpan(
                        //TODO: replace for textButton
                        text: 'Termos de Serviço',
                        style: AppTexts.bodySmall.copyWith(
                          color: AppColors.interactiveSecondColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const TextSpan(text: ' e '),
                      TextSpan(
                        //TODO: replace for textButton
                        text: 'Política de Privacidade',
                        style: AppTexts.bodySmall.copyWith(
                          color: AppColors.interactiveSecondColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const TextSpan(text: '.'),
                    ],
                  ),
                ),
                const SizedBox(height: 21),
                TMButton.positive(
                  text: 'Próximo',
                  onPressed: () async {
                    setState(() {
                      _formSubmitted = true;
                    });
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (formKey.currentState!.validate()) {
                        print("Formulário válido – irá navegar"); //TODO: remover
                        print(
                          "Futuro: Criar conta no Firebase com ${emailController.text} e senha");
                      } else {
                        print("Formulário inválido – não irá navegar"); //TODO: remover
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
