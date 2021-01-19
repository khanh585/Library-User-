import 'package:flutter/material.dart';

import 'midle_bar_item.dart';

class MidleBar extends StatefulWidget {
  final Function callback;
  const MidleBar({
    this.callback,
  });

  @override
  _MidleBarState createState() => _MidleBarState();
}

class _MidleBarState extends State<MidleBar> {
  int flag;
  @override
  void initState() {
    // TODO: implement initState
    flag = 1;
    super.initState();
  }

  void pickType(int i) {
    setState(() {
      flag = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MidleBarItem(
          isFocus: flag == 1,
          text: 'Popular',
          index: 1,
          onPick: pickType,
        ),
        MidleBarItem(
          isFocus: flag == 2,
          text: 'The Latest',
          index: 2,
          onPick: pickType,
        ),
        MidleBarItem(
          isFocus: flag == 3,
          text: 'Comming Soon',
          index: 3,
          onPick: pickType,
        ),
      ],
    ));
  }
}
