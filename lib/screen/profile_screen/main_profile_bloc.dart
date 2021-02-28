import 'dart:async';

import 'package:user_library/dao/CustomerDAO.dart';
import 'package:user_library/models/customer.dart';

import 'main_profile_event.dart';
import 'main_profile_state.dart';

class MainProfileBloc {
  var state = MainProfileState(mainProfile: null); // khoi tao gia tri

  //tao 2 controller
  // 1 cai quan ly event, dam nhan nhiem vu nhan event tu UI
  final eventController = StreamController<MainProfileEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<MainProfileState>();

  MainProfileBloc() {
    eventController.stream.listen((event) async {
      if (event is FetchMainProfileEvent) {
        print("sfsjfksjfhskjfshk");
        Customer result;
        int customerId = event.customerId;
        result = await CustomerDAO().fetchCustomer(customerId);
        state = MainProfileState(
          mainProfile: result,
        );
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
