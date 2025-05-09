import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tm_front/providers/p_registration_data.dart';
import 'package:tm_front/screens/register/user/sru_prof.dart';
import 'package:tm_front/screens/register/player/srp1_choice.dart';
import 'package:tm_front/screens/s_login.dart';
import 'package:tm_front/screens/password_recovery/spr_alteration.dart';
import 'package:tm_front/screens/password_recovery/spr_expired_link.dart';
import 'package:tm_front/utils/u_routes.dart';

void main() {
  runApp(ChangeNotifierProvider( //ChangeNotifierProvider se encontra mais alto do que o necessário na widget tree. Problema de escopo.
      create: (context) => PRegistrationData(), child: const MyApp()));
  //runApp(const MyApp());
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
      //initialRoute: URoutes.srp2Intro,
      //initialRoute: URoutes.srp3Types,
      //initialRoute: URoutes.srp4Sys,
      //initialRoute: URoutes.srp5Plat,
      //initialRoute: URoutes.srp6Time,
      //initialRoute: URoutes.srp7Search,
      //initialRoute: URoutes.srp8AboutMe,
      //initialRoute: URoutes.srgm1Choice,
      //initialRoute: URoutes.srgm2Intro,
      //initialRoute: URoutes.srgm3Types,
      //initialRoute: URoutes.srgm4Sys,
      //initialRoute: URoutes.srgm5Plat,
      //initialRoute: URoutes.srgm6Time,
      //initialRoute: URoutes.srgm7Search,
      //initialRoute: URoutes.srgm8AboutMe,
      //initialRoute: URoutes.sHomepage,
      //initialRoute: URoutes.sUserProfile,
      onGenerateRoute: URoutes.generateRoute,
    );
  }
}
