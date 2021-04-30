import 'package:flutter/material.dart';
import 'package:user_library/models/notification.dart';

class NotifyPopup extends StatelessWidget {
  const NotifyPopup({
    @required this.context,
    this.noti,
  });

  final BuildContext context;
  final UserNotification noti;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 30,
      title: Text(
        "Remind to return the book",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Close",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.orange[900],
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        )
      ],
      content: SizedBox(
        height: 260,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                child: Image.network(
                  this.noti.image,
                  fit: BoxFit.fitHeight,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace stackTrace) {
                    return Image.asset('images/img_newbook2.png');
                  },
                ),
                height: 140,
              ),
            ),
            Divider(
              height: 20,
              thickness: 2,
            ),
            Row(
              children: [
                Text(
                  "Return day: ",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  this.noti.returnDate.substring(0, 10),
                  style: TextStyle(color: Colors.black45, fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              child: SingleChildScrollView(
                child: Text(
                  "You have borrowed a book:\n\" ${this.noti.bookGroupName} \".\n\nPlease don't forget to return the book and share your feeling about the book in feedback! ",
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
