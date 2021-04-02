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
              builder: (context) => DetectionErrorScreen(
                  drawerDetectionId: drawerDetection.id
                  )),
        );
      },
      child: Wrap(
        children: [
          Column(
            children: <Widget>[
              SizedBox(
                height: 10,
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
                            color: Color(0xfffff9c4),
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
                                        Icons.card_membership,
                                        color: Color(0xff4db6ac),
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          'Drawer name: ' +
                                              drawerDetection.drawerName
                                                  .toString(),
                                          // overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Colors.black),
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
                                          Icons.confirmation_number_outlined,
                                          color: Color(0xff33691e),
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
                                          "Quantity: " + 
                                          drawerDetection.bookCount
                                                  .toString() ,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
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
                                        Icons.bar_chart_outlined,
                                        color: Colors.lightGreen[700],
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          "Barcode: " +
                                          drawerDetection.drawerBarcode,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
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
                                        Icons.error_outline,
                                        color: Colors.red[900],
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          "Number of error: " +
                                          drawerDetection.count.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // image
                            // Container(
                            //     width:
                            //         MediaQuery.of(context).size.width * 1 / 5,
                            //     child: Image.network(
                            //       drawerDetection.drawerBarcode,
                            //       fit: BoxFit.contain,
                            //     )),
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
        ],
      ),
    );
  }
}
