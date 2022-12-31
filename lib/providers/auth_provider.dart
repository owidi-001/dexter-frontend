import 'package:dexter/models/auth_model.dart';
import 'package:dexter/models/user_model.dart';
import 'package:dexter/utils/prefs.dart';
import 'package:dexter/utils/status.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider with ChangeNotifier {
  AuthenticationProvider._();
  static final instance = AuthenticationProvider._();

  AuthenticationStatus status = AuthenticationStatus.unknown;

  User user = User.empty();
  String authToken = "";
  bool isStaff = false;

  void authenticationChanged(AuthenticationStatus status) {
    this.status = status;
    notifyListeners();
  }

  void loginUser(
      {required User user, required String authToken, required bool isStaff}) {
    this.user = user;
    this.authToken = authToken;
    this.isStaff = user.isStaff;

    status = AuthenticationStatus.authenticated;
    notifyListeners();

    // User has been logged in and can be saved to shared prefs
    LoginData data =
        LoginData(user: user, authToken: authToken, isStaff: isStaff);

    //save user
    UserPreferences().storeLoginData(data);
  }

  void logout() async {
    status = AuthenticationStatus.unAuthenticated;
    user = User.empty();
    authToken = "";
    isStaff = false;

    SharedPreferences.getInstance().then((pref) => pref.clear());
    notifyListeners();
  }

  void initialize({User? user, String? authToken}) {
    this.user = user ?? this.user;
    this.authToken = authToken ?? this.authToken;
  }
}
