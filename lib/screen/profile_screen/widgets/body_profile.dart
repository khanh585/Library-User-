import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:user_library/models/customer.dart';
import 'package:user_library/screen/profile_screen/widgets/profile_item.dart';
import 'package:user_library/widgets/animation/fade_side_in.dart';

class BodyProfile extends StatelessWidget {
  final Customer customer;
  BodyProfile({
    Key key,
    this.customer,
  });
  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 320,
      padding: EdgeInsets.only(top: 15, left: 25, right: 20),
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(-1, -5),
            )
          ],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          )),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const Text('', textAlign: TextAlign.center),
          ),
          FadeSideIn(
              2,
              ProfileItem(
                title: "Email",
                infor: this.customer.email,
                color: Colors.black,
              )),
          FadeSideIn(
              2,
              ProfileItem(
                title: "Name",
                infor: this.customer.address,
                color: Colors.black,
              )),
          FadeSideIn(
            2,
            ProfileItem(
              title: "Address",
              infor: this.customer.name,
              color: Colors.black,
            ),
          ),
          FadeSideIn(
            2,
            ProfileItem(
              title: "Birthdate",
              infor: formatter.format(this.customer.doB).toString(),
              color: Colors.black,
            ),
          ),
          FadeSideIn(
            2,
            ProfileItem(
              title: "Created Time",
              infor: formatter.format(this.customer.createdTime).toString(),
              color: Colors.black,
            ),
          ),
          FadeSideIn(
            2,
            Container(
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 8,
                      child: Text(
                        "Log out",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )),
                  Expanded(
                    flex: 2,
                    child: Icon(
                      Icons.logout,
                      color: Colors.red,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
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