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
              top: Radius.circular(10),
            )),
        child: Column(children: [
          DefaultTabController(
            length: 3,
            child: TabBar(labelColor: Colors.black, tabs: [
              Tab(text: "Popular"),
              Tab(text: "The Lastest"),
              Tab(text: "The Newest"),
            ]),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.only(top: 10),
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
