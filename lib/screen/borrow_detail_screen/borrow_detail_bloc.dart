import 'dart:async';
import 'package:user_library/dao/BorrowDetailDAO.dart';
import 'package:user_library/dao/ReturnDetailDAO.dart';
import 'package:user_library/models/borrow_detail.dart';
import 'package:user_library/models/return_detail.dart';
import 'package:user_library/screen/borrow_detail_screen/borrow_detail_event.dart';
import 'package:user_library/screen/borrow_detail_screen/borrow_detail_state.dart';


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
        List<BorrowDetail> result;
        List<ReturnDetail> returnDetails;
        int customerId = event.customerId;
        result = await BorrowDetailDAO().fetchBorrowDetailOfCustomer(customerId);
        returnDetails = await ReturnDetailDAO().fetchReturnDetailOfCustomer(customerId);
        print(result);
        state = BorrowDetailState(
          borrowDetails: result,
          returnDetails: returnDetails
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
