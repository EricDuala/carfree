// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:yoga/SignUp/Enregistrement_Conducteur.dart';
import 'package:yoga/SignUp/SignUp.dart';
import 'package:yoga/creationAnnonce/Menu.dart';
import 'package:yoga/login.dart';
import 'package:yoga/main_welcome_page/welcome_page.dart';
import 'package:yoga/splashscreen.dart';

class RouteSettingPage extends RouteSettings {
  // ignore: non_constant_identifier_names
  static RoutegenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const WelcomePage());
        // ignore: dead_code
        break;
      case "/splash":
        return MaterialPageRoute(builder: (_) => const SplashPage());
        // ignore: dead_code
        break;
      case "/login":
        return MaterialPageRoute(builder: (_) => const LoginPage());
        // ignore: dead_code
        break;
      case "/signup":
        return MaterialPageRoute(builder: (_) => const SignupPage());
        // ignore: dead_code
        break;
      case "/home":
        return MaterialPageRoute(builder: (_) => const WelcomePage());
        // ignore: dead_code
        break;
      case "/suivant":
        return MaterialPageRoute(builder: (_) => const Enregistrement());
        // ignore: dead_code
        break;
      case "/menu":
        return MaterialPageRoute(builder: (_) => Menu());
        // ignore: dead_code
        break;
    }
  }
}
