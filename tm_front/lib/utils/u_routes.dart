import 'package:flutter/material.dart';
import 'package:tm_front/screens/password_recovery/spr_alteration.dart';
import 'package:tm_front/screens/password_recovery/spr_expired_link.dart';
import 'package:tm_front/screens/password_recovery/spr_main.dart';
import 'package:tm_front/screens/s_login.dart';
import '../screens/register/user/sru_prof.dart';
import '../screens/register/player/srp1_choice.dart';
import '../screens/register/gm/srgm1_choice.dart';
import '../screens/register/player/srp2_intro.dart';
import '../screens/register/gm/srgm2_intro.dart';
import '../screens/s_homepage.dart';

class URoutes {
  static const String sLogin = '/sLogin';
  static const String sprMain = '/sprMain';
  static const String sprAlteration = '/sprAlteration';
  static const String sprExpiredLink = '/sprExpiredLink';
  static const String sruProf = '/sruProf';
  static const String srp1Choice = '/srp1Choice';
  static const String srgm1Choice = '/srgm1Choice';
  static const String srp2Intro = '/srp2Intro';
  static const String srgm2Intro = '/srgm2Intro';
  static const String homepage = '/homepage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case sLogin:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SLogin());
      case sprMain:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SPRMain());
      case sprExpiredLink:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SPRExpiredLink());
      case sprAlteration:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SPRAlteration());
      case sruProf:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SRUProf());
      case srp1Choice:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SRP1Choice());
      case srgm1Choice:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SRGM1Choice());
      case srp2Intro:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SRP2Intro());
      case srgm2Intro:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SRGM2Intro());
      case homepage:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SHomePage());
      default:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SLogin());
    }
  }
}
