// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:http/http.dart' as http;

const String baseUrl = "http://localhost:8000/api/";

class BaseRoute {
  var user = http.Client();
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'Authorization': 'Bearer',
      'api_key': 'ief5065654fdf654df6d54f654fd64',
    };
    var response = await user.get(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    }
  }

  Future<dynamic> put(String api) async {}
  Future<dynamic> post(String api) async {}
  Future<dynamic> delete(String api) async {}
}
