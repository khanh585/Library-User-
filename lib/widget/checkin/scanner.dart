import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Scanner_Screen extends StatefulWidget {
  Scanner_Screen({Key key}) : super(key: key);

  final Map<String, dynamic> pluginParameters = {};

  @override
  _Scanner_ScreenState createState() => _Scanner_ScreenState();
}

class _Scanner_ScreenState extends State<Scanner_Screen> {
  String _scanBarcode = 'chưa có';

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Huỷ", true, ScanMode.QR);
      print(barcodeScanRes);
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
