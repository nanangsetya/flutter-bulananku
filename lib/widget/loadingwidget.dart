import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingOverlay {
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show() {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (ctx) => _FullScreenLoader());
  }

  // Future<T> during<T>(Future<T> future) {
  //   show();
  //   return future.whenComplete(() => hide());
  // }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
      body: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitFoldingCube(
                color: Colors.white,
                size: 30.0,
              ),
              // Container(
              //     margin: EdgeInsets.only(top: 20),
              //     child: Text("Please wait",
              //         style: TextStyle(color: Colors.grey.shade700)))
            ],
          )),
    );
  }
}
