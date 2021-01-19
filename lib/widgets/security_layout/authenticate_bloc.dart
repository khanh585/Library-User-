import 'dart:async';

import 'package:user_library/bloc/bloc.dart';
import 'package:user_library/models/user.dart';

import 'authenticate_event.dart';
import 'authenticate_state.dart';

class AuthenticateBloc implements Bloc {
  var state = AuthenticateState(currentUser: null); // khoi tao gia tri

  //tao 2 controller
  // 1 cai quan ly event, dam nhan nhiem vu nhan event tu UI
  final eventController = StreamController<AuthenticateEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<AuthenticateState>();

  AuthenticateBloc() {
    eventController.stream.listen((event) async {
      if (event is Connect) {
        var firebaseUser = event.firebaseUser;
        User currentUser = User(
            id: 0,
            email: firebaseUser.email,
            image: firebaseUser.photoURL,
            name: firebaseUser.displayName,
            phone: firebaseUser.phoneNumber);
        state.currentUser = currentUser;
        stateController.sink.add(state);
        print("State ${state.currentUser.email}");
      } else if (event is Disconnect) {
      } else {}
    });
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
