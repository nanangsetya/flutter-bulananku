import 'dart:convert';

import 'package:bulananku/models/Login.dart';
import 'package:http/http.dart' as http;

class Auth {
  static Future<LoginResult> loginProcess(
      String username, String password) async {
    var apiResult = await http.post(
        Uri.parse("http://192.168.43.212/cv_rahayu/api/Login/index"),
        body: {"username": username, "password": password});
    var jsonObject = json.decode(apiResult.body);

    return LoginResult(
        status: jsonObject['status'],
        id: jsonObject['id'],
        name: jsonObject['name'],
        roleId: jsonObject['role_id']);
  }
}
