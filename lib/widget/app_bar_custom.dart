import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    Key key,
    this.title,
  }) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      //
      width: MediaQuery.of(context).size.width,
      height: 70,
      padding: EdgeInsets.only(top: 20),
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
              child: Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
              ),
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
