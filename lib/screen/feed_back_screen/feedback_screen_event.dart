abstract class FeedbackScreenEvent {}

class FetchFeedback extends FeedbackScreenEvent {
  int bookId;
  int page;
  int pageSize;

  FetchFeedback({this.bookId, this.page, this.pageSize});
}
