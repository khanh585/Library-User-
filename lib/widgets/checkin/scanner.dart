import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:signalr_core/signalr_core.dart';

import 'obj.dart';

class Scanner_Screen extends StatefulWidget {
  Scanner_Screen({Key key}) : super(key: key);

  final Map<String, dynamic> pluginParameters = {};

  @override
  _Scanner_ScreenState createState() => _Scanner_ScreenState();
}

class _Scanner_ScreenState extends State<Scanner_Screen> {
  String _scanBarcode = 'chưa có';
  final connection =
      HubConnectionBuilder().withUrl('http://171.244.5.88:90/message').build();
  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      await FlutterBarcodeScanner.scanBarcode(
              "#ff6666", "Huỷ", true, ScanMode.QR)
          .then((value) {
        barcodeScanRes = value;
        if (connection != null) {
          var obj = Obj(StaffId: 9, Wishlist: [1, 2, 3, 55, 99], CustomerId: 5);
          connection.start().then((value) async {
            connection.invoke('SendMessage', args: <Object>[obj]);
          }).whenComplete(() => connection.stop());
        }
      });
    } on PlatformException {
      barcodeScanRes = 'Không thể nhận diện.';
    }
    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Scan Result',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '$_scanBarcode',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 72),
            RaisedButton(
              onPressed: () => scanQR(),
              child: Text('Scan QR'),
            )
          ],
        ),
      ),
    );
  }
}
