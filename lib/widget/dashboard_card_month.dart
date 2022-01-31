import 'dart:developer';

import 'package:bulananku/helper/colors_helper.dart';
import 'package:bulananku/helper/icons_helper.dart';
import 'package:bulananku/services/get_data_this_month.dart';
import 'package:bulananku/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardMonth extends StatefulWidget {
  const CardMonth({Key? key}) : super(key: key);

  @override
  _CardMonthState createState() => _CardMonthState();
}

class _CardMonthState extends State<CardMonth> {
  Set<Map<dynamic, dynamic>> contents = {
    {"color": ColorStyle.cYellow, "icon": FontAwesomeIcons.utensils},
    {"color": ColorStyle.cBlue, "icon": FontAwesomeIcons.tshirt},
    {"color": ColorStyle.cGreen, "icon": FontAwesomeIcons.building},
    {"color": ColorStyle.cRed, "icon": FontAwesomeIcons.robot}
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            alignment: Alignment.centerLeft,
            child: Text("This Month's Summary",
                style: TextStyle(
                    color: ColorStyle.cText,
                    fontFamily: "Bahnschrift",
                    fontWeight: FontWeight.bold,
                    fontSize: 14))),
        Container(
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
            future: GetThisMonth.getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                // inspect(snapshot.data);
                return GridView.builder(
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  primary: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 16 / 9,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    // crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return boxSummary(
                        getColor(name: snapshot.data[index].color.toString()),
                        getFontAwesomeIcon(
                            name: snapshot.data[index].icon.toString()),
                        snapshot.data[index].category.toString(),
                        snapshot.data[index].nominal.toString());
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}

class boxSummary extends StatelessWidget {
  final Color iconColor;
  final IconData iconData;
  final String boxName;
  final String boxTotal;

  const boxSummary(this.iconColor, this.iconData, this.boxName, this.boxTotal);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ColorStyle.cCardColor,
        boxShadow: [
          BoxShadow(
            color: Color(0xffD8E5FF),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: iconColor, borderRadius: BorderRadius.circular(10)),
            child: Icon(
              iconData,
              color: ColorStyle.cCardColor,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              boxName,
              style: TextStyle(
                  color: ColorStyle.cText,
                  fontFamily: "Bahnschrift",
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            alignment: Alignment.centerRight,
            child: Text(
              boxTotal,
              style: TextStyle(
                  color: ColorStyle.cText,
                  fontFamily: "Bahnschrift",
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
