import 'package:flutter/material.dart';
import 'package:user_library/dto/BookDTO.dart';

import 'book_item.dart';

class ProductGrid extends StatefulWidget {
  final List<BookDTO> listBooks;
  const ProductGrid({
    Key key,
    this.listBooks,
  }) : super(key: key);
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
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
                'List books is empty',
                style: TextStyle(color: Colors.black45, fontSize: 30),
              ),
            )
          : ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  width: MediaQuery.of(context).size.width - 30,
                  height: MediaQuery.of(context).size.height - 20,
                  child: GridView.count(
                    crossAxisCount: 3,
                    primary: false,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.7,
                    children: [
                      for (BookDTO book in this.widget.listBooks)
                        BookItem(
                          book: book,
                        ),
                      // ProductItem(),
                      // ProductItem(),
                      // ProductItem(),
                      // ProductItem(),
                      // ProductItem(),
                      // ProductItem(),
                      // ProductItem(),
                      // ProductItem(),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
