import 'package:flutter/material.dart';
import 'package:tm_front/components/c_buttons.dart';
import 'package:tm_front/utils/u_error_msgs.dart';
import 'package:tm_front/components/c_just_body_medium.dart';
import 'package:tm_front/utils/u_theme.dart';
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
  bool _formSubmitted = false;

  // Simulação de banco de dados de e-mails cadastrados
  final List<String> registeredEmails = ["user@email.com"];

  void _validateEmailAndSend() {
    if (formKey.currentState!.validate()) {
      setState(() {
        emailNotFound = !registeredEmails.contains(emailController.text.trim());
      });
      if (!emailNotFound) {
        setState(() {
          emailSent = true;
        });
      }
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
              AppBoxes.bellowTitleVSeparator,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Align(
                      child: CJustBodyMedium(
                        text:
                            'Digite o e-mail da sua conta na Taverna Multiversal. Um link para alteração de senha será enviado para ele.',
                      ),
                    ),
                    AppBoxes.rowVSeparator,
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CITEmail(
                            controller: emailController,
                            formSubmitted: _formSubmitted,
                          ),
                          if (emailNotFound) // Exibe erro se o e-mail não estiver cadastrado
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                ErrorMsgs.emailNotFound,
                                style:
                                    TextStyle(color: AppColors.negativeColor),
                              ),
                            ),
                          AppBoxes.rowVSeparator,
                          emailSent
                              ? Text(
                                  'ENVIADO!',
                                  style: AppTexts.confirmationFeedback,
                                )
                              : TMButton.positive(
                                  text: 'Enviar',
                                  onPressed: () async {
                                    setState(() {
                                      _formSubmitted = true;
                                    });
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      _validateEmailAndSend();
                                    });
                                  }),
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
