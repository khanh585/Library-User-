import 'package:flutter/material.dart';
import 'package:user_library/screen/book_detail_screen/book_detail_screen.dart';

class BookItemSuggestion extends StatelessWidget {
  final String image;
  final String author;
  final String name;

  BookItemSuggestion({
    this.image,
    this.author,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => BookDetail_Screen()),
        // );
      },
      child: Container(
        margin: EdgeInsets.only(right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: 120,
                height: 180,
                margin: EdgeInsets.only(bottom: 13),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: Offset(5, 8), // changes position of shadow
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
            Text(
              'Book Name',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  'Author',
                  style: TextStyle(
                      color: Colors.black12.withOpacity(0.4),
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
