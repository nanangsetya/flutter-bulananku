import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bulananku/models/this_week.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetThisWeek {
  static Future<List<WeekResult>> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var apiResult = await http.post(
        Uri.parse(
            'https://bulananku-laravel.pieceofsite.com/api/v1/data_last_week'),
        headers: {
          'Authorization': 'Bearer ' + prefs.getString('token').toString()
        },
        body: {
          "user_id": prefs.getString('user_id')
        });
    Map<String, dynamic> jsonObject = json.decode(apiResult.body);

    // return WeekResult(date: jsonObject['date'], outcomes: jsonObject['data']).map(e);

    return (jsonObject['data'] as List)
        .map((e) => WeekResult.fromJson(e))
        .toList();
  }
}
