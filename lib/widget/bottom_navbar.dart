import 'package:bulananku/pages/dashboard_page.dart';
import 'package:bulananku/pages/input_page.dart';
import 'package:bulananku/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavbar extends StatefulWidget {
  int selectedIndex;
  BottomNavbar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  void _onTapNavbar() {
    switch (widget.selectedIndex) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DashboardPage();
        }));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return InputPage();
        }));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        currentIndex: widget.selectedIndex,
        selectedItemColor: ColorStyle.cGreen,
        onTap: (index) {
          setState(() {
            widget.selectedIndex = index;
            _onTapNavbar();
          });
        },
      ),
    );
  }
}
