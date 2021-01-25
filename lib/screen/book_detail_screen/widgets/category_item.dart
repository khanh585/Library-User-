import 'package:flutter/material.dart';
import 'package:user_library/screen/search_screen/search_screen.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({this.text, this.catID});

  final String text;
  final int catID;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.only(top: 2, bottom: 2),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchScreen(
                        catID: catID,
                      )));
        },
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(6),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
