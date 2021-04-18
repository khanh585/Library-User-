import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/widgets/book/book_item_horizontal.dart';

class TabViewBooks extends StatefulWidget {
  final List<Book> listNewestBook;

  const TabViewBooks({Key key, this.listNewestBook}) : super(key: key);
  @override
  TabViewBooksState createState() => TabViewBooksState();
}

class TabViewBooksState extends State<TabViewBooks> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 145,
        padding: EdgeInsets.only(top: 15, left: 25, right: 20, bottom: 0),
        margin: EdgeInsets.only(top: 5),
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
              top: Radius.circular(30),
            )),
        child: Column(children: [
          Container(
            width: 40,
            height: 4,
            margin: EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const Text('', textAlign: TextAlign.center),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Text(
                    "New Arrivals",
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
          this.widget.listNewestBook.length != 0
              ? Container(
                  height: MediaQuery.of(context).size.height - 210,
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListView(
                    children: [
                      for (Book book in this.widget.listNewestBook)
                        BookItemHorizontal(book: book)
                    ],
                  ),
                )
              : Center(
                  child: Image.asset(
                    "images/empty.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
        ]));
  }
}
