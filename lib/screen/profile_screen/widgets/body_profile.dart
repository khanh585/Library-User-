import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:user_library/models/borrow_detail.dart';
import 'package:user_library/models/tmpUser.dart';
import 'package:user_library/screen/borrow_detail_screen/borrow_detail_screen.dart';
import 'package:user_library/screen/profile_screen/widgets/profile_item.dart';
import 'package:user_library/widgets/animation/fade_side_up.dart';

class BodyProfile extends StatelessWidget {
  final TmpUser tmpUser;
  final Function logout;
  BodyProfile({
    Key key,
    this.tmpUser,
    this.logout,
  });
  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');

    return Container(
      width: MediaQuery.of(context).size.width - 6,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: 20, left: 25, right: 20),
      margin: EdgeInsets.only(top: 5, left: 3, right: 3),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(1, 2),
            )
          ],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
            bottom: Radius.circular(35),
          )),
      child: Column(
        children: [
          FadeSideUp(
              2,
              ProfileItem(
                title: "Email",
                infor: this.tmpUser.email,
                color: Colors.black87,
              )),
          FadeSideUp(
              2,
              ProfileItem(
                title: "Name",
                infor: this.tmpUser.name,
                color: Colors.black87,
              )),
          FadeSideUp(
            2,
            ProfileItem(
              title: "Address",
              infor: this.tmpUser.address,
              color: Colors.black87,
            ),
          ),
          FadeSideUp(
            2,
            ProfileItem(
              title: "Birthdate",
              infor: this.tmpUser.doB.substring(0, 10),
              color: Colors.black87,
            ),
          ),
          FadeSideUp(
            2,
            ProfileItem(
              title: "Created Time",
              infor: this.tmpUser.createdTime.substring(0, 10),
              color: Colors.black87,
            ),
          ),
          this.tmpUser.roleId == 2
              ? FadeSideUp(
                  2,
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BorrowDetailScreen(
                              customer: this.tmpUser.toCustomer(),
                              customerId: int.parse(this.tmpUser.id)),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 8,
                                  child: Text(
                                    "History borrow",
                                    style: TextStyle(
                                        color: Colors.teal[800],
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  )),
                              Expanded(
                                flex: 2,
                                child: Icon(
                                  Icons.history_edu_outlined,
                                  color: Colors.teal[800],
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 0.2,
                        )
                      ],
                    ),
                  ),
                )
              : Container(),
          FadeSideUp(
            2,
            GestureDetector(
              onTap: () {
                this.logout();
              },
              child: Column(
                children: [
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
                  Divider(
                    color: Colors.black,
                    thickness: 0.2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
