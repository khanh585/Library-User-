import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:user_library/config.dart';
import 'package:user_library/models/book.dart';

class BookDAO {
  final String prefixUrl = API_CONFIGURE['apiPrefix'] + 'BookGroup';
  int pageSize = 15;
  int pageNumber = 1;

  Future<List<Book>> fetchBook(
      String name, String author, int categoryID) async {
    List<Book> list = new List<Book>();
    String category = '';
    if (categoryID != -1) {
      category = '&CategoryId=${categoryID}';
    }
    String url = prefixUrl +
        '?Name=${name}' +
        category +
        '&Author=${author}' +
        '&PageSize=${pageSize}' +
        '&PageNumber=${pageNumber}';
    var response = await http.get(url);
    print(url);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      List books = json['data'];

      books.forEach((book) {
        if (book != null) {
          Book dto = Book.fromJson(book);
          list.add(dto);
        }
      });

      return list;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<Book>> fetchSuggestBook() async {
    List<Book> list = new List<Book>();
    String url = prefixUrl +
        '?CustomerId=1' +
        '&PageSize=10';
    var response = await http.get(url);
    print(url);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      List books = json['data'];
      books.forEach((book) {
        if (book != null) {
          Book dto = Book.fromJson(book);
          list.add(dto);
        }
      });
      print(list);
      return list;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<Book>> fetchNewestBook() async {
    List<Book> list = new List<Book>();
    String url = prefixUrl +
        '?IsNewest=true' +
        '&PageSize=10';
    var response = await http.get(url);
    print(url);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      List books = json['data'];

      books.forEach((book) {
        if (book != null) {
          Book dto = Book.fromJson(book);
          list.add(dto);
        }
      });
      print(list);
      return list;
    } else {
      throw Exception('Failed');
    }
  }
}
