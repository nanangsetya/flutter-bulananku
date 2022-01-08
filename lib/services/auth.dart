import 'dart:convert';

import 'package:bulananku/models/Login.dart';
import 'package:http/http.dart' as http;

class Auth {
  static Future<LoginResult> loginProcess(
      String username, String password) async {
    var apiResult = await http.post(
        Uri.parse("https://bulananku-laravel.pieceofsite.com/api/login"),
        body: {"email": username, "password": password});
    Map<String, dynamic> jsonObject = json.decode(apiResult.body);
    Map<String, dynamic> data = jsonObject['data'];

    if (jsonObject['success']) {
      return LoginResult(
          status: jsonObject['success'],
          id: data['id'],
          name: data['name'],
          accessToken: data['token'],
          message: jsonObject['message']);
    } else {
      return LoginResult(
          status: jsonObject['success'],
          id: 0,
          name: "",
          accessToken: "",
          message: "Username and Password not found");
    }
  }
}
