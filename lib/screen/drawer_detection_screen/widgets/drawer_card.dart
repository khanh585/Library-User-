import 'package:flutter/material.dart';
import 'package:user_library/models/borrow_detail.dart';
import 'package:user_library/models/customer.dart';
import 'package:user_library/models/drawer_detection.dart';
import 'package:user_library/models/return_detail.dart';
import 'package:user_library/screen/borrow_detail_screen/widgets/progress_line_indicator.dart';
import 'package:user_library/screen/detection_error_screen/detection_error_screen.dart';

class DrawerCard extends StatelessWidget {
  final DrawerDetection drawerDetection;

  const DrawerCard({Key key, this.drawerDetection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetectionErrorScreen(drawerDetectionId: drawerDetection.id)),
        );
      },
      child: Wrap(
        children: [
          Column(
            children: <Widget>[
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                height: 148,
                child: PageView.builder(
                  //controller: _goalPageController,
                  itemBuilder: (_, index) {
                    return Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 10, left: 25, right: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 2, color: Colors.black.withOpacity(0.7)),
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      drawerDetection.drawerBarcode.trim(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 22),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Drawer',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                                color: Colors.brown),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        drawerDetection.drawerName.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 25,
                                            color: Colors.brown),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Books',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        drawerDetection.bookCount.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 25,
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Error',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                                color: Colors.red),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        drawerDetection.count.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 25,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ));
                  },
                  itemCount: 3,
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
        ],
      ),
    );
  }
}
