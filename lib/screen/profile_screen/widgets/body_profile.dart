import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:user_library/models/borrow_detail.dart';
import 'package:user_library/models/customer.dart';

class BodyProfile extends StatelessWidget {
  final Customer dto;
  const BodyProfile({
    Key key,
    this.dto,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 30),
      width: wi - 15 * 2,
      height: he,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: wi - 30,
                //padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                          color: Color.fromRGBO(75, 81, 136, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      this.dto.email,
                      style: TextStyle(
                          color: Color.fromRGBO(75, 81, 136, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
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
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: wi - 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Họ và tên",
                      style: TextStyle(
                          color: Color.fromRGBO(75, 81, 136, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      this.dto.name,
                      style: TextStyle(
                          color: Color.fromRGBO(75, 81, 136, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
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
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: wi - 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Địa chỉ",
                      style: TextStyle(
                          color: Color.fromRGBO(75, 81, 136, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      this.dto.address,
                      style: TextStyle(
                          color: Color.fromRGBO(75, 81, 136, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
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
              ),
              Container(
                width: wi - 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ngày tháng năm sinh",
                      style: TextStyle(
                          color: Color.fromRGBO(75, 81, 136, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      formatter.format(this.dto.doB).toString(),
                      style: TextStyle(
                          color: Color.fromRGBO(75, 81, 136, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
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
              ),
              Container(
                width: wi - 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Thời gian tạo",
                      style: TextStyle(
                          color: Color.fromRGBO(75, 81, 136, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      formatter.format(this.dto.createdTime).toString(),
                      style: TextStyle(
                          color: Color.fromRGBO(75, 81, 136, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
