import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotifiType extends StatelessWidget {
  const NotifiType({
    Key key,
    this.color,
    this.text,
  }) : super(key: key);
  final color;
  final text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () {
          print(text);
        },
        padding: EdgeInsets.all(0),
        minWidth: 80,
        child: Text(
          text,
          style: TextStyle(color: color[600], fontSize: 16),
        ),
      ),
      height: 40,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 12, right: 15),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: color,
            width: 3.0,
          ),
          bottom: BorderSide(
            color: color,
            width: 1.0,
          ),
          left: BorderSide(
            color: color,
            width: 1.0,
          ),
          right: BorderSide(
            color: color,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}