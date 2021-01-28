import 'package:flutter/material.dart';
import 'package:user_library/models/book.dart';

class BookItem extends StatefulWidget {
  final Book book;
  final bool isTick;
  const BookItem({this.book, this.isTick});

  @override
  _BookItemState createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.widget.book.name),
      subtitle: Text('${this.widget.book.author}'),
      trailing: Checkbox(
        onChanged: null,
        activeColor: Theme.of(context).primaryColor,
        value: this.widget.isTick,
      ),
    );
  }
}
