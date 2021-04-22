import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:user_library/constants.dart';
import 'package:user_library/models/message.dart';
import 'package:user_library/models/wishlist.dart';
import 'package:user_library/screen/wishlist_screen_2/wishlist_bloc.dart';
import 'package:user_library/screen/wishlist_screen_2/wishlist_event.dart';
import 'package:user_library/screen/wishlist_screen_2/wishlist_state.dart';
import 'package:user_library/widgets/loading_circle.dart';
import '../../models/wishlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishListScreen extends StatefulWidget {
  WishListScreen({Key key}) : super(key: key);
  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final _wishlistScreenBloc = WishListBloc();
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
    _wishlistScreenBloc.eventController.sink.add(RefreshWishList());
  }

  void _delete_ToListBorrow(WishList wish) {
    _wishlistScreenBloc.eventController.sink.add(DeleteToListBorrow(wish));
  }

  Future<void> _genQRCode(List<WishList> wishlist) async {
    List<int> listID = [];
    wishlist.forEach((element) {
      if (element.isChecked) listID.add(element.id);
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userid = (prefs.getString('PAPV_UserID') ?? '');
    var msg =
        new Message(wishlist: listID, patronId: int.parse(userid), staffId: 0);
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

  List<Widget> itemsData = [];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Color(0xfffbfafd),
          shadowColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black, opacity: 0.7),
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          leadingWidth: 25,
          elevation: 0,
          title: Text(
            "Wishlist",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                letterSpacing: 1),
          ),
        ),
        body: StreamBuilder<WishListState>(
            stream: _wishlistScreenBloc.stateController.stream,
            initialData: _wishlistScreenBloc.state,
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text("Error");
              if (snapshot.data.wishlist != null) {
                if (snapshot.data.wishlist.length != 0) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              controller: controller,
                              itemCount: snapshot.data.wishlist.length,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                double scale = 1.0;
                                return Opacity(
                                  opacity: scale,
                                  child: Transform(
                                    transform: Matrix4.identity()
                                      ..scale(scale, scale),
                                    alignment: Alignment.bottomCenter,
                                    child: Align(
                                        heightFactor: 0.9,
                                        alignment: Alignment.topCenter,
                                        child: Dismissible(
                                          onDismissed: (direction) {
                                            WishList wish =
                                                snapshot.data.wishlist[index];
                                            snapshot.data.wishlist
                                                .removeAt(index);
                                            _delete_ToListBorrow(wish);
                                          },
                                          background: Container(
                                            padding: EdgeInsets.only(right: 10),
                                            alignment: Alignment.centerRight,
                                            child: Icon(
                                              Icons.cancel_outlined,
                                              color: Colors.red,
                                            ),
                                          ),
                                          key: Key(snapshot
                                              .data.wishlist[index].id
                                              .toString()),
                                          child: Container(
                                              height: 150,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              15.0)),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withAlpha(100),
                                                        blurRadius: 5.0),
                                                  ]),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0,
                                                        vertical: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Container(
                                                          width: 200,
                                                          child: Text(
                                                            snapshot
                                                                .data
                                                                .wishlist[index]
                                                                .name,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: const TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data
                                                              .wishlist[index]
                                                              .author,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          "\$ ${snapshot.data.wishlist[index].fee}",
                                                          style: const TextStyle(
                                                              fontSize: 25,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      ],
                                                    ),
                                                    Image.network(
                                                      "${snapshot.data.wishlist[index].image}",
                                                      // height: double.infinity,
                                                      width: (size.width -
                                                                  25 * 2) /
                                                              3 -
                                                          18 * 2,
                                                    )
                                                  ],
                                                ),
                                              )),
                                        )),
                                  ),
                                );
                              }),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 25, right: 25, bottom: 25, top: 25),
                          height: 49,
                          width: 300,
                          color: Colors.transparent,
                          child: FlatButton(
                            color: Color(0xFF9966).withOpacity(0.95),
                            child: Text('Gen QRcode',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: kWhiteColor)),
                            onPressed: () =>
                                {_genQRCode(snapshot.data.wishlist)},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Wrap(
                      direction: Axis.vertical,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Image.asset("images/nodata.png",
                            width: 100, height: 100),
                        Text("No data",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.orangeAccent[400]))
                      ],
                    ),
                  );
                }
              } else {
                _refreshWishList();
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          "images/drone2.gif",
                          height: 250.0,
                          width: 250.0,
                        ),
                      ),
                      Positioned(
                        child: Text(
                          "Loading",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.orangeAccent[400]),
                        ),
                        top: 510,
                        left: 172,
                      )
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
