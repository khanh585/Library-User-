import 'package:user_library/models/borrow_detail.dart';
import 'package:user_library/models/return_detail.dart';

class BorrowDetailState {
  List<BorrowDetail> borrowDetails;
  List<ReturnDetail> returnDetails;
  BorrowDetailState({
    this.borrowDetails,
    this.returnDetails
  });
}
