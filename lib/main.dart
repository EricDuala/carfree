// import 'dart:async';
// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'package:flutter/material.dart';

import 'package:yoga/base_de_donnees/connexionDB.dart';

import 'package:yoga/main_welcome_page/welcome_page.dart';
// import 'package:splashscreen/splashscreen.dart';

// ignore: constant_identifier_names
const d_red = Color(0xFFE9717D);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;
  DatabaseHelper().initDb();
  if (DatabaseHelper.internal().db != null) {
    print("ok");
  } else {
    print("error");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'CarFree',
        debugShowCheckedModeBanner: false,
        home: WelcomePage());
  }
}

/* class SplashScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.white,
      seconds: 10,
      navigateAfterSeconds: WelcomePage(),
      title: new Text(
        'CarFree',
        textScaleFactor: 2,
      ),
      image: new Image.asset('images/TotalEnergies.jpeg'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.black,
    );
  }
} */
