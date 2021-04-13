import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_library/models/notification.dart';

import 'notification_item.dart';

class NotificationList extends StatelessWidget {
  final List<UserNotification> data;
  const NotificationList({this.data});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (UserNotification noti in this.data)
          NotificationItem(
            time: noti.time.substring(0, 10),
            message: noti.message,
            image: noti.image,
          )
      ],
    );
  }
}
