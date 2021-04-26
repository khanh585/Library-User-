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
              color: this.color,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            this.infor,
            style: TextStyle(
                color: this.color,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                height: 1.2),
          ),
          SizedBox(
            height: 2,
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
