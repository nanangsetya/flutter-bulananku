import 'dart:convert';

import 'package:bulananku/models/this_year.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetThisYear {
  static Future<YearResult> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var apiResult = await http.post(
        Uri.parse(
            'https://bulananku-laravel.pieceofsite.com/api/v1/data_this_year'),
        headers: {
          'Authorization': 'Bearer ' + prefs.getString('token').toString()
        },
        body: {
          "user_id": prefs.getString('user_id')
        });
    Map<String, dynamic> jsonObject = json.decode(apiResult.body);
    Map<String, dynamic> data = jsonObject['data'];

    return YearResult(
        success: jsonObject['success'],
        income: data['income'],
        outcome: data['outcome']);
  }
}
