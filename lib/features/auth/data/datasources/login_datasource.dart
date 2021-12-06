import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qr_code/core/base/base_failure.dart';
import 'package:qr_code/features/auth/data/models/login_model.dart';
import 'package:qr_code/features/auth/domain/entities/login_entity.dart';

abstract class LoginDataSource {
  Future<LoginEnity> getLoginUserApi(String username, String password);
}

class LoginDataSourceImpl implements LoginDataSource {
  final http.Client client;

  LoginDataSourceImpl({required this.client});

  @override
  Future<LoginEnity> getLoginUserApi(String username, String password) =>
      _getDetail(
          Uri.https('truly-contacts.herokuapp.com', '/api/auth/login'),
          {'content-type': 'application/json'},
          ({'username': username, 'password': password}));

  Future<LoginModel> _getDetail(
      Uri url, Map<String, String> headers, Object body) async {
    final response =
        await client.post((url), headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return LoginModel.fromMap(decodedJson);
    } else {
      throw const BaseException(code: 500, message: 'Some Exception');
    }
  }
}
