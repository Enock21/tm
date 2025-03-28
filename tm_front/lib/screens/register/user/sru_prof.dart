import 'package:flutter/material.dart';
import 'package:tm_front/components/input/ci_avatar_upload.dart';
import 'package:tm_front/utils/u_routes.dart';
import 'package:tm_front/utils/u_error_msgs.dart';
import 'package:tm_front/utils/u_theme.dart';
import 'package:tm_front/components/c_buttons.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/components/input/text/cit_password.dart';
import 'package:tm_front/components/c_header.dart';
import 'package:tm_front/components/input/ci_date.dart';
import 'package:tm_front/components/input/text/cit_username.dart';

class SRUProf extends StatefulWidget {
  const SRUProf({super.key});

  @override
  _SRUProfState createState() => _SRUProfState();
}

class _SRUProfState extends State<SRUProf> {
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
                AppBoxes.bellowTitleVSeparator,
                Text(
                  'Seu Avatar',
                  style: AppTexts.headlineSmall,
                ),
                AppBoxes.fieldLableVSeparator,
                CIAvatarUpload(onTap: () {
                  print("Selecionar imagem"); //TODO: remover
                  //Implementar lógica para seleção/upload da imagem
                }),

                AppBoxes.rowVSeparator,

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
                      AppBoxes.fieldLableVSeparator,
                      CITUsername(
                          controller: usernameController,
                          formSubmitted: _formSubmitted),
                      AppBoxes.rowVSeparator,
                      Align(
                        alignment: Alignment.center,
                        child: Text('E-mail', style: AppTexts.headlineSmall),
                      ),
                      AppBoxes.fieldLableVSeparator,
                      CITEmail(
                          controller: emailController,
                          isRegisterScreen: true,
                          formSubmitted: _formSubmitted),
                      AppBoxes.rowVSeparator,
                      Align(
                        alignment: Alignment.center,
                        child: Text('Data de Nascimento',
                            style: AppTexts.headlineSmall),
                      ),
                      AppBoxes.fieldLableVSeparator,
                      CIDate(controller: birthdateController),
                      AppBoxes.rowVSeparator,
                      Align(
                        alignment: Alignment.center,
                        child: Text('Senha', style: AppTexts.headlineSmall),
                      ),
                      AppBoxes.fieldLableVSeparator,
                      CITPassword(controller: passwordController),
                      AppBoxes.rowVSeparator,
                      Align(
                        alignment: Alignment.center,
                        child: Text('Confirmação de Senha',
                            style: AppTexts.headlineSmall),
                      ),
                      AppBoxes.fieldLableVSeparator,
                      CITPassword(
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ErrorMsgs.passwordEmpty;
                          }
                          if (value != passwordController.text) {
                            return ErrorMsgs.passwordMismatch;
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                AppBoxes.setVSeparator,
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
                AppBoxes.setVSeparator,
                TMButton.positive(
                  text: 'Próximo',
                  onPressed: () async {
                    setState(() {
                      _formSubmitted = true;
                    });
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      print('Dentro de WidgetsBinding.instance.addPostFrameCallback');
                      if (formKey.currentState!.validate()) {
                        //TODO: Criar conta no Firebase com ${emailController.text} e senha

                        Navigator.pushNamed(context, URoutes.srp1Choice);
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
