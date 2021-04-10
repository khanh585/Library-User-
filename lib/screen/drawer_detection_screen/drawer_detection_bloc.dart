import 'dart:async';

import 'package:user_library/bloc/bloc.dart';
import 'package:user_library/dao/DrawerDetectionDAO.dart';
import 'package:user_library/screen/drawer_detection_screen/drawer_detection_event.dart';
import 'package:user_library/screen/drawer_detection_screen/drawer_detection_state.dart';
import 'package:user_library/models/drawer_detection.dart';

class DrawerDetectionBloc implements Bloc {
  var state = DrawerDetectionState(drawerDetections: null);
  final eventController = StreamController<DrawerDetectionEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<DrawerDetectionState>.broadcast();

  DrawerDetectionBloc() {
    eventController.stream.listen((event) async {
      if (event is FetchDrawerDetection) {
        if (state.drawerDetections == null) {
          state.drawerDetections = new List<DrawerDetection>();
        }
        List response =
            await DrawerDetectionDAO().fetchDrawerDetection(event.detectionId);
        List<DrawerDetection> listDrawerDetection = response;
        state = DrawerDetectionState(
          drawerDetections: listDrawerDetection,
        );
        stateController.sink.add(state);
      }
    });
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
