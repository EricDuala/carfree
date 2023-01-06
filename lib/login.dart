import 'package:flutter/material.dart';
import 'package:yoga/AppBar/default_app_bar.dart';
import 'package:yoga/main_welcome_page/social_page.dart';

import 'base_de_donnees/connexionDB.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State createState() {
    // ignore: todo
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State {
  final _formKey = GlobalKey();
  final _scaffoldKey = GlobalKey();
  // ignore: unused_field
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  // ignore: unused_field
  final FocusNode _mailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    // ignore: unnecessary_new
    return Scaffold(
      key: _scaffoldKey,
      appBar:
          DefaultAppBar(Title(color: Colors.white, child: const Text("login"))),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _mailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      focusNode: _mailFocus,
                      onFieldSubmitted: (term) {
                        FocusScope.of(context).requestFocus(_passwordFocus);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Entrez votre mail";
                        }
                        return null;
                      },
                      style: getTextStyle(),
                      decoration: customInputDecoration(" adresse mail"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      focusNode: _passwordFocus,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Entrez votre mot de passe";
                        }
                        return null;
                      },
                      style: getTextStyle(),
                      decoration: customInputDecoration("mot de passe"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState != null) {
                          DatabaseHelper.instance
                              .checkUserLogin(_mailController.text,
                                  _passwordController.text)
                              .then((result) {
                            if (result == null) {
                              _scaffoldKey.currentState != null
                                  ? (const SnackBar(
                                      content:
                                          Text("Please enter valid details")))
                                  : const LoginPage();
                            } else {
                              Navigator.pushReplacementNamed(context, "/home");
                            }
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    TextButton(
                      child: const Text("Pas de compte ? Créer !"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SocialPage(),
                          ),
                        );
                      },
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  TextStyle getTextStyle() {
    return const TextStyle(fontSize: 18, color: Colors.pink);
  }

  InputDecoration customInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.teal),
      contentPadding: const EdgeInsets.all(10),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.pink)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.pink)),
    );
  }
}
