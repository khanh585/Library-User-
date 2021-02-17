import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

import 'scanner_screen/scanner_screen.dart';

class Checkin_Screen extends StatefulWidget {
  Checkin_Screen({Key key}) : super(key: key);

  final Map<String, dynamic> pluginParameters = {};

  @override
  _Checkin_ScreenState createState() => _Checkin_ScreenState();
}

class _Checkin_ScreenState extends State<Checkin_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 100.0),
          child: Column(
            children: [
              BarcodeWidget(
                barcode: Barcode.qrCode(),
                color: Colors.black87,
                data: 'dm dat',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScannerScreen(),
                    ),
                  );
                },
                child: Text('Scan QR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
