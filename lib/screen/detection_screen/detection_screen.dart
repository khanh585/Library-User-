import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:user_library/constants.dart';
import 'package:user_library/screen/detection_screen/detection_bloc.dart';
import 'package:user_library/screen/detection_screen/detection_event.dart';
import 'package:user_library/screen/detection_screen/detection_state.dart';
import 'package:intl/intl.dart';
import 'package:user_library/screen/detection_screen/widgets/transaction_item.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black, opacity: 0.7),
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
        title: Text(
          "Daily Detection",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.blueGrey[900]),
        ),
      ),
      body: getBody(),
    );
  }

  void _changeDate(String time) {
    detection_bloc.eventController.sink.add(FetchDetection(time: time));
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Column(
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
            padding:
                const EdgeInsets.only(top: 5, right: 12, left: 12, bottom: 5),
            child: Column(
              children: [
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
        Divider(
          thickness: 1,
        ),
        Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: StreamBuilder<DetectionState>(
              stream: detection_bloc.stateController.stream,
              initialData: detection_bloc.state,
              builder: (context, snapshot) {
                if (snapshot.hasError) return Text("Error");
                if (snapshot.data.detections == null) {
                  return Center(
                    child: Image.asset(
                      "images/drone2.gif",
                      height: 200.0,
                      width: 200.0,
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
                      height: size.height - 223,
                      child: ListView(
                          children: List.generate(
                              snapshot.data.detections.length, (index) {
                                print(snapshot.data.detections[index].avatar + "Ádasdasdas");
                        return TransactionItem(
                          size: size,
                          item: snapshot.data.detections[index],
                        );
                      })));
                }
              },
            )),
      ],
    );
  }
}
