import 'package:user_library/models/schedule.dart';

abstract class BorrowDetailEvent {}

class FetchBorrowDetailEvent extends BorrowDetailEvent {
  final int customerId;
  FetchBorrowDetailEvent(this.customerId);
}


