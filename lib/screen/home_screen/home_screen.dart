import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:user_library/screen/home_screen/widgets/suggest_book_item/suggest_book_section.dart';
import 'package:user_library/screen/search_screen/search_screen.dart';
import '../home_screen/widgets/top_bar/top_bar.dart';
import 'widgets/tab_view_books/tab_view_books.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/homescreen.jpg'),
            fit: BoxFit.fill,
          )),
          child: Text(""),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              FlatButton(
                  height: 60,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        right: 15, left: 15, top: 12, bottom: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Find your book",
                              style: TextStyle(color: Colors.black54),
                            ))
                      ],
                    ),
                  )),
              TopBar(),
              Container(
                  width: MediaQuery.of(context).size.width - 15,
                  //height: 320,
                  margin: EdgeInsets.only(top: 10, left: 15, bottom: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(1, 0),
                        )
                      ]),
                  child: SuggestBookSection()),
              TabViewBooks()
            ],
          ),
        ),
      ],
    );
  }
}
