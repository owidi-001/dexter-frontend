import 'package:dexter/models/user_model.dart';

class LoginData {
  final User user;
  final String authToken;
  final bool isStaff;

  LoginData(
      {required this.user, required this.authToken, required this.isStaff});
}
