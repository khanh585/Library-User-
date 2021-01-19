import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:user_library/screen/home_screen/widgets/suggest_book_item/suggest_book_section.dart';

import 'package:user_library/widgets/home_screen/midle_bar.dart';
import 'package:user_library/widgets/searchbar.dart';

import '../home_screen/widgets/item_book_bottom/item_book_bottom.dart';
import '../home_screen/widgets/top_bar/top_bar.dart';

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
          height: 330,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/homescreen.jpg'),
            fit: BoxFit.fill,
          )),
          child: Text(""),
        ),
        Positioned(
            top: 320,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  )),
              height: 330,
              child: Text(""),
            )),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              Container(
                child: SearchBar(atHomePage: true),
              ),
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
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    )),
                child: Column(
                  children: [
                    MidleBar(
                      callback: null,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          ItemBookBottom(),
                          ItemBookBottom(),
                          ItemBookBottom(),
                          ItemBookBottom(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
