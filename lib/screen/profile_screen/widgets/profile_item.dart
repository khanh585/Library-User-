import 'dart:ui';

import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String infor;
  final Color color;
  ProfileItem({this.title, this.infor, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.title,
            style: TextStyle(
                color: this.color, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            this.infor,
            style: TextStyle(
              color: this.color,
              fontSize: 13,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            color: Colors.black,
            thickness: 0.2,
          ),
        ],
      ),
    );
  }
}
