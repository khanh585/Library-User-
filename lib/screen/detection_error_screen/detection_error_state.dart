import 'package:user_library/models/detection_error.dart';
import 'package:user_library/models/undefined_error.dart';

class DetectionErrorState {
  List<DetectionError> detectionErrors;
  List<UndefinedError> undefinedErrors;

  List<UndefinedError> undefinedRejectedErrors;
  List<DetectionError> detectionRejectedErrors;
  List<UndefinedError> undefinedConfirmErrors;
  List<DetectionError> detectionConfirmErrors;
  List newList;
  DetectionErrorState(
      {this.detectionErrors,
      this.undefinedErrors,
      this.undefinedRejectedErrors,
      this.detectionRejectedErrors,
      this.undefinedConfirmErrors,
      this.detectionConfirmErrors,
      this.newList});
}
