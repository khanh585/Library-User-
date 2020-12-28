import 'package:flutter/cupertino.dart';
import 'package:user_library/widget/category_tab_button.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 7,
        height: 60,
        margin: EdgeInsets.only(left: 5, right: 2, top: 1),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CategoryTabButton('Design', true),
            CategoryTabButton('Achitecture', false),
            CategoryTabButton('Design', false),
            CategoryTabButton('Design', false),
          ],
        ));
  }
}