import 'package:flutter/material.dart';
import 'package:user_library/models/borrow_detail.dart';
import 'package:user_library/models/customer.dart';
import 'package:user_library/models/return_detail.dart';
import 'package:user_library/screen/borrow_detail_screen/widgets/progress_line_indicator.dart';
import 'package:user_library/screen/borrow_detail_screen/widgets/return_detail_item.dart';

import 'borrow_detail_item.dart';

class BorrowDetailCard extends StatelessWidget {
  final List<BorrowDetail> borrowDetail;
  final List<ReturnDetail> returnDetail;
  final Customer customer;

  const BorrowDetailCard(
      {Key key, this.borrowDetail, this.returnDetail, this.customer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      this.borrowDetail != null
                          ? 'Current borrow books: ' +
                              this.borrowDetail.length.toString()
                          : 'Current borrow books: 0',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 180,
                child: borrowDetail != null
                    ? borrowDetail.length > 0
                        ? PageView.builder(
                            itemBuilder: (_, index) {
                              int endTime = borrowDetail[index]
                                      .returnTime
                                      .millisecondsSinceEpoch +
                                  1000 * 30;
                              return BorrowDetailItem(
                                  item: borrowDetail[index]);
                            },
                            itemCount: borrowDetail.length,
                          )
                        : Center(
                            child: SizedBox(
                                child: Image.asset("images/empty.png",
                                    fit: BoxFit.fitHeight)),
                          )
                    : Center(
                        child: Image.asset(
                          "images/drone2.gif",
                          height: 100.0,
                          width: 100.0,
                        ),
                      ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Return books',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'See all >',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 180,
                child: returnDetail != null
                    ? returnDetail.length > 0
                        ? PageView.builder(
                            //controller: _goalPageController,
                            itemBuilder: (_, index) {
                              return ReturnDetailItem(
                                  item: this.returnDetail[index]);
                            },
                            itemCount: returnDetail.length,
                          )
                        : Center(
                            child: SizedBox(
                                child: Image.asset("images/empty.png",
                                    fit: BoxFit.fitHeight)),
                          )
                    : Center(
                        child: Image.asset(
                          "images/drone2.gif",
                          height: 100.0,
                          width: 100.0,
                        ),
                      ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
