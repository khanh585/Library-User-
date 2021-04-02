import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:user_library/config.dart';
import 'package:user_library/models/detection.dart';

class DetectionDAO {
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'Detection';
  int pageSize = 20;
  int pageNumber = 1;

  Future<List<Detection>> fetchDetection(String time) async {
    List<Detection> list = new List<Detection>();
    String url =
        prefixUrl + '?Time=${time}';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      List detections = json['data'];
      detections.forEach((detection){
        if (detection != null) {
          Detection dto = Detection.fromJson(detection);
          list.add(dto);
        }
      });
      return list;
    } else {
      print("Not 200");
    }
  }
}
