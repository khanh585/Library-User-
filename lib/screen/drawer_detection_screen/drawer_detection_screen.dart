import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:user_library/models/drawer_detection.dart';
import 'package:user_library/screen/drawer_detection_screen/drawer_detection_bloc.dart';
import 'package:user_library/screen/drawer_detection_screen/drawer_detection_event.dart';
import 'package:user_library/screen/drawer_detection_screen/drawer_detection_state.dart';
import 'package:user_library/screen/drawer_detection_screen/widgets/drawer_card.dart';
import 'package:user_library/screen/drawer_detection_screen/widgets/pilot_info.dart';

class DrawerDetectionScreen extends StatefulWidget {
  final int detectionId;
  final String pilot;
  final String bookshelf;
  final String avatar;
  const DrawerDetectionScreen(
      {this.detectionId, this.pilot, this.bookshelf, this.avatar});
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
                'Drawers in detection',
                style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        body: StreamBuilder<DrawerDetectionState>(
            stream: drawer_detection_bloc.stateController.stream,
            initialData: drawer_detection_bloc.state,
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text("Error");
              if (snapshot.data.drawerDetections == null) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Image.asset(
                      "images/drone2.gif",
                      height: 250.0,
                      width: 250.0,
                    ),
                  ),
                );
              }
              if (snapshot.data.drawerDetections.length == 0) {
                return Container(
                  padding: EdgeInsets.only(top: 100),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset("images/nodata.png",
                            width: 180, height: 180),
                        Text("No data",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.orangeAccent[400]))
                      ],
                    ),
                  ),
                );
              }

              if (snapshot.data.drawerDetections != null) {
                return Column(
                  children: [
                    Pilot_info(
                      name: this.widget.pilot,
                      bookshelf: this.widget.bookshelf,
                      avatar: this.widget.avatar,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Container(
                      height: size.height - 170,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          for (DrawerDetection drawerDetection
                              in snapshot.data.drawerDetections)
                            DrawerCard(drawerDetection: drawerDetection)
                        ],
                      ),
                    ),
                  ],
                );
              }
            }));
  }
}
