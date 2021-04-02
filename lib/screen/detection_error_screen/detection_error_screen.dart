import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_library/screen/detection_error_screen/detection_error_bloc.dart';
import 'package:user_library/screen/detection_error_screen/detection_error_event.dart';
import 'package:user_library/screen/detection_error_screen/detection_error_state.dart';
import 'package:user_library/constants.dart';

class DetectionErrorScreen extends StatefulWidget {
  final int drawerDetectionId;
  const DetectionErrorScreen({Key key, this.drawerDetectionId})
      : super(key: key);
  @override
  _DetectionErrorScreenState createState() => _DetectionErrorScreenState();
}

class _DetectionErrorScreenState extends State<DetectionErrorScreen>
    with SingleTickerProviderStateMixin {
  final detection_error_bloc = DetectionErrorBloc();
  TabController _tabController;
  int _selectedIndex = 0;
  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        detection_error_bloc.eventController.sink.add(
        FetchDetectionError(drawerDetectionId: this.widget.drawerDetectionId, isRejected: "true"));
      });
    });
    super.initState();
    detection_error_bloc.eventController.sink.add(
        FetchDetectionError(drawerDetectionId: this.widget.drawerDetectionId, isRejected: "true"));
  }

  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffff8a65),
        body: SafeArea(
          child: Container(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Color(0xffff8a65),
                  expandedHeight: MediaQuery.of(context).size.height * 0.15,
                  flexibleSpace: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: <Widget>[
                        SizedBox(
                          height: kToolbarHeight,
                        ),
                        SizedBox(
                          height: 240.0,
                        ),
                        Container(
                          margin: new EdgeInsets.only(top: 40.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Details About\n",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                TextSpan(
                                  text: "Order #521",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Container(
                    height: MediaQuery.of(context).size.height * 0.85,                  
                    margin: EdgeInsets.only(top: 23, bottom: 36),
                    //padding: EdgeInsets.only(right: 50),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: TabBar(
                                //labelPadding: EdgeInsets.all(0),
                                //indicatorPadding: EdgeInsets.all(0),
                                isScrollable: true,
                                labelColor: kBlackColor,
                                //unselectedLabelColor: kGreyColor,
                                indicatorColor: Colors.greenAccent[200],
                                indicatorWeight: 8,
                                labelStyle: GoogleFonts.openSans(
                                    fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                unselectedLabelStyle: GoogleFonts.openSans(
                                    fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
                                tabs: [
                                  Tab(
                                    icon: Icon(Icons.error_sharp, color: Colors.red[400]),
                                    text: 'Detection Error'
                                  ),                               
                                  Tab(
                                      icon: Icon(Icons.warning_sharp, color: Colors.amberAccent[400]),
                                      text: 'Undefined Error'),
                                  Tab(
                                      icon: Icon(Icons.directions_transit),
                                      text: 'Rejected'),
                                ],
                                controller: _tabController,
                              )),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Container(
                                    child: StreamBuilder<DetectionErrorState>(
                                        stream: detection_error_bloc
                                            .state
                                            .stream,
                                        initialData: detection_error_bloc
                                            .stateDetectionError,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError)
                                            return Text("Error");
                                          if (snapshot.data.detectionErrors
                                                  .length ==
                                              0){
                                                return Text("Error");
                                              }
                                          if (snapshot.data.detectionErrors
                                                  .length !=
                                              0) {
                                            return ListView.builder(
                                                controller: controller,
                                                physics:
                                                    BouncingScrollPhysics(),
                                                itemCount: snapshot.data
                                                    .detectionErrors.length,
                                                itemBuilder: (context, index) {
                                                  double scale = 1.0;
                                                  return Opacity(
                                                    opacity: scale,
                                                    child: Transform(
                                                      transform:
                                                          Matrix4.identity()
                                                            ..scale(
                                                                scale, scale),
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Align(
                                                        heightFactor: 0.9,
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child: Container(
                                                            height: 150,
                                                            margin:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        10),
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20.0)),
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .black
                                                                          .withAlpha(
                                                                              100),
                                                                      blurRadius:
                                                                          10.0),
                                                                ]),
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20.0,
                                                                  vertical: 10),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                        width:
                                                                            200,
                                                                        child:
                                                                            Text(
                                                                          snapshot
                                                                              .data
                                                                              .detectionErrors[index]
                                                                              .bookName,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: const TextStyle(
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        snapshot
                                                                            .data
                                                                            .detectionErrors[index]
                                                                            .errorMessage,
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                Colors.grey),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        snapshot
                                                                            .data
                                                                            .detectionErrors[index]
                                                                            .bookBarcode,
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                25,
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight: FontWeight.bold),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          }
                                        })), 
                                Container(
                                    child: StreamBuilder<DetectionErrorState>(
                                        stream: detection_error_bloc
                                            .state
                                            .stream,
                                        initialData: detection_error_bloc
                                            .stateDetectionError,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError)
                                            return Text("Error");
                                            if (snapshot.data.undefinedErrors
                                                  .length ==
                                              0) {
                                                return Text("Error");
                                              }
                                          if (snapshot.data.undefinedErrors
                                                  .length !=
                                              0) {
                                            return ListView.builder(
                                                controller: controller,
                                                itemCount: snapshot.data
                                                    .undefinedErrors.length,
                                                physics:
                                                    BouncingScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  double scale = 1.0;
                                                  return Opacity(
                                                    opacity: scale,
                                                    child: Transform(
                                                      transform:
                                                          Matrix4.identity()
                                                            ..scale(
                                                                scale, scale),
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Align(
                                                        heightFactor: 0.9,
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child: Container(
                                                            height: 150,
                                                            margin:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        10),
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20.0)),
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .black
                                                                          .withAlpha(
                                                                              100),
                                                                      blurRadius:
                                                                          10.0),
                                                                ]),
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20.0,
                                                                  vertical: 10),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                        width:
                                                                            200,
                                                                        child:
                                                                            Text(
                                                                          snapshot
                                                                              .data
                                                                              .undefinedErrors[index]
                                                                              .errorMessage,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: const TextStyle(
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        snapshot
                                                                            .data
                                                                            .undefinedErrors[index]
                                                                            .errorMessage,
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                Colors.grey),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        snapshot
                                                                            .data
                                                                            .undefinedErrors[index]
                                                                            .errorMessage,
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                25,
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight: FontWeight.bold),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          }
                                        })),                                                            
                                Container(
                                    child: StreamBuilder<DetectionErrorState>(
                                        stream: detection_error_bloc
                                            .state.stream,
                                        initialData: detection_error_bloc
                                            .stateDetectionError,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError)
                                            return Text("Error");
                                          if (snapshot.data
                                                  .undefinedRejectedErrors ==
                                              null) {
                                            snapshot
                                                .data
                                                .undefinedRejectedErrors
                                                .length = 0;
                                          }
                                          if (snapshot.data
                                                  .detectionRejectedErrors ==
                                              null) {
                                            snapshot
                                                .data
                                                .detectionRejectedErrors
                                                .length = 0;
                                          }
                                          if (snapshot.data.newList.length !=
                                              0) {
                                            return ListView.builder(
                                                controller: controller,
                                                physics:
                                                    BouncingScrollPhysics(),
                                                itemCount: snapshot
                                                    .data
                                                    .newList
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  double scale = 1.0;
                                                  return Opacity(
                                                    opacity: scale,
                                                    child: Transform(
                                                      transform:
                                                          Matrix4.identity()
                                                            ..scale(
                                                                scale, scale),
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Align(
                                                        heightFactor: 0.9,
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child: Container(
                                                            height: 150,
                                                            margin:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        10),
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20.0)),
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .black
                                                                          .withAlpha(
                                                                              100),
                                                                      blurRadius:
                                                                          10.0),
                                                                ]),
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20.0,
                                                                  vertical: 10),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                        width:
                                                                            200,
                                                                        child:
                                                                            Text(
                                                                          snapshot
                                                                              .data
                                                                              .newList[index]
                                                                              .bookName,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: const TextStyle(
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),Text(
                                                                        snapshot
                                                                            .data
                                                                            .newList[index]
                                                                            .errorMessage,
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                Colors.grey),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        snapshot
                                                                            .data
                                                                            .newList[index]
                                                                            .bookBarcode,
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                25,
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight: FontWeight.bold),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          }
                                        })),
                              ],
                              controller: _tabController,
                            ),
                          ),
                        ]),
                  ),
                ]))
              ],
            ),
          ),
        ));
  }
}
