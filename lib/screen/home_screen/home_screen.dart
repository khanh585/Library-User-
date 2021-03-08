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
  String _message = '';

  _registerOnFirebase() {
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.getToken().then((token) => print(token));
  }
  @override
  void initState() {
    _registerOnFirebase();
    getMessage();
    super.initState();
    home_bloc.eventController.sink
        .add(FetchSuggestBook(int.parse(this.widget.user.id)));

    home_bloc.eventController.sink.add(FetchNewestBook());
  }

  void getMessage() {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('received message');
      setState(() => _message = message["notification"]["body"]);
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => _message = message["notification"]["body"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["notification"]["body"]);
    });
  }

  @override
  Future<String> _updateToken(String id, TmpUser user) async {
    String url = 'http://171.244.5.88:90/api/Customer?id=$id';
    Map<String, String> headers = {"Content-type": "application/json"};
    Response response = await put(url, headers: headers, body: user);
    int statusCode = response.statusCode;
    print(statusCode);
    print(" co chay cai upate token ne");
    String body = response.body;
    return "OK";
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
              if (snapshot.hasError) return Text("Error");
              else{
                return Column(
                  children: [
                    SizedBox(height: 20),
                    FadeSideUp(1.0, NavigationBar(user: this.widget.user)),
                    FadeSideUp(2.0, SuggestBookSection(
                      listSuggestBook: snapshot.data.listSuggestBook
                    )),
                    FadeSideUp(3.0, TabViewBooks(
                      listNewestBook: snapshot.data.listNewestBook,
                    )),
                  ],
                );
              }
            }),
      ),
    );
  }
}
