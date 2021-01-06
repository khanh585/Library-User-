import 'package:user_library/dto/FeedbackDTO.dart';

abstract class FeedbackEvent {}

class FetchFeedbackEvent extends FeedbackEvent {
  final int rating;
  final int bookGroupID;
  FetchFeedbackEvent({this.bookGroupID, this.rating});
}

class SentFeedbackEvent extends FeedbackEvent {
  final FeedbackDTO feedback;
  SentFeedbackEvent(this.feedback);
}

class SortedFeedbackEvent extends FeedbackEvent {
  final int sorted;
  SortedFeedbackEvent(this.sorted);
}
