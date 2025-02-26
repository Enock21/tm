import 'package:flutter/material.dart';
import 'package:tm_front/components/CTheme.dart';
import 'package:tm_front/components/CAppButtons.dart';
import 'package:tm_front/components/input/text/CITEmail.dart';
import 'package:tm_front/components/input/text/CITPassword.dart';
import 'package:tm_front/components/CHeader.dart';
import 'package:tm_front/components/input/CIDate.dart';
import 'package:tm_front/components/input/text/CITUsername.dart';

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
                const CHeader(
                    title: 'Bem Vindo(a) à\nTaverna Multiversal!'),
                const SizedBox(height: 24),
                Text(
                  'Seu Avatar',
                  style: AppTexts.headlineSmall,
                ),
                const SizedBox(height: 29),
                Image.network(
                  'https://cdn.builder.io/api/v1/image/assets/TEMP/568072e900496fdc1943030b761d86a66e943802325c73f03b43f7c5f6831f7f',
                  width: 48,
                  height: 48,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 29),

                // Formulário
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nome de Usuário', style: AppTexts.headlineSmall),
                      const SizedBox(height: 10),
                      CITUsername(controller: usernameController, formSubmitted: _formSubmitted), // 🔹 Agora passa `_formSubmitted`

                      const SizedBox(height: 25),
                      Text('E-mail', style: AppTexts.headlineSmall),
                      const SizedBox(height: 10),
                      CITEmail(
                        controller: emailController,
                        formSubmitted: _formSubmitted,
                      ),

                      const SizedBox(height: 25),
                      Text('Data de Nascimento', style: AppTexts.headlineSmall),
                      const SizedBox(height: 10),
                      CIDate(controller: birthdateController),

                      const SizedBox(height: 25),
                      Text('Senha', style: AppTexts.headlineSmall),
                      const SizedBox(height: 10),
                      CITPassword(
                        controller: passwordController,
                      ),

                      const SizedBox(height: 25),
                      Text('Confirmação de Senha',
                        style: AppTexts.headlineSmall),
                      const SizedBox(height: 10),
                      CITPassword(
                        controller: confirmPasswordController,
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
                      _formSubmitted = true; // 🔹 Agora o form sabe que foi enviado
                    });

                    if (formKey.currentState!.validate()) {
                      print("Todos os campos estão preenchidos corretamente!");
                      // 🔹 FUTURAMENTE: Aqui será chamada a função do Firebase
                      print("Futuro: Criar conta no Firebase com ${emailController.text} e senha");
                    } else {
                      print("Preencha os campos obrigatórios.");
                    }
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