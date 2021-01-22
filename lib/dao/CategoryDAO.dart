import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:user_library/config.dart';
import 'package:user_library/dto/CategoryDTO.dart';
import 'package:user_library/models/category.dart';

class CategoryDAO {
  List<Category> list;
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'Category';
  int pageSize = 20;
  int pageNumber = 1;

  Future<List<Category>> fetchCategory(String name) async {
    if (list == null) {
      list = new List();
    }
    String url = prefixUrl +
        '?Name=${name}' +
        '&PageSize=${pageSize}' +
        '&PageNumber=${pageNumber}';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      List cats = json['data'];
      cats.forEach((element) {
        Category dto = Category.fromJson(element);
        print(dto.name);
        list.add(dto);
      });
      return list;
    } else {
      throw Exception('Failed');
    }
  }
}
