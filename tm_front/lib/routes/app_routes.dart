import 'package:flutter/material.dart';
import '../screens/register/user/sru.dart';
import '../screens/register/player/srp1_choice.dart';
import '../screens/register/gm/srgm1_choice.dart';
import '../screens/register/player/srp2_intro.dart';
import '../screens/register/gm/srgm2_intro.dart';
import '../screens/s_homepage.dart';

class AppRoutes {
  static const String sr1UserProf = '/';
  static const String srp1Choice = '/srp1Choice';
  static const String srgm1Choice = '/srgm1Choice';
  static const String srp2Intro = '/srp2Intro';
  static const String srgm2Intro = '/srgm2Intro';
  static const String homepage = '/homepage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case sr1UserProf:
        return MaterialPageRoute(builder: (_) => const SR1UserProf());
      case srp1Choice:
        return MaterialPageRoute(builder: (_) => const SRP1Choice());
      // case srgm1Choice:
      //   return MaterialPageRoute(builder: (_) => const SRGM1Choice());
      // case srp2Intro:
      //   return MaterialPageRoute(builder: (_) => const SRP2Intro());
      // case srgm2Intro:
      //   return MaterialPageRoute(builder: (_) => const SRGM2Intro());
      // case homepage:
      //   return MaterialPageRoute(builder: (_) => const Homepage());
      default:
        return MaterialPageRoute(builder: (_) => const SR1UserProf());
    }
  }
}
