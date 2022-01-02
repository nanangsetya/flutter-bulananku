import 'package:bulananku/pages/dashboard_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var username, password;
  bool _usernameValue = false;
  bool _passwordValue = false;
  final formGlobalKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _secureText = true;

  void showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/login_image.jpg"),
                    fit: BoxFit.cover)),
          ),
          Opacity(
            opacity: 0.8,
            child: Container(
              color: Color(0xff030403),
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
            ),
          ),
          Center(
            child: Form(
              key: formGlobalKey,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "BULANAN",
                            style:
                                TextStyle(fontFamily: "RussoOne", fontSize: 39),
                            children: [
                          TextSpan(
                              text: "KU",
                              style: TextStyle(color: Color(0xff43D0A1)))
                        ])),
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff6A6A6A).withOpacity(0.6),
                      ),
                      child: TextFormField(
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: "Arvo"),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15),
                            border: InputBorder.none,
                            hintText: "Username",
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 16),
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                          ),
                          validator: (_usernameValue) {
                            if (_usernameValue == null ||
                                _usernameValue.isEmpty) {
                              return 'Please enter your username';
                            }
                            username = _usernameValue;
                            return null;
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff6A6A6A).withOpacity(0.6),
                      ),
                      child: TextFormField(
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: "Arvo"),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 15),
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              )),
                          validator: (_passwordValue) {
                            if (_passwordValue == null ||
                                _passwordValue.isEmpty) {
                              showMsg("Username or Password cannot be empty");
                            }
                            password = _passwordValue;
                            return null;
                          }),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => DashboardPage()),
                          // );
                          if (formGlobalKey.currentState!.validate()) {
                            showMsg("Processing Data");
                          }
                        },
                        child: Text('LOGIN',
                            style: TextStyle(
                                fontFamily: "Arvo",
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff43D0A1),
                            shadowColor: Color(0xff43D0A1),
                            elevation: 10,
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.85, 55))),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
