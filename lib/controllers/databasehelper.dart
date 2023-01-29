// ignore_for_file: unnecessary_string_interpolations, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, prefer_const_declarations, unused_local_variable

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  var ServeUrl = Uri.parse(" https://carfrere.000webhostapp.com/api");

  var status;

  var token;

  //login d'un utilisateur
  loginData(String email, String password) async {
    var myUrl = Uri.parse("$ServeUrl/connexion");
    final response = await http.post(myUrl,
        headers: {'Accept': 'application/json'},
        body: {"email": "$email", "password": "$password"});
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  //logout d'un utilisateur
  logoutData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    var myUrl = Uri.parse("$ServeUrl/logout");
    final response = await http.post(
      myUrl,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $value',
      },
    );
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  //enregistrement d'un utilisateur
  registerData(String first_name, String last_name, String phone_number,
      String email, String password, String password_confirmation) async {
    var myUrl = Uri.parse("$ServeUrl/enregistrer");
    final response = await http.post(myUrl, headers: {
      'Accept': 'application/json'
    }, body: {
      "first_name": "$first_name",
      "last_name": "$last_name",
      "phone_number": "$phone_number",
      "email": "$email",
      "password": "$password",
      "password_confirmation": "$password_confirmation"
    });
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  //enregistrement d'un véhicule
  VehiculeData(String immatriculaiton, String couleur, String marque) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    var myUrl = Uri.parse("$ServeUrl/vehicule");
    final response = await http.post(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }, body: {
      "immatriculaiton": "$immatriculaiton",
      "couleur": "$couleur",
      "marque": "$marque"
    });
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  //création d'un annonce
  AnnonceData(DateTime date, String heure, String lieu_arrive,
      String lieu_depart, int nb_place) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    var myUrl = Uri.parse("$ServeUrl/annonce");
    final response = await http.post(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }, body: {
      "date": "$date",
      "heure": "$heure",
      "lieu_arrive": "$lieu_arrive",
      "lieu_depart": "$lieu_depart",
      "nb_place": "$nb_place"
    });
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  //vérifier si l'annonce est active
  estActif(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    var myUrl = Uri.parse("$ServeUrl/estActif/$id");
    final response = await http.post(
      myUrl,
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $value'},
    );
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  //rechercher une annonce
  Future<List> RechercherAnnonce(
      DateTime date, int nb_place, String lieu_arrive) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    var myUrl = Uri.parse("$ServeUrl/rechercher");
    http.Response response = await http.post(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }, body: {
      "date": "$date",
      "heure": "$nb_place",
      "nb_place": "$lieu_arrive"
    });
    return json.decode(response.body);
  }

  //reserver une annonce
  Future ReserverAnnonce(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    var myUrl = Uri.parse("$ServeUrl/reserver/$id");
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });
    return json.decode(response.body);
  }

  /*  void deleteData(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl/products/$id";
    http.delete(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  void addData(String name, String price) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl/products";
    http.post(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }, body: {
      "name": "$name",
      "price": "$price"
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  void editData(int id, String name, String price) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "http://flutterapitutorial.codeforiraq.org/api/products/$id";
    http.put(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }, body: {
      "name": "$name",
      "price": "$price"
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }*/

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}
