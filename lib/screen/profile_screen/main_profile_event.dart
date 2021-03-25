import 'package:user_library/models/schedule.dart';

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
  Logout();
}
