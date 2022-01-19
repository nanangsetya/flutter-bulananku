import 'package:bulananku/models/this_month.dart';
import 'package:bulananku/services/get_data_this_month.dart';
import 'package:bulananku/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

class CardMonth extends StatefulWidget {
  const CardMonth({Key? key}) : super(key: key);

  @override
  _CardMonthState createState() => _CardMonthState();
}

class _CardMonthState extends State<CardMonth> {
  setData() async {
    var listData = await GetThisMonth.getData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setData();
  }

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
            child: GridView.count(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              childAspectRatio: 16 / 9,
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                FutureBuilder<List<MonthResult>>(
                  future: GetThisMonth.getData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<MonthResult> months = snapshot.data;
                      months.map((month) => new boxSummary(
                          ColorStyle.cYellow,
                          FontAwesomeIcons.utensils,
                          month.category,
                          month.nominal));
                      // return new boxSummary(months.ca, iconData, boxName, boxTotal)
                    } else if (snapshot.hasError) {
                      new boxSummary(ColorStyle.cYellow,
                          FontAwesomeIcons.utensils, "Food", "125.000");
                    } else {
                      new boxSummary(ColorStyle.cYellow,
                          FontAwesomeIcons.utensils, "Food", "125.000");
                    }
                  },
                ),
                // boxSummary(ColorStyle.cYellow, FontAwesomeIcons.utensils,
                //     "Food", "125.000"),
                // boxSummary(ColorStyle.cBlue, FontAwesomeIcons.tshirt, "Clothes",
                //     "165.000"),
                // boxSummary(ColorStyle.cGreen, FontAwesomeIcons.building,
                //     "Building", "50.000"),
                // boxSummary(ColorStyle.cRed, FontAwesomeIcons.robot, "Tertriary",
                //     "75.000"),
              ],
            )),
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
