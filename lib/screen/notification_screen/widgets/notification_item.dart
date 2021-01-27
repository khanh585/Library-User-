import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class NotificationItem extends StatefulWidget {
  final status;
  final content;
  final title;
  final time;

  const NotificationItem({
    this.status,
    this.content,
    this.title,
    this.time,
  });

  @override
  NotificationItemState createState() => NotificationItemState();
}

class NotificationItemState extends State<NotificationItem> {
  List<Color> colors = [Colors.red, Colors.green, Colors.amber];
  int pickColor = 0;
  setColor() {
    if (this.widget.status == 'success') {
      pickColor = 1;
    } else if (this.widget.status == 'warning') {
      pickColor = 0;
    } else if (this.widget.status == 'processing') {
      pickColor = 2;
    }
    setState(() {
      pickColor = pickColor;
    });
  }

  @override
  void initState() {
    super.initState();
    setColor();
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
    return Container(
        padding: EdgeInsets.only(top: 15, left: 5),
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
                      Wrap(
                        children: [
                          Container(
                            child: Text(
                              this.widget.title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Text("-"),
                          ),
                          Container(
                            child: Text(
                              this.widget.time,
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          this.widget.content,
                          style: TextStyle(color: Colors.black87, fontSize: 14),
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
        ));
  }
}
