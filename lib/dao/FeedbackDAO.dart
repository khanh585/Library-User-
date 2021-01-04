import 'package:http/http.dart' as http;
import 'package:stack/stack.dart';
import 'dart:convert';
import 'package:user_library/config.dart';
import 'package:user_library/dto/FeedbackDTO.dart';

class FeedbackDAO {
  List<FeedbackDTO> list;
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'Feedback';
  int pageSize = 20;
  int pageNumber = 1;

  Future<Map> fetchFeedback(int bookGroupID, int rating) async {
    if (list == null) {
      list = new List();
    }
    String rateString = '';
    if (rating != -1) {
      rateString = '&Name=${rating}';
    }
    String url = prefixUrl +
        '?PageSize=${pageSize}' +
        '&PageNumber=${pageNumber}' +
        '&BookGroupId=${bookGroupID}' +
        rateString;
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      Map result = {};
      result['total'] = json['meta']['totalCount'];
      List cats = json['data'];
      Stack<FeedbackDTO> stack = Stack();
      cats.forEach((element) {
        FeedbackDTO dto = FeedbackDTO.fromJson(element);
        list.add(dto);
        stack.push(dto);
      });
      result['list'] = list;
      result['stack'] = stack;
      return result;
    } else {
      throw Exception('Failed');
    }
  }

  Future<FeedbackDTO> sentFeedback(FeedbackDTO dto) async {
    Map<String, String> headers = {"Content-type": "application/json"};

    String body = json.encode(dto.toJson());

    var response = await http.post(prefixUrl, headers: headers, body: body);

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      FeedbackDTO dto = FeedbackDTO.fromJson(json['data']);
      return dto;
    } else {
      throw Exception('Failed');
    }
  }
}
