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
        color: Color(0xff161637),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Text(
            "This year",
            style: TextStyle(
              color: Colors.white,
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
                                color: Color(0xff43D0A1), size: 25),
                            Text("income",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Bahnschrift",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ],
                        ),
                        Text('3.500.000',
                            style: TextStyle(
                                color: Colors.white,
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
                                color: Color(0xffFF5C58), size: 25),
                            Text("outcome",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Bahnschrift",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ],
                        ),
                        Text('750.000',
                            style: TextStyle(
                                color: Colors.white,
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
