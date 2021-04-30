import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_library/models/notification.dart';

import 'notify_popup.dart';

class NotificationItem extends StatefulWidget {
  final UserNotification noti;

  const NotificationItem({this.noti});

  @override
  NotificationItemState createState() => NotificationItemState();
}

class NotificationItemState extends State<NotificationItem> {
  List<Color> colors = [Colors.red, Colors.green, Colors.amber];
  int pickColor = 0;
  // setColor() {
  //   if (this.widget.status == 'success') {
  //     pickColor = 1;
  //   } else if (this.widget.status == 'warning') {
  //     pickColor = 0;
  //   } else if (this.widget.status == 'processing') {
  //     pickColor = 2;
  //   }
  //   setState(() {
  //     pickColor = pickColor;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    //setColor();
  }

  bool isDetail = false;
  void onDetail() {
    isDetail = !isDetail;
    setState(() {
      isDetail = isDetail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => NotifyPopup(
            context: context,
            noti: this.widget.noti,
          ),
        );
      },
      child: Container(
          padding: EdgeInsets.only(top: 15, left: 20, right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          this.widget.noti.createdDate,
                          style: TextStyle(color: Colors.black45, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Remind to return the book",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            "The book ${this.widget.noti.message} need to return!",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.warning,
                        color: Colors.yellow[600],
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Divider(
                  color: Colors.black54,
                ),
              )
            ],
          )),
    );
  }
}
