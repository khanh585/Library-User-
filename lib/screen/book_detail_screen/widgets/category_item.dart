import 'package:flutter/material.dart';
import 'package:user_library/screen/search_screen/search_screen.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({this.text, this.catID});

  final String text;
  final int catID;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      height: 25,
      padding: EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
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
          style: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
