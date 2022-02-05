import 'package:bulananku/helper/colors_helper.dart';
import 'package:bulananku/helper/icons_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width * 1;
    final double _height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: new IconButton(
            icon: new Icon(
              getFontAwesomeIcon(name: 'arrowLeft'),
              size: 30.0,
              color: getColor(name: 'green'),
            ),
            onPressed: () => {Navigator.pop(context)},
          ),
        ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Create Account',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                    Text(
                      'Create a new account',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w700),
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
                      labelText: "NAME",
                      labelStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade400,
                          letterSpacing: 1.5),
                      prefixIcon: Icon(
                        getFontAwesomeIcon(name: 'user'),
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
                    autofocus: false,
                    style: TextStyle(
                        color: getColor(name: 'green'),
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "EMAIL",
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
                      labelText: "CONFIRM PASSWORD",
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
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("CREATE ACCOUNT",
                        style: TextStyle(fontSize: 16, letterSpacing: 2)),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: getColor(name: 'green'),
                        minimumSize: Size(_width, _height * 0.07)),
                  ),
                ),
                RichText(
                    text: TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          text: " Login",
                          style: TextStyle(color: getColor(name: 'green')),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () => Navigator.pop(context))
                    ])),
              ],
            )));
  }
}
