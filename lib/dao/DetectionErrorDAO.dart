import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:user_library/config.dart';
import 'package:user_library/models/detection_error.dart';

class DetectionErrorDAO {
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'DetectionError';
  int pageSize = 20;
  int pageNumber = 1;

  Future<List<DetectionError>> fetchDetectionError(int drawerDetectionId,
      {bool isRejected, bool isConfirm}) async {
    List<DetectionError> list = new List<DetectionError>();
    String url = prefixUrl + '?DrawerDetectionId=${drawerDetectionId}';

    if (isRejected != null) {
      url = url + '&IsRejected=${isRejected}';
    }
    if (isConfirm != null) {
      url = url + '&IsConfirm=${isConfirm}';
    }

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List detectionErrors = jsonDecode(response.body);
      detectionErrors.forEach((detectionError) {
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

  Future<bool> updateDetectionError(DetectionError decError) async {
    String url = prefixUrl + "?id=${decError.id}";
    Map<String, String> header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var response =
        await http.put(url, headers: header, body: jsonEncode(decError));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
