import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoga/base_de_donnees/CreateBD.dart';
import 'package:yoga/base_de_donnees/api_response.dart';
import 'package:yoga/constant.dart';
import 'package:http/http.dart' as http;

Future<ApiResponse> login(String email, String password) async {
  ApiResponse api = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.post(Uri.parse(loginUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      'email': email,
      'password': password
    });
    switch (response.statusCode) {
      case 200:
        api.data = TableUtilisateur.fromjson(jsonDecode(response.body));
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

Future<ApiResponse> register(
    String firstName,
    String lastName,
    String phoneNumber,
    String email,
    String password,
    String passwordConfirmation,
    int typeRole) async {
  ApiResponse api = ApiResponse();
  try {
    final response = await http.post(Uri.parse(registerUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'password': password,
      'email': email,
      'password_confirmation': passwordConfirmation,
      'type_role': typeRole
    });
    switch (response.statusCode) {
      case 200:
        api.data = TableUtilisateur.fromjson(jsonDecode(response.body));
        break;
      case 500:
        final error = jsonDecode(response.body)['message'];
        api.error = error[error.keys.elementAt(0)][0];
        break;
      case 422:
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

Future<ApiResponse> userDetails() async {
  ApiResponse api = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(userUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    switch (response.statusCode) {
      case 200:
        api.data = TableUtilisateur.fromjson(jsonDecode(response.body));
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

Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('userId') ?? 0;
}

Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.remove('API TOKEN');
}
