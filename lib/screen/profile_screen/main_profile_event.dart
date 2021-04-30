import 'package:user_library/models/schedule.dart';
import 'package:user_library/models/tmpUser.dart';

abstract class MainProfileEvent {}

class FetchMainProfileEvent extends MainProfileEvent {
  final int customerId;
  final int roleId;
  FetchMainProfileEvent(this.customerId, this.roleId);
}

class GetProfileFromToken extends MainProfileEvent {
  GetProfileFromToken();
}

class Logout extends MainProfileEvent {
  final TmpUser user;
  Logout(this.user);
}
