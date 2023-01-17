// ignore_for_file: avoid_unnecessary_containers, unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yoga/base_de_donnees/CreateBD.dart';
import 'package:yoga/base_de_donnees/connexionDB.dart';
import 'package:yoga/creationAnnonce/Menu.dart';
import 'package:intl/intl.dart';

class Ajout extends StatefulWidget {
  final String username;
  final String password;

  const Ajout({super.key, required this.username, required this.password});
  @override
  AjoutState createState() => AjoutState();
}

class AjoutState extends State<Ajout> {
  int _selectedIndex = 0;

  DateTime date = DateTime.now();

  TextEditingController dateController = TextEditingController();
  TextEditingController heureController = TextEditingController();
  TextEditingController arriveController = TextEditingController();
  TextEditingController departController = TextEditingController();
  TextEditingController placeController = TextEditingController();

  void dropDownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {});
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child:
                  Menu()), /*MaterialPageRoute(builder: (context) => Menu())*/
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: const Ajout(
                  username: 'username',
                  password:
                      'password')), /*MaterialPageRoute(builder: (context) => Menu())*/
        );
      }
    });
  }

  late TimeOfDay _timeOfDay = TimeOfDay.now();

  void _timePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
        heureController.text = _timeOfDay.format(context).toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              padding: const EdgeInsets.only(top: 0),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                    child: const UserAccountsDrawerHeader(
                  accountName: Text(
                    'Briand Duala',
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: Text('eric.duala@totalenergies.cm',
                      style: TextStyle(color: Colors.black)),
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
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            'Ajouter une annonce',
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
          ],
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped, //New
        ),
        body: Center(
          child: Form(
              child: ListView(
            padding: const EdgeInsets.only(
                left: 20.0, bottom: 20.0, right: 20.0, top: 20.0),
            children: [
              //buildDatePicker(),
              Card(
                child: TextField(
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2101));
                    if (pickeddate != null) {
                      setState(() {
                        dateController.text =
                            DateFormat('dd-MM-yyyy').format(pickeddate);
                      });
                    }
                  },
                  controller: dateController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 20.0),
                      labelText: 'Date',
                      prefixIcon: Icon(Icons.calendar_today),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0))),
                ),
              ),
              Card(
                child: TextFormField(
                  onTap: _timePicker,
                  controller: heureController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      labelText: 'Heure',
                      prefixIcon: Icon(Icons.watch),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0))),
                ),
              ),

              Card(
                child: TextFormField(
                  controller: arriveController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                      labelText: 'Lieu d\'arrivée',
                      prefixIcon: Icon(Icons.map_outlined),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0))),
                ),
              ),

              Card(
                child: TextFormField(
                  controller: departController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                      labelText: 'lieu de départ',
                      prefixIcon: Icon(Icons.departure_board_outlined),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0))),
                ),
              ),

              Card(
                child: TextFormField(
                  controller: placeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'nombre de place',
                      prefixIcon: Icon(Icons.person_outlined),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0))),
                ),
              ),

              /*           Card(
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                      labelText: 'Type d\'offre',
                      prefixIcon: Icon(Icons.place),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0))),
                  items: const [
                    DropdownMenuItem(
                      value: "Arrivée",
                      child: Text('Arrivée'),
                    ),
                    DropdownMenuItem(value: "Départ", child: Text('Départ'))
                  ],
                  value: _dropdownValue,
                  onChanged: dropDownCallBack,
                  iconSize: 42.0,
                  //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  iconEnabledColor: Colors.indigo,
                  isExpanded: true,
                ),
              ),
 */
              /*TextFormField(
                decoration: InputDecoration(
                    labelText: 'Type d\'offre',
                    hintText: 'Départ / Arrivée',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            color: Colors.indigoAccent, width: 2.0))),
              ),*/
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Menu()));
                  DatabaseHelper.instance.insertVehicule(TableTransport(
                      dateController.text,
                      heureController.text,
                      placeController.text));
                },
                child: const Text("Ajouter"),
              ),
              Image.asset('images/ajout2.png'),
            ],
          )),
        ));
  }

  Widget buildDatePicker() => CupertinoDatePicker(
      initialDateTime: date,
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (date) => setState(() {
            this.date = date;
          }));
}
