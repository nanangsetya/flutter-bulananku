import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FormResult {
  bool success;
  String message;

  FormResult({required this.success, required this.message});

  static Future<FormResult> sendData(
      String type, String description, String nominal, String category) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var apiResult = await http.post(
          Uri.parse("https://bulananku-laravel.pieceofsite.com/api/v1/store"),
          headers: {
            'Authorization': 'Bearer ' + prefs.getString('token').toString()
          },
          body: {
            'type': type,
            'description': description,
            'nominal': nominal,
            'category': category,
            'user': prefs.getString('user_id')
          });

      if (apiResult.statusCode != 200) {
        return FormResult(success: false, message: "No Internet Connection.");
      }

      if (apiResult.body.isEmpty) {
        return FormResult(success: false, message: "Gagal.");
      } else {
        var jsonObject = json.decode(apiResult.body);
        return FormResult(
            success: jsonObject['success'],
            message: jsonObject['message'].toString());
      }
    } on SocketException {
      return FormResult(success: false, message: "No Internet Connection.");
    }
  }
}
