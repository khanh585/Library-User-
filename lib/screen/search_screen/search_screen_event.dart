abstract class SearchScreenEvent {}

class FetchCategories extends SearchScreenEvent {
  FetchCategories();
}

class FetchBooks extends SearchScreenEvent {
  final String author;
  final String name;
  final int categoryId;

  FetchBooks({this.author, this.name, this.categoryId});
}

class CleanBooks extends SearchScreenEvent {
  CleanBooks();
}
