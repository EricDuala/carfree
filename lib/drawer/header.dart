// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: const UserAccountsDrawerHeader(
            accountName: Text('Briand Duala'),
            accountEmail: Text('eric.duala@totalenergies.cm'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/TotalEnergies.jpeg'),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    tileMode: TileMode.clamp)),
          ))
        ],
      ),
    );
  }
}
