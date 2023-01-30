// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoga/base_de_donnees/CreateBD.dart';
import 'package:yoga/base_de_donnees/api_response.dart';
import 'package:yoga/constant.dart';
import 'package:http/http.dart' as http;

Future<ApiResponse> AddAnnonce(DateTime dateDepart, String heureDepart,
    int nbPlace, String lieuDepart, String lieuArrive) async {
  ApiResponse api = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.post(Uri.parse(annonceUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      'date_depart': dateDepart,
      'heureDepart': heureDepart,
      'nbPlace': nbPlace,
      'lieuDepart': lieuDepart,
      'lieuArrive': lieuArrive,
    });
    switch (response.statusCode) {
      case 200:
        api.data = TableAnnonce.fromjson(jsonDecode(response.body));
        break;
      case 500:
        final error = jsonDecode(response.body)['message'];
        api.error = error[error.keys.elementAt(0)][0];
        break;
      case 401:
        api.error = jsonDecode(response.body)['message'];
        break;
      default:
        api.error = someThingWentWrong;
        break;
    }
  } catch (e) {
    api.error = serverError;
  }
  return api;
}

Future<ApiResponse> annonceDetails() async {
  ApiResponse api = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(showAnnonceUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    switch (response.statusCode) {
      case 200:
        api.data = jsonDecode(response.body)['annonces']
            .map((p) => TableAnnonce.fromjson(p))
            .toList();
        api.data as List<dynamic>;
        break;
      case 401:
        api.error = unAuthorizided;
        break;
      default:
        api.error = someThingWentWrong;
        break;
    }
  } catch (e) {
    api.error = serverError;
  }
  return api;
}

Future<ApiResponse> updateAnnonce() async {
  ApiResponse api = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.put(Uri.parse(updateAnnonceUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    switch (response.statusCode) {
      case 200:
        api.data = TableAnnonce.fromjson(jsonDecode(response.body));
        break;
      case 401:
        api.error = unAuthorizided;
        break;
      default:
        api.error = someThingWentWrong;
        break;
    }
  } catch (e) {
    api.error = serverError;
  }
  return api;
}

Future<ApiResponse> deleteAnnonce() async {
  ApiResponse api = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.delete(Uri.parse(destroyAnnonceUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    switch (response.statusCode) {
      case 200:
        api.data = TableAnnonce.fromjson(jsonDecode(response.body));
        break;
      case 401:
        api.error = unAuthorizided;
        break;
      default:
        api.error = someThingWentWrong;
        break;
    }
  } catch (e) {
    api.error = serverError;
  }
  return api;
}

Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('API TOKEN') ?? '';
}
