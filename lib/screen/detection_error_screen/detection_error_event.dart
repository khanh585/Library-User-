import 'package:user_library/models/detection_error.dart';
import 'package:user_library/models/undefined_error.dart';

abstract class DetectionErrorEvent {}

class FetchDetectionError extends DetectionErrorEvent {
  int drawerDetectionId;
  String isRejected;
  FetchDetectionError({this.drawerDetectionId, this.isRejected});
}

class RejectedError extends DetectionErrorEvent {
  DetectionError decError;
  UndefinedError undError;
  RejectedError({this.decError, this.undError});
}

class ConfirmError extends DetectionErrorEvent {
  DetectionError decError;
  UndefinedError undError;
  ConfirmError({this.decError, this.undError});
}
