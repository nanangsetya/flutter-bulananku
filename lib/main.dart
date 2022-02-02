import 'package:bulananku/pages/dashboard_page.dart';
import 'package:bulananku/pages/login_page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final isLogin = false;

  @override
//   void checkLogin() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (prefs.getBool("login") == true) {
//       isLogin == true;
//     }
//     setState(() {});
//   }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (isLogin ? DashboardPage() : LoginPage()),
    );
  }
}
