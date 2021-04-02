import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:user_library/database/database.dart';
import 'package:user_library/models/message.dart';
import 'package:user_library/models/wishlist.dart';
import 'package:user_library/screen/wishlish_screen/widget/wishlist_item.dart';
import 'package:user_library/screen/wishlish_screen/wishlist_screen_bloc.dart';
import 'package:user_library/screen/wishlish_screen/wishlist_screen_event.dart';
import 'package:user_library/screen/wishlish_screen/wishlist_screen_state.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WishListScreen extends StatefulWidget {
  WishListScreen({Key key}) : super(key: key);
  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final _wishlistScreenBloc = WishListScreenBloc();
  @override
  void initState() {
    _refreshWishList();
    super.initState();
  }

  Future<void> _refreshWishList() async {
    _wishlistScreenBloc.eventController.sink.add(RefreshWishList());
  }

  void _add_delete_ToListBorrow(WishList wish) {
    _wishlistScreenBloc.eventController.sink.add(AddOrRemoveToListBorrow(wish));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<WishListScreenState>(
        stream: _wishlistScreenBloc.stateController.stream,
        initialData: _wishlistScreenBloc.state,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text("Error");
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              _refreshWishList();
              return;
            },
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wish List',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data.wishlist != null
                          ? '${snapshot.data.wishlist.where((element) => element.isChecked).length} of ${snapshot.data.wishlist.length}'
                          : '0 of 0',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
                for (WishList wish in snapshot.data.wishlist)
                  GestureDetector(
                    onTap: () {
                      this._add_delete_ToListBorrow(wish);
                    },
                    child: WishListItem(
                      wishlist: wish,
                      isTick: wish.isChecked,
                    ),
                  ),
                FlatButton(
                    onPressed: () => {_genQRCode(snapshot.data.wishlist)},
                    child: Text('Gen QRcode')),
              ],
            ),
          );
        },
      ),
    );
  }
}
