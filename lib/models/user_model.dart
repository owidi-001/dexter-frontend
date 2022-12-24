import 'dart:convert';

import 'package:equatable/equatable.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toMap());

class User extends Equatable {
  final String phoneNumber;
  final String email;
  final String token;

  const User({
    required this.phoneNumber,
    required this.email,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      phoneNumber: (json["phone_number"] as String).replaceAll("+254", "0"),
      email: json["email"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson(User user) => {
        "phone_number": user.phoneNumber,
        "email": user.email,
        "token": user.token
      };

  Map<String, dynamic> toMap() =>
      {"phone_number": phoneNumber, "email": email, "token": token};

  @override
  List<Object?> get props => [
        email,
        phoneNumber,
        token,
      ];

  @override
  String toString() {
    return jsonEncode(
      toJson(this),
    );
  }

  factory User.empty() => const User(
      email: "anonymous", phoneNumber: "anonymous", token: "anonymous");
}
