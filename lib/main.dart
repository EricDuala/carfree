// import 'dart:async';
// ignore_for_file: unnecessary_null_comparison, avoid_print, unnecessary_const

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:yoga/main_welcome_page/welcome_page.dart';

// import 'package:splashscreen/splashscreen.dart';

// ignore: constant_identifier_names
const d_red = Color(0xFFE9717D);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;
/*   DatabaseHelper().initDb();
  if (DatabaseHelper.internal().db != null) {
    print("ok");
  } else {
    print("error");
  } */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarFree',
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splash: 'images/TotalEnergies.jpeg',
          duration: 3000,
          backgroundColor: Colors.white,
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: const WelcomePage()),
    );
  }
}
