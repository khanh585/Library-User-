import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:user_library/models/message.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Util {
  static final connection =
      HubConnectionBuilder().withUrl('http://171.244.5.88:90/message').build();

  static Future<String> scanQR() async {
    String barcodeScanRes;
    try {
      await FlutterBarcodeScanner.scanBarcode(
              "#ff6666", "Huỷ", true, ScanMode.QR)
          .then((value) {
        barcodeScanRes = value;
        if (connection != null) {
          print("LVAUE " + value);
          var msg = Message.fromJson(jsonDecode(value));
          var message =
              Message(staffId: 9, wishlist: [1, 2, 3, 55, 99], customerId: 5);
          connection.start().then((value) async {
            connection.invoke('SendMessage', args: <Object>[msg]);
          }).whenComplete(() => connection.stop());
        }
      });
    } on PlatformException {
      barcodeScanRes = 'Không thể nhận diện.';
    }
    return barcodeScanRes;
  }

  static Future<String> returnBook() async {
    String barcodeScanRes;
    await FlutterBarcodeScanner.scanBarcode("#ff6666", "Huỷ", true, ScanMode.QR)
        .then((value) {
      // barcodeScanRes = value;
      print(value);
    });
  }

  static void showSnackBar(BuildContext context, String message) =>
      Scaffold.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(message)),
        );
}
