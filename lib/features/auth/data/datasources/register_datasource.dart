import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qr_code/core/base/base_failure.dart';
import 'package:qr_code/features/auth/data/models/register_model.dart';
import 'package:qr_code/features/auth/domain/entities/user_entity.dart';

abstract class RegisterDataSource {
  Future<UserEntity> postUserApi(String username, String password,
      String firstName, String lastName, String email);
}

class RegisterDataSourceImpl implements RegisterDataSource {
  final http.Client client;

  RegisterDataSourceImpl({required this.client});

  @override
  Future<UserEntity> postUserApi(String username, String password,
          String firstName, String lastName, String email) =>
      _getDetail(
          Uri.https('truly-contacts.herokuapp.com', '/api/auth/register'),
          {'content-type': 'application/json'},
          ({
            'username': username,
            'password': password,
            'first_name': firstName,
            'last_name': lastName,
            'email': email
          }));

  Future<UserModel> _getDetail(
      Uri url, Map<String, String> headers, Object body) async {
    final response =
        await client.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 201) {
      final decodedJson = json.decode(response.body);
      return UserModel.fromMap(decodedJson);
    } else {
      throw const BaseException(code: 500, message: 'Some Exception');
    }
  }
}
