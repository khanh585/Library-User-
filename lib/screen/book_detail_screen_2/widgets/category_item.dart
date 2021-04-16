import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String cat;
  const CategoryItem({
    this.cat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 5, left: 5),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 0.5,
                offset: Offset(0, 0),
              ),
            ]),
        child: Text(
          cat,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ));
  }
}
