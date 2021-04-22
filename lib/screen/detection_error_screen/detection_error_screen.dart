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

  void _rejectError({DetectionError decError, UndefinedError undError}) {
    detection_error_bloc.eventController.sink
        .add(RejectedError(decError: decError, undError: undError));
  }

  void _confirmError({DetectionError decError, UndefinedError undError}) {
    detection_error_bloc.eventController.sink
        .add(ConfirmError(decError: decError, undError: undError));
  }

  Widget _ListError(List<DetectionError> listDetect,
      List<UndefinedError> listUndefine, Size size) {
    List<Widget> li = new List();
    listDetect.forEach((element) {
      li.add(ErrorItem(
        item: element,
        size: size,
        confirmError: _confirmError,
        rejectedError: _rejectError,
      ));
    });

    listUndefine.forEach((element) {
      li.add(ErrorItem(
        und: element,
        size: size,
        confirmError: _confirmError,
        rejectedError: _rejectError,
      ));
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
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black, opacity: 0.7),
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        leadingWidth: 25,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        title: Column(
          children: <Widget>[
            Text(
              'Detection error message',
              style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
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
              height: size.height - 160,
              child: TabBarView(
                controller: _tabController,
                children: [
                  //Error
                  Container(
                    child: StreamBuilder<DetectionErrorState>(
                      stream: detection_error_bloc.stateController.stream,
                      initialData: detection_error_bloc.state,
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
                        } else if (snapshot.data.detectionErrors.length != 0 ||
                            snapshot.data.undefinedErrors.length != 0) {
                          return _ListError(snapshot.data.detectionErrors,
                              snapshot.data.undefinedErrors, size);
                        } else {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                        }
                      },
                    ),
                  ),

                  //Reject
                  Container(
                    child: StreamBuilder<DetectionErrorState>(
                      stream: detection_error_bloc.stateController.stream,
                      initialData: detection_error_bloc.state,
                      builder: (context, snapshot) {
                        if (snapshot.hasError)
                          return Center(child: Text("Error"));
                        else if (snapshot.data.undefinedRejectedErrors.length !=
                                0 ||
                            snapshot.data.detectionRejectedErrors.length != 0) {
                          return _ListError(
                              snapshot.data.detectionRejectedErrors,
                              snapshot.data.undefinedRejectedErrors,
                              size);
                        } else {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                        }
                      },
                    ),
                  ),

                  //Confirm
                  Container(
                    child: StreamBuilder<DetectionErrorState>(
                      stream: detection_error_bloc.stateController.stream,
                      initialData: detection_error_bloc.state,
                      builder: (context, snapshot) {
                        if (snapshot.hasError)
                          return Text("Error");
                        else if (snapshot.data.detectionConfirmErrors.length !=
                                0 ||
                            snapshot.data.undefinedConfirmErrors.length != 0) {
                          return _ListError(
                              snapshot.data.detectionConfirmErrors,
                              snapshot.data.undefinedConfirmErrors,
                              size);
                        } else {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
