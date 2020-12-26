import 'package:flutter/material.dart';

class BottomBar_Home extends StatefulWidget {
  const BottomBar_Home({Key key}) : super(key: key);

  @override
  _BottomBar_HomeState createState() => _BottomBar_HomeState();
}

class _BottomBar_HomeState extends State<BottomBar_Home> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      // notchMargin: 6.0,
      color: Colors.white,
      // elevation: 9,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 40,
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
                      Icons.dashboard_outlined,
                      color: Colors.grey,
                      size: 35,
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(35)),
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
                      Icons.search,
                      color: Colors.grey,
                      size: 35,
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(35)),
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
                      Icons.notifications_none_rounded,
                      color: Colors.grey,
                      size: 35,
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(35)),
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
                      Icons.menu_rounded,
                      color: Colors.grey,
                      size: 35,
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(35)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
