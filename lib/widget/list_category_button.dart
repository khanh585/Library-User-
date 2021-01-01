import 'package:flutter/material.dart';
import 'package:user_library/widget/category_of_book_button.dart';

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

  MaterialColor pickColor(text) {
    int index = widget.categoies.indexOf(text);
    return listColor[index % 6];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        for (String cat in widget.categoies)
          CategoryOfBook(
            text: cat,
            catID: widget.categoies.indexOf(cat) + 1,
            color: pickColor(cat),
          ),
      ],
    );
  }
}
