import 'package:flutter/material.dart';
import 'package:tm_front/screens/login.dart';
import 'package:tm_front/screens/password_recovery/alterationPRS.dart';
import 'package:tm_front/screens/password_recovery/expiredLinkPRS.dart';

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
      //home: const Alteration(),
      home: const ExpiredLink(),
    );
  }
}
