import 'package:flutter/material.dart';
import 'package:user_library/models/detection_error.dart';
import 'package:user_library/models/undefined_error.dart';

import '../../../constants.dart';

class ErrorItem extends StatefulWidget {
  final DetectionError item;
  final UndefinedError und;
  final Size size;
  final Function rejectedError;
  final Function confirmError;

  ErrorItem(
      {this.item, this.size, this.und, this.rejectedError, this.confirmError});

  @override
  _ErrorItemState createState() => _ErrorItemState();
}

class _ErrorItemState extends State<ErrorItem> {
  bool _switch = true;
  bool _showButton = true;
  String url = "";
  int count = 0;

  bool _checkShowButton() {
    if (this.widget.item != null) {
      return !(this.widget.item.isConfirm || this.widget.item.isRejected);
    } else {
      return !(this.widget.und.isConfirm || this.widget.und.isRejected);
    }
  }

  Widget _refreshImage() {
    if (count >= 0) {
      this.url = this.widget.item.image[count];
      this.count--;
    }
    return Image.network(this.url);
  }

  @override
  void initState() {
    // TODO: implement initState
    _showButton = _checkShowButton();
    setState(() {
      count = this.widget.item.image.length - 1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      padding: EdgeInsets.only(top: 10, bottom: 3, left: 10, right: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black54.withOpacity(0.2),
            blurRadius: 3,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        width: this.widget.size.width - 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedCrossFade(
                crossFadeState: _switch
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: GestureDetector(
                  onTap: () {
                    setState(() {
                      _switch = !_switch;
                    });
                  },
                  child: Wrap(
                    children: [
                      this.widget.item != null
                          ? Container(
                              margin: EdgeInsets.symmetric(vertical: 3),
                              child: Row(
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
                              ),
                            )
                          : Container(),
                      this.widget.item != null
                          ? Container(
                              margin: EdgeInsets.symmetric(vertical: 3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.menu_book_outlined,
                                    color: Colors.orange[900],
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      this.widget.item.bookName,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 3),
                        child: Row(
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
                            Expanded(
                              child: Text(
                                this.widget.item != null
                                    ? this.widget.item.errorMessage
                                    : this.widget.und.errorMessage,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                secondChild: GestureDetector(
                  onTap: () {
                    setState(() {
                      _switch = !_switch;
                    });
                  },
                  child: Container(
                    height: 130,
                    child: Center(
                      child: this.widget.item != null
                          ? this.widget.item.image != null
                              ? this.widget.item.image.length != 0
                                  ? Image.network(
                                      this.widget.item.image[count],
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
                  ),
                ),
                duration: const Duration(milliseconds: 420)),
            Divider(
              thickness: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
            // button
            _showButton
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlineButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () => {
                          this.widget.confirmError(
                              decError: this.widget.item,
                              undError: this.widget.und)
                        },
                        child: Text(
                          'Confirm',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      SizedBox(
                        width: 118,
                      ),
                      OutlineButton(
                        onPressed: () => {
                          this.widget.rejectedError(
                              decError: this.widget.item,
                              undError: this.widget.und)
                        },
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
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
