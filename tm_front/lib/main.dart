import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Taverna Multiversal',
      supportedLocales: const [
        Locale('pt', 'BR'), // Adiciona suporte para português do Brasil
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate, // Suporte ao Material Design
        GlobalWidgetsLocalizations.delegate, // Suporte para widgets Flutter
        GlobalCupertinoLocalizations.delegate, // Suporte para Cupertino (iOS)
      ],
      home: const SR1UserProf(),
      //home: const SLogin(),
    );
  }
}
