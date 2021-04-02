
import 'package:user_library/models/detection_error.dart';
import 'package:user_library/models/drawer_detection.dart';
import 'package:user_library/models/undefined_error.dart';

class DetectionErrorState {
  List<DetectionError> detectionErrors;
  List<UndefinedError> undefinedErrors;
  List<UndefinedError> undefinedRejectedErrors;
  List<DetectionError> detectionRejectedErrors;
  List newList;
  DetectionErrorState({
    this.detectionErrors,
    this.undefinedErrors,
    this.undefinedRejectedErrors,
    this.detectionRejectedErrors,
    this.newList
  });
}

