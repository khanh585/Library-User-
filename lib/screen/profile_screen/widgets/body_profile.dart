import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:user_library/models/borrow_detail.dart';
import 'package:user_library/models/tmpUser.dart';
import 'package:user_library/screen/borrow_detail_screen/borrow_detail_screen.dart';
import 'package:user_library/screen/profile_screen/widgets/profile_item.dart';
import 'package:user_library/widgets/animation/fade_side_in.dart';

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
      child: ListView(
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
                infor: this.tmpUser.email,
                color: Colors.black,
              )),
          FadeSideIn(
              2,
              ProfileItem(
                title: "Name",
                infor: this.tmpUser.address,
                color: Colors.black,
              )),
          FadeSideIn(
            2,
            ProfileItem(
              title: "Address",
              infor: this.tmpUser.name,
              color: Colors.black,
            ),
          ),
          FadeSideIn(
            2,
            ProfileItem(
              title: "Birthdate",
              infor: this.tmpUser.doB,
              color: Colors.black,
            ),
          ),
          FadeSideIn(
            2,
            ProfileItem(
              title: "Created Time",
              infor: this.tmpUser.createdTime,
              color: Colors.black,
            ),
          ),
          this.tmpUser.roleId == 2
              ? FadeSideIn(
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
                    child: Container(
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
                                    color: Colors.cyanAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              )),
                          Expanded(
                            flex: 2,
                            child: Icon(
                              Icons.history_edu_outlined,
                              color: Colors.cyanAccent,
                              size: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
          this.tmpUser.roleId == 2
              ? Divider(
                  color: Colors.black,
                  thickness: 0.2,
                )
              : Container(),
          FadeSideIn(
            2,
            GestureDetector(
              onTap: () {
                this.logout();
              },
              child: Container(
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
