abstract class DrawerDetectionEvent {}

class FetchDrawerDetection extends DrawerDetectionEvent {
  int detectionId;
  FetchDrawerDetection({this.detectionId});
}
