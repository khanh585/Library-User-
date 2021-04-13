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
  var state = DetectionErrorState(
    detectionErrors: null,
    undefinedErrors: null,
    //
    detectionRejectedErrors: null,
    detectionConfirmErrors: null,
    //
    undefinedConfirmErrors: null,
    undefinedRejectedErrors: null,
    //
    newList: new List(),
  );
  final eventController = StreamController<DetectionErrorEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<DetectionErrorState>.broadcast();

  DetectionErrorBloc() {
    eventController.stream.listen((event) async {
      if (event is FetchDetectionError) {
        List detectionErrors = await DetectionErrorDAO()
            .fetchDetectionError(event.drawerDetectionId);
        List undefinedErrors = await UndefinedErrorDAO()
            .fetchUndefinedError(event.drawerDetectionId);
        //
        List<DetectionError> listDetectionError = detectionErrors;
        List<UndefinedError> listUndefinedError = undefinedErrors;
        //
        this.state.detectionErrors = listDetectionError;
        this.state.undefinedErrors = listUndefinedError;
        _getConfirm();
        _getReject();

        stateController.sink.add(state);
      } else if (event is RejectedError) {
        if (event.decError != null) {
          DetectionError tmp = event.decError;
          event.decError.isRejected = true;
          bool rs =
              await DetectionErrorDAO().updateDetectionError(event.decError);
          if (rs) {
            if (this.state.detectionRejectedErrors == null) {
              this.state.detectionRejectedErrors = new List<DetectionError>();
            }
            this.state.detectionRejectedErrors.add(event.decError);
            this.state.detectionErrors.remove(tmp);
          }
        } else {
          UndefinedError tmp = event.undError;
          event.undError.isRejected = true;
          bool rs =
              await UndefinedErrorDAO().updateUndefineError(event.undError);
          if (rs) {
            if (this.state.undefinedRejectedErrors == null) {
              this.state.undefinedRejectedErrors = new List<UndefinedError>();
            }
            this.state.undefinedRejectedErrors.add(event.undError);
            this.state.undefinedErrors.remove(tmp);
          }
        }
        stateController.sink.add(state);
      } else if (event is ConfirmError) {
        if (event.decError != null) {
          DetectionError tmp = event.decError;
          event.decError.isConfirm = true;
          bool rs =
              await DetectionErrorDAO().updateDetectionError(event.decError);
          if (rs) {
            if (this.state.detectionConfirmErrors == null) {
              this.state.detectionConfirmErrors = new List<DetectionError>();
            }
            this.state.detectionConfirmErrors.add(event.decError);
            this.state.detectionErrors.remove(tmp);
          }
        } else {
          UndefinedError tmp = event.undError;
          event.undError.isConfirm = true;
          bool rs =
              await UndefinedErrorDAO().updateUndefineError(event.undError);
          if (rs) {
            if (this.state.undefinedConfirmErrors == null) {
              this.state.undefinedConfirmErrors = new List<UndefinedError>();
            }
            this.state.undefinedConfirmErrors.add(event.undError);
            this.state.undefinedErrors.remove(tmp);
          }
        }
        stateController.sink.add(state);
      }
    });
  }

  void _getReject() {
    if (this.state.detectionErrors != null) {
      List<DetectionError> tmp = new List<DetectionError>();
      this.state.detectionRejectedErrors = new List<DetectionError>();

      this.state.detectionErrors.forEach((element) {
        if (element.isRejected) {
          this.state.detectionRejectedErrors.add(element);
        } else {
          tmp.add(element);
        }
      });
      this.state.detectionErrors = tmp;
    }
    if (this.state.undefinedErrors != null) {
      List<UndefinedError> tmp = new List<UndefinedError>();
      this.state.undefinedRejectedErrors = new List<UndefinedError>();
      this.state.undefinedErrors.forEach((element) {
        if (element.isRejected) {
          this.state.undefinedRejectedErrors.add(element);
        } else {
          tmp.add(element);
        }
      });
      this.state.undefinedErrors = tmp;
    }
  }

  void _getConfirm() {
    if (this.state.detectionErrors != null) {
      List<DetectionError> tmp = new List<DetectionError>();
      this.state.detectionConfirmErrors = new List<DetectionError>();
      this.state.detectionErrors.forEach((element) {
        if (element.isConfirm) {
          this.state.detectionConfirmErrors.add(element);
        } else {
          tmp.add(element);
        }
      });
      this.state.detectionErrors = tmp;
    }
    if (this.state.undefinedErrors != null) {
      List<UndefinedError> tmp = new List<UndefinedError>();
      this.state.undefinedConfirmErrors = new List<UndefinedError>();
      this.state.undefinedErrors.forEach((element) {
        if (element.isConfirm) {
          this.state.undefinedConfirmErrors.add(element);
        } else {
          tmp.add(element);
        }
      });
      this.state.undefinedErrors = tmp;
    }
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
