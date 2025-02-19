import 'package:flutter/material.dart';
import 'package:tm_front/screens/SLogin.dart';
import 'package:tm_front/screens/password_recovery/PRSAlteration.dart';
import 'package:tm_front/screens/password_recovery/PRSExpiredLink.dart';
import 'package:tm_front/screens/register/RS1UserProf.dart';

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
      //home: const ExpiredLink(),
      home: const R1UserProf(),
    );
  }
}
