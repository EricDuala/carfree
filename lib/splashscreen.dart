import 'package:flutter/material.dart';

import 'base_de_donnees/connexionDB.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State createState() {
    // ignore: todo
    // TODO: implement createState
    return SplashState();
  }
}

class SplashState extends State {
  int login = 101;
  late int loginData;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    loginData = login;
    // ignore: unnecessary_new
    new Future.delayed(const Duration(seconds: 5), () {
      DatabaseHelper.instance.getUser().then((result) {
        setState(() {
          loginData = result;
          if (loginData == 0) {
            Navigator.pushReplacementNamed(context, "/signup");
          } else {
            Navigator.pushReplacementNamed(context, "/home");
          }
          // ignore: avoid_print
          print("Called Return value on state  $loginData");
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // ignore: avoid_unnecessary_containers
        home: Container(
          child: Image.asset(
            "images/TotalEnergies.jpeg",
            fit: BoxFit.none,
          ),
        ));
  }
}
