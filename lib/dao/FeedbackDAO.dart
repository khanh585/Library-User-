import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:user_library/config.dart';

import 'package:user_library/models/user_feedback.dart';

class FeedbackDAO {
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'Feedback';

  Future<List> fetchFeedback(int bookId, int page, int pageSize) async {
    String url = prefixUrl +
        '?&BookGroupId=${bookId}&PageNumber=${page}&PageSize=${pageSize}';
    var response = await http.get(url);
    Map json = jsonDecode(response.body);
    List<UserFeedback> feedbacks = new List<UserFeedback>();

    List data = json['data'];
    int total = json['meta']['totalCount'];
    data.forEach((element) {
      UserFeedback tmp = UserFeedback.fromJson(element);
      feedbacks.add(tmp);
    });

    return [feedbacks, total];
  }

  Future<UserFeedback> getFeedbackById(int id) async {
    String url = prefixUrl + '/${id}';

    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);

      UserFeedback feedback = UserFeedback.fromJson(json['data']);

      return feedback;
    } else {
      return null;
    }
  }

  Future<List> fetchCountFeedback(int bookId) async {
    String url = API_CONFIGURE['apiPrefix'] + 'BookGroup/${bookId}';
    var response = await http.get(url);

    Map json = jsonDecode(response.body);

    List data = json['data']['rating'];
    return data;
  }

  Future<UserFeedback> sentFeedback(UserFeedback dto) async {
    Map<String, String> headers = {"Content-type": "application/json"};

    String body = json.encode(dto.toJson());

    var response = await http.post(prefixUrl, headers: headers, body: body);

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      UserFeedback dto = UserFeedback.fromJson(json['data']);
      return dto;
    } else {
      Map json = jsonDecode(response.body);
      throw Exception('Failed');
    }
  }
}
