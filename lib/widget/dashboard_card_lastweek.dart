import 'dart:developer';

import 'package:bulananku/helper/colors_helper.dart';
import 'package:bulananku/helper/icons_helper.dart';
import 'package:bulananku/models/this_week.dart';
import 'package:bulananku/services/get_data_this_week.dart';
import 'package:bulananku/styles/color_style.dart';
import 'package:flutter/material.dart';

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
          FutureBuilder(
              future: GetThisWeek.getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  inspect(snapshot.data[0].outcomes.length);
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return dateList(
                          dateText: snapshot.data[index].date,
                          outcomesList: snapshot.data[index].outcomes,
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("error");
                } else {
                  return Text("Loading...");
                }
              }),
        ],
      ),
    );
  }
}

class dateList extends StatelessWidget {
  final String dateText;
  final List<Outcome> outcomesList;

  const dateList({required this.dateText, required this.outcomesList});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
          width: MediaQuery.of(context).size.width * 1,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(bottom: 10),
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
                child: Text(dateText,
                    style: TextStyle(
                      color: ColorStyle.cText,
                      fontFamily: "Bahnschrift",
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    )),
              ),
            ),
            ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: outcomesList.length,
                itemBuilder: (context, index) {
                  return outcomeBox(
                      outcomeColor: getColor(name: outcomesList[index].color),
                      outcomeIcon:
                          getFontAwesomeIcon(name: outcomesList[index].color),
                      outcomeDescription: outcomesList[index].description,
                      outcomeTime: outcomesList[index].time,
                      outcomeNominal: outcomesList[index].nominal);
                }),
          ])),
    );
  }
}

class outcomeBox extends StatelessWidget {
  final Color outcomeColor;
  final IconData outcomeIcon;
  final String outcomeDescription;
  final String outcomeTime;
  final String outcomeNominal;

  const outcomeBox(
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
