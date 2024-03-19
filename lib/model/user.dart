// To parse this JSON data, do
//
//     final UserModel = UserModelFromMap(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

class UserModel {
  final String id;
  final String userId;
  final String username;
  final String password;
  final String firstname;
  final String lastname;

  UserModel({
    required this.id,
    required this.userId,
    required this.username,
    required this.password,
    required this.firstname,
    required this.lastname,
  });

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        userId: json["user_id"],
        username: json["username"],
        password: json["password"],
        firstname: json["firstname"],
        lastname: json["lastname"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "username": username,
        "password": password,
        "firstname": firstname,
        "lastname": lastname,
      };
}
