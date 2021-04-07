import 'package:user_library/models/book.dart';

class HomeDetailState {
  List<Book> listPopularBook;
  List<Book> listBooks;
  List<Book> listNewestBook;
  String name;
  HomeDetailState({this.listPopularBook, this.listNewestBook, this.name, this.listBooks});
}
