abstract class DetectionErrorEvent {}

class FetchDetectionError extends DetectionErrorEvent {
  int drawerDetectionId;
  String isRejected;
  FetchDetectionError({this.drawerDetectionId, this.isRejected});
}
