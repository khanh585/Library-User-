abstract class HomeEvent {}

class FetchSuggestBook extends HomeEvent {
  final int customerId;
  FetchSuggestBook(this.customerId);
}

class FetchNewestBook extends HomeEvent {
  FetchNewestBook();
}