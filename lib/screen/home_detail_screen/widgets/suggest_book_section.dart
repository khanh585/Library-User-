import 'package:flutter/material.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/screen/home_detail_screen/widgets/book_item_suggest.dart';

class SuggestBookSection extends StatefulWidget {
  final List<Book> listSuggestBook;

  const SuggestBookSection({Key key, this.listSuggestBook}) : super(key: key);
  @override
  State<StatefulWidget> createState() => SuggestBookSectionState();
}

class SuggestBookSectionState extends State<SuggestBookSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 35),
        height: 210,
        child: ListView(
          padding: EdgeInsets.only(left: 25, right: 6),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            for (Book book in this.widget.listSuggestBook)
              BookItemSuggest(book: book)
          ],
        ));
  }
}
