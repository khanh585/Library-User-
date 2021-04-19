import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:user_library/models/tmpUser.dart';

class HeaderProfile extends StatelessWidget {
  final TmpUser tmpUser;
  HeaderProfile({
    this.tmpUser,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              margin: EdgeInsets.only(bottom: 15),
              child: CircleAvatar(
                radius: 90.0,
                backgroundImage: NetworkImage(
                  "${tmpUser.image}",
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Text(
                    tmpUser.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(tmpUser.phone,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
