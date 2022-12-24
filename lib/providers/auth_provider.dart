import 'package:dexter/models/auth_model.dart';
import 'package:dexter/models/user_model.dart';
import 'package:dexter/utils/prefs.dart';
import 'package:dexter/utils/status.dart';
import 'package:flutter/foundation.dart';

class AuthenticationProvider with ChangeNotifier {
  AuthenticationProvider._();
  static final instance = AuthenticationProvider._();

  AuthenticationStatus status = AuthenticationStatus.unknown;

  User user = User.empty();

  void authenticationChanged(AuthenticationStatus status) {
    this.status = status;
    notifyListeners();
  }

  void loginUser({required User user}) {
    this.user = user;
    status = AuthenticationStatus.authenticated;
    notifyListeners();

    // Save to shared prefs
    LoginData data = LoginData(user: user);

    // TODO! re-evaluate for elevated rights
    //save user
    UserPreferences().storeLoginData(data);
  }

  void logout() async {
    status = AuthenticationStatus.unAuthenticated;
    user = User.empty();
    UserPreferences().logout();
    notifyListeners();
  }

  void initialize({User? user}) {
    this.user = user ?? this.user;
  }
}
