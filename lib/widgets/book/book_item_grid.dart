import 'package:flutter/material.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/screen/book_detail_screen_2/book_detail_screen.dart';

class BookItemGrid extends StatelessWidget {
  final Book book;
  BookItemGrid({this.book});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BookDetailScreen(
                  book: book,
                )),
      ),
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 150,
            child: this.book.image != null && this.book.image.isNotEmpty
                ? Image.network(
                    this.book.image[0],
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  )
                : Image.asset("images/notebook.png", fit: BoxFit.fill),
          ),
          Container(
            child: Text(this.book.name)
          )
        ],
      ),
    );
  }
}
