import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
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
                  onPressed: () {},
                  child: Icon(
                    Icons.home_outlined,
                    color: Colors.grey,
                    size: 35,
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
                  onPressed: () {},
                  child: Icon(
                    Icons.book_outlined,
                    color: Colors.grey,
                    size: 35,
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
                  onPressed: () {},
                  child: Icon(
                    Icons.shopping_basket_outlined,
                    color: Colors.grey,
                    size: 35,
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
                  onPressed: () {},
                  child: Icon(
                    Icons.more_horiz_outlined,
                    color: Colors.grey,
                    size: 35,
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
