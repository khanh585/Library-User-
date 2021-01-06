import 'package:user_library/dto/FeedbackDTO.dart';
import 'package:user_library/dto/FeedbackDTO.dart';

class FeedbackState {
  List<FeedbackDTO> feedbacks;
  List<FeedbackDTO> temp;
  Map<int, List<FeedbackDTO>> typeFeedbacks;
  int total;
  final int bookGroupID;
  FeedbackState({
    this.feedbacks,
    this.temp,
    this.total,
    this.typeFeedbacks,
    this.bookGroupID,
  });
}
