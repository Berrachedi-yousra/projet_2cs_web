import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<bool> saveUser(
      String? token, String? operateurId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final body = {
        "token": token,
        "operateurId": operateurId.toString(),
      };
      await prefs.setString(
        "operateur_data",
        json.encode(body),
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<Map<String, dynamic>?> getUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final userAsString = prefs.getString(
        "operateur_data",
      );
      if (userAsString == null) return null;
      final userData = json.decode(userAsString);
      return userData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static clearLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
