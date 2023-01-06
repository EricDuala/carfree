import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yoga/base_de_donnees/CreateBD.dart';
import 'package:yoga/base_de_donnees/connexionDB.dart';
import 'package:yoga/creationAnnonce/Menu.dart';
import 'package:yoga/creationAnnonce/Profile_page.dart';

class Ajout extends StatefulWidget {
  final String username;
  final String password;

  const Ajout({super.key, required this.username, required this.password});
  @override
  AjoutState createState() => AjoutState();
}

class AjoutState extends State<Ajout> {
  int _selectedIndex = 0;
  String _dropdownValue = 'Arrivée';

  DateTime date = DateTime.now();

  TextEditingController dateController = TextEditingController();
  TextEditingController heureController = TextEditingController();
  TextEditingController offreController = TextEditingController();

  void dropDownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
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
        appBar: AppBar(
          title: const Text('Add a ride'),
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
        body: Center(
          child: Form(
              child: ListView(
            padding: const EdgeInsets.only(
                left: 20.0, bottom: 20.0, right: 20.0, top: 20.0),
            children: <Widget>[
              //buildDatePicker(),
              Card(
                child: TextField(
                  controller: dateController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 20.0),
                      labelText: 'Date',
                      prefixIcon: Icon(Icons.calendar_today),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.indigoAccent, width: 2.0))),
                ),
              ),
              Card(
                child: TextFormField(
                  controller: heureController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      labelText: 'Heure',
                      prefixIcon: Icon(Icons.watch),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.indigoAccent, width: 2.0))),
                ),
              ),
              Card(
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                      labelText: 'Type d\'offre',
                      prefixIcon: Icon(Icons.car_rental),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.indigoAccent, width: 2.0))),
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
                  DatabaseHelper.instance.insertVehicule(TableTransport(
                      dateController.text,
                      heureController.text,
                      offreController.text));
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
