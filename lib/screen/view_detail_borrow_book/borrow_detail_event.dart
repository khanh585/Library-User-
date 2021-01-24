import 'package:user_library/models/schedule.dart';

abstract class BorrowDetailEvent {}

class FetchBorrowDetailEvent extends BorrowDetailEvent {
  final int borrowId;
  FetchBorrowDetailEvent(this.borrowId);
}


