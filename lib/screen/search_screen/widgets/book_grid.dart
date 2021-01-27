import 'dart:math';

import 'package:flutter/material.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/widget/animation/fade_side_up.dart';

import 'package:user_library/widgets/book/book_item_grid.dart';

class BookGrid extends StatefulWidget {
  final List<Book> listBooks;

  const BookGrid({
    this.listBooks,
  });

  @override
  BookGridState createState() => BookGridState();
}

class BookGridState extends State<BookGrid> {
  bool isEmpty = true;
  @override
  void initState() {
    isEmpty = this.widget.listBooks.isEmpty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isEmpty
          ? Center(
              child: Text(
                'Cannot find any books !',
                style: TextStyle(color: Colors.black45, fontSize: 16),
              ),
            )
          : ListView(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 6),
                  width: MediaQuery.of(context).size.width - 30,
                  height: MediaQuery.of(context).size.height - 202,
                  child: GridView.count(
                    crossAxisCount: 3,
                    primary: false,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                    children: renderBookItemm(),
                  ),
                ),
              ],
            ),
    );
  }

  List<Widget> renderBookItemm() {
    List<Widget> tmp = new List<Widget>();
    Random random = new Random();
    for (Book book in this.widget.listBooks) {
      double randomNumber = random.nextDouble() * 3;
      tmp.add(FadeSideUp(
        randomNumber,
        BookItemGrid(
          book: book,
        ),
      ));
    }
    return tmp;
  }
}
