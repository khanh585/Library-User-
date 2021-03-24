import 'package:user_library/models/schedule.dart';

abstract class NotificationEvent {}

class FetchNotificationEvent extends NotificationEvent {
  final int userId;
  FetchNotificationEvent(this.userId);
}


