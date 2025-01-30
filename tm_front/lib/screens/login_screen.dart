import 'package:flutter/material.dart';
import 'package:tm_front/widgets/custom_button.dart';
import 'package:tm_front/widgets/text_input_email.dart';
import 'package:tm_front/widgets/text_input_password.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ////The following code was commented out to remove the logo from the login screen. It shall be transfered to theme.dart once the logo is defined.
                  // const CircleAvatar
                  // (
                  //   radius: 56,
                  //   backgroundColor: Color(0xFFBB86FC),
                  //   child: Text('LOGO', style: TextStyle(color: Colors.black)),
                  //),
                  const SizedBox(height: 24),
                  Column(children: [
                    Text(
                      'Taverna',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'Multiversal',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge,
                    )
                  ]),
                  const SizedBox(height: 24),
                  TextInputEmail(
                    controller: TextEditingController(),
                    prefixIcon: Icon(Icons.email, color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(height: 16),
                  TextInputPassword(
                    hintText: 'Digite a senha',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Falta a senha';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      print('Esqueci minha senha'); //TODO: delete this line
                    },
                    child: Text(
                      'Esqueci minha senha',
                      style: GoogleFonts.montserrat(
                        color: Color(0xFF03DAC6),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF03DAC6),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.login, color: Color(0xFFB3B3B3)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: CustomButton(
                            text: 'Entrar',
                            textStyle: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                // TODO: Implementar ação de login
                                print('Entrar');
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const SizedBox(
                          width: 24), // Espaço reservado para o ícone oculto
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      const Icon(Icons.person, color: Color(0xFFB3B3B3)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: CustomButton(
                            text: 'Criar conta',
                            textStyle: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            onPressed: () {
                              // TODO: Navegar para tela de cadastro
                              print('Criar conta');
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const SizedBox(
                          width: 24), // Espaço reservado para o ícone oculto
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Center(
                child: Text(
                  '© 2024 Taverna Multiversal. Todos os direitos reservados.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
