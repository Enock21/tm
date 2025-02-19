import 'package:flutter/material.dart';
import 'package:tm_front/widgets/WAppButtons.dart';
import 'package:tm_front/widgets/WTheme.dart';
import 'package:tm_front/widgets/input/text/WITEmail.dart';
import 'package:tm_front/screens/SLogin.dart';
import 'package:tm_front/widgets/WHeader.dart';

class SPRMain extends StatefulWidget {
  const SPRMain({super.key});

  @override
  _SPRMainState createState() => _SPRMainState();
}

class _SPRMainState extends State<SPRMain> {
  final formKey = GlobalKey<FormState>();
  bool emailSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              WHeader(
                title: 'Recuperação de Senha',
                leading: TMBackButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SLogin(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Align(
                        child: SizedBox(
                      child: Text(
                        'Digite o e-mail da sua conta na Taverna Multiversal. Um link para alteração de senha será enviado para ele.',
                        textAlign: TextAlign.left,
                        style: AppTexts.bodyMedium,
                      ),
                    )),
                    const SizedBox(height: 40),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          WITEmail(
                            controller: TextEditingController(),
                          ),
                          const SizedBox(height: 30),
                          emailSent
                              ? Text(
                                  'ENVIADO!',
                                  style: AppTexts.confirmationFeedback,
                                )
                              : TMButton.positive(
                                  text: 'Enviar',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      // TODO: Implement logic to send email
                                      setState(() {
                                        emailSent = true;
                                      });
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
