import 'package:flutter/material.dart';
import 'package:tm_front/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget
{
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> 
{
  final formKey = GlobalKey<FormState>();
  bool obscureTextVar = true;

  void togglePasswordVisibility()
  {
    setState
    (
      ()
      {obscureTextVar = !obscureTextVar;}
    );
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      backgroundColor: const Color(0xFF1A1A1A),
      body: Padding
      (
        padding: const EdgeInsets.all(16.0),
        child: Form
        (
          key: formKey,
          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            [
              // const CircleAvatar
              // (
              //   radius: 56,
              //   backgroundColor: Color(0xFFBB86FC),
              //   child: Text('LOGO', style: TextStyle(color: Colors.black)),
              //),
              const SizedBox(height: 24),
              const Column
              (
                children:
                [
                  Text
                  (
                    'Taverna',
                    textAlign: TextAlign.center,
                    style: TextStyle
                    (
                      color: Color(0xFFBB86FC),
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BerkshireSwash'
                    ),
                  ),
                  Text
                  (
                    'Multiversal',
                    textAlign: TextAlign.center,
                    style: TextStyle
                    (
                      color: Color(0xFFBB86FC),
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BerkshireSwash'
                    )
                  )
                ]
              ),
              const SizedBox(height: 24),
              TextFormField
              (
                decoration: InputDecoration
                (
                  hintText: 'Digite o e-mail',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: const Color(0xFF312B47),
                  prefixIcon: const Icon(Icons.email, color: Color(0xFFB3B3B3))
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value)
                {
                  if (value == null || value.isEmpty)
                  {
                    return 'Falta o e-mail';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value))
                  {
                    return 'E-mail inválido';
                  }
                  return null;
                }
              ),
              const SizedBox(height: 16),
              TextFormField
              (
                obscureText: obscureTextVar,
                decoration: InputDecoration
                (
                  hintText: 'Digite a senha',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: const Color(0xFF322B47),
                  prefixIcon: const Icon(Icons.lock, color: Color(0xFFB3B3B3)),
                  suffixIcon: IconButton
                  (
                    icon: Icon
                    (
                      obscureTextVar ? Icons.visibility_off : Icons.visibility,
                      color: const Color(0xFFB3B3B3)
                    ),
                    onPressed: togglePasswordVisibility
                  )
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value)
                {
                  if (value == null || value.isEmpty)
                  {
                    return 'Falta a senha';
                  }
                  return null;
                }
              ),
              const SizedBox(height: 8),
              TextButton
              (
                onPressed: () 
                {
                  print('Esqueci minha senha'); //TODO: delete this line
                },
                child: const Text
                (
                  'Esqueci minha senha', 
                  style: TextStyle
                  (
                    color: Color(0xFF03DAC6),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFF03DAC6),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row
              (
                children: 
                [
                  const Icon(Icons.login, color: Color(0xFFB3B3B3)),
                  const SizedBox(width: 10),
                  Expanded
                  (
                    child: CustomButton
                    (
                      text: 'Entrar',
                      onPressed: () 
                      {
                        if (formKey.currentState!.validate())
                        {
                          // TODO: Implementar ação de login
                          print('Entrar');
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(width: 24), 
                ],
              ),
              const SizedBox(height: 8),
              Row
              (
                children:
                [
                  const Icon(Icons.person, color: Color(0xFFB3B3B3)),
                  const SizedBox(width: 10),
                  Expanded
                  (
                    child: CustomButton
                    (
                      text: 'Criar conta',
                      onPressed: ()
                      {
                        // TODO: Navegar para tela de cadastro
                        print('Criar conta');
                      }
                    )
                  ),
                  const SizedBox(width:10),
                  const SizedBox(width: 24),
                ]
              )
            ]
          )
        )
      )
    );
  }
}