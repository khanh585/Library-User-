import 'package:flutter/material.dart';

class MidleBarItem extends StatefulWidget {
  final String text;
  final int index;
  final Function onPick;
  bool isFocus;

  MidleBarItem({this.text, this.isFocus, this.index, this.onPick});

  @override
  _MidleBarItemState createState() => _MidleBarItemState();
}

class _MidleBarItemState extends State<MidleBarItem> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        this.widget.onPick(this.widget.index);
        setState(() {
          widget.isFocus = widget.isFocus ? false : true;
        });
      },
      padding: EdgeInsets.all(3),
      child: Text(
        widget.text,
        style: TextStyle(
            color:
                widget.isFocus ? Colors.black : Colors.black.withOpacity(0.3),
            fontSize: widget.isFocus ? 25 : 18,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
