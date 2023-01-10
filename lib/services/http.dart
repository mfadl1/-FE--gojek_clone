import 'dart:convert';

import "package:http/http.dart" as http;

import '../utils/user_secure_storage.dart';

const String baseUrl = 'http://192.168.1.4:3000/api';

class BaseClient {
  static Future<dynamic> post(String endpoint, Object reqBody,
      {middleware = true}) async {
    var url = Uri.parse(baseUrl + endpoint);

    Map<String, String> headers = {};
    
    if (middleware) {
      var encodedToken = await UserSecureStorage.getToken();
      var decodedToken = utf8.decode(base64.decode(encodedToken));

      headers = {'Authorization': 'Bearer $decodedToken'};
    }
    return await http.post(url, body: reqBody, headers: headers);
  }
}
