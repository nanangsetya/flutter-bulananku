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
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.only(right: 5, bottom: 5),
                  padding: EdgeInsets.all(10),
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff161637),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Color(0xffECE445),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          FontAwesomeIcons.utensils,
                          color: Color(0xff161637),
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
              ),
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.only(left: 5, bottom: 5),
                  padding: EdgeInsets.all(10),
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff161637),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Color(0xff459CEE),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          FontAwesomeIcons.tshirt,
                          color: Color(0xff161637),
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
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.only(right: 5, top: 5),
                  padding: EdgeInsets.all(10),
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff161637),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Color(0xff43D0A1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          FontAwesomeIcons.building,
                          color: Color(0xff161637),
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
              ),
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.only(left: 5, top: 5),
                  padding: EdgeInsets.all(10),
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff161637),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Color(0xffFF5C58),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          FontAwesomeIcons.robot,
                          color: Color(0xff161637),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
