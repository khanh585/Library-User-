import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:user_library/models/tmpUser.dart';
import 'package:user_library/screen/librarian_home_screen/widgets/grid_dashboard.dart';

class LibrarianHomeScreen extends StatefulWidget {
  final TmpUser user;
  LibrarianHomeScreen({this.user});
  @override
  LibrarianHomeScreenState createState() => LibrarianHomeScreenState();
}

class LibrarianHomeScreenState extends State<LibrarianHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    final connection =
      HubConnectionBuilder().withUrl('http://171.244.5.88:90/message').build();
      connection.stop();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: size.height / 12,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Welcome back, " + this.widget.user.name,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Home",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          GridDashboard(
            user: this.widget.user,
          )
        ],
      ),
    );
  }
}
