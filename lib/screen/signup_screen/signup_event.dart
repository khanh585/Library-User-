import 'package:user_library/models/schedule.dart';
import 'package:user_library/models/tmpUser.dart';

abstract class SignupEvent {}

class AddUserEvent extends SignupEvent {
  final TmpUser user;
  AddUserEvent(this.user);
}


