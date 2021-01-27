import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:user_library/widgets/checkin/obj.dart';

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
          var obj = Obj(StaffId: 9, Wishlist: [1, 2, 3, 55, 99], CustomerId: 5);
          connection.start().then((value) async {
            connection.invoke('SendMessage', args: <Object>[obj]);
          }).whenComplete(() => connection.stop());
        }
      });
    } on PlatformException {
      barcodeScanRes = 'Không thể nhận diện.';
    }
    return barcodeScanRes;
  }
}
