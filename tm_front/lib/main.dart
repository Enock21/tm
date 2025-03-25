import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tm_front/screens/register/user/sru_prof.dart';
import 'package:tm_front/screens/register/player/srp1_choice.dart';
import 'package:tm_front/screens/s_login.dart';
import 'package:tm_front/screens/password_recovery/spr_alteration.dart';
import 'package:tm_front/screens/password_recovery/spr_expired_link.dart';
import 'package:tm_front/routes/app_routes.dart';

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
      //initialRoute: AppRoutes.sLogin,
      //initialRoute: AppRoutes.srp1Choice,
      //initialRoute: AppRoutes.srgm1Choice,
      initialRoute: AppRoutes.srp2Intro,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
