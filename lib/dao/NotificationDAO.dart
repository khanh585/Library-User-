import 'package:http/http.dart' as http;
import 'package:stack/stack.dart';
import 'dart:convert';
import 'package:user_library/config.dart';
import 'package:user_library/models/borrow_detail.dart';
import 'package:user_library/models/notification.dart';
import 'package:user_library/models/schedule.dart';

class NotificationDAO {
  List<UserNotification> list;
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'UserNotification';
  int pageSize = 20;
  int pageNumber = 1;

  Future<List<UserNotification>> fetchNotification(int userId) async {
    if (list == null) {
      list = new List();
    }
    String url = prefixUrl + '?UserId=$userId';
    print(url.toString());
    var response = await http.get(url);

    print(response);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      List notifications = json['data'];
      notifications.forEach((element) {
        UserNotification dto = UserNotification.fromJson(element);
        list.add(dto);
      });
      return list;
    } else {
      print("Not 200");
    }
  }
}
