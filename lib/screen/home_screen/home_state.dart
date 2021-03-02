import 'package:user_library/models/book.dart';

class HomeState {
  List<Book> listSuggestBook;
  List<Book> listNewestBook;
  HomeState({this.listSuggestBook, this.listNewestBook});
}
