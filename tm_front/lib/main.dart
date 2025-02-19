import 'package:flutter/material.dart';
import 'package:tm_front/screens/SLogin.dart';
import 'package:tm_front/screens/password_recovery/SPRAlteration.dart';
import 'package:tm_front/screens/password_recovery/SPRExpiredLink.dart';
import 'package:tm_front/screens/register/SR1UserProf.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taverna Multiversal',
      //home: const SLogin(),
      //home: const SPRAlteration(),
      //home: const SPRExpiredLink(),
      home: const SR1UserProf(),
    );
  }
}
