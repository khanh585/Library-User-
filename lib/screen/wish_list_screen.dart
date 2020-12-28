import 'package:flutter/material.dart';
import 'package:user_library/widget/bottombar.dart';
import 'package:user_library/widget/book_grid.dart';
import 'package:user_library/widget/category_bar.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 252, 251, 1),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFF545D68),
          ),
          onPressed: () {
            // Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Color.fromRGBO(250, 252, 251, 1),
      body: Stack(children: [
        CategoryBar(),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 70, left: 5, right: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(147, 149, 148, .7),
                blurRadius: 20,
                offset: Offset(1, 5),
              ),
            ],
          ),
          child: Container(
            child: Column(
              children: [
                // thanh tim kiem
                SearchBar(
                  txtSearch: txtSearch,
                  atHomePage: false,
                ),
                // list book, grid book
                Container(
                  height: MediaQuery.of(context).size.height - 280,
                  width: MediaQuery.of(context).size.width,
                  child: StreamBuilder<Object>(
                      stream: null,
                      builder: (context, snapshot) {
                        return ProductGrid();
                      }),
                ),
              ],
            ),
          ),
        ),
        // Book image
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        backgroundColor: Color.fromRGBO(44, 209, 172, 1),
        child: Icon(Icons.qr_code),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}



