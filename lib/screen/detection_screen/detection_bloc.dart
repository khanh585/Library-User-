import 'dart:async';

import 'package:user_library/bloc/bloc.dart';
import 'package:user_library/dao/DetectionDAO.dart';
import 'package:user_library/screen/detection_screen/detection_event.dart';
import 'package:user_library/screen/detection_screen/detection_state.dart';
import 'package:user_library/models/detection.dart';

class DetectionBloc implements Bloc {
  var state = DetectionState(detections: new List<Detection>());
  final eventController = StreamController<DetectionEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<DetectionState>.broadcast();

  DetectionBloc() {
    eventController.stream.listen((event) async {
      if (event is FetchDetection) {
        List response = await DetectionDAO().fetchDetection(event.time);
        List<Detection> listDetection = response;
        state = DetectionState(
          detections: listDetection,
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
