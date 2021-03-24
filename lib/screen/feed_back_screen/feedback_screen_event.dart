import 'package:user_library/models/user_feedback.dart';

abstract class FeedbackScreenEvent {}

class FetchFeedback extends FeedbackScreenEvent {
  int bookId;
  int page;
  int pageSize;

  FetchFeedback({this.bookId, this.page, this.pageSize});
 
}

class SentFeedbackEvent extends FeedbackScreenEvent {
  UserFeedback userFeedback;
  SentFeedbackEvent({this.userFeedback});
}