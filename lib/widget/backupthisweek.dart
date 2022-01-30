import 'package:bulananku/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardWeek extends StatefulWidget {
  const CardWeek({Key? key}) : super(key: key);

  @override
  _CardWeekState createState() => _CardWeekState();
}

class _CardWeekState extends State<CardWeek> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              alignment: Alignment.centerLeft,
              child: Text("Last Week",
                  style: TextStyle(
                      color: ColorStyle.cText,
                      fontFamily: "Bahnschrift",
                      fontWeight: FontWeight.bold,
                      fontSize: 14))),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: ColorStyle.cCardColor,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffECF2FF),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Dec 23",
                        style: TextStyle(
                          color: ColorStyle.cText,
                          fontFamily: "Bahnschrift",
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
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
                      ),
                      Expanded(
                          flex: 4,
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Jacket",
                                    style: TextStyle(
                                      color: ColorStyle.cText,
                                      fontFamily: "Bahnschrift",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    )),
                                Text("12:10",
                                    style: TextStyle(
                                      color: ColorStyle.cText,
                                      fontFamily: "Bahnschrift",
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 5,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text("125.000",
                                style: TextStyle(
                                  color: ColorStyle.cText,
                                  fontFamily: "Bahnschrift",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                )),
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: ColorStyle.cYellow,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            FontAwesomeIcons.utensils,
                            color: ColorStyle.cBaseColor,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Lunch",
                                    style: TextStyle(
                                      color: ColorStyle.cText,
                                      fontFamily: "Bahnschrift",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    )),
                                Text("13:10",
                                    style: TextStyle(
                                      color: ColorStyle.cText,
                                      fontFamily: "Bahnschrift",
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 5,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text("125.000",
                                style: TextStyle(
                                  color: ColorStyle.cText,
                                  fontFamily: "Bahnschrift",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                )),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class dateList extends StatelessWidget {
  const dateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 1,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ColorStyle.cCardColor,
          boxShadow: [
            BoxShadow(
              color: Color(0xffECF2FF),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Dec 23",
                  style: TextStyle(
                    color: ColorStyle.cText,
                    fontFamily: "Bahnschrift",
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  )),
            ),
          )
        ]));
  }
}

class outcomeList extends StatelessWidget {
  final Color outcomeColor;
  final IconData outcomeIcon;
  final String outcomeDescription;
  final String outcomeTime;
  final String outcomeNominal;

  const outcomeList(
      {required this.outcomeColor,
      required this.outcomeIcon,
      required this.outcomeDescription,
      required this.outcomeTime,
      required this.outcomeNominal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: outcomeColor, borderRadius: BorderRadius.circular(10)),
              child: Icon(
                outcomeIcon,
                color: ColorStyle.cCardColor,
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(outcomeDescription,
                        style: TextStyle(
                          color: ColorStyle.cText,
                          fontFamily: "Bahnschrift",
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        )),
                    Text(outcomeTime,
                        style: TextStyle(
                          color: ColorStyle.cText,
                          fontFamily: "Bahnschrift",
                          fontSize: 12,
                        )),
                  ],
                ),
              )),
          Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(outcomeNominal,
                    style: TextStyle(
                      color: ColorStyle.cText,
                      fontFamily: "Bahnschrift",
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )),
              ))
        ],
      ),
    );
  }
}
