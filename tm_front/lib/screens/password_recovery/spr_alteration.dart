import 'package:flutter/material.dart';
import 'package:tm_front/components/c_buttons.dart';
import 'package:tm_front/utils/u_error_msgs.dart';
import 'package:tm_front/components/c_just_body_medium.dart';
import 'package:tm_front/utils/u_routes.dart';
import 'package:tm_front/utils/u_theme.dart';
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
              AppBoxes.bellowTitleVSeparator,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
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
                          AppBoxes.fieldLableVSeparator,
                          CITPassword(
                            controller: newPasswordController,
                          ),
                          AppBoxes.rowVSeparator,
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Repita a nova senha',
                              style: AppTexts.headlineSmall,
                            ),
                          ),
                          AppBoxes.fieldLableVSeparator,
                          CITPassword(
                            controller: confirmPasswordController,
                          ),
                          AppBoxes.rowVSeparator,
                          passwordChanged
                              ? Column(
                                  children: [
                                    Text(
                                      'SENHA ALTERADA!',
                                      style: AppTexts.confirmationFeedback,
                                    ),
                                    AppBoxes.textVSeparator,
                                    Align(
                                      child: CJustBodyMedium(
                                        text:
                                            'Retorne à tela de login e utilize sua nova senha para acessar.',
                                      ),
                                    ),
                                    AppBoxes.rowVSeparator,
                                    TMButton.positive(
                                      text: 'Voltar ao Login',
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context, URoutes.sLogin
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
                                              ErrorMsgs.passwordMismatch,
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
