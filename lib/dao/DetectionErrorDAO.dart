import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:user_library/config.dart';
import 'package:user_library/models/detection_error.dart';
import 'package:user_library/models/drawer_detection.dart';

class DetectionErrorDAO {
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'DetectionError';
  int pageSize = 20;
  int pageNumber = 1;

  Future<List<DetectionError>> fetchDetectionError(int drawerDetectionId) async {
    List<DetectionError> list = new List<DetectionError>();
    String url =
        prefixUrl + '?DrawerDetectionId=${drawerDetectionId}';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List detectionErrors = jsonDecode(response.body);
      detectionErrors.forEach((detectionError){
        if (detectionError != null) {
          DetectionError dto = DetectionError.fromJson(detectionError);
          list.add(dto);
        }
      });
      return list;
    } else {
      print("Not 200");
    }
  }

  Future<List<DetectionError>> fetchDetectionErrorRejected(String isRejected) async {
    List<DetectionError> list = new List<DetectionError>();
    String url =
        prefixUrl + '?IsRejected=${isRejected}';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List detectionErrors = jsonDecode(response.body);
      detectionErrors.forEach((detectionError){
        if (detectionError != null) {
          DetectionError dto = DetectionError.fromJson(detectionError);
          list.add(dto);
        }
      });
      return list;
    } else {
      print("Not 200");
    }
  }
}
