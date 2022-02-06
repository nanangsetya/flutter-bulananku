import 'package:bulananku/styles/color_style.dart';
import 'package:bulananku/widget/dashboard_card_lastweek.dart';
import 'package:bulananku/widget/dashboard_card_month.dart';
import 'package:bulananku/widget/dashboard_card_year.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String user_name = '';
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<Null> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user_name = prefs.getString('user_name').toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getName();
  }

  @override
  int _selectedIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ColorStyle.cBaseColor,
          child: RefreshIndicator(
            edgeOffset: 0,
            onRefresh: () {
              return Future.delayed(
                Duration(seconds: 1),
                () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => DashboardPage()));
                },
              );
            },
            child: ListView(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      color: Color(0xff43D0A1),
                      child: ClipRRect(
                        //to clip overflown positioned containers.
                        // borderRadius: BorderRadius.circular(30),
                        //if we set border radius on container, the overflown content get displayed at corner.
                        child: Container(
                            child: Stack(
                          children: <Widget>[
                            //Stack helps to overlap widgets
                            Positioned(
                                //positioned helps to position widget wherever we want.
                                top: -45,
                                right: -150, //position of the widget
                                child: RotationTransition(
                                  turns: AlwaysStoppedAnimation(30 / 360),
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Color(
                                              0xff4CDAAA) //background color with opacity
                                          )),
                                )),

                            Positioned(
                                //positioned helps to position widget wherever we want.
                                top: -70,
                                right: -250, //position of the widget
                                child: RotationTransition(
                                  turns: AlwaysStoppedAnimation(30 / 360),
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Color(
                                              0xff75E2BE) //background color with opacity
                                          )),
                                )),
                          ],
                        )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.04,
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.04),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.white,
                                        backgroundImage:
                                            AssetImage("images/avatarw.jpeg"),
                                      ),
                                    )),
                                Expanded(flex: 3, child: Text("")),
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        user_name,
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
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xffD8E5FF),
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: ColorStyle.cCardColor,
          unselectedItemColor: ColorStyle.cText,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                LineIcons.home,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                LineIcons.barChartAlt,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                LineIcons.user,
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
      ),
    );
  }
}
