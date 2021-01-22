import 'package:flutter/cupertino.dart';
import 'package:user_library/models/category.dart';

import 'category_tab_button.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({
    this.cats,
    this.searchByCategory,
  });
  final List<Category> cats;
  final Function searchByCategory;

  @override
  _CategoryBarState createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  var managerCats = {};
  void covertListCats() {
    this.widget.cats.forEach((element) {
      if (element.name.contains('*')) {
        managerCats[element.id] = true;
        element.name = element.name.split('*')[0];
      } else {
        managerCats[element.id] = false;
      }
    });
  }

  @override
  void initState() {
    covertListCats();
    super.initState();
  }

  void checkCats(int id) {
    setState(() {
      managerCats.forEach((key, value) {
        managerCats[key] = false;
      });
    });
    setState(() {
      managerCats[id] = true;
    });
    this.widget.searchByCategory(id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        for (Category cat in this.widget.cats)
          CategoryTabButton(
            text: cat.name,
            id: cat.id,
            isFocus: managerCats[cat.id],
            onForcus: checkCats,
          )
      ],
    ));
  }
}
