// Save token to local device
import 'dart:convert';

import 'package:dexter/models/auth_model.dart';
import 'package:dexter/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // load shared preferences
  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  final USER = "USER";

// Load User data
  Future<LoginData?> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? user = prefs.getString(USER);

    if (user != null) {
      return LoginData(
          user: User.fromJson(
        json.decode(user),
      ));
    }
    return null;
  }

  // Store user
  void storeLoginData(LoginData data) async {
    await SharedPreferences.getInstance().then((pref) {
      pref.setString(USER, jsonEncode(data.user.toMap()));
    });
  }

  // get auth token from saved user
  Future<String> getToken() async {
    String token = "";
    var userLoaded = await loadUserData();

    if (userLoaded != null) {
      token = userLoaded.user.token;
    }
    return token;
  }

  void logout() async {
    await prefs.then((value) => value.remove(USER));
  }
}
