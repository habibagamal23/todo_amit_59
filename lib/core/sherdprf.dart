import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrfHelper {
  static late SharedPreferences prefs;

  static Future startShred() async {
    prefs = await SharedPreferences.getInstance();
  }

  static const String KeyUserName = 'username';
  static const String Keyislogin = 'islogin';

  static Future setName(String name) async {
    await prefs.setString(KeyUserName, name);
  }

  static Future<String?> getName() async {
    return prefs.getString(KeyUserName);
  }

  static Future deletall() async {
    return prefs.clear();
  }

  static Future setIslogin(bool islogin) async {
    await prefs.setBool(Keyislogin, islogin);
  }

  static Future<bool?> getIsLogin() async {
    return prefs.getBool(Keyislogin);
  }
}
