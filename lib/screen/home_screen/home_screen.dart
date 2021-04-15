import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:user_library/models/tmpUser.dart';
import 'package:user_library/screen/home_screen/home_bloc.dart';
import 'package:user_library/screen/home_screen/home_event.dart';
import 'package:user_library/screen/home_screen/home_state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:user_library/screen/home_screen/widgets/navigation_bar/navigation_bar.dart';
import 'package:user_library/screen/home_screen/widgets/suggest_book_item/suggest_book_section.dart';
import 'package:user_library/widgets/animation/fade_side_up.dart';
import 'widgets/tab_view_books/tab_view_books.dart';

class HomeScreen extends StatefulWidget {
  final TmpUser user;
  HomeScreen({this.user});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final txtSearch = TextEditingController();

  final home_bloc = HomeBloc();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    home_bloc.eventController.sink
        .add(FetchSuggestBook(int.parse(this.widget.user.id)));

    home_bloc.eventController.sink.add(FetchNewestBook());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: new LinearGradient(
            colors: [
              const Color.fromRGBO(255, 255, 255, 1),
              const Color.fromRGBO(250, 250, 250, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp),
      ),
      child: SingleChildScrollView(
        child: StreamBuilder<HomeState>(
            stream: home_bloc.stateController.stream,
            initialData: home_bloc.state,
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Text("Error");
              else {
                if (snapshot.data.listSuggestBook.length != 0 &&
                    snapshot.data.listNewestBook.length != 0) {
                  return Column(
                    children: [
                      SizedBox(height: 20),
                      FadeSideUp(1.0, NavigationBar(user: this.widget.user)),
                      FadeSideUp(
                          2.0,
                          SuggestBookSection(
                              listSuggestBook: snapshot.data.listSuggestBook)),
                      FadeSideUp(
                          3.0,
                          TabViewBooks(
                            listNewestBook: snapshot.data.listNewestBook,
                          )),
                    ],
                  );
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            "images/drone2.gif",
                            height: 250.0,
                            width: 250.0,
                          ),
                        ),
                        Positioned(
                          child: Text(
                            "Loading",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.orangeAccent[400]),
                          ),
                          top: 510,
                          left: 172,
                        )
                      ],
                    ),
                  );
                }
              }
            }),
      ),
    );
  }
}
