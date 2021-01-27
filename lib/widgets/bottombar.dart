import 'package:flutter/material.dart';

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
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    Icons.book_outlined,
                    color: buttonColor,
                    size: 24,
                  ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30)),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                  onPressed: () {
                    widget.handelPageView(2);
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
                    widget.handelPageView(3);
                  },
                  child: Icon(
                    Icons.more_horiz_outlined,
                    color: buttonColor,
                    size: 24,
                  ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
