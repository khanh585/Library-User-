import 'package:http/http.dart' as http;
import 'package:stack/stack.dart';
import 'dart:convert';
import 'package:user_library/config.dart';
import 'package:user_library/dto/ScheduleDTO.dart';

class ScheduleDAO {
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'BorrowBook';
  int pageSize = 20;
  int pageNumber = 1;

  Future<List<ScheduleDTO>> fetchSchedule() async {
    print("Noasasst 200");
    List<ScheduleDTO> list;
    if (list == null) {
      list = new List();
    }
    String url =
        prefixUrl + '?PageSize=${pageSize}' + '&PageNumber=${pageNumber}';
        print(url.toString());
    var response = await http.get(url).timeout(Duration(seconds: 10));

    print(response);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      print(json.toString());
      List cats = json['data'];
      cats.forEach((element) {
        ScheduleDTO dto = ScheduleDTO.fromJson(element);
        list.add(dto);
      });
      return list;
    } else {
      print("Not 200");
    }
  }

  Future<ScheduleDTO> sentFeedback(ScheduleDTO dto) async {
    Map<String, String> headers = {"Content-type": "application/json"};

    String body = json.encode(dto.toJson());

    var response = await http.post(prefixUrl, headers: headers, body: body);

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      ScheduleDTO dto = ScheduleDTO.fromJson(json['data']);
      return dto;
    } else {
      throw Exception('Failed');
    }
  }
}
