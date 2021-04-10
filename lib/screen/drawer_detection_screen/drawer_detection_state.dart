import 'package:user_library/models/drawer_detection.dart';

class DrawerDetectionState {
  List<DrawerDetection> drawerDetections;
  Map<String, List<DrawerDetection>> drawers;
  DrawerDetectionState({this.drawerDetections, this.drawers});
}
