import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:user_library/config.dart';
import 'package:user_library/models/staff.dart';
import 'package:user_library/models/tmpUser.dart';

class StaffDAO {
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'Staff';
  int pageSize = 20;
  int pageNumber = 1;

  Future<TmpUser> fetchStaff(int staffId) async {
    TmpUser tmpUser;
    if (tmpUser == null) {
      tmpUser = new TmpUser();
    }
    String url =
        prefixUrl + '/$staffId';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      tmpUser = TmpUser.fromJson(json['data']);
      return tmpUser;
    } else {
      print("Not 200");
    }
  }
}
