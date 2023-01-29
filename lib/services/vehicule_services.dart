// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:yoga/base_de_donnees/CreateBD.dart';
import 'package:yoga/base_de_donnees/api_response.dart';
import 'package:yoga/constant.dart';
import 'package:http/http.dart' as http;

Future<ApiResponse> AddVehicule(
  String immatriculation,
  String marque,
  String couleur,
) async {
  ApiResponse api = ApiResponse();
  try {
    final response = await http.post(Uri.parse(vehiculeUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      'immatriculation': immatriculation,
      'marque': marque,
      'couleur': couleur,
    });
    switch (response.statusCode) {
      case 200:
        api.data = TableTransport.fromjson(jsonDecode(response.body));
        break;
      case 500:
        final error = jsonDecode(response.body)['errors'];
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
