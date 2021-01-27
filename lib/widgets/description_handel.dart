import 'dart:ui';

import 'package:flutter/material.dart';

class DescriptionHandel extends StatefulWidget {
  final String text;

  DescriptionHandel({@required this.text});

  @override
  DescriptionHandelState createState() => new DescriptionHandelState();
}

class DescriptionHandelState extends State<DescriptionHandel> {
  String firstHalf;
  String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 400) {
      firstHalf = widget.text.substring(0, 400);
      secondHalf = widget.text.substring(400, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? new Text(firstHalf)
          : new Column(
              children: <Widget>[
                new Text(
                  flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                  style: TextStyle(height: 1.8, fontSize: 14),
                ),
                new InkWell(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text(
                        flag ? "Show more" : "Show less",
                        style: new TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
