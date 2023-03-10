// ignore_for_file: unused_field, avoid_unnecessary_containers, camel_case_types, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoga/base_de_donnees/CreateBD.dart';
import 'package:yoga/base_de_donnees/api_response.dart';
import 'package:yoga/creationAnnonce/dashboard/dashbord_conducteur.dart';
import 'package:yoga/delayed_animation.dart';
import 'package:yoga/services/vehicule_services.dart';
import 'package:yoga/sign_in_and_sign_up/button/sign_up_button.dart';
import 'package:yoga/sign_in_and_sign_up/login_page.dart';

class suite extends StatefulWidget {
  const suite({super.key});

  @override
  suite_conducteur createState() => suite_conducteur();
}

class suite_conducteur extends State<suite> {
  bool Loading = false;
  void Vehicule() async {
    ApiResponse response = await AddVehicule(immatriculationController.text,
        marqueController.text, couleurController.text);
/*     final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0; */
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as TableTransport);
    } else {
      setState(() {
        Loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void _saveAndRedirectToHome(TableTransport user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const DashBordConducteur()),
        (route) => false);
  }

  @override
  initState() {
    super.initState();
    Vehicule();
  }

/*   DatabaseHelper databaseHelper = new DatabaseHelper();

  String msgStatus = ''; */

  final GlobalKey<FormState> Formkey = GlobalKey<FormState>();

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
          key: Formkey,
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
                      hintText: 'marque du v??hicule',
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
                      hintText: 'couleur du v??hicule',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),

              const SizedBox(height: 25),

              /* Loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  :  */
              sign_up_button(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashBordConducteur()))
                  /*  if (Formkey.currentContext == null)
                          {
                            // loginUser()
                            setState(() {
                              Loading = !Loading;
                              Vehicule();
                            })
                          } */
                },
              ),

              const SizedBox(height: 25),

              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'D??j?? un Compte ?',
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
