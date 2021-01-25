import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:user_library/config.dart';
import 'package:user_library/dto/FeedbackDTO.dart';
import 'package:user_library/models/feedback.dart';

class FeedbackDAO {
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'Feedback';

  Future<List> fetchFeedback(int bookId, int page, int pageSize) async {
    String url = prefixUrl +
        '?&BookGroupId=${bookId}&PageNumber=${page}&PageSize=${pageSize}';
    var response = await http.get(url);

    Map json = jsonDecode(response.body);
    List<Feedback> feedbacks = new List<Feedback>();

    List data = json['data'];
    int total = json['meta']['totalCount'];
    print('---- ${data}  ---  ${total} ----');
    data.forEach((element) {
      Feedback tmp = Feedback.fromJson(element);
      feedbacks.add(tmp);
    });

    return [feedbacks, total];
  }

  Future<List> fetchCountFeedback(int bookId) async {
    String url = API_CONFIGURE['apiPrefix'] + 'BookGroup/${bookId}';
    var response = await http.get(url);

    Map json = jsonDecode(response.body);

    List data = json['data']['rating'];
    return data;
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
