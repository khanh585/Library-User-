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
        margin: EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 180,
              margin: EdgeInsets.only(bottom: 10),
              child: Image.asset(
                'images/book.jpg',
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  'Author',
                  style: TextStyle(
                      color: Colors.black12.withOpacity(0.4),
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )),
            Text(
              'Book Name',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
