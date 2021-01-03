import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:user_library/config.dart';
import 'package:user_library/dto/BookDTO.dart';

class BookDAO {
  List<BookDTO> list;
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'BookGroup';
  int pageSize = 15;
  int pageNumber = 1;

  Future<List<BookDTO>> fetchBook(
      String name, String author, int categoryID) async {
    list = [];
    String category = '';
    if (categoryID != -1) {
      String category = '&CategoryId=${categoryID}';
    }
    String url = prefixUrl +
        '?Name=${name}' +
        category +
        '&Author=${author}' +
        '&PageSize=${pageSize}' +
        '&PageNumber=${pageNumber}';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      List books = json['data'];
      books.forEach((element) {
        BookDTO dto = BookDTO.fromJson(element);
        list.add(dto);
      });
      return list;
    } else {
      print(response.statusCode);
      throw Exception('Failed');
    }
  }
}
