abstract class HomeDetailEvent {}

class FetchPopularBook extends HomeDetailEvent {
  FetchPopularBook();
}

class FetchNewestBook extends HomeDetailEvent {
  FetchNewestBook();
}