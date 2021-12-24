import 'package:bulananku/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardYear extends StatefulWidget {
  const CardYear({Key? key}) : super(key: key);

  @override
  _CardYearState createState() => _CardYearState();
}

class _CardYearState extends State<CardYear> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: 160,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: ColorStyle.cCardColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Color(0xffE2DFDF).withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(1, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "This year",
            style: TextStyle(
              color: ColorStyle.cText,
              fontSize: 16,
              fontFamily: "Bahnschrift",
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 100,
            child: Row(
              children: [
                Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.caretDown,
                                color: ColorStyle.cGreen, size: 25),
                            Text("income",
                                style: TextStyle(
                                    color: ColorStyle.cText,
                                    fontFamily: "Bahnschrift",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ],
                        ),
                        Text('3.500.000',
                            style: TextStyle(
                                color: ColorStyle.cText,
                                fontFamily: "Bahnschrift",
                                fontWeight: FontWeight.bold,
                                fontSize: 17)),
                      ],
                    )),
                Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.caretUp,
                                color: ColorStyle.cRed, size: 25),
                            Text("outcome",
                                style: TextStyle(
                                    color: ColorStyle.cText,
                                    fontFamily: "Bahnschrift",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ],
                        ),
                        Text('750.000',
                            style: TextStyle(
                                color: ColorStyle.cText,
                                fontFamily: "Bahnschrift",
                                fontWeight: FontWeight.bold,
                                fontSize: 17)),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
