import 'package:user_library/dto/FeedbackDTO.dart';

abstract class FeedbackEvent {}

class FetchFeedbackEvent extends FeedbackEvent {
  final int rating;
  FetchFeedbackEvent(this.rating);
}

class SentFeedbackEvent extends FeedbackEvent {
  final FeedbackDTO feedback;
  SentFeedbackEvent(this.feedback);
}
