import 'package:flutter/material.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/screen/book_detail_screen/book_detail_screen.dart';

class BookItemSuggestion extends StatefulWidget {
  final Book book;

  const BookItemSuggestion({Key key, this.book}) : super(key: key);
  @override
  State<StatefulWidget> createState() => BookItemSuggestionState();
}

class BookItemSuggestionState extends State<BookItemSuggestion> {
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
        child: Row(
          children: [
              Container(
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
                              offset:
                                  Offset(5, 8), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            this.widget.book.image[0],
                            fit: BoxFit.cover,
                            alignment: Alignment.centerLeft,
                          ),
                        )),
                    Text(
                      this.widget.book.name,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          this.widget.book.author,
                          style: TextStyle(
                              color: Colors.black12.withOpacity(0.4),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              )
          ],
        ));
  }
}
