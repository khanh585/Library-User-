import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:user_library/models/borrow_detail.dart';
import 'package:user_library/models/customer.dart';

class HeaderProfile extends StatelessWidget {
  final Customer dto;
  const HeaderProfile({
    Key key,
    this.dto,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
      width: wi - 15 * 2,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            child: CircleAvatar(
              radius: 80.0,
                backgroundImage:
                    NetworkImage("${this.dto.image}"),
                backgroundColor: Colors.transparent,
            ),
          ),
          Container(
            width: wi - 30 * 2 - 60,
            padding: EdgeInsets.only(top: 15,bottom: 20,left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  this.dto.name,
                  style: TextStyle(
                      color: Color.fromRGBO(75, 81, 136, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(this.dto.phone,
                        style: TextStyle(
                            color: Color.fromRGBO(83, 80, 170, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w400))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
