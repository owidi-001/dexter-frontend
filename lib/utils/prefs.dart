// Save token to local device
import 'dart:convert';

import 'package:dexter/models/auth_model.dart';
import 'package:dexter/models/user_model.dart';
import 'package:dexter/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // load shared preferences
  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

// Load User data
  Future<LoginData?> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? user = prefs.getString(USER);
    String? authToken = prefs.getString(TOKEN);
    bool? isStaff = prefs.getBool(IS_STAFF);

    if (user != null && authToken != null && isStaff != null) {
      // if (kDebugMode) {
      //   print(json.decode(user));
      // }

      return LoginData(
          user: User.fromJson(
            json.decode(user),
          ),
          authToken: authToken,
          isStaff: isStaff);
    }
    return null;
  }

  // Store user
  void storeLoginData(LoginData data) async {
    await SharedPreferences.getInstance().then((pref) {
      pref.setString(USER, jsonEncode(data.user.toMap()));
      pref.setString(TOKEN, data.authToken);
      pref.setBool(IS_STAFF, data.isStaff);
    });
  }

  // Retrieve auth token from prefs
  Future<String> getToken() async {
    String data = await prefs.then((value) => value.getString(TOKEN)) ?? "";
    return data;
  }

  Future<bool> checkStaffStatus() async {
    bool data = await prefs.then((value) => value.getBool(IS_STAFF)) ?? false;
    return data;
  }

  // void removeUser() async {
  //   await prefs.then((value) => value.remove(USER));
  //   await prefs.then((value) => value.remove(TOKEN));
  //   await prefs.then((value) => value.remove(IS_STAFF));
  // }

}
