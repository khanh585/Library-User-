import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:user_library/models/message.dart';
import 'package:flutter/material.dart';

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
          var message =
              Message(staffId: 9, wishlist: [1, 2, 3, 55, 99], customerId: 5);
          connection.start().then((value) async {
            connection.invoke('SendMessage', args: <Object>[message]);
          }).whenComplete(() => connection.stop());
        }
      });
    } on PlatformException {
      barcodeScanRes = 'Không thể nhận diện.';
    }
    return barcodeScanRes;
  }

  static void showSnackBar(BuildContext context, String message) =>
      Scaffold.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(message)),
        );
}
