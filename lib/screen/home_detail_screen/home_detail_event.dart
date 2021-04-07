abstract class HomeDetailEvent {}

class FetchPopularBook extends HomeDetailEvent {
  FetchPopularBook();
}

class FetchNewestBook extends HomeDetailEvent {
  FetchNewestBook();
}

class FetchBooks extends HomeDetailEvent {
  final String name;

  FetchBooks({this.name});
}

class CleanBooks extends HomeDetailEvent {
  CleanBooks();
}