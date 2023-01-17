import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yoga/delayed_animation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yoga/main.dart';
import 'package:yoga/sign_in_and_sign_up/login_page.dart';
import 'package:yoga/sign_in_and_sign_up/sign_conducteur.dart';
import 'package:yoga/sign_in_and_sign_up/sign_up.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({super.key});

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
          children: [
            DelayedAnimation(
              delay: 1500,
              child: SizedBox(
                height: 100,
                child: Image.asset('images/logo.png'),
              ),
            ),
            DelayedAnimation(
              delay: 2500,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    Text(
                      "Bienvenue dans CarFree",
                      style: GoogleFonts.poppins(
                        color: d_red,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Choisissez votre profil pour aller plus loin !",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DelayedAnimation(
              delay: 3500,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 40,
                ),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRightWithFade,
                              child: const signUp()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: d_red,
                        padding: const EdgeInsets.all(13),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.car_rental),
                          const SizedBox(width: 10),
                          Text(
                            'CONDUCTEUR',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRightWithFade,
                              child: const stateUp()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: const Color(0xFF576dff),
                        padding: const EdgeInsets.all(13),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(FontAwesomeIcons.male),
                          const SizedBox(width: 10),
                          Text(
                            'PASSAGER',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
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
                                              builder: (context) =>
                                                  const state()))
                                    },
                                child: const Text(
                                  'Connectez-vous',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ))
                    /*  TextButton(
                      child: const Text(
                          "Vous avez déjà un compte? Connectez-vous"),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/login");
                      },
                    ) */
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
