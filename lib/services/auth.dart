import 'dart:convert';
import 'dart:io';

import 'package:bulananku/models/Login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static Future<LoginResult> loginProcess(
      String username, String password) async {
    try {
      var apiResult = await http.post(
          Uri.parse("https://bulananku-laravel.pieceofsite.com/api/login"),
          body: {"email": username, "password": password});

      if (apiResult.statusCode != 200) {
        return LoginResult(
            status: false,
            id: 0,
            name: "",
            accessToken: "",
            message: "No Internet Connection.");
      }

      Map<String, dynamic> jsonObject = json.decode(apiResult.body);
      Map<String, dynamic> data = jsonObject['data'];

      if (jsonObject['success']) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('login', true);
        await prefs.setString('user_id', data['id'].toString());
        await prefs.setString('user_name', data['name']);
        await prefs.setString('user_token', data['token']);

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
    } on SocketException {
      return LoginResult(
          status: false,
          id: 0,
          name: "",
          accessToken: "",
          message: "Failed. Please check your internet connection.");
    }
  }
}
