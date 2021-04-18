import 'package:flutter/material.dart';
import 'package:user_library/screen/notification_screen/notification_bloc.dart';
import 'package:user_library/screen/notification_screen/notification_event.dart';
import 'package:user_library/screen/notification_screen/notification_state.dart';
import 'package:user_library/screen/notification_screen/widgets/notification_list.dart';

class NotificationScreen extends StatefulWidget {
  final int userId;
  const NotificationScreen({Key key, this.userId}) : super(key: key);

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  final txtSearch = TextEditingController();

  final notification_bloc = NotificationBloc();

  @override
  void initState() {
    super.initState();
    notification_bloc.eventController.sink
        .add(FetchNotificationEvent(this.widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Notification",
            style: TextStyle(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
        body: StreamBuilder<NotificationState>(
            stream: notification_bloc.stateController.stream,
            initialData: notification_bloc.state,
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text("Error");
              if (snapshot.data.notification != null) {
                return Container(
                    width: MediaQuery.of(context).size.width - 10,
                    height: MediaQuery.of(context).size.height - 110,
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    margin: EdgeInsets.only(top: 10, left: 8, right: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            blurRadius: 5,
                          )
                        ],
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                          bottom: Radius.circular(20),
                        )),
                    child: NotificationList(
                      data: snapshot.data.notification,
                    ));
              }
            }));
  }
}
