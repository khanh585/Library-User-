import 'package:flutter/material.dart';
import 'package:user_library/screen/search_book_screen.dart';

class CategoryOfBook extends StatelessWidget {
  const CategoryOfBook({Key key, this.text, this.color, this.catID})
      : super(key: key);
  final String text;
  final int catID;
  final MaterialColor color;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.only(top: 2, bottom: 2),
      decoration: BoxDecoration(
          color: color.withOpacity(0.4),
          borderRadius: BorderRadius.circular(6)),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchBook_Screen(
                        catID: catID,
                      )));
        },
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(6),
        ),
        child: Text(
          text,
          style: TextStyle(color: color[900], fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
