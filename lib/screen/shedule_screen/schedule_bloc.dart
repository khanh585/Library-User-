import 'dart:async';
import 'dart:convert';

import 'package:stack/stack.dart';
import 'package:user_library/dao/ScheduleDAO.dart';
import 'package:user_library/screen/shedule_screen/schedule_event.dart';
import 'package:user_library/screen/shedule_screen/schedule_state.dart';

class ScheduleBloc {
  var state = ScheduleState(schedules: []); // khoi tao gia tri

  //tao 2 controller
  // 1 cai quan ly event, dam nhan nhiem vu nhan event tu UI
  final eventController = StreamController<ScheduleEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<ScheduleState>();

  ScheduleBloc() {
    eventController.stream.listen((event) async {
      if (event is FetchScheduleEvent) {
        print("sfsjfksjfhskjfshk");
        List result;
        result = await ScheduleDAO().fetchSchedule();
        state = ScheduleState(
          schedules: result,
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
