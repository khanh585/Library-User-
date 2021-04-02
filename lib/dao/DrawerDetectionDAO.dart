import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:user_library/config.dart';
import 'package:user_library/models/drawer_detection.dart';

class DrawerDetectionDAO {
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'DrawerDetection';
  int pageSize = 20;
  int pageNumber = 1;

  Future<List<DrawerDetection>> fetchDrawerDetection(int detectionId) async {
    List<DrawerDetection> list = new List<DrawerDetection>();
    String url =
        prefixUrl + '?DetectionId=${detectionId}';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List drawerDetections = jsonDecode(response.body);
      drawerDetections.forEach((drawerDetection){
        if (drawerDetection != null) {
          DrawerDetection dto = DrawerDetection.fromJson(drawerDetection);
          list.add(dto);
        }
      });
      return list;
    } else {
      print("Not 200");
    }
  }
}
