import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:user_library/screen/search_screen/search_screen.dart';

class NavigationBar extends StatefulWidget {
  @override
  NavigationBarState createState() => NavigationBarState();
}

class NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    print("RENDER");
    return Container(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
        child: Row(children: [
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.fill,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  "images/user.jpg",
                  fit: BoxFit.cover,
                  width: 25,
                  height: 25,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Text("Nguyen Huynh Phu"),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Wrap(
                alignment: WrapAlignment.end,
                spacing: 10,
                runSpacing: 0,
                direction: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 35,
                    height: 35,
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 20,
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen())),
                    ),
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    child: IconButton(
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
