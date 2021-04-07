import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_library/models/drawer_detection.dart';
import 'package:user_library/screen/drawer_detection_screen/drawer_detection_bloc.dart';
import 'package:user_library/screen/drawer_detection_screen/drawer_detection_event.dart';
import 'package:user_library/screen/drawer_detection_screen/drawer_detection_state.dart';
import 'package:user_library/screen/drawer_detection_screen/widgets/drawer_card.dart';

class DrawerDetectionScreen extends StatefulWidget {
  final int detectionId;
  const DrawerDetectionScreen({Key key, this.detectionId}) : super(key: key);
  @override
  _DrawerDetectionScreenState createState() => _DrawerDetectionScreenState();
}

class _DrawerDetectionScreenState extends State<DrawerDetectionScreen> {
  final drawer_detection_bloc = DrawerDetectionBloc();
  // Track active index
  int activeIndex = 0;
  @override
  void initState() {
    super.initState();
    drawer_detection_bloc.eventController.sink
        .add(FetchDrawerDetection(detectionId: this.widget.detectionId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffff7043),
        body: StreamBuilder<DrawerDetectionState>(
            stream: drawer_detection_bloc.stateController.stream,
            initialData: drawer_detection_bloc.state,
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text("Error");
              if (snapshot.data.drawerDetections.length == 0) {
                return Center(
                  child: Column(
                    children: [
                      Image.asset("images/nodata.png", width: 100, height: 100),
                      Text("No data",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.orangeAccent[400]))
                    ],
                  ),
                );
              }
              if (snapshot.data.drawerDetections == null) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          "images/drone2.gif",
                          height: 250.0,
                          width: 250.0,
                        ),
                      ),
                      Positioned(
                        child: Text(
                          "Loading",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.orangeAccent[400]),
                        ),
                        top: 510,
                        left: 172,
                      )
                    ],
                  ),
                );
              }
              if (snapshot.data.drawerDetections != null) {
                return Container(
                    height: double.infinity,
                    padding: EdgeInsets.only(right: 25, left: 25),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Stack(
                          overflow: Overflow.visible,
                          children: [
                            // Positioned(
                            //   right: 0.0,
                            //   top: -20.0,
                            //   child: Opacity(
                            //     opacity: 0.3,
                            //     child: Image.asset(
                            //       "images/drone.jpg",
                            //     ),
                            //   ),
                            // ),
                            SingleChildScrollView(
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(
                                    //   height: kToolbarHeight,
                                    // ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              FlutterIcons
                                                  .keyboard_backspace_mdi,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Welcome Back,\n",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                          .copyWith(
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                    TextSpan(
                                                      text: "FlutterPanda!",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                          .copyWith(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Image.asset(
                                                "images/dp.png",
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),  
                                    Container(
                                      //width: double.infinity,
                                      //height: double.infinity,
                                      constraints: BoxConstraints(
                                        minHeight:
                                            MediaQuery.of(context).size.height -
                                                200.0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(30.0),
                                        ),
                                        color: Color(0xffff7043),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 24.0,
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 7.0),
                                          Container(
                                            child: ListView(
                                              physics: BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              children: [
                                                for (DrawerDetection drawerDetection
                                                    in snapshot
                                                        .data.drawerDetections)
                                                  DrawerCard(
                                                      drawerDetection:
                                                          drawerDetection)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ));
              }
            }));
  }
}
