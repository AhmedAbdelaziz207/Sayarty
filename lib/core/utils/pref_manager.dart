import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  static Future<bool> setData(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    log("Set Data key: $key, value: $value");


    switch (value.runtimeType) {
      case String:
        return await prefs.setString(key, value);
      case bool:
        return await prefs.setBool(key, value);
      case int:
        return await prefs.setInt(key, value);
      case double:
        return await prefs.setDouble(key, value);
      default:
        return await prefs.setString(key, value.toString());
    }
  }

  static Future<dynamic> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }
}
