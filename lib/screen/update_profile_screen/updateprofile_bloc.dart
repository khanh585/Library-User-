import 'dart:async';

import 'package:user_library/dao/CustomerDAO.dart';
import 'package:user_library/models/tmpUser.dart';
import 'package:user_library/screen/signup_screen/signup_event.dart';
import 'package:user_library/screen/signup_screen/signup_state.dart';

class SignupBloc {
  var state = SignupState(user: null); // khoi tao gia tri

  //tao 2 controller
  // 1 cai quan ly event, dam nhan nhiem vu nhan event tu UI
  final eventController = StreamController<SignupEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<SignupState>();

  SignupBloc() {
    eventController.stream.listen((event) async {
      if (event is AddUserEvent) {
        TmpUser dto = event.user;
        dto = await CustomerDAO().addCustomer(dto);
      }
      stateController.sink.add(state);
    });
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
