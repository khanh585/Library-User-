import 'dart:async';

import 'package:user_library/bloc/bloc.dart';
import 'package:user_library/dao/DetectionErrorDAO.dart';
import 'package:user_library/dao/DrawerDetectionDAO.dart';
import 'package:user_library/dao/UndefinedErrorDAO.dart';
import 'package:user_library/models/detection_error.dart';
import 'package:user_library/models/undefined_error.dart';
import 'package:user_library/screen/detection_error_screen/detection_error_event.dart';
import 'package:user_library/screen/detection_error_screen/detection_error_state.dart';
import 'package:user_library/screen/drawer_detection_screen/drawer_detection_event.dart';
import 'package:user_library/screen/drawer_detection_screen/drawer_detection_state.dart';
import 'package:user_library/models/drawer_detection.dart';

class DetectionErrorBloc implements Bloc {
  var stateDetectionError = DetectionErrorState(detectionErrors: new List<DetectionError>(), 
  undefinedErrors: new List<UndefinedError>(), detectionRejectedErrors: new List<DetectionError>(), newList: new List(), undefinedRejectedErrors: new List<UndefinedError>());
  final eventController = StreamController<DetectionErrorEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final state = StreamController<DetectionErrorState>.broadcast();

  DetectionErrorBloc() {
    eventController.stream.listen((event) async {
      if (event is FetchDetectionError) {
        List detectionErrors = await DetectionErrorDAO().fetchDetectionError(event.drawerDetectionId);
        List undefinedErrors = await UndefinedErrorDAO().fetchUndefinedError(event.drawerDetectionId);
        List rejectedUndefinedErrors = await UndefinedErrorDAO().fetchUndefinedErrorRejected(event.isRejected);
        List rejectedDetectionsErrors = await DetectionErrorDAO().fetchDetectionErrorRejected(event.isRejected);
        List<DetectionError> listDetectionError = detectionErrors;
        List<UndefinedError> listUndefinedError = undefinedErrors;
        List<DetectionError> listDetectionErrorRejected = rejectedDetectionsErrors;
        List<UndefinedError> listUndefinedErrorRejected = rejectedUndefinedErrors;
        var newList = new List.from(listDetectionErrorRejected)..addAll(listUndefinedErrorRejected);
        stateDetectionError = DetectionErrorState(
          detectionErrors: listDetectionError,
          detectionRejectedErrors: listDetectionErrorRejected,
          newList: newList,       
          undefinedErrors: listUndefinedError,
          undefinedRejectedErrors: listUndefinedErrorRejected
        );
        state.sink.add(stateDetectionError);
      }
    });
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    state.close();
    eventController.close();
  }
}
