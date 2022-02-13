import 'dart:developer';

import 'package:bulananku/services/get_data_this_month_category.dart';
import 'package:bulananku/services/get_data_this_month_summary.dart';
import 'package:bulananku/styles/color_style.dart';
import 'package:flutter/material.dart';

class CardMonth extends StatefulWidget {
  const CardMonth({Key? key}) : super(key: key);

  @override
  _CardMonthState createState() => _CardMonthState();
}

class _CardMonthState extends State<CardMonth> {
  String _income = "0";
  String _outcome = "0";

  setData() async {
    var data = await GetThisMonthSummary.getData();
    setState(() {
      _income = data.income;
      _outcome = data.outcome;
    });
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
          child: GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.only(bottom: 10),
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 6),
            children: [
              Container(
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
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: ColorStyle.cBaseColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(
                            "images/icons/income.png",
                            scale: 2,
                          )),
                    ),
                    Flexible(
                      flex: 8,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          _income,
                          style: TextStyle(
                              color: ColorStyle.cText,
                              fontFamily: "Bahnschrift",
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
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
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffD8E5FF),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: ColorStyle.cBaseColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(
                            "images/icons/outcome.png",
                            scale: 2,
                          )),
                    ),
                    Flexible(
                      flex: 8,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          _outcome,
                          style: TextStyle(
                              color: ColorStyle.cText,
                              fontFamily: "Bahnschrift",
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
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
                    return _summaryWidgets(
                        snapshot.data[index].icon.toString(),
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

class _summaryWidgets extends StatelessWidget {
  final String iconData;
  final String boxName;
  final String boxTotal;

  const _summaryWidgets(this.iconData, this.boxName, this.boxTotal);

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
                  color: ColorStyle.cBaseColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "images/icons/" + iconData + ".png",
                scale: 2.2,
              )),
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
