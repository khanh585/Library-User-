import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:user_library/config.dart';
import 'package:user_library/models/detection_error.dart';
import 'package:user_library/models/drawer_detection.dart';
import 'package:user_library/models/undefined_error.dart';

class UndefinedErrorDAO {
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'UndefinedError';
  int pageSize = 20;
  int pageNumber = 1;

  Future<List<UndefinedError>> fetchUndefinedError(int drawerDetectionId) async {
    List<UndefinedError> list = new List<UndefinedError>();
    String url =
        prefixUrl + '?DrawerDetectionId=${drawerDetectionId}';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List undefinedErrors = jsonDecode(response.body);
      undefinedErrors.forEach((undefinedErrors){
        if (undefinedErrors != null) {
          UndefinedError dto = UndefinedError.fromJson(undefinedErrors);
          list.add(dto);
        }
      });
      return list;
    } else {
      print("Not 200");
    }
  }

  Future<List<UndefinedError>> fetchUndefinedErrorRejected(String isRejected) async {
    List<UndefinedError> list = new List<UndefinedError>();
    String url =
        prefixUrl + '?IsRejected=${isRejected}';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List undefinedErrors = jsonDecode(response.body);
      undefinedErrors.forEach((undefinedErrors){
        if (undefinedErrors != null) {
          UndefinedError dto = UndefinedError.fromJson(undefinedErrors);
          list.add(dto);
        }
      });
      return list;
    } else {
      print("Not 200");
    }
  }
}
