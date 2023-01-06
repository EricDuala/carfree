// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yoga/base_de_donnees/CreateBD.dart';
import 'package:yoga/base_de_donnees/connexionDB.dart';
import 'package:yoga/creationAnnonce/Ajout.dart';
import 'package:yoga/creationAnnonce/Menu.dart';
import 'package:yoga/login.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  final String password;

  const ProfilePage(
      {super.key, required this.username, required this.password});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController pastPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  // ignore: unnecessary_new

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
      } else if (index == 0) {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child:
                  Menu()), /*MaterialPageRoute(builder: (context) => Menu())*/
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modifier votre profil')),
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
        future: DatabaseHelper().getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          print('builder');
          return snapshot.hasData
              ? ListView.builder(itemBuilder: ((context, index) {
                  var data = (snapshot.data);
                  print(data);
                  // ignore: unnecessary_cast
                  List? liste = snapshot.data as List?;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.person_outline_rounded),
                          title: TextField(
                            controller: nomController,
                            decoration: InputDecoration(
                                hintText: liste![index]['nomUser'],
                                labelText: liste[index]['nomUser'],
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 2.0)),
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Colors.indigoAccent,
                                        width: 2.0))),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                            leading: const Icon(Icons.person_outline_rounded),
                            title: TextField(
                              controller: prenomController,
                              decoration: InputDecoration(
                                  hintText: liste[index]['prenUser'],
                                  labelText: liste[index]['prenUser'],
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 2.0)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: Colors.indigoAccent,
                                          width: 2.0))),
                            )),
                      ),
                      Card(
                        child: ListTile(
                            leading: const Icon(Icons.phone),
                            title: TextField(
                              controller: telController,
                              decoration: InputDecoration(
                                  hintText: liste[index]['telUser'],
                                  labelText: liste[index]['telUser'],
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 2.0)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: Colors.indigoAccent,
                                          width: 2.0))),
                            )),
                      ),
                      Card(
                        child: ListTile(
                            leading: const Icon(Icons.mail),
                            title: TextField(
                              controller: mailController,
                              decoration: InputDecoration(
                                  hintText: liste[index]['mailUser'],
                                  labelText: liste[index]['mailUser'],
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 2.0)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: Colors.indigoAccent,
                                          width: 2.0))),
                            )),
                      ),
                      Card(
                        child: ListTile(
                            leading: const Icon(Icons.password),
                            title: TextField(
                              controller: pastPasswordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  hintText: 'Ancien mot de passe',
                                  labelText: 'Password',
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 2.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: Colors.indigoAccent,
                                          width: 2.0))),
                            )),
                      ),
                      Card(
                        child: ListTile(
                            leading: const Icon(Icons.password),
                            title: TextField(
                              controller: newPasswordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  hintText: 'Nouveau mot de passe',
                                  labelText: 'Password',
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 2.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: Colors.indigoAccent,
                                          width: 2.0))),
                            )),
                      ),
                      ButtonBar(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                DatabaseHelper.instance.insertUser(
                                    TableUtilisateur(
                                        nomController.text,
                                        prenomController.text,
                                        telController.text,
                                        mailController.text,
                                        newPasswordController.text,
                                        newPasswordController.text));
                              },
                              child: const Text('Modifier')),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .leftToRightWithFade,
                                      child: const LoginPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              child: const Text('Se déconnecter'))
                        ],
                      )
                    ],
                  );
                }))
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
