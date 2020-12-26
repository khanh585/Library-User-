import 'package:flutter/material.dart';
import 'package:user_library/widget/bottombar.dart';
import 'package:user_library/widget/book_grid.dart';
import 'package:user_library/widget/searchbar.dart';

class SearchBook_Screen extends StatefulWidget {
  SearchBook_Screen({Key key}) : super(key: key);

  @override
  _SearchBook_ScreenState createState() => _SearchBook_ScreenState();
}

class _SearchBook_ScreenState extends State<SearchBook_Screen> {
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

class CategoryBar extends StatelessWidget {
  const CategoryBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 7,
        height: 60,
        margin: EdgeInsets.only(left: 5, right: 2, top: 1),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CategoryTabButton('Design', true),
            CategoryTabButton('Achitecture', false),
            CategoryTabButton('Design', false),
            CategoryTabButton('Design', false),
          ],
        ));
  }
}

class CategoryTabButton extends StatelessWidget {
  final String text;
  final bool isFocus;
  const CategoryTabButton(
    this.text,
    this.isFocus,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: [
          FlatButton(
            padding: EdgeInsets.only(top: 10),
            onPressed: null,
            child: Text(
              text,
              style: TextStyle(
                  color: isFocus ? Colors.black87 : Colors.black45,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0),
            width: 45,
            height: isFocus ? 5 : 0,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10), bottom: Radius.circular(10)),
            ),
          )
        ],
      ),
    );
  }
}
