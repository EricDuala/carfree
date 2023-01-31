// ignore_for_file: unused_field, avoid_unnecessary_containers, camel_case_types, non_constant_identifier_names, unnecessary_new, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoga/base_de_donnees/CreateBD.dart';
import 'package:yoga/base_de_donnees/api_response.dart';
import 'package:yoga/creationAnnonce/Menu.dart';
import 'package:yoga/delayed_animation.dart';
import 'package:yoga/services/user_services.dart';
import 'package:yoga/sign_in_and_sign_up/button/sign_up_button.dart';
import 'package:yoga/sign_in_and_sign_up/login_page.dart';

class stateUp extends StatefulWidget {
  const stateUp({super.key});

  @override
  SignUp createState() => SignUp();
}

class SignUp extends State<stateUp> {
  bool Loading = false;
  void registerUser() async {
    ApiResponse response = await register(
        first_nameController.text,
        last_nameController.text,
        phoneController.text,
        mailController.text,
        passwordController.text,
        valid_passwordController.text,
        type_role);
/*     final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0; */
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as TableUtilisateur);
    } else {
      setState(() {
        Loading = !Loading;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void _saveAndRedirectToHome(TableUtilisateur user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Menu()), (route) => false);
  }

  @override
  initState() {
    super.initState();
    registerUser();
  }
  /*  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Failed'),
            content: const Text('Check your email or password'),
            actions: <Widget>[
              ElevatedButton(
                child: const Text(
                  'Close',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = ''; */

  final GlobalKey<FormState> Formkey = GlobalKey<FormState>();

  final first_nameController = TextEditingController();
  final last_nameController = TextEditingController();
  final phoneController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final valid_passwordController = TextEditingController();
  late int type_role = 1;
/* 
  _onPressed() {
    setState(() {
      if (mailController.text.trim().toLowerCase().isNotEmpty &&
          passwordController.text.trim().isNotEmpty) {
        databaseHelper
            .registerData(
                first_nameController.text.trim(),
                last_nameController.text.trim(),
                phoneController.text.trim(),
                mailController.text.trim().toLowerCase(),
                passwordController.text.trim(),
                valid_passwordController.text.trim())
            .whenComplete(() {
          if (databaseHelper.status) {
            _showDialog();
            msgStatus = 'Check email or password';
          } else {
            Navigator.pushReplacementNamed(context, '/dashboard');
          }
        });
      }
    });
  } */

/*   String _dropdownValue = 'Conducteur';

  void dropDownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  } */

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
              const SizedBox(height: 25),
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
              const SizedBox(height: 10),
              //mail
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: first_nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      icon: const Icon(
                        Icons.person,
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
                      hintText: 'first name',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: last_nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      icon: const Icon(
                        Icons.person,
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
                      hintText: 'last name',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (val) =>
                      val!.isEmpty ? 'numéro de téléphone invalide' : null,
                  decoration: InputDecoration(
                      icon: const Icon(
                        Icons.phone,
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
                      hintText: 'phone number',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),

              const SizedBox(height: 10),

              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                    textInputAction: TextInputAction.done,
                    controller: mailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) =>
                        val!.isEmpty ? 'adresse mail invalide' : null,
                    decoration: InputDecoration(
                        icon: const Icon(
                          Icons.email,
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
                        hintText: 'email',
                        hintStyle: TextStyle(color: Colors.grey[500]))),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                    textInputAction: TextInputAction.done,
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    validator: (val) => val!.length < 8
                        ? 'le mot de passe doit avoir au moins 8 caratère'
                        : null,
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: const Icon(
                          Icons.vpn_key,
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
                        hintText: 'password',
                        hintStyle: TextStyle(color: Colors.grey[500]))),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                    textInputAction: TextInputAction.done,
                    controller: valid_passwordController,
                    keyboardType: TextInputType.text,
                    validator: (val) => val != passwordController.text
                        ? 'confirmer un mot de passe valide'
                        : null,
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: const Icon(
                          Icons.vpn_key,
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
                        hintText: 'verified password',
                        hintStyle: TextStyle(color: Colors.grey[500]))),
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
                      context, MaterialPageRoute(builder: (context) => Menu()))
                  /*   if (Formkey.currentContext == null)
                          {
                            // loginUser()
                            setState(() {
                              Loading = !Loading;
                              registerUser();
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
