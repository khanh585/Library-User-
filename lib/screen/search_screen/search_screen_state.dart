import 'package:user_library/models/book.dart';
import 'package:user_library/models/category.dart';

class SearchScreenState {
  List<Category> listCategories;
  List<Book> listBooks;
  String name;
  String author;
  int categoryId;
  SearchScreenState(
      {this.listCategories,
      this.listBooks,
      this.name,
      this.author,
      this.categoryId});
}
