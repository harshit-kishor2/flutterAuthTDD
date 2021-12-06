import 'dart:convert';

import 'package:qr_code/features/auth/data/models/register_model.dart';
import 'package:qr_code/features/auth/domain/entities/login_entity.dart';

class LoginModel extends LoginEnity {
  const LoginModel({required userDetails, required token})
      : super(userDetails: userDetails, token: token);

  Map<String, dynamic> toMap() {
    return {
      'user': userDetails.toMap(),
      'token': token,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      userDetails: UserModel.fromMap(map["user"]),
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));
}
