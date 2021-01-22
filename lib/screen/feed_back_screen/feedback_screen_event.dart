abstract class FeedbackScreenEvent {}

class FetchFeedback extends FeedbackScreenEvent {
  int bookId;
  int page;

  FetchFeedback({this.bookId, this.page});
}
