// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:yoga/delayed_animation.dart';
import 'package:yoga/sign_in_and_sign_up/modify_compte_button.dart';
import 'package:yoga/sign_in_and_sign_up/reset_password.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  TextEditingController mailController = TextEditingController();

  // ignore: unnecessary_new

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'modifier votre profil',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 30),
          DelayedAnimation(
            delay: 1500,
            child: SizedBox(
              height: 100,
              child: Image.asset('images/TotalEnergies.jpeg'),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'modifier son profil ici !',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 25),
          //mail
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: mailController,
              keyboardType: TextInputType.emailAddress,
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
                  hintText: 'your email *',
                  hintStyle: TextStyle(color: Colors.grey[500])),
            ),
          ),

          const SizedBox(height: 25),

          ModifyCompteState(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResetPassword()))
            },
          ),
        ])));
  }
}
