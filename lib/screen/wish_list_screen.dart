import 'package:flutter/material.dart';
import 'package:user_library/widget/wish_list/bag_bar.dart';
import 'package:user_library/widget/wish_list/book_cart.dart';
import 'package:user_library/widget/bottombar.dart';
import 'package:user_library/widget/book_grid.dart';
import 'package:user_library/widget/searchbar.dart';

class WishList_Screen extends StatefulWidget {
  WishList_Screen({Key key}) : super(key: key);

  @override
  _WishList_ScreenState createState() => _WishList_ScreenState();
}

class _WishList_ScreenState extends State<WishList_Screen> {
  final txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: new SingleChildScrollView(
            child: new Column(
              // appBar: AppBar(
              //   backgroundColor: Color.fromRGBO(250, 252, 251, 1),
              //   elevation: 0.0,
              //   leading: IconButton(
              //     icon: Icon(
              //       Icons.arrow_back_ios_rounded,
              //       color: Color(0xFF545D68),
              //     ),
              //     onPressed: () {
              //       // Navigator.of(context).pop();
              //     },
              //   ),
              // ),
              // backgroundColor: Color.fromRGBO(204, 255, 255, 1),
              children: [
                Column(children: [
                  BagBar(),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                  ),
                  BookCart() // Book image
                ]),
              ],
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          //   backgroundColor: Color.fromRGBO(44, 209, 172, 1),
          //   child: Icon(Icons.qr_code),
          // ),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          // bottomNavigationBar: BottomBar(),
        )
      ],
    );
  }
}
