import 'package:flutter/material.dart';
import 'package:user_library/screen/notification_screen/widgets/notification_list.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen();

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 25, right: 25, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Notification",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(
                          Icons.filter_alt_outlined,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                )),
            Container(
                width: MediaQuery.of(context).size.width - 100,
                padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(-1, -5),
                      )
                    ],
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(35),
                    )),
                child: NotificationList(
                  data: [],
                )),
          ],
        ),
      ),
    );
  }
}
