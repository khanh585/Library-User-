import 'dart:async';
import 'dart:convert';

import 'package:stack/stack.dart';
import 'package:user_library/dao/FeedbackDAO.dart';
import 'package:user_library/dto/FeedbackDTO.dart';
import 'package:user_library/event/Feedback_event.dart';
import 'package:user_library/state/Feedback_state.dart';

class FeedbackBloc {
  var state = FeedbackState(
      feedbacks: [], total: 0, typeFeedbacks: {}); // khoi tao gia tri

  //tao 2 controller
  // 1 cai quan ly event, dam nhan nhiem vu nhan event tu UI
  final eventController = StreamController<FeedbackEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<FeedbackState>();

  FeedbackBloc() {
    eventController.stream.listen((event) async {
      if (event is FetchFeedbackEvent) {
        Map result = {};
        int rating = event.rating;
        int bookGroupID = event.bookGroupID;
        result = await FeedbackDAO().fetchFeedback(bookGroupID, rating);

        state = FeedbackState(
            feedbacks: result['list'],
            total: result['total'],
            typeFeedbacks: filterRate(result['stack']));
      } else if (event is SentFeedbackEvent) {
        FeedbackDTO dto = event.feedback;
        dto = await FeedbackDAO().sentFeedback(dto);
        print(json.encode(dto));
        state.feedbacks.add(dto);
        state.total += 1;
        if (state.typeFeedbacks[dto.rating] == null) {
          state.typeFeedbacks[dto.rating] = [];
        }
        state.typeFeedbacks[dto.rating].add(dto);
      }
      stateController.sink.add(state);
    });
  }

  Map<int, List<FeedbackDTO>> filterRate(Stack stack) {
    Map<int, List<FeedbackDTO>> result = new Map();
    while (stack.isNotEmpty) {
      FeedbackDTO dto = stack.pop();
      if (result[dto.rating] == null) {
        result[dto.rating] = [];
      }
      result[dto.rating].add(dto);
    }
    return result;
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
