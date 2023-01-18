// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:yoga/creationAnnonce/Ajout.dart';
import 'package:yoga/creationAnnonce/Menu.dart';
import 'package:yoga/mon_profil.dart';

class DashBordConducteur extends StatefulWidget {
  const DashBordConducteur({super.key});

  @override
  State<DashBordConducteur> createState() => _DashBordConducteurState();
}

class _DashBordConducteurState extends State<DashBordConducteur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Mon Dashbord',
          style: TextStyle(color: Colors.amber),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            //mes annonces
            Card(
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
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
              margin: const EdgeInsets.all(8.0),
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
              margin: const EdgeInsets.all(8.0),
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
              margin: const EdgeInsets.all(8.0),
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
