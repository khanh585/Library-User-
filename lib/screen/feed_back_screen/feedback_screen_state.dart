import 'package:user_library/models/user_feedback.dart';

class FeedbackScreenState {
  List<UserFeedback> listFeedback;
  int totalFeedback;
  List rating;

  FeedbackScreenState({this.listFeedback, this.totalFeedback, this.rating});
}
