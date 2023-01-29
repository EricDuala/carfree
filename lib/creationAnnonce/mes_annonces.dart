// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yoga/creationAnnonce/ride.dart';
import 'package:yoga/sign_in_and_sign_up/login_page.dart';

class MesMenus extends StatefulWidget {
  late final String username;
  late final String password;
  checkUserLogin(username, password) {
    throw UnimplementedError();
  }

  @override
  State<MesMenus> createState() => _MesMenusState();
}

class _MesMenusState extends State<MesMenus> {
  int _selectedIndex = 1;

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
                  const state()), /*MaterialPageRoute(builder: (context) => Ajout())*/
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child:
                  MesMenus()), /*MaterialPageRoute(builder: (context) => Menu())*/
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
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
          return snapshot.hasData
              ? ListView.builder(itemBuilder: (context, index) {
                  // ignore: unused_local_variable
                  var data = (snapshot.data);
                  List? liste = snapshot.data as List?;
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(liste![index]['date'],
                          style: const TextStyle(fontSize: 20)),
                      subtitle: Text(
                        liste[index]['heure'] +
                            '\n' +
                            liste[index]['typeOffre'],
                        style: const TextStyle(fontSize: 16),
                      ),
                      isThreeLine: true,
                      onTap: () => Navigator.push(
                          context,
                          PageTransition(
                              child: Ride(
                                  date: liste[index]['date'],
                                  heure: liste[index]['heure'],
                                  typeOffre: liste[index]['typeOffre'],
                                  username: widget.username,
                                  password: widget.password,
                                  nb_place: liste[index]['nb_place'],
                                  rider: liste[index]['idUser']),
                              type: PageTransitionType.bottomToTop)),
                    ),
                  );
                })
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
        /*Snapshot simplifie l'accès et la conversion des propriétés 
        d'un objet de type JSON*/
      ),
    );
  }
}
