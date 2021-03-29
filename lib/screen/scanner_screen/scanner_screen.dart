import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:user_library/service/utils.dart';

class ScannerScreen extends StatefulWidget {
  ScannerScreen({Key key}) : super(key: key);

  final Map<String, dynamic> pluginParameters = {};

  @override
  ScannerScreenState createState() => ScannerScreenState();
}

class ScannerScreenState extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: Offset(1, 1),
                      )
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(35),
                    )),
                padding: EdgeInsets.all(40),
                width: 250,
                height: 250,
                child: Image.asset('images/QR.png')),
            FlatButton(
                onPressed: () => Util().scanQR(),
                child: Container(
                  height: 48,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      "Start Scan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
