import 'dart:async';
import 'package:user_library/dao/BorrowDetailDAO.dart';
import 'package:user_library/dao/ReturnDetailDAO.dart';
import 'package:user_library/models/borrow_detail.dart';
import 'package:user_library/models/return_detail.dart';
import 'package:user_library/screen/borrow_detail_screen/borrow_detail_event.dart';
import 'package:user_library/screen/borrow_detail_screen/borrow_detail_state.dart';

class BorrowDetailBloc {
  var state = BorrowDetailState(
      borrowDetails: null,
      returnDetails: null,
      sumBorrow: 0,
      sumReturn: 0); // khoi tao gia tri

  //tao 2 controller
  // 1 cai quan ly event, dam nhan nhiem vu nhan event tu UI
  final eventController = StreamController<BorrowDetailEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<BorrowDetailState>();

  BorrowDetailBloc() {
    eventController.stream.listen((event) async {
      if (event is FetchBorrowDetailEvent) {
        List<BorrowDetail> list_borrows = new List();
        List<ReturnDetail> returnDetails = new List();
        int customerId = event.customerId;
        list_borrows =
            await BorrowDetailDAO().fetchBorrowDetailOfCustomer(customerId);
        returnDetails =
            await ReturnDetailDAO().fetchReturnDetailOfCustomer(customerId);

        state = BorrowDetailState(
          borrowDetails:
              list_borrows.where((element) => !element.isReturn).toList(),
          returnDetails: returnDetails,
          sumBorrow: _sumFeeBorrow(list_borrows),
          sumReturn: _sumFeeReturn(returnDetails),
        );
      }
      stateController.sink.add(state);
    });
  }

  double _sumFeeBorrow(List<BorrowDetail> borrowDetails) {
    double sum = 0;
    if (borrowDetails != null) {
      borrowDetails.forEach((element) {
        sum += element.fee;
      });
    }
    return sum;
  }

  double _sumFeeReturn(List<ReturnDetail> returnDetails) {
    double sum = 0;
    if (returnDetails != null) {
      returnDetails.forEach((element) {
        sum += element.fee;
      });
    }
    return sum;
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
