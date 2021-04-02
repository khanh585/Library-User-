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
      child: Column(
        children: [
          FlatButton(
            onPressed: () => widget.onForcus(this.widget.id),
            child: Text(
              widget.text,
              style: TextStyle(
                  color: widget.isFocus ? Colors.black54 : Colors.black38,
                  fontSize: widget.isFocus ? 16 : 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 45,
            height: widget.isFocus ? 5 : 0,
            decoration: BoxDecoration(
              color: Colors.deepOrange[300],
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10), bottom: Radius.circular(10)),
            ),
          )
        ],
      ),
    );
  }
}
