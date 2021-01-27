import 'package:flutter/material.dart';

class BookItemHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(),
        margin: EdgeInsets.only(bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 80,
                height: 120,
                margin: EdgeInsets.only(bottom: 13),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'images/book2.jpg',
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                  ),
                )),
            Container(
              width: MediaQuery.of(context).size.width - 140,
              height: 120,
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Book name',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 2, bottom: 5),
                      child: Text(
                        'Author',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Colors.black45),
                      )),
                  Container(
                      height: 45,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Authority is a 2014 novel by Jeff VanderMeer. It is the second in a series of three books called the Southern Reach Trilogy",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.2),
                        maxLines: 3,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
