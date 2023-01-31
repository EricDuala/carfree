// ignore_for_file: unused_field, avoid_unnecessary_containers, camel_case_types, use_build_context_synchronously, prefer_const_declarations, unused_element, unnecessary_new, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:yoga/creationAnnonce/Menu.dart';
import 'package:yoga/delayed_animation.dart';
import 'package:yoga/main_welcome_page/social_page.dart';
import 'package:yoga/profil/Profile_page.dart';
import 'package:yoga/sign_in_and_sign_up/button/sign_button.dart';

class state extends StatefulWidget {
  const state({super.key});

  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<state> {
/*   bool Loading = false;
  void loginUser() async {
    ApiResponse response =
        await login(mailController.text, passwordController.text);
/*     final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0; */
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as TableUtilisateur);
    } else {
      setState(() {
        Loading = false;
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
        MaterialPageRoute(builder: (context) => const DashBordConducteur()),
        (route) => false);
  }

  @override
  initState() {
    super.initState();
    loginUser();
  }
 */

  final GlobalKey<FormState> Formkey = GlobalKey<FormState>();

  final TextEditingController mailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

/*   _onPressed() {
    setState(() {
      if (mailController.text.trim().toLowerCase().isNotEmpty &&
          passwordController.text.trim().isNotEmpty) {
        login(mailController.text.trim().toLowerCase(),
                passwordController.text.trim())
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
              const SizedBox(height: 25),
              //mail
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
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
                      hintText: 'email *',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),

              const SizedBox(height: 10),

              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                    textInputAction: TextInputAction.done,
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (val) =>
                        val!.length < 8 ? 'mot de passe invalide' : null,
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

              Container(
                margin: const EdgeInsets.only(top: 20, right: 20),
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: const Text(
                    'mot de passe oublié ?',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()))
                  },
                ),
              ),

              const SizedBox(height: 25),
              /*  Loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : */
              sign_button(
                onTap: () => {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Menu()))
                  /* if (Formkey.currentContext == null)
                          {
                            // loginUser()
                            setState(() {
                              Loading = true;
                              loginUser();
                            })
                          } */
                },
              ),

              const SizedBox(height: 50),

              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pas de Compte ?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      GestureDetector(
                          onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SocialPage()))
                              },
                          child: const Text(
                            'Créer un compte',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ))
            ],
          ),
        ));
  }

/*   void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Failed'),
            content: const Text('Check your email or password'),
            actions: <Widget>[
              new ElevatedButton(
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
  } */
}
