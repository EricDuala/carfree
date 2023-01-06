// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yoga/AppBar/default_app_bar.dart';
import 'package:yoga/base_de_donnees/connexionDB.dart';
import 'package:yoga/creationAnnonce/Ajout.dart';
import 'package:yoga/creationAnnonce/Profile_page.dart';
import 'package:yoga/creationAnnonce/ride.dart';

// ignore: use_key_in_widget_constructors
class Menu extends StatefulWidget {
  late final String username;
  late final String password;
  // ignore: non_constant_identifier_names
  checkUserLogin(username, password) {
    throw UnimplementedError();
  }

  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
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
              child: Ajout(
                username: widget.username,
                password: widget.password,
              )), /*MaterialPageRoute(builder: (context) => Ajout())*/
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: ProfilePage(
                username: widget.username,
                password: widget.password,
              )), /*MaterialPageRoute(builder: (context) => Menu())*/
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        actions: const <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Recherche',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),*/
      appBar:
          DefaultAppBar(Title(color: Colors.white, child: const Text("Menu"))),
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
        future: DatabaseHelper().getTableTransport(),
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
