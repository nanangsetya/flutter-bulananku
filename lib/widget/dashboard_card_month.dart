import 'package:bulananku/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardMonth extends StatefulWidget {
  const CardMonth({Key? key}) : super(key: key);

  @override
  _CardMonthState createState() => _CardMonthState();
}

class _CardMonthState extends State<CardMonth> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            alignment: Alignment.centerLeft,
            child: Text("This Month's Summary",
                style: TextStyle(
                    color: Colors.white,
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
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorStyle.cCardColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: ColorStyle.cYellow,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          FontAwesomeIcons.utensils,
                          color: ColorStyle.cCardColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Food",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Bahnschrift",
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        alignment: Alignment.centerRight,
                        child: Text(
                          "125.000",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Bahnschrift",
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorStyle.cCardColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: ColorStyle.cBlue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          FontAwesomeIcons.tshirt,
                          color: ColorStyle.cCardColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Cloth",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Bahnschrift",
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        alignment: Alignment.centerRight,
                        child: Text(
                          "165.000",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Bahnschrift",
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorStyle.cCardColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: ColorStyle.cGreen,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          FontAwesomeIcons.building,
                          color: ColorStyle.cCardColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Building",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Bahnschrift",
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        alignment: Alignment.centerRight,
                        child: Text(
                          "125.000",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Bahnschrift",
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorStyle.cCardColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: ColorStyle.cRed,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          FontAwesomeIcons.robot,
                          color: ColorStyle.cCardColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Tertiary",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Bahnschrift",
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        alignment: Alignment.centerRight,
                        child: Text(
                          "75.000",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Bahnschrift",
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
