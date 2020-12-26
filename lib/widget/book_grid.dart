import 'package:flutter/material.dart';
import 'package:user_library/widget/book_item.dart';

class ProductGrid extends StatefulWidget {
  final void Function() refresh;
  const ProductGrid({
    Key key,
    this.refresh,
  }) : super(key: key);
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.height - 20,
            child: false
                ? Center(
                    child: Text(
                      'List items is empty',
                      style: TextStyle(color: Colors.black45, fontSize: 30),
                    ),
                  )
                : GridView.count(
                    crossAxisCount: 3,
                    primary: false,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.7,
                    children: [
                      ProductItem(),
                      ProductItem(),
                      ProductItem(),
                      ProductItem(),
                      ProductItem(),
                      ProductItem(),
                      ProductItem(),
                      ProductItem(),
                      ProductItem(),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
