import 'package:flutter/material.dart';

class CheckItem extends StatefulWidget {
  const CheckItem({
    Key key,
  }) : super(key: key);

  @override
  _CheckItemState createState() => _CheckItemState();
}

class _CheckItemState extends State<CheckItem> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(50), blurRadius: 5.0),
          ]),
      child: CheckboxListTile(
        value: _checked,
        onChanged: (value) {
          setState(() {
            _checked = value;
          });
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.amber,
              height: 95,
              child: Image.asset(
                "images/chat.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'ID: S123410',
                  style: const TextStyle(fontSize: 17, color: Colors.grey),
                ),
                Container(
                  width: 160,
                  child: Text(
                    'Khanh',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
