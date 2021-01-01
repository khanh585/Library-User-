import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryTabButton extends StatefulWidget {
  final String text;
  final int id;

  final bool isFocus;
  final Function(int) onForcus;
  const CategoryTabButton({this.text, this.isFocus, this.onForcus, this.id});

  @override
  _CategoryTabButtonState createState() => _CategoryTabButtonState();
}

class _CategoryTabButtonState extends State<CategoryTabButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: [
          FlatButton(
            padding: EdgeInsets.only(top: 10),
            onPressed: () => widget.onForcus(this.widget.id),
            child: Text(
              widget.text,
              style: TextStyle(
                  color: widget.isFocus ? Colors.black87 : Colors.black45,
                  fontSize: widget.isFocus ? 22 : 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 45,
            height: widget.isFocus ? 5 : 0,
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
