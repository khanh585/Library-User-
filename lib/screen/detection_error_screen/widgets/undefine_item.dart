import 'package:flutter/material.dart';
import 'package:user_library/models/detection_error.dart';
import 'package:user_library/models/undefined_error.dart';

class UndefineItem extends StatefulWidget {
  UndefinedError item;
  Size size;

  UndefineItem({this.item, this.size});

  @override
  _UndefineItemState createState() => _UndefineItemState();
}

class _UndefineItemState extends State<UndefineItem> {
  bool v = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        border: Border.all(width: 2, color: Colors.black.withOpacity(0.7)),
      ),
      child: CheckboxListTile(
        contentPadding: EdgeInsets.only(left: 0),
        value: this.v,
        controlAffinity: ListTileControlAffinity.leading,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //hinh anh
            Container(
                height: 80,
                width: 60,
                child: Image.asset(
                  'images/book.png',
                  fit: BoxFit.fitHeight,
                )),
            //content
            Container(
              width: this.widget.size.width / 10 * 6,
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.message_outlined,
                        color: Colors.orange[900],
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: this.widget.size.width / 2 + 5,
                        child: Text(
                          this.widget.item.errorMessage,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        onChanged: (value) {
          print(value);
          setState(() {
            v = !v;
          });
        },
      ),
    );
  }
}
