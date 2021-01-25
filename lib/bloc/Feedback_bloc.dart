import 'dart:async';
import 'dart:convert';

import 'package:stack/stack.dart';
import 'package:user_library/dao/FeedbackDAO.dart';
import 'package:user_library/dto/FeedbackDTO.dart';
import 'package:user_library/event/Feedback_event.dart';
import 'package:user_library/state/Feedback_state.dart';

class FeedbackBloc {
  var state = FeedbackState(
      feedbacks: [], total: 0, typeFeedbacks: {}, temp: []); // khoi tao gia tri

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
        //result = await FeedbackDAO().fetchFeedback(bookGroupID, rating);
        state = FeedbackState(
            feedbacks: result['list'],
            total: result['total'],
            typeFeedbacks: filterRate(result['stack']));
      } else if (event is SentFeedbackEvent) {
        FeedbackDTO dto = event.feedback;
        dto = await FeedbackDAO().sentFeedback(dto);
        state.feedbacks.add(dto);
        state.total += 1;
        if (state.typeFeedbacks[dto.rating] == null) {
          state.typeFeedbacks[dto.rating] = [];
        }
        state.typeFeedbacks[dto.rating].insert(0, dto);
      } else if (event is SortedFeedbackEvent) {
        int sorted = event.sorted;
        print(state.temp == null);

        if (state.temp == null) {
          state.temp = [];
        }
        print('${state.feedbacks.length} ${state.total} ${state.temp.length}');
        if (state.feedbacks.length >= state.total) {
          state.temp = state.feedbacks;
        }
        if (sorted > 0) {
          state.feedbacks = state.typeFeedbacks[sorted];
        } else if (sorted == -1) {
          state.feedbacks = state.temp;
        } else if (sorted == 0) {}
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
