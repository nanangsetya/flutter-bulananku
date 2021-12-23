import 'package:bulananku/styles/color_style.dart';
import 'package:bulananku/widget/dashboard_card_lastweek.dart';
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
  int _selectedIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ColorStyle.cBaseColor,
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
              CardMonth(),
              CardWeek(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorStyle.cCardColor,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorStyle.cGreen,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
