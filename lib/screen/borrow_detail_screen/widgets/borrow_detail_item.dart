import 'package:flutter/material.dart';
import 'package:user_library/models/borrow_detail.dart';

class BorrowDetailItem extends StatelessWidget {
  final BorrowDetail item;
  BorrowDetailItem({
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                blurRadius: 6,
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
                        Icons.watch_later_outlined,
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
                      Expanded(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.menu_book_rounded,
                        color: Colors.black87,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
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
