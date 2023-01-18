// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:yoga/creationAnnonce/page_dashbord.dart';
import 'package:yoga/main.dart';
import 'package:yoga/main_welcome_page/welcome_page.dart';
import 'package:yoga/mon_profil.dart';
import 'package:yoga/sign_in_and_sign_up/login_page.dart';

class DashBordConducteur extends StatefulWidget {
  const DashBordConducteur({super.key});

  @override
  State<DashBordConducteur> createState() => _DashBordConducteurState();
}

class _DashBordConducteurState extends State<DashBordConducteur> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = const pageDashbord();
    } else if (currentPage == DrawerSections.profil_page) {
      container = const MonProfil();
    } else if (currentPage == DrawerSections.login_page) {
      container = const state();
    } else if (currentPage == DrawerSections.Setting) {
      container = const WelcomePage();
    } else if (currentPage == DrawerSections.Policy) {
      container = main();
    }

    return Scaffold(
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const UserAccountsDrawerHeader(
                  accountName: Text('Briand Duala'),
                  accountEmail: Text('eric.duala@totalenergies.cm'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/TotalEnergies.jpeg'),
                  ),
                  /*      decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          tileMode: TileMode.clamp)),
               */
                ),
                MyDrawerList()
              ],
            )),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            'Mon dashboard',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notification_add, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: container);
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          MenuItem(1, 'Dashboard', Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          MenuItem(2, 'Profil', Icons.person_outline,
              currentPage == DrawerSections.profil_page ? true : false),
          MenuItem(3, 'LogOut', Icons.logout_outlined,
              currentPage == DrawerSections.login_page ? true : false),
          const Divider(),
          MenuItem(4, 'Setting', Icons.settings_outlined,
              currentPage == DrawerSections.Setting ? true : false),
          MenuItem(5, 'Policy privacy', Icons.privacy_tip_outlined,
              currentPage == DrawerSections.Policy ? true : false),
        ],
      ),
    );
  }

  Widget MenuItem(int id, String title, IconData icon, bool select) {
    return Material(
      color: select ? Colors.red : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.profil_page;
            } else if (id == 3) {
              currentPage = DrawerSections.login_page;
            } else if (id == 4) {
              currentPage = DrawerSections.Setting;
            } else if (id == 5) {
              currentPage = DrawerSections.Policy;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                  child: Icon(
                icon,
                size: 20,
                color: Colors.blue,
              )),
              Expanded(
                  flex: 4,
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: constant_identifier_names
enum DrawerSections { dashboard, profil_page, login_page, Setting, Policy }
