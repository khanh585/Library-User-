import 'package:flutter/material.dart';
import 'package:user_library/dto/BookDTO.dart';
import 'package:user_library/screen/book_detail_screen.dart';

class BookItem extends StatefulWidget {
  final BookDTO book;
  const BookItem({
    Key key,
    this.book,
  }) : super(key: key);
  @override
  _BookItemState createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BookDetail_Screen(
                  book: this.widget.book,
                )));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/notebook.png"), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
