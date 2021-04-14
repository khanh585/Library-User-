import 'package:flutter/material.dart';
import 'package:user_library/models/return_detail.dart';

class ReturnDetailItem extends StatelessWidget {
  final ReturnDetail item;
  ReturnDetailItem({
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 3,
                offset: Offset(1, 4),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // content
            Container(
              padding: const EdgeInsets.only(left: 15),
              width: MediaQuery.of(context).size.width * 3 / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.autorenew,
                        color: Colors.red,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          item.returnTime.toString().substring(0, 10),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                        ),
                        child: Icon(
                          Icons.money_rounded,
                          color: Color(0xffaeea00),
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          item.fee.toString() + '\$',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.menu_book_rounded,
                        color: Colors.black87,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          item.bookName.trim(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87.withOpacity(.95),
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        color: Colors.black54,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          item.author.trim(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // image
            Container(
                padding: EdgeInsets.only(right: 15),
                child: Image.network(
                  item.image,
                  fit: BoxFit.fitHeight,
                )),
          ],
        ));
  }
}
