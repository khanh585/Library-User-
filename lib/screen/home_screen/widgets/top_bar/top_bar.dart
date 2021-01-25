import 'package:flutter/material.dart';
import 'package:user_library/widgets/checkin/scanner.dart';

import 'navigation_item.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 15 * 2,
      height: 55,
      margin: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 15),
      padding: EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(1, 0),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scanner_Screen()),
              );
            },
            child: NavigationItem(
              icon: Icons.qr_code_outlined,
              text: 'QR-code',
            ),
          ),
          Container(
            height: 30,
            width: 1,
            color: Colors.grey[200],
          ),
          FlatButton(
            onPressed: () {
              print('Mark');
            },
            padding: EdgeInsets.all(0),
            child: NavigationItem(
              icon: Icons.bookmark_border_outlined,
              text: 'Mark',
            ),
          ),
          Container(
            height: 30,
            width: 1,
            color: Colors.grey[200],
          ),
          FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              print('Borrow');
            },
            child: NavigationItem(
              icon: Icons.library_books_outlined,
              text: 'Borrow',
            ),
          ),
        ],
      ),
    );
  }
}
