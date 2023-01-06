// ignore: file_names
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:yoga/base_de_donnees/CreateBD.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper dbs = DatabaseHelper._();

  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  // ignore: unused_element
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static String path = '';
  //table des utilisateurs
  // ignore: non_constant_identifier_names
  final String Utilisateur = 'TableUtilisateur';
  final String columnUserId = 'id';
  final String columnUsernom = 'first_name';
  final String columnUserpren = 'last_name';
  final String columnUsermail = 'email';
  final String columnUsertel = 'phone_user';
  final String columnUserpass = 'password';

//table de transport = [départ,arrivée]
  // ignore: non_constant_identifier_names
  final String Annonce = 'TableAnnonce';
  final String columnTransportId = 'id';
  final String columnDate = 'date';
  final String columnHeure = 'heure';
  final String columnTypeOffreTransport = 'TypeTransport';

  //table des véhicules
  // ignore: non_constant_identifier_names
  final String vehicule = 'TableTransport';
  final String columnVehiculeId = 'id';
  final String columnMarque = 'marque';
  final String columnCouleur = 'couleur';
  final String columnImmatriculation = 'immatriculation';

  final String idUsers = "idUsers";

  late Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    // ignore: unnecessary_null_comparison
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'tests.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $Utilisateur($columnUserId INTEGER PRIMARY KEY AUTOINCREMENT, $columnUsernom TEXT, $columnUserpren TEXT, $columnUsermail TEXT, $columnUsertel TEXT, $columnUserpass TEXT)');
    await db.execute(
        'CREATE TABLE $Annonce($columnTransportId INTEGER PRIMARY KEY AUTOINCREMENT, $columnDate TEXT, $columnHeure TEXT, $columnTypeOffreTransport TEXT, $idUsers INTEGER)');
    await db.execute(
        'CREATE TABLE $vehicule($columnVehiculeId INTEGER PRIMARY KEY AUTOINCREMENT, $columnMarque TEXT, $columnCouleur TEXT, $columnImmatriculation TEXT, $idUsers INTEGER)');
  }

  // ignore: non_constant_identifier_names
  Future<int> saveUsers(TableUtilisateur Carfree) async {
    var dbClient = await db;
    var result = await dbClient.insert(Utilisateur, Carfree.toUserMap());
    return result;
  }

  // ignore: non_constant_identifier_names
  Future<int> saveTransport(TableAnnonce Trans) async {
    var dbClient = await db;
    var result = await dbClient.insert(Annonce, Trans.toMap());
    return result;
  }

  Future<int> saveVehicules(TableTransport v) async {
    var dbClient = await db;
    var result = await dbClient.insert(vehicule, v.toMap());
    return result;
  }

  Future<List> getAllTransport() async {
    var dbClient = await db;
    var result = await dbClient.query(Annonce,
        columns: [
          columnTransportId,
          columnDate,
          columnHeure,
          columnTypeOffreTransport,
          idUsers,
        ],
        orderBy: "columnTransportId ASC");
    // var result = await dbClient.rawQuery('SELECT * FROM tableArtiste');

    return result.toList();
  }

  Future<List> getAllUsers() async {
    var dbClient = await db;
    var result = await dbClient.query(Utilisateur,
        columns: [
          columnUserId,
          columnUsernom,
          columnUserpren,
          columnUsermail,
          columnUsertel,
          columnUserpass
        ],
        orderBy: "columnTestId ASC");
    // var result = await dbClient.rawQuery('SELECT * FROM tableArtiste');

    return result.toList();
  }

  Future<List> getAllVehicules() async {
    var dbClient = await db;
    var result = await dbClient.query(vehicule,
        columns: [
          columnVehiculeId,
          columnMarque,
          columnCouleur,
          columnImmatriculation,
          idUsers,
        ],
        orderBy: "columnTestId ASC");
    // var result = await dbClient.rawQuery('SELECT * FROM tableArtiste');

    return result.toList();
  }

  Future<int?> getCountUsers() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $Utilisateur'));
  }

  Future<int?> getCountTransport() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $Annonce'));
  }

  Future<int?> getCountVehicules() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $vehicule'));
  }

  Future<TableUtilisateur?> getTableUser(int id) async {
    var dbClient = await db;
    List<Map<String, dynamic>> result = await dbClient.query(Utilisateur,
        columns: [
          columnUserId,
          columnUsernom,
          columnUserpren,
          columnUsermail,
          columnUsertel,
          columnUserpass
        ],
        where: '$columnUserId = ?',
        whereArgs: [id]);
    // var result = await dbClient.rawQuery('SELECT * FROM $tableArtiste WHERE $columnArtisteId = $id');

    if (result.isEmpty) {
      return TableUtilisateur.fromMap(result.first);
    }

    return null;
  }

  Future<TableTransport?> getTableTransport() async {
    var dbClient = await db;
    List<Map<String, dynamic>> result = await dbClient.query(Annonce,
        columns: [
          columnTransportId,
          columnDate,
          columnHeure,
          columnTypeOffreTransport,
          idUsers,
        ],
        where: columnTransportId);
    // var result = await dbClient.rawQuery('SELECT * FROM $tableArtiste WHERE $columnArtisteId = $id');

    if (result.isEmpty) {
      return TableTransport.fromMap(result.first);
    }

    return null;
  }

  Future<TableTransport?> getTableVehicule(int id) async {
    var dbClient = await db;
    List<Map<String, dynamic>> result = await dbClient.query(vehicule,
        columns: [
          columnVehiculeId,
          columnMarque,
          columnCouleur,
          columnImmatriculation,
          idUsers,
        ],
        where: '$columnVehiculeId = ?',
        whereArgs: [id]);
    // var result = await dbClient.rawQuery('SELECT * FROM $tableArtiste WHERE $columnArtisteId = $id');

    if (result.isEmpty) {
      return TableTransport.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(Utilisateur, where: '$columnUserId = ?', whereArgs: [id]);
    // return await dbClient.rawDelete('DELETE FROM $tableArtiste WHERE $columnArtisteId = $id');
  }

  Future<int> deleteTransport(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(Annonce, where: '$columnTransportId = ?', whereArgs: [id]);
    // return await dbClient.rawDelete('DELETE FROM $tableArtiste WHERE $columnArtisteId = $id');
  }

  Future<int> deleteVehicule(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(vehicule, where: '$columnVehiculeId = ?', whereArgs: [id]);
    // return await dbClient.rawDelete('DELETE FROM $tableArtiste WHERE $columnArtisteId = $id');
  }

  Future<int> updateUser(TableUtilisateur user) async {
    var dbClient = await db;
    return await dbClient.update(Utilisateur, user.toUserMap(),
        where: "$columnUserId = ?", whereArgs: [user.id]);
    // return await dbClient.rawUpdate(
    // 'UPDATE $tableArtiste SET $columnArtisteTitle = \'${artiste.title}\', $columnArtisteImage = \'${artiste.image}\' WHERE $columnArtisteId = ${artiste.id}');
  }

  Future<int> updateTransport(TableTransport trans) async {
    var dbClient = await db;
    return await dbClient.update(Annonce, trans.toMap(),
        where: "$columnTransportId = ?", whereArgs: [trans.idVehicule]);
    // return await dbClient.rawUpdate(
    // 'UPDATE $tableArtiste SET $columnArtisteTitle = \'${artiste.title}\', $columnArtisteImage = \'${artiste.image}\' WHERE $columnArtisteId = ${artiste.id}');
  }

  Future<int> updateVehicule(TableTransport v) async {
    var dbClient = await db;
    return await dbClient.update(vehicule, v.toMap(),
        where: "$columnVehiculeId = ?", whereArgs: [v.idVehicule]);
    // return await dbClient.rawUpdate(
    // 'UPDATE $tableArtiste SET $columnArtisteTitle = \'${artiste.title}\', $columnArtisteImage = \'${artiste.image}\' WHERE $columnArtisteId = ${artiste.id}');
  }

  // ignore: non_constant_identifier_names
  Future<bool> UserIsLoggedIn() async {
    var dbClient = await db;
    var res = await dbClient.query("TableUtilisateur");
    return res.isNotEmpty ? true : false;
  }

  Future checkUserLogin(String mailUser, String passUser) async {
    // ignore: await_only_futures
    Database db = await instance._db;
    var res = await db.rawQuery(
        "select * from TableUtilisateur where mailUser = '$mailUser' and passUser = '$passUser'");
    if (res.isNotEmpty) {
      List list = res.toList().map((c) => TableUtilisateur.fromMap(c)).toList();
      // ignore: avoid_print, prefer_interpolation_to_compose_strings
      print("Data " + list.toString());
      await db.insert("TableUtilisateur", list[0].toUserMap());
      return list[0];
    }
    return null;
  }

  Future insertUser(TableUtilisateur user) async {
    // ignore: await_only_futures
    Database db = await instance._db;

    var users = await db.rawQuery(
        "select * from TableUtilisateur where mobile = ${user.phone_number}");
    if (users.isNotEmpty) {
      return -1;
    }
    return await db.insert("TableUtilisateur", user.toUserMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future insertVehicule(TableTransport v) async {
    // ignore: await_only_futures
    Database db = await instance._db;

    var users = await db.rawQuery(
        "select * from TableVehicule where immatriculation = ${v.immatriculation}");
    if (users.isNotEmpty) {
      return -1;
    }
    return await db.insert("TableUtilisateur", v.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future getUser() async {
    // ignore: await_only_futures
    Database db = await instance._db;
    var logins = await db.rawQuery(
        "select nomUser, preUser, telUser, passUser from Utilisateur");
    // ignore: unnecessary_null_comparison
    if (logins == null) return 0;
    return logins.length;
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

  static Future getFileData() async {
    return getDatabasesPath().then((s) {
      return path = s;
    });
  }
}
