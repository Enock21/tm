import 'package:flutter/material.dart';
import 'package:tm_front/screens/login_screen.dart';
import 'package:tm_front/screens/password_recovery_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taverna Multiversal',
      //home: const LoginScreen(),
      home: PasswordRecoveryScreen(),
    );
  }
}