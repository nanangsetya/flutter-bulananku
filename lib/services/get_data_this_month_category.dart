import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:bulananku/models/this_month_category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetThisMonth {
  static Future<List<MonthResult>> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // try {
    var apiResult = await http.post(
        Uri.parse(
            'https://bulananku-laravel.pieceofsite.com/api/v1/data_this_month_by_category'),
        headers: {
          'Authorization': 'Bearer ' + prefs.getString('token').toString()
        },
        body: {
          "user_id": prefs.getString('user_id')
        });
    Map<String, dynamic> jsonObject = json.decode(apiResult.body);

    // if (!jsonObject.containsKey("success")) {
    //   return List.empty();
    // }

    List<MonthResult> result = (jsonObject['data'] as List)
        .map((e) => MonthResult.fromJson(e))
        .toList();
    return result;
    // } on SocketException {
    //   return List.empty();
    // }
    // return jsonObject['data'].map<MonthResult>(MonthResult.fromJson(e)).toList();
    // Map<String, dynamic> data = jsonObject['data'];
    // return (data as List).map((e) => MonthResult.fromJson(e)).toList();
    // return (jsonObject['data'] as List)
    //     .map((e) => MonthResult.fromJson(e))
    //     .toList();
    // return MonthResult(
    //     category: jsonObject['data']['category'],
    //     nominal: jsonObject['data']['nominal']);
    // } catch (e) {
    //   throw Future.error(e).toString();
    // }
  }
}
