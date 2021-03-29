import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:user_library/models/message.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:user_library/models/messagebarcode.dart';
import 'package:user_library/models/messagereturn.dart';
import 'package:vibration/vibration.dart';
import 'package:soundpool/soundpool.dart';
import 'dart:io';

class Util {
  final connection =
      HubConnectionBuilder().withUrl('http://171.244.5.88:90/message').build();
  bool hasConnected = false;
  bool inStream = false;
  Soundpool pool = Soundpool(streamType: StreamType.notification);

  Future<String> scanQR() async {
    String barcodeScanRes;
    hasConnected = !connection.state.toString().contains('disconnected');
    int soundId =
        await rootBundle.load("sounds/beep.mp3").then((ByteData soundData) {
      return pool.load(soundData);
    });

    try {
      final scanner = await FlutterBarcodeScanner.getBarcodeStreamReceiver(
          "#ff6666", "Cancel", false, ScanMode.DEFAULT);

      final substream = await scanner.listen(null);
      substream.onData((value) async {
        print('BORROW NEK');
        String code = value.toString();
        if (code == '-1') {
          await substream.cancel();
          print('Cancel br');
        } else {
          if (connection != null) {
            if (hasConnected) {
              inStream = true;
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String userid = (prefs.getString('PAPV_UserID') ?? '');
              String str = code.toString();
              if (str.toLowerCase().contains('wishlist')) {
                var msg = Message.fromJson(jsonDecode(code));
                msg.staffId = int.parse(userid);
                connection.start().whenComplete(() {
                  hasConnected = true;
                  connection
                      .invoke('SendMessage', args: <Object>[msg]).whenComplete(
                          () => connection.stop().whenComplete(() async {
                                if (await Vibration.hasVibrator()) {
                                  Vibration.vibrate(duration: 400);
                                }
                                await pool.play(soundId);
                                print('kk' + msg.toJson().toString());
                                await sleep(const Duration(seconds: 3));
                                await scanner.drain();
                                hasConnected = false;
                                inStream = false;
                              }));
                });
              } else {
                var msg = new MessageBarcode(
                    barcode: code, customerId: -1, staffId: int.parse(userid));
                connection.start().whenComplete(() {
                  hasConnected = true;
                  connection.invoke('SendMessageToBorrow', args: <Object>[
                    msg
                  ]).whenComplete(
                      () => connection.stop().whenComplete(() async {
                            if (await Vibration.hasVibrator()) {
                              Vibration.vibrate(duration: 400);
                            }
                            await pool.play(soundId);
                            print('borrow' + msg.toJson().toString());
                            await sleep(const Duration(seconds: 3));
                            await scanner.drain();
                            hasConnected = false;
                            inStream = false;
                          }));
                });
              }
            } else {
              if (!inStream) {
                hasConnected = true;
              }
            }
          }
        }
      });
    } on PlatformException {
      barcodeScanRes = 'Không thể nhận diện.';
    } catch (error) {} finally {
      return barcodeScanRes;
    }
  }

  Future<String> returnBook() async {
    String barcodeScanRes;
    hasConnected = !connection.state.toString().contains('disconnected');
    int soundId =
        await rootBundle.load("sounds/beep.mp3").then((ByteData soundData) {
      return pool.load(soundData);
    });
    try {
      final scanner = await FlutterBarcodeScanner.getBarcodeStreamReceiver(
          "#ff6666", "Cancel", false, ScanMode.DEFAULT);

      final substream = await scanner.listen(null);
      substream.onData((value) async {
        print('RETURN NEK');
        String code = value.toString();
        if (code == '-1') {
          await substream.cancel();
          print('Cancel rt');
        } else {
          if (connection != null) {
            if (hasConnected) {
              inStream = true;
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String userid = (prefs.getString('PAPV_UserID') ?? '');
              String str = code.toString();
              if (str.contains('WishList')) {
                var msg = MessageReturn.fromJson(jsonDecode(code));
                msg.staffId = int.parse(userid);
                connection.start().whenComplete(() {
                  hasConnected = true;
                  connection.invoke('SendMessageToReturn', args: <Object>[
                    msg
                  ]).whenComplete(
                      () => connection.stop().whenComplete(() async {
                            if (await Vibration.hasVibrator()) {
                              Vibration.vibrate(duration: 400);
                            }
                            await pool.play(soundId);
                            await sleep(const Duration(seconds: 3));
                            await scanner.drain();
                            print('CODE===' + code);
                            hasConnected = false;
                            inStream = false;
                          }));
                });
              } else {
                var msg = new MessageBarcode(
                    barcode: code, customerId: -1, staffId: int.parse(userid));
                connection.start().whenComplete(() {
                  hasConnected = true;
                  connection.invoke('SendMessageToReturnBook', args: <Object>[
                    msg
                  ]).whenComplete(
                      () => connection.stop().whenComplete(() async {
                            if (await Vibration.hasVibrator()) {
                              Vibration.vibrate(duration: 400);
                            }
                            await pool.play(soundId);
                            await sleep(const Duration(seconds: 3));
                            print('return CODE===' + code);
                            await scanner.drain();
                            hasConnected = false;
                            inStream = false;
                          }));
                });
              }
            } else {
              if (!inStream) {
                hasConnected = true;
              }
            }
          }
        }
      });
    } on PlatformException {
      barcodeScanRes = 'Không thể nhận diện.';
    } catch (error) {} finally {
      return barcodeScanRes;
    }
  }

  static void showSnackBar(BuildContext context, String message) =>
      Scaffold.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(message)),
        );
}
