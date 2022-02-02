import 'package:bulananku/helper/colors_helper.dart';
import 'package:bulananku/helper/icons_helper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width * 1;
    final double _height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      body: Container(
        width: _width,
        height: _height * 0.8,
        margin: EdgeInsets.only(
            left: _width * 0.08,
            right: _width * 0.08,
            top: _height * 0.1,
            bottom: _height * 0.1),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: CircleAvatar(
                radius: _width * 0.15,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("images/logo.png"),
              ),
            ),
            Column(
              children: [
                RichText(
                    text: TextSpan(
                        text: "BULANAN",
                        style: TextStyle(
                            fontFamily: "RussoOne",
                            fontSize: 39,
                            color: Colors.black),
                        children: [
                      TextSpan(
                          text: "KU",
                          style: TextStyle(color: getColor(name: 'green')))
                    ])),
                Text(
                  "Sign to continue",
                  style: TextStyle(
                      color: Colors.grey.shade400, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset.fromDirection(10, -9),
                        color: Colors.grey.shade300,
                        blurRadius: 10.0,
                        spreadRadius: 1)
                  ]),
              child: TextFormField(
                autofocus: false,
                style: TextStyle(
                    color: getColor(name: 'green'),
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "USERNAME",
                  labelStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade400,
                      letterSpacing: 1.5),
                  prefixIcon: Icon(
                    getMaterialIcon(name: 'mail_outline'),
                    color: getColor(name: 'green'),
                    size: 30,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset.fromDirection(10, -9),
                        color: Colors.grey.shade300,
                        blurRadius: 10.0,
                        spreadRadius: 1)
                  ]),
              child: TextFormField(
                obscureText: true,
                autofocus: false,
                style: TextStyle(
                    color: getColor(name: 'green'),
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "PASSWORD",
                  labelStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade400,
                      letterSpacing: 1.5),
                  prefixIcon: Icon(
                    getMaterialIcon(name: 'lock_open'),
                    color: getColor(name: 'green'),
                    size: 30,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot password ?",
                style: TextStyle(
                    color: getColor(name: 'green'),
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("LOGIN",
                    style: TextStyle(fontSize: 16, letterSpacing: 2)),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: getColor(name: 'green'),
                    minimumSize: Size(_width, _height * 0.07)),
              ),
            ),
            RichText(
                text: TextSpan(
                    text: "Don't have account?",
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                      text: " create new account",
                      style: TextStyle(color: getColor(name: 'green')))
                ])),
          ],
        ),
      ),
    );
  }
}
