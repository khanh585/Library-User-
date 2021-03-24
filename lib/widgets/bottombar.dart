import 'package:flutter/material.dart';
import 'package:user_library/screen/search_screen/search_screen.dart';

class BottomBar extends StatefulWidget {
  final Function(int) handelPageView;
  BottomBar({this.handelPageView});

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  final Color buttonColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            onPressed: () {
              widget.handelPageView(0);
            },
            child: Icon(
              Icons.menu_book_outlined,
              color: buttonColor,
              size: 24,
            ),
          ),
          FlatButton(
            onPressed: () {
              widget.handelPageView(1);
            },
            child: Icon(
              Icons.shopping_basket_outlined,
              color: buttonColor,
              size: 24,
            ),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30)),
          ),
          FlatButton(
            onPressed: () {
              widget.handelPageView(2);
            },
            child: Icon(
              Icons.search,
              color: buttonColor,
              size: 24,
            ),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30)),
          ),
          // FloatingActionButton(
          //   onPressed: () => Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => SearchScreen())),
          //   backgroundColor: Colors.blueGrey,
          //   child: Icon(
          //     Icons.search,
          //     size: 28,
          //   ),
          // ),
          FlatButton(
            onPressed: () {
              widget.handelPageView(3);
            },
            child: Icon(
              Icons.account_box_outlined,
              color: buttonColor,
              size: 24,
            ),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30)),
          ),
        ],
      ),
    );
  }
}
