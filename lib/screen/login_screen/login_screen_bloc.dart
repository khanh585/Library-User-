import 'dart:async';

import 'package:user_library/bloc/bloc.dart';

import 'login_screen_event.dart';
import 'login_screen_state.dart';

class LoginBloc implements Bloc {
  var state = LoginScreenState(
    isLoading: false,
  ); // khoi tao gia tri
  final eventController = StreamController<LoginScreenEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<LoginScreenState>();

  LoginBloc() {
    eventController.stream.listen((event) async {
      if (event is LoginLoading) {
        state.isLoading = true;
      } else if (event is FinishProcess) {
        state.isLoading = false;
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
