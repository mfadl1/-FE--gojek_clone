
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_app/utils/jwt.dart';

class UserSecureStorage {
  static const storage = FlutterSecureStorage();

  static Future setToken(String token) async {
    // encode key
    var encodedKey = base64Encode(utf8.encode("access_token"));

    // encode value
    var encodedValue = base64Encode(utf8.encode(token));
     await storage.write(key: encodedKey, value: encodedValue);
  }

  static Future getToken() {
    // encode key
    var encodedKey = base64Encode(utf8.encode("access_token"));
    return storage.read(key: encodedKey);
  }

  static Future getId() async {
    var encodedToken = await UserSecureStorage.getToken();
    var decodedToken = utf8.decode(base64.decode(encodedToken));
    var userId = parseJwt(decodedToken);
    return userId;
  }

  static Future remove(String key) async {
    var encodedKey = base64Encode(utf8.encode(key));
    await storage.delete(key: encodedKey);
  }
}