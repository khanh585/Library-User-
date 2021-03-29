import 'package:flutter/material.dart';
import 'package:user_library/models/borrow_detail.dart';
import 'package:user_library/models/customer.dart';
import 'package:user_library/models/return_detail.dart';
import 'package:user_library/screen/borrow_detail_screen/widgets/progress_line_indicator.dart';

class BorrowDetailCard extends StatelessWidget {
  final List<BorrowDetail> borrowDetail;
  final List<ReturnDetail> returnDetail;
  final Customer customer;

  const BorrowDetailCard(
      {Key key, this.borrowDetail, this.returnDetail, this.customer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //tao bảo đảm m code gắn bloc sai vaf m load chổ này lâu vl :))))))

    return Container(
      child: Wrap(
        children: [
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Current borrow books',
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
                child: PageView.builder(
                  //controller: _goalPageController,
                  itemBuilder: (_, index) {
                    int endTime =
                        borrowDetail[index].returnTime.millisecondsSinceEpoch +
                            1000 * 30;
                    return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400],
                                blurRadius: 5,
                                offset: Offset(0, 5),
                              )
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // content
                            Container(
                              height: 160,
                              width: 270,
                              child: Column(
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.watch_later_outlined,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          'Exp date: ' +
                                              borrowDetail[index]
                                                  .returnTime
                                                  .toString()
                                                  .substring(0, 10),
                                          // overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(80),
                                        ),
                                        child: Icon(
                                          Icons.money_rounded,
                                          color: Color(0xffaeea00),
                                          size: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                    3 /
                                                    5 -
                                                10,
                                        child: Text(
                                          borrowDetail[index].fee.toString() +
                                              '\$',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.menu_book_rounded,
                                        color: Colors.black87,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          borrowDetail[index].bookName,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87
                                                  .withOpacity(.95),
                                              fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.person,
                                        color: Colors.black54,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          borrowDetail[index].author,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // image
                            Container(
                                width:
                                    MediaQuery.of(context).size.width * 1 / 5,
                                child: Image.network(
                                  borrowDetail[index].image,
                                  fit: BoxFit.contain,
                                )),
                          ],
                        ));
                  },
                  itemCount: 5,
                  // onPageChanged: (page) {
                  //   setState(() {
                  //     _goalPageCurrent = page;
                  //   });
                  // },
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
                height: 125,
                child: PageView.builder(
                  //controller: _goalPageController,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400],
                              blurRadius: 5,
                              offset: Offset(0, 5),
                            )
                          ]),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  returnDetail[index].bookName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ProgressLineIndicator(
                            completedPercentage: (5 / 5 * 100).toInt(),
                            width: MediaQuery.of(context).size.width * 0.8,
                            strokeWidth: 5,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  returnDetail[index].author,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: returnDetail.length,
                  // onPageChanged: (page) {
                  //   setState(() {
                  //     _goalPageCurrent = page;
                  //   });
                  // },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // CircleIndicator(
              //   count: borrowDetail.length,
              //   //current: _goalPageCurrent,
              // ),
              SizedBox(
                height: 25,
              ),
            ],
          )
        ],
      ),
    );
  }
}
