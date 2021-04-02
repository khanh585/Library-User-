import 'package:http/http.dart' as http;
import 'package:stack/stack.dart';
import 'dart:convert';
import 'package:user_library/config.dart';
import 'package:user_library/models/schedule.dart';

class ScheduleDAO {
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'BorrowBook';
  int pageSize = 20;
  int pageNumber = 1;

  Future<List<Schedule>> fetchSchedule() async {
    print("Noasasst 200");
    List<Schedule> list;
    if (list == null) {
      list = new List();
    }
    String url =
        prefixUrl + '?PageSize=${pageSize}' + '&PageNumber=${pageNumber}';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      List cats = json['data'];
      cats.forEach((element) {
        Schedule dto = Schedule.fromJson(element);
        list.add(dto);
      });
      return list;
    } else {
      print("Not 200");
    }
  }

  Future<Schedule> sentFeedback(Schedule dto) async {
    Map<String, String> headers = {"Content-type": "application/json"};

    String body = json.encode(dto.toJson());

    var response = await http.post(prefixUrl, headers: headers, body: body);

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      Schedule dto = Schedule.fromJson(json['data']);
      return dto;
    } else {
      throw Exception('Failed');
    }
  }
}
