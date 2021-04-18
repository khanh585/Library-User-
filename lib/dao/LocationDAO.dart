import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:user_library/config.dart';
import 'package:user_library/models/location.dart';

class BookDAO {
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'Book';

  Future<List<Location>> fetchLocationByBookGroupId(int bookBroupId) async {
    String url = prefixUrl + '?BookGroupId=${bookBroupId}';
    List<Location> list = new List();
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map json = jsonDecode(response.body);
        List tmp = json['data'];
        tmp.forEach((element) {
          Location dto = Location.fromJson(element);
          list.add(dto);
        });
      }
    } catch (e) {} finally {
      return list;
    }
  }
}
