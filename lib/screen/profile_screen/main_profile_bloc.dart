import 'dart:async';

import 'package:user_library/dao/CustomerDAO.dart';
import 'package:user_library/dao/StaffDAO.dart';
import 'package:user_library/models/customer.dart';
import 'package:user_library/models/staff.dart';
import 'package:user_library/models/tmpUser.dart';

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
        TmpUser result;
        int customerId = event.customerId;
        int roleId = event.roleId;
        print("zo cai nay ne" + roleId.toString());
        if (roleId.toString() == "2") {
          
          result = await CustomerDAO().fetchCustomer(customerId);
          state = MainProfileState(
            mainProfile: result,
          );
        }else{
          result = await StaffDAO().fetchStaff(customerId);
          state = MainProfileState(
            mainProfile: result,
          );
        }
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
