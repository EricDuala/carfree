// ignore: unnecessary_import
// ignore_for_file: unnecessary_new

// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga/SignUp/SignUp.dart';
import 'package:yoga/base_de_donnees/CreateBD.dart';
import 'package:yoga/base_de_donnees/connexionDB.dart';

class Enregistrement extends StatefulWidget {
  const Enregistrement({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Enregistrement createState() => _Enregistrement();
}

class _Enregistrement extends State<Enregistrement> {
  final _formKey = GlobalKey();
  final _scafoldKey = GlobalKey();
  final _marqueEditController = TextEditingController();
  final _couleurEditController = TextEditingController();
  final _immatriculationEditController = TextEditingController();
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
              child: TextField(
                  controller: _marqueEditController,
                  decoration: const InputDecoration(
                      labelText: 'marque du véhicule',
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
              child: TextField(
                  controller: _couleurEditController,
                  decoration: const InputDecoration(
                      labelText: 'Couleur du véhicule',
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
              child: TextField(
                  controller: _immatriculationEditController,
                  decoration: const InputDecoration(
                      labelText: 'immatriculation du véhicule',
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
                          .insertVehicule(TableTransport(
                        _marqueEditController.text,
                        _couleurEditController.text,
                        _immatriculationEditController.text,
                      ))
                          .then((result) {
                        if (result == -1) {
                          _scafoldKey.currentState != null
                              ? (SnackBar(
                                  content:
                                      Text('ce véhicule existe déjà $result')))
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
