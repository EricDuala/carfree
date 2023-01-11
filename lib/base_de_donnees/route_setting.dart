// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:yoga/creationAnnonce/Menu.dart';
import 'package:yoga/main_welcome_page/welcome_page.dart';

class RouteSettingPage extends RouteSettings {
  // ignore: non_constant_identifier_names
  static RoutegenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const WelcomePage());
        // ignore: dead_code
        break;
      case "/home":
        return MaterialPageRoute(builder: (_) => const WelcomePage());
        // ignore: dead_code
        break;
      case "/menu":
        return MaterialPageRoute(builder: (_) => Menu());
        // ignore: dead_code
        break;
    }
  }
}
