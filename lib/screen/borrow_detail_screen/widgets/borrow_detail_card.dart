import 'package:flutter/material.dart';
import 'package:user_library/models/borrow_detail.dart';
import 'package:user_library/screen/borrow_detail_screen/widgets/circle_indicator.dart';
import 'package:user_library/screen/borrow_detail_screen/widgets/progress_line_indicator.dart';

class BorrowDetailCard extends StatelessWidget {
  final List<BorrowDetail> borrowDetail;

  const BorrowDetailCard({Key key, this.borrowDetail}) : super(key: key);

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
                      'Personal goals',
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
                height: 100,
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
                              Text(
                                borrowDetail[index].bookName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text('3/5')
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ProgressLineIndicator(
                            completedPercentage: (3 / 5 * 100).toInt(),
                            width: MediaQuery.of(context).size.width * 0.8,
                            strokeWidth: 5,
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: 4,
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
              CircleIndicator(
                count: 4,
                //current: _goalPageCurrent,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Current tasks',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Calendar >',
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  color: Colors.greenAccent,
                                ),
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: Colors.green,
                                  size: 18,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                borrowDetail[index].bookName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[300],
                                ),
                                child: Text(
                                  'In progress',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            borrowDetail[index].bookName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.watch_later,
                                color: Colors.grey,
                                size: 15,
                              ),
                              Text(
                                borrowDetail[index].bookName,
                                style: TextStyle(fontSize: 12),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Text(
                                borrowDetail[index].bookName,
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          )
                        ],
                      ),
                    );
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
              CircleIndicator(
                count: 5,
                //current: _goalPageCurrent,
              )
            ],
          )
        ],
      ),
    );
  }
}
