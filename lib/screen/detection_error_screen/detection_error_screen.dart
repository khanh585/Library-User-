import 'package:flutter/material.dart';
import 'package:user_library/models/detection_error.dart';
import 'package:user_library/models/undefined_error.dart';
import 'package:user_library/screen/detection_error_screen/detection_error_bloc.dart';
import 'package:user_library/screen/detection_error_screen/detection_error_event.dart';
import 'package:user_library/screen/detection_error_screen/widgets/error_item.dart';
import 'package:user_library/screen/detection_error_screen/widgets/tabbar_header.dart';
import 'package:user_library/screen/detection_error_screen/widgets/undefine_item.dart';

import 'detection_error_state.dart';

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
  ScrollController controller = ScrollController();

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        detection_error_bloc.eventController.sink.add(FetchDetectionError(
            drawerDetectionId: this.widget.drawerDetectionId,
            isRejected: "true"));
      });
    });
    super.initState();
    detection_error_bloc.eventController.sink.add(FetchDetectionError(
        drawerDetectionId: this.widget.drawerDetectionId, isRejected: "true"));
  }

  Widget _ListError(List<DetectionError> listDetect,
      List<UndefinedError> listUndefine, Size size) {
    List<Widget> li = new List();

    listDetect.forEach((element) {
      li.add(ErrorItem(item: element, size: size));
    });

    listUndefine.forEach((element) {
      li.add(ErrorItem(und: element, size: size));
    });

    Widget rs = ListView(
      children: [for (Widget i in li) i],
    );
    return rs;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Check list'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            //tabbar
            Tabbar_Header(tabController: _tabController),
            //tabbar view
            Container(
              color: Colors.white,
              width: size.width,
              height: size.height - 165,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    child: StreamBuilder<DetectionErrorState>(
                      stream: detection_error_bloc.state.stream,
                      initialData: detection_error_bloc.stateDetectionError,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return Text("Error");
                        if (snapshot.data.detectionErrors == null) {
                          return Center(
                            child: Image.asset(
                              "images/drone2.gif",
                              height: 250.0,
                              width: 250.0,
                            ),
                          );
                        } else if (snapshot.data.detectionErrors.length == 0) {
                          return Column(
                            children: [
                              Image.asset("images/nodata.png",
                                  width: 100, height: 100),
                              Text("No data",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.orangeAccent[400]))
                            ],
                          );
                        } else if (snapshot.data.detectionErrors.length != 0) {
                          return _ListError(snapshot.data.detectionErrors,
                              snapshot.data.undefinedErrors, size);
                        }
                      },
                    ),
                  ),
                  Container(
                    child: StreamBuilder<DetectionErrorState>(
                      stream: detection_error_bloc.state.stream,
                      initialData: detection_error_bloc.stateDetectionError,
                      builder: (context, snapshot) {
                        if (snapshot.hasError)
                          return Text("Error");
                        else if (snapshot.data.undefinedErrors.length == 0) {
                          return Column(
                            children: [
                              Image.asset("images/nodata.png",
                                  width: 100, height: 100),
                              Text("No data",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.orangeAccent[400]))
                            ],
                          );
                        } else if (snapshot.data.undefinedErrors.length != 0) {
                          return ListView.builder(
                              controller: controller,
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data.undefinedErrors.length,
                              itemBuilder: (context, index) {
                                return ErrorItem(
                                    size: size,
                                    und: snapshot.data.undefinedErrors[index]);
                              });
                        }
                      },
                    ),
                  ),
                  Container(
                    child: StreamBuilder<DetectionErrorState>(
                      stream: detection_error_bloc.state.stream,
                      initialData: detection_error_bloc.stateDetectionError,
                      builder: (context, snapshot) {
                        if (snapshot.hasError)
                          return Text("Error");
                        else if (snapshot.data.detectionRejectedErrors.length ==
                            0) {
                          return Column(
                            children: [
                              Image.asset("images/nodata.png",
                                  width: 100, height: 100),
                              Text("No data",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.orangeAccent[400]))
                            ],
                          );
                        } else if (snapshot
                                .data.detectionRejectedErrors.length !=
                            0) {
                          return ListView.builder(
                              controller: controller,
                              physics: BouncingScrollPhysics(),
                              itemCount:
                                  snapshot.data.detectionRejectedErrors.length,
                              itemBuilder: (context, index) {
                                return ErrorItem(
                                    size: size,
                                    item: snapshot
                                        .data.detectionRejectedErrors[index]);
                              });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            //pakage
            Container(),
          ],
        ),
      ),
    );
  }
}
