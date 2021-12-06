import 'dart:convert';

import 'package:qr_code/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required username,
      required first_name,
      required last_name,
      required email})
      : super(
            username: username,
            first_name: first_name,
            last_name: last_name,
            email: email);
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'],
      first_name: map['first_name'],
      last_name: map['last_name'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
