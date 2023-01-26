// ignore: file_names
// ignore_for_file: unnecessary_this, recursive_getters, unnecessary_null_comparison, unnecessary_new, prefer_collection_literals, duplicate_ignore, non_constant_identifier_names, unused_field

class TableUtilisateur {
  late int _id;
  late String _first_name;
  late String _last_name;
  late String _phone_number;
  late String _email;
  late String _password;
  late String _password_confirmation;

  TableUtilisateur(String first_name, String last_name, String phone_number,
      String email, String password, String password_confirmation) {
    this._first_name = first_name;
    this._last_name = last_name;
    this._phone_number = phone_number;
    this._email = email;
    this._password = password;
    this._password_confirmation = password_confirmation;
  }

  TableUtilisateur.map(dynamic obj) {
    this._id = obj['id'];
    this._first_name = obj['first_name'];
    this._last_name = obj['last_name'];
    this._phone_number = obj['phone_number'];
    this._email = obj['email'];
    this._password = obj['password'];
    this._password_confirmation = obj['password_confirmation'];
  }

  int get id => id;
  String get first_name => first_name;
  String get last_name => last_name;
  String get phone_number => phone_number;
  String get email => email;
  String get password => password;
  String get password_confirmation => password_confirmation;

  // ignore: duplicate_ignore
  Map<String, dynamic> toUserMap() {
    // ignore: prefer_collection_literals
    var map = Map<String, dynamic>();
    // ignore: unnecessary_null_comparison
    if (id != null) {
      map['id'] = id;
    }
    map['first_name'] = _first_name;
    map['last_name'] = _last_name;
    map['phone_number'] = _phone_number;
    map['email'] = _email;
    map['password'] = _password;
    map['password_confirmation'] = _password_confirmation;

    return map;
  }

  TableUtilisateur.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._first_name = map['first_name'];
    this._last_name = map['last_name'];
    this._phone_number = map['phone_number'];
    this._email = map['email'];
    this._password = map['password'];
    this._password_confirmation = map['password_confirmation'];
  }
}

class TableAnnonce {
  late int _id;
  late String _date_depart;
  late String _heure_depart;
  // ignore: non_constant_identifier_names
  late String _lieu_depart;
  late String _lieu_arrive;
  late int _nb_place;

  TableAnnonce(
      // ignore: non_constant_identifier_names
      String date,
      String heure,
      // ignore: non_constant_identifier_names
      String lieu_depart,
      String lieu_arrive,
      int nb_place) {
    this._date_depart = date;
    this._heure_depart = heure;
    this._lieu_depart = lieu_depart;
    this._lieu_arrive = lieu_arrive;
    this._nb_place = nb_place;
  }

  TableAnnonce.map(dynamic obj) {
    this._id = obj['idAnnonce'];
    this._date_depart = obj['date'];
    this._heure_depart = obj['heure'];
    this._lieu_depart = obj['lieu_depart'];
    this._lieu_arrive = obj['lieu_arrive'];
    this._nb_place = obj['nb_place'];
  }

  int get idAnnonce => _id;
  String get date => _date_depart;
  String get heure => _heure_depart;
  // ignore: non_constant_identifier_names
  String get lieu_depart => _lieu_depart;
  String get lieu_arrive => _lieu_arrive;
  int get nb_place => _nb_place;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['date'] = _date_depart;
    map['heure'] = _heure_depart;
    map['lieu_depart'] = _lieu_depart;
    map['lieu_arrive'] = _lieu_arrive;
    map['nb_place'] = _nb_place;

    return map;
  }

  TableAnnonce.fromMap(Map<String, dynamic> map) {
    this._id = map['idAnnonce'];
    this._date_depart = map['date'];
    this._heure_depart = map['heure'];
    this._lieu_depart = map['lieu_depart'];
    this._lieu_arrive = map['lieu_arrive'];
    this._nb_place = map['nb_place'];
  }
}

class TableTransport {
  late int _id;
  late String _marque_vehicule;
  late String _couleur_vehicule;
  // ignore: non_constant_identifier_names
  late String _immatriculation;
  // ignore: prefer_typing_uninitialized_variables

  TableTransport(
    // ignore: non_constant_identifier_names
    String marque,
    String couleur,
    // ignore: non_constant_identifier_names
    String immatriculation,
  ) {
    this._marque_vehicule = marque;
    this._couleur_vehicule = couleur;
    this._immatriculation = immatriculation;
  }

  TableTransport.map(dynamic obj) {
    this._id = obj['idVehicule'];
    this._marque_vehicule = obj['marque'];
    this._couleur_vehicule = obj['couleur'];
    this._immatriculation = obj['immatriculation'];
  }

  int get idVehicule => _id;
  String get marque => _marque_vehicule;
  String get couleur => _couleur_vehicule;
  // ignore: non_constant_identifier_names
  String get immatriculation => _immatriculation;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['idVehicule'] = _id;
    }
    map['marque'] = _marque_vehicule;
    map['couleur'] = _couleur_vehicule;
    map['immatriculation'] = _immatriculation;

    return map;
  }

  TableTransport.fromMap(Map<String, dynamic> map) {
    this._id = map['idVehicule'];
    this._marque_vehicule = map['marque'];
    this._couleur_vehicule = map['couleur'];
    this._immatriculation = map['immatriculation'];
  }
}
