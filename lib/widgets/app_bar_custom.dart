import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    Key key,
    this.title,
    this.back,
    this.background,
  }) : super(key: key);
  final Widget title;
  final Widget back;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background == null ? Colors.white.withOpacity(0) : this.background,
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 55,
              alignment: Alignment.center,
              child: this.back,
            ),
          ),
          Container(child: title),
          Container(
            width: 55,
          ),
        ],
      ),
    );
  }
}
