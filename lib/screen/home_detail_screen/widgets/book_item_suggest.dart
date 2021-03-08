import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_library/constants.dart';
import 'package:user_library/models/book.dart';
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
    return GestureDetector(
      onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookDetailScreen(book: this.widget.book)),
          );
        },
      child: Container(
        margin: EdgeInsets.only(right: 19),
        height: 210,
        width: 153,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kMainColor,
            image: DecorationImage(
              image: NetworkImage(this.widget.book.image[0]),
            )),
      ),
    );
  }
}
