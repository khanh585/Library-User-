import 'package:flutter/material.dart';
import 'package:user_library/screen/book_detail_screen.dart';

class ProductItem extends StatefulWidget {
  const ProductItem();
  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => BookDetail_Screen()));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/notebook.png"), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
