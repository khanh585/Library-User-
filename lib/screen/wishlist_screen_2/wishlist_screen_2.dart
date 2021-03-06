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
import 'constants_wish.dart';

class WishListScreen extends StatefulWidget {
  WishListScreen({Key key}) : super(key: key);
  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final _wishlistScreenBloc = WishListBloc();
  @override
  void initState() {
    _refreshWishList();
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

  //final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  // void getPostsData(List<WishList> responseList) {
  //   List<Widget> listItems = [];
  //   responseList.forEach((post) {
  //     listItems.add(Container(
  //         height: 150,
  //         margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.all(Radius.circular(20.0)),
  //             color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
  //             ]),
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: <Widget>[
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text(
  //                     "KHanh",
  //                     style: const TextStyle(
  //                         fontSize: 28, fontWeight: FontWeight.bold),
  //                   ),
  //                   Text(
  //                     post.author,
  //                     style: const TextStyle(fontSize: 17, color: Colors.grey),
  //                   ),
  //                   SizedBox(
  //                     height: 10,
  //                   ),
  //                   Text(
  //                     post.fee.toString(),
  //                     style: const TextStyle(
  //                         fontSize: 25,
  //                         color: Colors.black,
  //                         fontWeight: FontWeight.bold),
  //                   )
  //                 ],
  //               ),
  //               Image.network(
  //                 post.image,
  //                 height: double.infinity,
  //               )
  //             ],
  //           ),
  //         )));
  //   });
  //   // setState(() {
  //   //   itemsData = listItems;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<WishListState>(
            stream: _wishlistScreenBloc.stateController.stream,
            initialData: _wishlistScreenBloc.state,
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text("Error");
              if (snapshot.data.wishlist.length != 0) {
                return RefreshIndicator(
                  onRefresh: () async {
                    _refreshWishList();
                    return;
                  },
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
                                "Wishlist screen",
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
                      // AnimatedOpacity(
                      //   duration: const Duration(milliseconds: 200),
                      //   opacity: closeTopContainer ? 0 : 1,
                      //   child: AnimatedContainer(
                      //       duration: const Duration(milliseconds: 200),
                      //       width: size.width,
                      //       alignment: Alignment.topCenter,
                      //       height: closeTopContainer ? 0 : categoryHeight,
                      //       child: categoriesScroller),
                      // ),
                      Expanded(
                        child: ListView.builder(
                            controller: controller,
                            itemCount: snapshot.data.wishlist.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              double scale = 1.0;
                              if (topContainer > 0.5) {
                                scale = index + 0.5;
                                if (scale < 0) {
                                  scale = 0;
                                } else if (scale > 1) {
                                  scale = 1;
                                }
                              }
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
                                          color: Colors.red,
                                        ),
                                        key: Key(snapshot
                                            .data.wishlist[index].id
                                            .toString()),
                                        child: Container(
                                            height: 150,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0)),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withAlpha(100),
                                                      blurRadius: 10.0),
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
                                                          overflow: TextOverflow
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
                                                        style: const TextStyle(
                                                            fontSize: 17,
                                                            color: Colors.grey),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "\$ ${snapshot.data.wishlist[index].fee}",
                                                        style: const TextStyle(
                                                            fontSize: 25,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  ),
                                                  Image.network(
                                                    "${snapshot.data.wishlist[index].image}",
                                                    // height: double.infinity,
                                                    width:
                                                        (size.width - 25 * 2) /
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
                          onPressed: () => {_genQRCode(snapshot.data.wishlist)},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(child: Text("Empty wish list"));
              }
              // return LoadingCircle(50, Colors.grey);
            }),
      ),
    );
  }
}
