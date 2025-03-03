import 'package:flutter/material.dart';
import 'package:tm_front/screens/s_login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taverna Multiversal'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bem-vindo à Taverna Multiversal!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simula o logout, retornando para a tela de login
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SLogin()),
                  (route) => false,
                );
              },
              child: const Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}
