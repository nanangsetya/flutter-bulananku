import 'dart:developer';

import 'package:bulananku/helper/colors_helper.dart';
import 'package:bulananku/pages/dashboard_page.dart';
import 'package:bulananku/services/send_data_form.dart';
import 'package:bulananku/styles/color_style.dart';
import 'package:bulananku/widget/loadingwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPage extends StatefulWidget {
  int _selectedIndex = 1;
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

_alertDialog(BuildContext context, String msg) {
  showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(msg),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

_inputProcess(context, type, description, nominal, category) {
  LoadingOverlay.of(context).show();
  FormResult.sendData(type, description, nominal, category).then((value) {
    LoadingOverlay.of(context).hide();
    if (value.success == false) {
      _alertDialog(context, value.message);
    } else {
      // _alertDialog(context, value.message);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => DashboardPage()));
    }
  });
}

class _InputPageState extends State<InputPage> {
  TabBar get _tabBar => TabBar(tabs: <Widget>[
        Tab(
          icon: Icon(Icons.shopping_cart_outlined),
        ),
        Tab(
          icon: Icon(Icons.savings_outlined),
        ),
      ], indicatorColor: Colors.white);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: ColorStyle.cGreen, //change your color here
          ),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: ColorStyle.cGreen,
              child: _tabBar,
            ),
          ),
        ),
        body: const TabBarView(
          children: <Widget>[OutcomeForm(), IncomeForm()],
        ),
      ),
    );
  }
}

class OutcomeForm extends StatefulWidget {
  const OutcomeForm({Key? key}) : super(key: key);

  @override
  OutcomeFormState createState() => OutcomeFormState();
}

class OutcomeFormState extends State<OutcomeForm> {
  static GlobalKey<FormState> _outcomeKey = new GlobalKey<FormState>();
  List<String> _categoryList = ["Sandang", "Pangan", "Papan", "Tersier"];
  String _categoryValue = "Sandang";

  TextEditingController _outcomeDesc = new TextEditingController();
  TextEditingController _outcomeNom = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width * 1;
    final double _height = MediaQuery.of(context).size.height * 1;
    return Container(
      margin: EdgeInsets.only(
        top: 50,
        left: MediaQuery.of(context).size.width * 0.04,
        right: MediaQuery.of(context).size.width * 0.04,
      ),
      child: Form(
        key: _outcomeKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: TextFormField(
                autofocus: false,
                controller: _outcomeDesc,
                style: TextStyle(
                    color: getColor(name: 'green'),
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorStyle.cGreen),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorStyle.cGreen,
                    ),
                  ),
                  labelText: "DESCRIPTION",
                  labelStyle: TextStyle(
                      fontSize: 12,
                      color: ColorStyle.cGreen,
                      letterSpacing: 1.5),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: TextFormField(
                autofocus: false,
                controller: _outcomeNom,
                style: TextStyle(
                    color: getColor(name: 'green'),
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorStyle.cGreen),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorStyle.cGreen,
                    ),
                  ),
                  labelText: "NOMINAL",
                  labelStyle: TextStyle(
                      fontSize: 12,
                      color: ColorStyle.cGreen,
                      letterSpacing: 1.5),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorStyle.cGreen),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorStyle.cGreen,
                    ),
                  ),
                  labelText: "Category",
                  labelStyle: TextStyle(
                      fontSize: 12,
                      color: ColorStyle.cGreen,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold),
                ),
                icon: Icon(
                  Icons.expand_more,
                  color: ColorStyle.cGreen,
                ),
                value: _categoryValue,
                items:
                    _categoryList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                          fontSize: 14,
                          color: ColorStyle.cGreen,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _categoryValue = newValue!;
                  });
                },
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  if (_outcomeKey.currentState!.validate()) {
                    if (_outcomeDesc.text.isEmpty ||
                        _outcomeNom.text.isEmpty ||
                        _categoryValue.isEmpty) {
                      _alertDialog(context, "Complete the form!");
                    }
                    _inputProcess(
                        context,
                        "outcome",
                        _outcomeDesc.text.toString(),
                        _outcomeNom.text.toString(),
                        _categoryValue.toString());
                  }
                },
                child: Text("Save",
                    style: TextStyle(fontSize: 16, letterSpacing: 2)),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: getColor(name: 'green'),
                    minimumSize: Size(_width, _height * 0.07)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IncomeForm extends StatefulWidget {
  const IncomeForm({Key? key}) : super(key: key);

  @override
  IncomeFormState createState() => IncomeFormState();
}

class IncomeFormState extends State<IncomeForm> {
  static GlobalKey<FormState> _incomeKey = new GlobalKey<FormState>();

  TextEditingController _incomeDesc = new TextEditingController();
  TextEditingController _incomeNom = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width * 1;
    final double _height = MediaQuery.of(context).size.height * 1;
    return Container(
      margin: EdgeInsets.only(
        top: 50,
        left: MediaQuery.of(context).size.width * 0.04,
        right: MediaQuery.of(context).size.width * 0.04,
      ),
      child: Form(
        key: _incomeKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: TextFormField(
                autofocus: false,
                controller: _incomeDesc,
                style: TextStyle(
                    color: getColor(name: 'green'),
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorStyle.cGreen),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorStyle.cGreen,
                    ),
                  ),
                  labelText: "DESCRIPTION",
                  labelStyle: TextStyle(
                      fontSize: 12,
                      color: ColorStyle.cGreen,
                      letterSpacing: 1.5),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: TextFormField(
                autofocus: false,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: _incomeNom,
                style: TextStyle(
                    color: getColor(name: 'green'),
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorStyle.cGreen),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorStyle.cGreen,
                    ),
                  ),
                  labelText: "NOMINAL",
                  labelStyle: TextStyle(
                      fontSize: 12,
                      color: ColorStyle.cGreen,
                      letterSpacing: 1.5),
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  if (_incomeKey.currentState!.validate()) {
                    if (_incomeDesc.text.isEmpty || _incomeNom.text.isEmpty) {
                      _alertDialog(context, "Complete the form!");
                    }
                    _inputProcess(
                        context,
                        "income",
                        _incomeDesc.text.toString(),
                        _incomeNom.text.toString(),
                        '');
                  }
                },
                child: Text("Save",
                    style: TextStyle(fontSize: 16, letterSpacing: 2)),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: getColor(name: 'green'),
                    minimumSize: Size(_width, _height * 0.07)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
