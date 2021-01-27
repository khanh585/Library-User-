import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:user_library/widgets/book/book_item_horizontal.dart';

class TabViewBooks extends StatefulWidget {
  TabViewBooks();
  @override
  TabViewBooksState createState() => TabViewBooksState();
}

class TabViewBooksState extends State<TabViewBooks> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 15, left: 25, right: 20),
        margin: EdgeInsets.only(top: 35),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(1, 1),
              )
            ],
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(35),
            )),
        child: Column(children: [
          Container(
            width: 40,
            height: 4,
            margin: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const Text('', textAlign: TextAlign.center),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Text(
                    "Reading now",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
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
                              Icons.category_outlined,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                BookItemHorizontal(),
                BookItemHorizontal(),
                BookItemHorizontal(),
                BookItemHorizontal(),
              ],
            ),
          )
        ]));
  }
}
