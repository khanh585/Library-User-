import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:user_library/bloc/bloc.dart';

import 'authenticate_event.dart';
import 'authenticate_state.dart';

class AuthenticateBloc implements Bloc {
  var state = AuthenticateState(token: '==='); // khoi tao gia tri

  //tao 2 controller
  // 1 cai quan ly event, dam nhan nhiem vu nhan event tu UI
  final eventController = StreamController<AuthenticateEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<AuthenticateState>.broadcast();

  AuthenticateBloc() {
    eventController.stream.listen((event) async {
      if (event is CheckToken) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        state.token = (prefs.getString('PAPV_Token') ?? '');
        print(state.token);
      } else if (event is Disconnect) {
      } else if (event is Connect) {}
      stateController.sink.add(state);
    });
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
