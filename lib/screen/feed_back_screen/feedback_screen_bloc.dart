import 'dart:async';

import 'package:user_library/bloc/bloc.dart';
import 'package:user_library/dao/FeedbackDAO.dart';
import 'package:user_library/models/user_feedback.dart';
import 'package:user_library/screen/feed_back_screen/feedback_screen_event.dart';

import 'feedback_screen_state.dart';

class FeedbackScreenBloc implements Bloc {
  var state = FeedbackScreenState(
      listFeedback: new List<UserFeedback>(), totalFeedback: 0, rating: new List());
  final eventController = StreamController<FeedbackScreenEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<FeedbackScreenState>.broadcast();

  FeedbackScreenBloc() {
    eventController.stream.listen((event) async {
      if (event is FetchFeedback) {
        List response = await FeedbackDAO()
            .fetchFeedback(event.bookId, event.page, event.pageSize);
        List<UserFeedback> listFeedbacks = response[0];
        int total = response[1];

        List<UserFeedback> concatList = new List.from(state.listFeedback)
          ..addAll(listFeedbacks);
        List rating = await FeedbackDAO().fetchCountFeedback(event.bookId);

        state.listFeedback = concatList;
        state.totalFeedback = total;
        state.rating = rating;
        stateController.sink.add(state);
      }else if(event is SentFeedbackEvent){
        UserFeedback dto = event.userFeedback;
        dto = await FeedbackDAO().sentFeedback(dto);
      }
    });
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
