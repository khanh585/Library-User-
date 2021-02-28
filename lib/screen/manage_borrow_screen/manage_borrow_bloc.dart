import 'dart:async';

import 'package:user_library/bloc/bloc.dart';
import 'package:user_library/dao/CustomerDAO.dart';
import 'package:user_library/dao/FeedbackDAO.dart';
import 'package:user_library/models/customer.dart';
import 'package:user_library/models/feedback.dart';
import 'package:user_library/models/user.dart';
import 'package:user_library/screen/feed_back_screen/feedback_screen_event.dart';
import 'package:user_library/screen/manage_borrow_screen/manage_borrow_event.dart';
import 'package:user_library/screen/manage_borrow_screen/manage_borrow_state.dart';


class ManageBorrowBloc implements Bloc {
  var state = ManageBorrowState(
      listUser: new List<Customer>());
  final eventController = StreamController<ManageBorrowEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<ManageBorrowState>.broadcast();

  ManageBorrowBloc() {
    eventController.stream.listen((event) async {
      if (event is FetchUser) {
        List response = await CustomerDAO()
            .fetchAllCustomer();
        List<Customer> listUser = response;
        state = ManageBorrowState(
          listUser: listUser,
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
