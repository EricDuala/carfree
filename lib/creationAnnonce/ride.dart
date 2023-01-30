// ignore_for_file: avoid_print, unnecessary_cast, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yoga/creationAnnonce/Ajout.dart';
import 'package:yoga/creationAnnonce/Menu.dart';
import 'package:yoga/profil/Profile_page.dart';

class Ride extends StatefulWidget {
  final String date;
  final String heure;
  final String typeOffre;
  final String username;
  final String password;
  final String rider;
  final String nb_place;

  const Ride(
      {super.key,
      required this.date,
      required this.heure,
      required this.typeOffre,
      required this.username,
      required this.password,
      required this.rider,
      required this.nb_place});

  @override
  RideState createState() => RideState();
}

class RideState extends State<Ride> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
      if (index == 1) {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child:
                  Ajout()), /*MaterialPageRoute(builder: (context) => Ajout())*/
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child:
                  const ProfilePage()), /*MaterialPageRoute(builder: (context) => Menu())*/
        );
      } else if (index == 0) {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.topToBottom,
              child:
                  Menu()), /*MaterialPageRoute(builder: (context) => Menu())*/
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Réserver cette ride'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_rental),
              label: 'Ajouter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped, //New
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            print('builder');
            return snapshot.hasData
                ? ListView.builder(itemBuilder: ((context, index) {
                    print('salut mec');
                    var data = (snapshot.data);
                    print(data);
                    List? liste = snapshot.data as List?;
                    return Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('images/ride.png'),
                        Card(
                          child: ListTile(
                            title: Text(
                              widget.typeOffre +
                                  ' le ' +
                                  widget.date +
                                  ' avec ' +
                                  widget.nb_place +
                                  ' places disponibles',
                              style: const TextStyle(fontSize: 25),
                            ),
                            isThreeLine: true,
                            subtitle: Text('Heure prévue : ' +
                                widget.heure +
                                '\n Proposé par : ' +
                                liste![index]['nomUser'] +
                                ' ' +
                                liste[index]['prenUser']),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 16.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text('Appuyez pour réserver',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6))),
                        ),
                        ButtonBar(
                          children: [
                            ElevatedButton(
                                onPressed: () {}, child: const Text('Réserver'))
                          ],
                        )
                      ],
                    ));
                  }))
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}
