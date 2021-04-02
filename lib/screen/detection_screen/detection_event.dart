abstract class DetectionEvent {}

class FetchDetection extends DetectionEvent {
  String time;
  FetchDetection({this.time});
}
