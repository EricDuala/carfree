// ignore_for_file: sized_box_for_whitespace, library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoga/sign_in_and_sign_up/modify_button.dart';

class AnnonceConducteur extends StatefulWidget {
  const AnnonceConducteur({super.key});

  @override
  State<AnnonceConducteur> createState() => _AnnonceConducteurState();
}

class _AnnonceConducteurState extends State<AnnonceConducteur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mes annonces'),
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
        children: [const SearchSection(), CarSection()],
      )),
    );
  }
}

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  _SearchSection createState() => _SearchSection();
}

class _SearchSection extends State<SearchSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 100,
      padding: const EdgeInsets.only(right: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bienvenue Briand Duala dans votre Dashboard',
                      style: GoogleFonts.nunito(
                          color: Colors.blue[700], fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vous avez à votre actif 3 annonces',
                      style: GoogleFonts.nunito(
                          color: Colors.greenAccent[700], fontSize: 15),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CarSection extends StatelessWidget {
  final List CarList = [
    {
      'prenom': 'briand',
      'nom': 'duala',
      'phone': '66666666',
      'marque': 'BMW',
      'couleur': 'rouge',
      'immatriculation': 'LT2222',
      'places': '3',
      'heure': '15h30',
      'lieu': 'siège total'
    },
    {
      'prenom': 'briand',
      'nom': 'duala',
      'phone': '777777777',
      'marque': 'Prado',
      'couleur': 'noire',
      'immatriculation': 'LT33333',
      'places': '2',
      'heure': '17h30',
      'lieu': 'siège total'
    },
    {
      'prenom': 'briand',
      'nom': 'duala',
      'phone': '88888888',
      'marque': 'yaris',
      'couleur': 'verte',
      'immatriculation': 'LT55555',
      'places': '8',
      'heure': '19h30',
      'lieu': 'immeuble PMUC'
    },
  ];
  CarSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Column(
            children: CarList.map((car) {
              return CarMap(car);
            }).toList(),
          )
        ],
      ),
    );
  }
}

class CarMap extends StatelessWidget {
  final Map carData;
  const CarMap(this.carData, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 80, 80, 80),
                spreadRadius: 4,
                blurRadius: 6,
                offset: Offset(0, 5))
          ]),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  carData['prenom'] +
                      ' ' +
                      carData['nom'] +
                      ' de numéro ' +
                      carData['phone'],
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w800, fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  carData['marque'] +
                      ' de couleur ' +
                      carData['couleur'] +
                      ' et d\'immatriculaiton ' +
                      carData['immatriculation'],
                  style: GoogleFonts.nunito(color: Colors.blue, fontSize: 15),
                ),
              ],
            ),
            /*      decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: Colors.white,
            ), */
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(carData['lieu'] + ' dès ' + carData['heure']),
                Row(
                  children: const [
                    Icon(
                      Icons.place,
                      color: Colors.green,
                      size: 20.0,
                    )
                  ],
                ),
                Text(
                  carData['places'] + " places disponible(s)",
                  style: GoogleFonts.nunito(color: Colors.red, fontSize: 12),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 40,
            child: Row(
/*               crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween, */
              children: [modify_button(onTap: () {})],
            ),
          )
        ],
      ),
    );
  }
}
