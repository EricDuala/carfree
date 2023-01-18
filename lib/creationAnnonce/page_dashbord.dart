// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:yoga/creationAnnonce/Ajout.dart';
import 'package:yoga/creationAnnonce/Menu.dart';
import 'package:yoga/creationAnnonce/annonces_conducteur.dart';
import 'package:yoga/mon_profil.dart';

class pageDashbord extends StatefulWidget {
  const pageDashbord({super.key});

  @override
  State<pageDashbord> createState() => _pageDashbordState();
}

class _pageDashbordState extends State<pageDashbord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            //mes annonces
            Card(
              color: Colors.blue[600],
              margin: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnnonceConducteur()))
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.dashboard_customize_outlined,
                        size: 80.0,
                      ),
                      Text(
                        'Mes annonces',
                        style: TextStyle(fontSize: 18.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //liste des annonces
            Card(
              color: Colors.red[600],
              margin: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () => {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Menu()))
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.list_alt_outlined,
                        size: 80.0,
                      ),
                      Text(
                        'Liste des annonces',
                        style: TextStyle(fontSize: 18.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //créer une annonce
            Card(
              color: Colors.green[700],
              margin: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Ajout(
                                password: 'password',
                                username: 'username',
                              )))
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.create_new_folder_outlined,
                        size: 80.0,
                      ),
                      Text(
                        'Créer une annonce',
                        style: TextStyle(fontSize: 18.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //mes paramètres
            Card(
              color: Colors.amber[700],
              margin: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MonProfil()))
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.settings_accessibility_outlined,
                        size: 80.0,
                      ),
                      Text(
                        'Mes paramètres',
                        style: TextStyle(fontSize: 18.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
