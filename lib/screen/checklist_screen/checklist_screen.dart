import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:user_library/constants.dart';
import 'package:user_library/models/message.dart';
import 'package:user_library/models/wishlist.dart';
import 'package:user_library/screen/checklist_screen/widget/checkitem.dart';
import 'package:user_library/screen/wishlist_screen_2/wishlist_bloc.dart';
import 'package:user_library/screen/wishlist_screen_2/wishlist_event.dart';
import 'package:user_library/screen/wishlist_screen_2/wishlist_state.dart';
import 'package:user_library/widgets/loading_circle.dart';
import '../../models/wishlist.dart';

class CheckListScreen extends StatefulWidget {
  CheckListScreen({Key key}) : super(key: key);
  @override
  _CheckListScreenState createState() => _CheckListScreenState();
}

class _CheckListScreenState extends State<CheckListScreen> {
  final _ChecklistScreenBloc = WishListBloc();
  @override
  void initState() {
    // _refreshWishList();
    controller.addListener(() {
      double value = controller.offset / 119;
      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
    super.initState();
  }

  Future<void> _refreshWishList() async {
    _ChecklistScreenBloc.eventController.sink.add(RefreshWishList());
  }

  void _delete_ToListBorrow(WishList wish) {
    _ChecklistScreenBloc.eventController.sink.add(DeleteToListBorrow(wish));
  }

  void _genQRCode(List<WishList> wishlist) {
    List<int> listID = [];
    wishlist.forEach((element) {
      if (element.isChecked) listID.add(element.id);
    });
    var msg = new Message(wishlist: listID, customerId: 1, staffId: 1);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Container(
                padding: EdgeInsets.all(40),
                color: Colors.white,
                child: QrImage(
                  data: json.encode(msg),
                  version: QrVersions.auto,
                  size: 50.0,
                ),
              )),
    );
  }

  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Container(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Check List screen",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(
                          Icons.edit_outlined,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      CheckItem(),
                      CheckItem(),
                      CheckItem(),
                      CheckItem(),
                      CheckItem(),
                      CheckItem(),
                      CheckItem(),
                      CheckItem(),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 25),
                  height: 49,
                  width: 300,
                  color: Colors.transparent,
                  child: FlatButton(
                    color: Color(0xFF9966).withOpacity(0.95),
                    child: Text('Confirm',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kWhiteColor)),
                    onPressed: () => {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
