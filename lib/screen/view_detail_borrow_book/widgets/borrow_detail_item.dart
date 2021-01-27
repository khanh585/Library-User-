import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:user_library/models/borrow_detail.dart';

class BorrowDetailItem extends StatelessWidget {
  final BorrowDetail dto;
  const BorrowDetailItem({
    Key key,
    this.dto,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      width: wi - 15 * 2,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Image.network(
              this.dto.image,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            width: wi - 30 * 2 - 60,
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  this.dto.bookName,
                  style: TextStyle(
                      color: Color.fromRGBO(75, 81, 136, 1),
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(this.dto.author,
                        style: TextStyle(
                            color: Color.fromRGBO(83, 80, 170, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      width: 30,
                    ),
                    Text(formatter.format(this.dto.startTime).toString(),
                        style: TextStyle(
                            color: Color.fromRGBO(83, 80, 170, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
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
