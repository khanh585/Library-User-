import 'dart:async';
import 'package:user_library/dao/BorrowDetailDAO.dart';
import 'borrow_detail_event.dart';
import 'borrow_detail_state.dart';

class BorrowDetailBloc {
  var state = BorrowDetailState(borrowDetails: []); // khoi tao gia tri

  //tao 2 controller
  // 1 cai quan ly event, dam nhan nhiem vu nhan event tu UI
  final eventController = StreamController<BorrowDetailEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<BorrowDetailState>();

  BorrowDetailBloc() {
    eventController.stream.listen((event) async {
      if (event is FetchBorrowDetailEvent) {
        List result;
        int borrowId = event.borrowId;
        result = await BorrowDetailDAO().fetchBorrowDetail(borrowId);
        state = BorrowDetailState(
          borrowDetails: result,
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
