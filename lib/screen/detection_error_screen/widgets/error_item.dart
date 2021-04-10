import 'package:flutter/material.dart';
import 'package:user_library/models/detection_error.dart';
import 'package:user_library/models/undefined_error.dart';

import '../../../constants.dart';

class ErrorItem extends StatefulWidget {
  DetectionError item;
  UndefinedError und;

  Size size;

  ErrorItem({this.item, this.size, this.und});

  @override
  _ErrorItemState createState() => _ErrorItemState();
}

class _ErrorItemState extends State<ErrorItem> {
  bool v = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        border: Border.all(width: 2, color: Colors.black.withOpacity(0.7)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //hinh anh
          Container(
            height: 80,
            width: 80,
            child: this.widget.item != null
                ? this.widget.item.image != null
                    ? this.widget.item.image.length != 0
                        ? Image.network(
                            this.widget.item.image[0],
                            fit: BoxFit.fitHeight,
                          )
                        : Image.asset(
                            'images/book.png',
                            fit: BoxFit.fitHeight,
                          )
                    : Image.asset(
                        'images/book.png',
                        fit: BoxFit.fitHeight,
                      )
                : Image.asset(
                    'images/book.png',
                    fit: BoxFit.fitHeight,
                  ),
          ),
          //content
          Container(
            width: this.widget.size.width / 10 * 6,
            margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                this.widget.item != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.qr_code_outlined,
                            color: Colors.orange[900],
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            this.widget.item.bookBarcode,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    : Container(),
                this.widget.item != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.menu_book_outlined,
                            color: Colors.orange[900],
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            this.widget.item.bookName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    : Container(),
                this.widget.item != null
                    ? Row(
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
                            width: this.widget.size.width / 2,
                            child: Text(
                              this.widget.item.errorMessage,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15),
                            ),
                          ),
                        ],
                      )
                    : Row(
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
                            width: this.widget.size.width / 2,
                            child: Text(
                              this.widget.und.errorMessage,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlineButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () => {},
                      child: Text(
                        'Confirm',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    OutlineButton(
                      onPressed: null,
                      child: Text(
                        'Reject',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF9966).withOpacity(0.95)),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
