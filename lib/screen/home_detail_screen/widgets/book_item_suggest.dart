import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_library/constants.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/screen/book_detail_screen/book_detail_librarian_screen.dart';
import 'package:user_library/screen/book_detail_screen_2/book_detail_screen.dart';

class BookItemSuggest extends StatefulWidget {
  final Book book;

  const BookItemSuggest({Key key, this.book}) : super(key: key);
  @override
  State<StatefulWidget> createState() => BookItemSuggestState();
}

class BookItemSuggestState extends State<BookItemSuggest> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (this.widget.book.image.length == 0 || this.widget.book.image == null) {
      print("image ne ba:");
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  BookDetailLibrarianScreen(book: this.widget.book)),
        );
      },
      child: Container(
          margin: EdgeInsets.only(right: 19),
          height: 210,
          width: 153,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              this.widget.book.image[0],
              fit: BoxFit.fill,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: Image.asset(
                    "images/loading1.gif",
                    height: 550.0,
                    width: 750.0,
                  ),
                );
              },
            ),
          )),
    );
  }
}
