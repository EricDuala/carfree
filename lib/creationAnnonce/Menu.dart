// ignore_for_file: avoid_print, avoid_unnecessary_containers, non_constant_identifier_names, constant_identifier_names, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yoga/creationAnnonce/dashboard/dashboard.dart';
import 'package:yoga/main.dart';
import 'package:yoga/main_welcome_page/welcome_page.dart';
import 'package:yoga/profil/mon_profil.dart';
import 'package:yoga/sign_in_and_sign_up/login_page.dart';
import 'package:http/http.dart' as http;

// ignore: use_key_in_widget_constructors
class Menu extends StatefulWidget {
  late final String username;
  late final String password;
  checkUserLogin(username, password) {
    throw UnimplementedError();
  }

  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
  Future getData() async {
    var myUrl = Uri.parse(" http://localhost:8000/api/enregistrer");
    http.Response response = await http.post(myUrl, headers: {
      'Accept': 'application/json',
    });
    return json.decode(response.body);
  }

  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = const MyDashboard();
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
                /*   decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.white],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        tileMode: TileMode.clamp)), */
              ),
              MyDrawerList()
            ],
          )),
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Menu',
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
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: container,
    );
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

enum DrawerSections { dashboard, profil_page, login_page, Setting, Policy }
