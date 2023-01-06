// ignore: unnecessary_import
// ignore_for_file: unnecessary_new

// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga/base_de_donnees/CreateBD.dart';
import 'package:yoga/base_de_donnees/connexionDB.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignupPage> {
  final _formKey = GlobalKey();
  final _scafoldKey = GlobalKey();
  final _nameEditController = TextEditingController();
  final _preEditController = TextEditingController();
  final _emailEditController = TextEditingController();
  final _mobileEditController = TextEditingController();
  final _passwordEditController = TextEditingController();
  final _verifypasswordEditController = TextEditingController();
  // ignore: non_constant_identifier_names
  String email_pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  // ignore: non_constant_identifier_names
  String password_pattern =
      r'^[?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]]{8,}';
  // ignore: non_constant_identifier_names
  String mobile_pattern = r'^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$';

  late Size size;

  @override
  // ignore: duplicate_ignore,
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scafoldKey,
      body: Center(
        child: Form(
            child: ListView(
          children: <Widget>[
            Image.asset('images/create.png'),
            Card(
              child: TextFormField(
                  controller: _nameEditController,
                  validator: (value) {
                    if (value != null) {
                      return "Entrer votre nom";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: 'Nom',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.indigoAccent, width: 2.0)))),
            ),
            Card(
              child: TextFormField(
                  controller: _preEditController,
                  validator: (value) {
                    if (value != null) {
                      return "Entrer votre prenom";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: 'Prenom',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.indigoAccent, width: 2.0)))),
            ),
            Card(
              child: TextFormField(
                  controller: _emailEditController,
                  validator: (value) {
                    RegExp regex = RegExp(email_pattern);
                    if (!regex.hasMatch(value!)) {
                      return 'Entrer une adresse mail valide';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: 'Mail',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.indigoAccent, width: 2.0)))),
            ),
            Card(
              child: TextFormField(
                  controller: _mobileEditController,
                  validator: (value) {
                    RegExp regex = RegExp(mobile_pattern);
                    if (!regex.hasMatch(value!)) {
                      return 'Entrer un numéro valide';
                    } else {
                      return null;
                    }
                    // ignore: dead_code
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 9,
                  decoration: const InputDecoration(
                      labelText: 'Téléphone',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.indigoAccent, width: 2.0)))),
            ),
            Card(
              child: TextFormField(
                  controller: _passwordEditController,
                  validator: (value) {
                    RegExp regex = RegExp(password_pattern);
                    if (!regex.hasMatch(value!)) {
                      return 'un mot de passe possède au moins 8 caractères';
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Mot de Passe',
                      hintText: 'Saisir mot de passe',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.indigoAccent, width: 2.0)))),
            ),
            Card(
              child: TextFormField(
                  controller: _verifypasswordEditController,
                  validator: (value) {
                    if (_passwordEditController !=
                        _verifypasswordEditController) {
                      return 'le mot de passe n\'est pas correct';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      labelText: 'Mot de Passe',
                      hintText: 'Saisir à nouveau',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.indigoAccent, width: 2.0)))),
            ),
            ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState != null) {
                      DatabaseHelper.instance
                          .insertUser(TableUtilisateur(
                              _nameEditController.text,
                              _preEditController.text,
                              _emailEditController.text,
                              _mobileEditController.text,
                              _passwordEditController.text,
                              _verifypasswordEditController.text))
                          .then((result) {
                        if (result == -1) {
                          _scafoldKey.currentState != null
                              ? (SnackBar(
                                  content: Text(
                                      'Le numéro de cet utilisateur existe déjà $result')))
                              : const SignupPage();
                        } else {
                          _scafoldKey.currentState != null
                              ? (SnackBar(
                                  content:
                                      Text('Enregistrement réussi $result')))
                              : Navigator.pushReplacementNamed(
                                  context, "/menu");
                        }
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    "Enregistrer",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                TextButton(
                  child: const Text("Vous avez déjà un compte? Connectez-vous"),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/login");
                  },
                )
              ],
            )
          ],
        )),
      ),
    );
    ;
  }
}
