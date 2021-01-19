import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import 'main_layout/main_layout.dart';

class QRCode_Borrow_Book_Screen extends StatefulWidget {
  @override
  _QRCode_Borrow_Book_ScreenState createState() =>
      _QRCode_Borrow_Book_ScreenState();
}

class _QRCode_Borrow_Book_ScreenState extends State<QRCode_Borrow_Book_Screen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MainLayout();
                },
              ),
            ),
          ),
          centerTitle: true,
          title: const Text(
            'BORROW BOOK QR CODE',
            textAlign: TextAlign.center,
          ),
        ),
        body: Center(
          child: Container(
            height: 250,
            child: SfBarcodeGenerator(
              value: 'www.papv.com',
              symbology: QRCode(),
              showValue: false,
            ),
          ),
        ),
      ),
    );
  }
}
