import 'package:flutter/material.dart';
import 'package:yoga/delayed_animation.dart';
import 'package:yoga/sign_in_and_sign_up/reset_password_button.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final newpasswordController = TextEditingController();
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            'changez votre mot de passse ici si vous l\'avez oublié',
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
              controller: passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  icon: const Icon(
                    Icons.vpn_key_off_outlined,
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
                  hintText: 'nouveau mot de passe *',
                  hintStyle: TextStyle(color: Colors.grey[500])),
            ),
          ),

          const SizedBox(height: 10),

          //password
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
                textInputAction: TextInputAction.done,
                controller: newpasswordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    icon: const Icon(
                      Icons.password_outlined,
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
                    hintText: 'saisir à nouveau *',
                    hintStyle: TextStyle(color: Colors.grey[500]))),
          ),

          const SizedBox(height: 25),

          ResetPasswordButton(
            onTap: () => {},
          ),

          const SizedBox(height: 10),
        ])));
  }
}
