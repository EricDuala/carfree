// ignore_for_file: camel_case_types, sort_child_properties_last, sized_box_for_whitespace, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoga/creationAnnonce/calender.dart';
import 'package:yoga/main.dart';

/* class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  MyDashboard createState() => MyDashboard();
} */

class MyDashboard extends StatelessWidget {
  const MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [const SearchSection(), CarSection()],
      )),
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 170,
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(0, 3)),
                    ]),
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'lieu d\'arrivé',
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none),
                ),
              )),
              const SizedBox(width: 10),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 4)),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return calender();
                          },
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.search,
                      size: 26,
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10),
                        primary: d_red)),
              ),
            ],
          ),
          /*  const SizedBox(
            height: 30,
          ), */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date départ',
                      style:
                          GoogleFonts.nunito(color: Colors.grey, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '18 janvier 2023',
                      style:
                          GoogleFonts.nunito(color: Colors.black, fontSize: 17),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'nombre de places',
                      style:
                          GoogleFonts.nunito(color: Colors.grey, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '3 places reservées',
                      style:
                          GoogleFonts.nunito(color: Colors.black, fontSize: 17),
                    )
                  ],
                ),
              )
            ],
          )
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
    {
      'prenom': 'briand',
      'nom': 'duala',
      'phone': '222222222',
      'marque': 'Toyota',
      'couleur': 'gris',
      'immatriculation': 'LT4444',
      'places': '5',
      'heure': '14h30',
      'lieu': 'immeuble PMUC'
    },
    {
      'prenom': 'briand',
      'nom': 'duala',
      'phone': '111111111',
      'marque': 'Hunday',
      'couleur': 'noir',
      'immatriculation': 'LT77777',
      'places': '1',
      'heure': '16h30',
      'lieu': 'Bonamoussadi'
    }
  ];
  CarSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '10 covoiturages trouvés',
                  style: GoogleFonts.nunito(color: Colors.black, fontSize: 15),
                ),
                Row(
                  children: [
                    Text(
                      'filtrer',
                      style:
                          GoogleFonts.nunito(color: Colors.black, fontSize: 15),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.filter_list_outlined,
                          color: d_red,
                          size: 25,
                        ))
                  ],
                )
              ],
            ),
          ),
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
            height: 140,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(carData['lieu'] + ' dès ' + carData['heure']),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
        ],
      ),
    );
  }
}
