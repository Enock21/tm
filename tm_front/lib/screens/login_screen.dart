import 'package:flutter/material.dart';
import 'package:tm_front/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget 
{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) 
  {
    final formKey = GlobalKey<FormState>();

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
              const CircleAvatar
              (
                radius: 56,
                backgroundColor: Color(0xFFBB86FC),
                child: Text('LOGO', style: TextStyle(color: Colors.black)),
              ),
              const SizedBox(height: 24),
              const Text
              (
                'Taverna Multiversal',
                textAlign: TextAlign.center,
                style: TextStyle
                (
                  color: Color(0xFFBB86FC),
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                )
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
                obscureText: true,
                decoration: InputDecoration
                (
                  hintText: 'Digite a senha',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: const Color(0xFF322B47),
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
              CustomButton
              (
                text: 'Entrar',
                onPressed: ()
                {
                  if (formKey.currentState!.validate())
                  {
                    print('Entrar'); //TODO: delete this line
                  }
                },
              ),
              const SizedBox(height: 8),
              CustomButton
              (
                text: 'Criar conta',
                onPressed: () 
                {
                  print('Criar conta'); //TODO: delete this line
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}