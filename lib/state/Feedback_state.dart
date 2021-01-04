import 'package:user_library/dto/FeedbackDTO.dart';
import 'package:user_library/dto/FeedbackDTO.dart';

class FeedbackState {
  List<FeedbackDTO> feedbacks;
  Map<int, List<FeedbackDTO>> typeFeedbacks;
  int total;
  final int bookGroupID;
  FeedbackState({
    this.feedbacks,
    this.total,
    this.typeFeedbacks,
    this.bookGroupID,
  });
}
