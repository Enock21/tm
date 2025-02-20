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

  bool isUsernameTaken = true; // Inicialmente, assume que o nome é válido

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    birthdateController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void checkUsernameAvailability(String username) {
    setState(() {
      isUsernameTaken = username == "UsuarioExistente"; // Simula nome já existente
      print("isUsernameTaken atualizado para: $isUsernameTaken");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey, // Move a chave para englobar todo o formulário
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CHeader(title: 'Bem Vindo(a) à\nTaverna Multiversal!'),
                  const SizedBox(height: 24),
                  Text('Nome de Usuário', style: AppTexts.headlineSmall),
                  const SizedBox(height: 10),
                  CITUsername(
                    controller: usernameController,
                    onChanged: checkUsernameAvailability,
                    isUsernameTaken: isUsernameTaken,
                  ),
                  const SizedBox(height: 25),
                  Text('E-mail', style: AppTexts.headlineSmall),
                  const SizedBox(height: 10),
                  CITEmail(controller: emailController),
                  const SizedBox(height: 25),
                  Text('Data de Nascimento', style: AppTexts.headlineSmall),
                  const SizedBox(height: 10),
                  CIDate(controller: birthdateController),
                  const SizedBox(height: 25),
                  Text('Senha', style: AppTexts.headlineSmall),
                  const SizedBox(height: 10),
                  CITPassword(
                    controller: passwordController,
                    hintText: 'Crie uma senha segura',
                  ),
                  const SizedBox(height: 25),
                  Text('Confirmação de Senha', style: AppTexts.headlineSmall),
                  const SizedBox(height: 10),
                  CITPassword(
                    controller: confirmPasswordController,
                    hintText: 'Repita a senha anterior',
                  ),
                  const SizedBox(height: 25),
                  TMButton.positive(
                    text: 'Próximo',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // TODO: Implementar lógica de cadastro
                        print(isUsernameTaken.toString());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
