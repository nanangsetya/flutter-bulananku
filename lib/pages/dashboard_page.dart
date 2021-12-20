import 'package:bulananku/widget/dashboard_card_month.dart';
import 'package:bulananku/widget/dashboard_card_year.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  // int _currentpage = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFF0B0B1B),
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.04,
          ),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.04),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 50.0,
                        child: ClipRRect(
                          child: Image.asset('images/avatarw.jpeg'),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    Expanded(flex: 4, child: Text("")),
                    Expanded(
                        flex: 5,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Chelsea Islan",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Bahnschrift",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              CardYear(),
              Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text("This month's summary",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Bahnschrift",
                          fontWeight: FontWeight.bold,
                          fontSize: 14))),
              CardMonth(),
            ],
          ),
        ),
      ),
    );
  }
}
