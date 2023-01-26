// ignore_for_file: unused_field, avoid_unnecessary_containers, camel_case_types, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yoga/delayed_animation.dart';
import 'package:yoga/sign_in_and_sign_up/button/suivant.dart';
import 'package:yoga/sign_in_and_sign_up/suite_conducteur.dart';
import 'package:http/http.dart' as http;

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  Sign_Conducteur createState() => Sign_Conducteur();
}

class Sign_Conducteur extends State<signUp> {
  Future getEnregistrer() async {
    var myUrl = Uri.parse(" http://localhost:8000/api/enregistrer");
    // ignore: unused_local_variable
    http.Response response = await http.post(myUrl, headers: {
      'Accept': 'application/json',
    });
    return json.decode(response.body);
  }

  final first_nameController = TextEditingController();
  final last_nameController = TextEditingController();
  final phoneController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final valid_passwordController = TextEditingController();

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
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
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
                      hintText: 'phone number *',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),

              const SizedBox(height: 10),

              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: mailController,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
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
                        hintText: 'email *',
                        hintStyle: TextStyle(color: Colors.grey[500]))),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: passwordController,
                    keyboardType: TextInputType.text,
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
                        hintText: 'password *',
                        hintStyle: TextStyle(color: Colors.grey[500]))),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: valid_passwordController,
                    keyboardType: TextInputType.text,
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
                        hintText: 'verified password *',
                        hintStyle: TextStyle(color: Colors.grey[500]))),
              ),

              const SizedBox(height: 25),

              suivant(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const suite()))
                },
              ),
            ],
          ),
        ));
  }
}
