import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryTabButton extends StatelessWidget {
  final String text;
  final bool isFocus;
  const CategoryTabButton(
    this.text,
    this.isFocus,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: [
          FlatButton(
            padding: EdgeInsets.only(top: 10),
            onPressed: null,
            child: Text(
              text,
              style: TextStyle(
                  color: isFocus ? Colors.black87 : Colors.black45,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0),
            width: 45,
            height: isFocus ? 5 : 0,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10), bottom: Radius.circular(10)),
            ),
          )
        ],
      ),
    );
  }
}
