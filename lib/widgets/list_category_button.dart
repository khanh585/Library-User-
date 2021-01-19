import 'package:flutter/material.dart';
import 'package:user_library/dto/CategoryDTO.dart';

import 'category_of_book_button.dart';

class ListView_CategoryOfBook extends StatefulWidget {
  const ListView_CategoryOfBook({
    Key key,
    this.categoies,
  }) : super(key: key);
  final List categoies;

  @override
  _ListView_CategoryOfBookState createState() =>
      _ListView_CategoryOfBookState();
}

class _ListView_CategoryOfBookState extends State<ListView_CategoryOfBook> {
  List listColor = [
    Colors.amber,
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.purple,
    Colors.teal
  ];

  MaterialColor pickColor(int index) {
    return listColor[index % 6];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        for (CategoryDTO cat in this.widget.categoies)
          CategoryOfBook(
            text: cat.name,
            catID: cat.id,
            color: pickColor(cat.id),
          ),
      ],
    );
  }
}
