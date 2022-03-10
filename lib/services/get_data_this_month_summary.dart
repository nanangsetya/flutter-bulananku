import 'dart:convert';
import 'dart:io';

import 'package:bulananku/models/this_month_summary.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetThisMonthSummary {
  static Future<MonthSummary> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var apiResult = await http.post(
          Uri.parse(
              "https://bulananku-laravel.pieceofsite.com/api/v1/data_this_month_summary"),
          headers: {
            'Authorization': 'Bearer ' + prefs.getString('token').toString()
          },
          body: {
            "user_id": prefs.getString('user_id')
          });

      Map<String, dynamic> jsonObject = json.decode(apiResult.body);
      Map<String, dynamic> data = jsonObject['data'];

      return MonthSummary(income: data['income'], outcome: data['outcome']);
    } on SocketException {
      return MonthSummary(income: "0", outcome: "0");
    }
  }
}
