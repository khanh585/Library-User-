import 'package:flutter/material.dart';
import 'package:user_library/constants.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/screen/home_detail_screen/widgets/book_item_new.dart';
import 'package:user_library/widgets/book/book_item_suggestion.dart';

class NewBookSection extends StatefulWidget {
  final List<Book> listNewestBook;

  const NewBookSection({Key key, this.listNewestBook}) : super(key: key);
  @override
  State<StatefulWidget> createState() => NewBookSectionState();
}

class NewBookSectionState extends State<NewBookSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 25, right: 25, left: 25),    
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            for (Book book in this.widget.listNewestBook)
              BookItemNew(book: book)
          ],
        ));
  }
}
