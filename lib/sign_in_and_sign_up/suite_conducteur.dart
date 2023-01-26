// ignore_for_file: unused_field, avoid_unnecessary_containers, camel_case_types, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yoga/creationAnnonce/dashboard/dashbord_conducteur.dart';
import 'package:yoga/delayed_animation.dart';
import 'package:yoga/sign_in_and_sign_up/button/sign_up_button.dart';
import 'package:yoga/sign_in_and_sign_up/login_page.dart';
import 'package:http/http.dart' as http;

class suite extends StatefulWidget {
  const suite({super.key});

  @override
  suite_conducteur createState() => suite_conducteur();
}

class suite_conducteur extends State<suite> {
  Future getEnregistrer() async {
    var myUrl = Uri.parse(" http://localhost:8000/api/vehicule");
    // ignore: unused_local_variable
    http.Response response = await http.post(myUrl, headers: {
      'Accept': 'application/json',
    });
    return json.decode(response.body);
  }

  final immatriculationController = TextEditingController();
  final marqueController = TextEditingController();
  final couleurController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              DelayedAnimation(
                delay: 1500,
                child: SizedBox(
                  height: 100,
                  child: Image.asset('images/TotalEnergies.jpeg'),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Bienvenue dans l\'application de covoiturage',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 15),
              //mail
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: immatriculationController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      icon: const Icon(
                        Icons.car_repair,
                        color: Colors.black,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'immatriculation',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: marqueController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      icon: const Icon(
                        Icons.wb_auto_sharp,
                        color: Colors.black,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'marque du véhicule',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: couleurController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      icon: const Icon(
                        Icons.color_lens,
                        color: Colors.black,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'couleur du véhicule',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),

              const SizedBox(height: 25),

              sign_up_button(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashBordConducteur()))
                },
              ),

              const SizedBox(height: 25),

              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Déjà un Compte ?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      GestureDetector(
                          onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const state()))
                              },
                          child: const Text(
                            'Connectez-vous',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ))
            ],
          ),
        ));
  }
}
