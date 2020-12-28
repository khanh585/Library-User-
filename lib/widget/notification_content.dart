import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotifiContent extends StatelessWidget {
  const NotifiContent({
    Key key,
    this.color,
    this.content,
    this.title,
    this.time,
    this.from,
  }) : super(key: key);
  final color;
  final content;
  final title;
  final time;
  final from;
  @override
  Widget build(BuildContext context) {
    final wi = MediaQuery.of(context).size.width - 10 * 2;
    return Container(
        width: wi,
        padding: EdgeInsets.only(left: 3, top: 5, bottom: 5),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: color,
              width: 10.0,
            ),
            top: BorderSide(
              color: color,
              width: 1.0,
            ),
            bottom: BorderSide(
              color: color,
              width: 1.0,
            ),
            right: BorderSide(
              color: color,
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 5),
              width: wi - 92,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        from,
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                      Text(
                        time,
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(content,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              width: 70,
              height: 80,
              child: FlatButton(
                onPressed: () {
                  print('detail');
                },
                child: Icon(
                  Icons.near_me_outlined,
                  color: color,
                  size: 30,
                ),
              ),
            ),
          ],
        ));
  }
}
