import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:user_library/models/tmpUser.dart';
import 'package:user_library/screen/notification_screen/notification_screen.dart';

class NavigationBar extends StatefulWidget {
  final TmpUser user;
  NavigationBar({this.user});
  @override
  NavigationBarState createState() => NavigationBarState();
}

class NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15, bottom: 0),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 0.7,
          ),
        )),
        child: Row(children: [
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.fill,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: this.widget.user.image != ""
                    ? Image.network(
                        this.widget.user.image,
                        fit: BoxFit.cover,
                        width: 25,
                        height: 25,
                        errorBuilder: (BuildContext context, Object object,
                            StackTrace stackTrace) {
                          return Image.asset(
                            "images/2.png",
                            fit: BoxFit.cover,
                            width: 25,
                            height: 25,
                          );
                        },
                      )
                    : Image.asset(
                        "images/2.png",
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
              child: Text(
                this.widget.user.name,
              ),
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
                          Icons.notifications_none,
                          size: 24,
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationScreen(
                                    userId: int.parse(this.widget.user.id))))),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
