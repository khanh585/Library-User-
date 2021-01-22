import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final Function(int) handelPageView;
  BottomBar({this.handelPageView});

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed: () {
                    widget.handelPageView(0);
                  },
                  child: Icon(
                    Icons.home_outlined,
                    color: Colors.grey,
                    size: 26,
                  ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30)),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed: () {
                    widget.handelPageView(1);
                  },
                  child: Icon(
                    Icons.book_outlined,
                    color: Colors.grey,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed: () {
                    widget.handelPageView(2);
                  },
                  child: Icon(
                    Icons.shopping_basket_outlined,
                    color: Colors.grey,
                    size: 26,
                  ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30)),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed: () {
                    widget.handelPageView(3);
                  },
                  child: Icon(
                    Icons.more_horiz_outlined,
                    color: Colors.grey,
                    size: 26,
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
