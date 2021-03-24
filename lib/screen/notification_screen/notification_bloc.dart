import 'dart:async';

import 'package:user_library/bloc/bloc.dart';
import 'package:user_library/dao/CustomerDAO.dart';
import 'package:user_library/dao/FeedbackDAO.dart';
import 'package:user_library/dao/NotificationDAO.dart';
import 'package:user_library/models/customer.dart';
import 'package:user_library/models/notification.dart';
import 'package:user_library/models/user_feedback.dart';
import 'package:user_library/models/user.dart';
import 'package:user_library/screen/feed_back_screen/feedback_screen_event.dart';
import 'package:user_library/screen/manage_borrow_screen/manage_borrow_event.dart';
import 'package:user_library/screen/manage_borrow_screen/manage_borrow_state.dart';
import 'package:user_library/screen/notification_screen/notification_event.dart';
import 'package:user_library/screen/notification_screen/notification_state.dart';


class NotificationBloc implements Bloc {
  var state = NotificationState(
      notification: new List<UserNotification>());
  final eventController = StreamController<NotificationEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<NotificationState>.broadcast();

  NotificationBloc() {
    eventController.stream.listen((event) async {
      if (event is FetchNotificationEvent) {
        int userId = event.userId;
        List response = await NotificationDAO()
            .fetchNotification(userId);
        List<UserNotification> listNotification = response;
        state = NotificationState(
          notification: listNotification,
        );
        stateController.sink.add(state);
      }
    });
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
