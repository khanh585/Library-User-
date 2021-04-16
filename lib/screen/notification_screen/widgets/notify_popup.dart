import 'package:flutter/material.dart';

class NotifyPopup extends StatelessWidget {
  const NotifyPopup({
    @required this.context,
    this.time,
    this.content,
  });

  final BuildContext context;
  final String time;
  final String content;

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
                child: Image.asset(
                  'images/img_newbook2.png',
                  fit: BoxFit.fitHeight,
                ),
                height: 140,
              ),
            ),
            Divider(
              height: 20,
              thickness: 2,
            ),
            Text(
              this.time,
              style: TextStyle(color: Colors.black45, fontSize: 14),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              child: SingleChildScrollView(
                child: Text(
                  this.content,
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
