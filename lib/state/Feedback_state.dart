import 'package:user_library/dto/FeedbackDTO.dart';
import 'package:user_library/dto/FeedbackDTO.dart';

class FeedbackState {
  final List<FeedbackDTO> feedbacks;
  final Map<int, List<FeedbackDTO>> typeFeedbacks;
  final int total;
  FeedbackState({
    this.feedbacks,
    this.total,
    this.typeFeedbacks,
  });
}
