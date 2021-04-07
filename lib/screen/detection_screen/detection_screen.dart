import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:user_library/constants.dart';
import 'package:user_library/screen/detection_screen/detection_bloc.dart';
import 'package:user_library/screen/detection_screen/detection_event.dart';
import 'package:user_library/screen/detection_screen/detection_state.dart';
import 'package:intl/intl.dart';
import 'package:user_library/screen/drawer_detection_screen/drawer_detection_screen.dart';

class DetectionScreen extends StatefulWidget {
  const DetectionScreen({Key key}) : super(key: key);
  @override
  _DetectionScreenState createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  final detection_bloc = DetectionBloc();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  int activeDay = 3;
  @override
  void initState() {
    super.initState();
    detection_bloc.eventController.sink
        .add(FetchDetection(time: dateFormat.format(DateTime.now())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: getBody(),
    );
  }

  void _changeDate(String time) {
    detection_bloc.eventController.sink.add(FetchDetection(time: time));
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
                // changes position of shadow
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, right: 20, left: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Daily Transaction",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      //Icon(AntDesign.search1)
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DatePicker(
                        DateTime(DateTime.now().year, DateTime.now().month - 1,
                            DateTime.now().day),
                        initialSelectedDate: DateTime.now(),
                        selectionColor: Color(0xFFFF5722).withOpacity(1),
                        selectedTextColor: Colors.white,
                        onDateChange: (date) {
                          // New date selected
                          _changeDate(date.toString());
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: StreamBuilder<DetectionState>(
                stream: detection_bloc.stateController.stream,
                initialData: detection_bloc.state,
                builder: (context, snapshot) {
                  if (snapshot.hasError) return Text("Error");
                  if (snapshot.data.detections == null) {
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
                  if (snapshot.data.detections.length == 0) {
                    return Center(                    
                      child: Column(
                        children: [
                          Image.asset("images/nodata.png",
                              width: 100, height: 100),
                          Text("No data",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.orangeAccent[400]))
                        ],
                      ),
                    );
                  }
                  if (snapshot.data.detections != null) {
                    return Container(
                      child: Column(
                          children: List.generate(
                              snapshot.data.detections.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DrawerDetectionScreen(
                                        detectionId:
                                            snapshot.data.detections[index].id,
                                      )),
                            );
                          },
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: (size.width - 40) * 0.8,
                                    child: Column(
                                      children: [
                                        SizedBox(width: 15),
                                        Container(
                                            child: Row(
                                          children: [
                                            Padding(
                                              padding: new EdgeInsets.only(
                                                  bottom: 0),
                                              child: Icon(
                                                Icons.library_books,
                                                color: Colors.pink,
                                                size: 24.0,
                                                semanticLabel:
                                                    'Text to announce in accessibility modes',
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "Book shelf:" +
                                                    snapshot
                                                        .data
                                                        .detections[index]
                                                        .bookShelfName,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xFFFF5722)
                                                        .withOpacity(1),
                                                    fontWeight:
                                                        FontWeight.w600),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: new EdgeInsets.only(
                                                    right: 19),
                                                child: Icon(
                                                  Icons.people,
                                                  color: Color(0xFF4CAF50),
                                                  size: 24.0,
                                                  semanticLabel:
                                                      'Text to announce in accessibility modes',
                                                ),
                                              ),
                                              Text(
                                                snapshot.data.detections[index]
                                                    .staffName,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontStyle: FontStyle.italic,
                                                    color:
                                                        black.withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.w400),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: grey.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        "images/round.jpg",
                                        width: 70,
                                        height: 70,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 65, top: 8),
                                child: Divider(
                                  thickness: 0.8,
                                ),
                              )
                            ],
                          ),
                        );
                      })),
                    );
                  }
                },
              )),
        ],
      ),
    );
  }
}
