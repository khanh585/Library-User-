import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_library/widget/category_tab_button.dart';

class BagBar extends StatelessWidget {
  const BagBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          margin: const EdgeInsets.only(left: 35.0, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Bag',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 102, 1),
                    fontSize: 47,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'RobotoMono'),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Check your wish list',
                style: TextStyle(
                    color: Color.fromRGBO(160, 160, 160, 1),
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'RobotoMono'),
              ),
            ],
          )),
    );
  }
}
