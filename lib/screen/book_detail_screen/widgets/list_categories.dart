import 'package:flutter/material.dart';
import 'package:user_library/models/category.dart';

import 'category_item.dart';

class ListCategories extends StatefulWidget {
  final List<Category> categoies;

  const ListCategories({
    this.categoies,
  });
  @override
  ListCategoriesState createState() => ListCategoriesState();
}

class ListCategoriesState extends State<ListCategories> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        for (Category cat in this.widget.categoies)
          CategoryItem(
            text: cat.name,
            catID: cat.id,
          ),
      ],
    );
  }
}
