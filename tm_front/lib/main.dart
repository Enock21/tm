import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tm_front/screens/register/user/sru_prof.dart';
import 'package:tm_front/screens/register/player/srp1_choice.dart';
import 'package:tm_front/screens/s_login.dart';
import 'package:tm_front/screens/password_recovery/spr_alteration.dart';
import 'package:tm_front/screens/password_recovery/spr_expired_link.dart';
import 'package:tm_front/utils/u_routes.dart';

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
      //initialRoute: URoutes.sLogin,
      //initialRoute: URoutes.sprMain,
      //initialRoute: URoutes.sprExpiredLink,
      //initialRoute: URoutes.sprAlteration,
      //initialRoute: URoutes.sruProf,
      initialRoute: URoutes.srp1Choice,
      //initialRoute: URoutes.srgm1Choice,
      //initialRoute: URoutes.srp2Intro,
      onGenerateRoute: URoutes.generateRoute,
    );
  }
}
