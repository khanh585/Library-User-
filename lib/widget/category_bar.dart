import 'package:flutter/cupertino.dart';
import 'package:user_library/dto/categoryDTO.dart';
import 'package:user_library/widget/category_tab_button.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({
    Key key,
    this.cats,
  }) : super(key: key);
  final List<CategoryDTO> cats;

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
    managerCats.forEach((key, value) {
      print(key.toString() + value.toString());
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 7,
        height: 60,
        margin: EdgeInsets.only(left: 5, right: 0, top: 1),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            // CategoryTabButton('All', managerCats[0]),
            for (CategoryDTO cat in this.widget.cats)
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
